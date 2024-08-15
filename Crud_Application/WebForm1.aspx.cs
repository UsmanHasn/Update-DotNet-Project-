using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crud_Application
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection Conn = new SqlConnection(@"Data Source=DESKTOP-6CO61BE\SQLEXPRESS; Initial Catalog=HRS; Integrated Security=true;");
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                reset();
            }
        }


        void reset()
        {
            txtName.Text = "";
            txtPassword.Text = "";

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            SqlDataAdapter adp = new SqlDataAdapter("Sp_login", Conn);
            adp.SelectCommand.Parameters.AddWithValue("@UserName", txtName.Text);
            adp.SelectCommand.Parameters.AddWithValue("@Password", txtPassword.Text);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0 )
            {
                lblerror.Style.Add("Color", "Green");
                lblerror.Text = "Login Successfully";
                Response.Redirect("Webform2.aspx");
            }
            else
            {
                lblerror.Style.Add("Color", "Red");
                lblerror.Text = "Invaid Id && Password";
            }
            
        }
    }
}