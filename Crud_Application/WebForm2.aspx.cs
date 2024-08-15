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
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection Conn = new SqlConnection(@"Data Source=DESKTOP-6CO61BE\SQLEXPRESS; Initial Catalog=HRS; Integrated Security=true;");
        SqlDataAdapter Adp;
        SqlCommand cmd;
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Getdata();

            }
        }

        void Getdata()
        {
            Adp = new SqlDataAdapter("GetAllTransactions", Conn);
            Adp.SelectCommand.Parameters.AddWithValue("@P_action", 'a');
            Adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();

            Adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridCrud.DataSource = dt;
                GridCrud.DataBind();
            }
        }

        protected void Crud(int xpin, int customerno, string beneficientname, string sendername, string fromdate, string todate, string action)
        {
            dt = new DataTable();
            cmd = new SqlCommand("GetAllTransactions", Conn);
            cmd.Parameters.AddWithValue("@P_xpin", xpin);
            cmd.Parameters.AddWithValue("@p_Cusrefrence_number", customerno);
            cmd.Parameters.AddWithValue("@p_Bneficiency_name", beneficientname);
            cmd.Parameters.AddWithValue("@p_Sender_name", sendername);
            cmd.Parameters.AddWithValue("@p_FromDate", fromdate);
            cmd.Parameters.AddWithValue("@p_ToDate", todate);
            cmd.Parameters.AddWithValue("@p_action", action);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();

            Getdata();
        }

        void insert()
        {
            int xpinid = int.Parse(txtxpin.Text == "" ? "0" : txtxpin.Text);
            int cusid = int.Parse(txtcusref.Text == "" ? "0" : txtcusref.Text);

            Crud(xpinid, cusid, txtbeneficient.Text, txtSenderName.Text, txtfromdate.Text, txttodate.Text, "i");

        }

        void Update()
        {
            int xpinid = int.Parse(txtxpin.Text == "" ? "0" : txtxpin.Text);
            int cusid = int.Parse(txtcusref.Text == "" ? "0" : txtcusref.Text);

            Crud(xpinid, cusid, txtbeneficient.Text, txtSenderName.Text, txtfromdate.Text, txttodate.Text, "u");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            insert();
            reset();
        }

        void reset()
        {
            txtxpin.Text = "";
            txtcusref.Text = "";
            txtbeneficient.Text = "";
            txtSenderName.Text = "";
            txtfromdate.Text = "";
            txttodate.Text = "";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Update();
            reset();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Delete();
        }

        void Delete()
        {
            int xpinid = int.Parse(txtxpin.Text == "" ? "0" : txtxpin.Text);
            Crud(xpinid, 0, "", "", "", "", "d");
            reset();
        }
    }



}
