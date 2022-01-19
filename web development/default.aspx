<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="web_development._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row" style="border:2px solid grey;height:auto;border-radius:14px">
            <br />
        <div class="row">
            <div class="col-md-3"></div>
                <div class ="col-md-6">
                <label><b>LIST</b></label>
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddllist">
                    <asp:ListItem>Select *</asp:ListItem>
                    <asp:ListItem>cricket</asp:ListItem>
                    <asp:ListItem>batminton</asp:ListItem>
                    <asp:ListItem>swimming</asp:ListItem>
                    <asp:ListItem>shooting</asp:ListItem>
                    <asp:ListItem>table tennis</asp:ListItem>
                    <asp:ListItem>snooker </asp:ListItem>
                    <asp:ListItem>weightlifting</asp:ListItem>
                    <asp:ListItem>boxing </asp:ListItem>
                    <asp:ListItem>archery</asp:ListItem>
                    <asp:ListItem>chess</asp:ListItem>
                    <asp:ListItem>football</asp:ListItem>
                    <asp:ListItem>basketball</asp:ListItem>
                     </asp:DropDownList>
                    <div class ="col-md-3"></div> 
                    </div>
            </div>
            <div class ="row">
                <div class ="col-md-3"></div>
            <div class="col-md-6">
                    <label><b>NAME</b></label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtname" placeholder="user name"></asp:TextBox>
               <div class ="col-md-3"></div>
                </div>
                </div>
            <div class ="row">
                <div class ="col-md-3"></div>
                <div class ="col-md-6">
                    <label><b>Phone no</b></label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtmob" placeholder="Mobile no"></asp:TextBox>
                <div class ="col-md-3"></div>
                </div>
                 </div>
            <div class ="row">
                <div class ="col-md-3"></div>
                <div class ="col-md-6">
                    <label><b>ADDRESS</b></label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtaddress" placeholder="address"></asp:TextBox>
                    <div class="col-md-3"></div>
                    </div>
            </div>  
            <center><asp:LinkButton runat="server" Text="save" OnClick="Unnamed_Click" CssClass="btn btn-success"></asp:LinkButton></center>
       
            
        
            <br />
            <br />


            <div class="row">
                <div class="col-sm-1"></div>


                  <div class="col-sm-10">

                  <table class="table table-bordered">
    <thead>
      <tr>
        <th>list</th>
        <th>Name</th>
        <th>Mobileno</th>
         <th>Address</th>
        <th>status</th>
          <th>Delete</th>
          <th>Update</th>

      </tr>
    </thead>
    <tbody>
        <asp:ListView runat="server" ID="lstView" OnPagePropertiesChanging="lstView_PagePropertiesChanging" >

            <GroupTemplate>
                <div runat="server" id="itemPlaceholder"></div>
            </GroupTemplate>
            <ItemTemplate>
                

      <tr>
        <td><%# Eval("list") %></td>
        <td><%# Eval("Name") %></td>
        <td><%# Eval("Mobileno") %></td>
        <td><%# Eval("Address") %></td>
        <td><%# Eval("status") %></td>
        <td><asp:LinkButton runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Delete"></asp:LinkButton></td>
        <td><asp:LinkButton runat="server" ID="btnUpdate" CssClass="btn btn-primary" Text="Update"></asp:LinkButton></td>
      </tr>

            </ItemTemplate>



            <LayoutTemplate>



                <div id="groupPlaceholder" runat="server"></div>

                <asp:DataPager runat="server" ID="DataPager1"  PageSize="02" PagedControlID="lstView" >

                    <Fields>

                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="false" ButtonCssClass="page-link  page-item" ShowNextPageButton="false" ShowPreviousPageButton="true" />

                        <asp:NumericPagerField  />

 <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="false" ButtonCssClass="page-link  page-item"  ShowNextPageButton="true" ShowPreviousPageButton="false"></asp:NextPreviousPagerField>

                    </Fields>

                </asp:DataPager>


            </LayoutTemplate>



        </asp:ListView>
   
    </tbody>
  </table>

                      </div>
                  <div class="col-sm-1"></div>

            </div>
        
        
        
        
        </div>
    </div>
</asp:Content>
