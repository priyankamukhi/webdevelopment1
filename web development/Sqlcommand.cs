namespace web_development
{
    internal class Sqlcommand
    {
        private string v;
        private Sqlconnection con;

        public Sqlcommand(string v, Sqlconnection con)
        {
            this.v = v;
            this.con = con;
        }
    }
}