using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_development
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection (@"Data Source = DESKTOP-6H8AVCC; Initial Catalog = db; Integrated Security =True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)

            {
                ShowData();
            }

        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddllist.Text == "")
                {
                    Response.Write("<script>alert('Please select any one')</script>");
                    
                }
                else if (txtname.Text == "")
                {
                    Response.Write("<script>alert('please enter your name')</script>");
                }
                else if (txtname.Text.Length > 35)
                {
                    Response.Write("<script>alert('Please Enter valid name')</script>");

                }
                else if (txtname.Text.Length < 2)
                {
                    Response.Write("<script>alert('Please Enter valid name')</script>");

                }
                else if (txtmob.Text == "")
                {
                    Response.Write("<script>alert('please enter valid mobile number')</script>");

                }
                else if (txtmob.Text.Length > 10)
                {
                    Response.Write("<script>alert('please enter valid  mobile number')</script>");

                }
                else if (txtmob.Text.Length < 10)
                {
                    Response.Write("<script>alert('please enter valid mobile number')</script>");

                }
                else if (txtaddress.Text == "")
                {
                    Response.Write("<script>alert('please enter your address')</script");
                }
                else if (txtaddress.Text.Length > 50)
                {
                    Response.Write("<script>alert('not valid')");
                }
                else if (txtaddress.Text.Length < 5)
                    Response.Write("<script>alert('not valid')</Script>");
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_sports", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", "");
                    cmd.Parameters.AddWithValue("@list",ddllist.Text );
                    cmd.Parameters.AddWithValue("@Name",txtname.Text );
                    cmd.Parameters.AddWithValue("@Mobileno",txtmob.Text);
                    cmd.Parameters.AddWithValue("@Address",txtaddress.Text );
                    cmd.Parameters.AddWithValue("@status", "Active");
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if (i>0)
                    {
                        ddllist.Text = "";
                        txtname.Text = "";
                        txtmob.Text = "";
                        txtaddress.Text = "";
                        ShowData();
                        Response.Write("<script>alert('RECORD SAVED')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('having some issue')</script>");

                    }

                }   
            }
             catch (Exception excp)
            {
                throw excp;

            }
            finally
            {
                con.Close();
            }
        }        


        public void ShowData()
        {
            try
            {
                //con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand("select * from sports order by id desc", con);
                cmd.CommandType = CommandType.Text;
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count>0)
                {
                    lstView.DataSource = dt;
                    lstView.DataBind();
                }

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void lstView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager dp = (DataPager)lstView.FindControl("DataPager1");
            dp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            ShowData();
        }
    }
}