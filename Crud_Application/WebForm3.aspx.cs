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
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection Conn = new SqlConnection(@"Data Source=DESKTOP-6CO61BE\SQLEXPRESS; Initial Catalog=HRS; Integrated Security=true");
        SqlDataAdapter Adp;
        SqlCommand cmd;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetdatabySender();
                Getdata();

            }
        }


        #region method
        void Getdata()
        {
            Adp = new SqlDataAdapter("sp_Crud", Conn);
            Adp.SelectCommand.Parameters.AddWithValue("@P_Action", 'a');
            Adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            Adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridCrud.DataSource = dt;
                GridCrud.DataBind();

            }

        }
        void insert()
        {
            if (Page.IsValid)
            {
                SpCrud(0, txtstdname.Text, txtfname.Text, dropdownstdclass.Text, txtfromdate.Text, txttodate.Text, "i");
                reset();
            }
            
        }

        void reset()
        {
            txtId.Text = "";
            txtstdname.Text = "";
            txtfname.Text = "";
            dropdownstdclass.SelectedIndex = -1;
            txtfromdate.Text = "";
            txttodate.Text = "";
        }

        void GetdatabySender()
        {
            Adp = new SqlDataAdapter("select * From tbl_ClassName", Conn);
            Adp.SelectCommand.CommandType = CommandType.Text;
            dt = new DataTable();
            Adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                dropdownstdclass.DataSource = dt;
                dropdownstdclass.DataTextField = "ClassName";
                dropdownstdclass.DataValueField = "ClassName";
                dropdownstdclass.DataBind();
                dropdownstdclass.Items.Insert(0, new ListItem("---Select Class---"));

            }
        }
        #endregion


        #region Events
        protected void SpCrud(int Id, string StudentName, string StudentFname, string clsName, string fromdate, string todate, string action)
        {
            dt = new DataTable();
            cmd = new SqlCommand("Sp_crud", Conn);
            cmd.Parameters.AddWithValue("@P_Id", Id);
            cmd.Parameters.AddWithValue("@P_StudentName", StudentName);
            cmd.Parameters.AddWithValue("@P_StudentFName", StudentFname);
            cmd.Parameters.AddWithValue("@P_StudentClass", clsName);
            cmd.Parameters.AddWithValue("@P_Stdfromdate", fromdate);
            cmd.Parameters.AddWithValue("@P_Stdtodate", todate);
            cmd.Parameters.AddWithValue("@P_Action", action);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();

            Getdata();

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
           
                insert();
                reset();
            

        }







        #endregion

        protected void GridCrud_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridCrud.DataKeys[e.RowIndex].Value);
            SpCrud(id, "", "", "", "", "", "d");
            Getdata();
        }

        protected void GridCrud_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridCrud.EditIndex = e.NewEditIndex;
            Getdata();

        }

        protected void GridCrud_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridCrud.EditIndex = -1;
            Getdata();
        }

        protected void GridCrud_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            TextBox stdId = GridCrud.Rows[e.RowIndex].FindControl("txtstudentId") as TextBox;
            txtId.Text = stdId.Text;
            //string OstdId = stdId.Text;

            TextBox studentName = GridCrud.Rows[e.RowIndex].FindControl("txtstudentName") as TextBox;
            txtstdname.Text = studentName.Text;
            //string Ostdname = studentName.Text;

            TextBox StdFName = GridCrud.Rows[e.RowIndex].FindControl("txtfname") as TextBox;
            txtfname.Text = StdFName.Text;


            //GridViewRow row = GridCrud.Rows[e.NewEditIndex];
            //DropDownList ddlClass = row.FindControl("ddlClass") as DropDownList;
            DropDownList StudentClass = GridCrud.Rows[e.RowIndex].FindControl("ddlclasname") as DropDownList;
            if (StudentClass != null)
            {
                string selectedValue = StudentClass.SelectedValue;

                // Set the selected value to the form dropdown
                dropdownstdclass.SelectedValue = selectedValue;
                // Get the selected value from the GridView dropdown
                //string selectedValue = StudentClass.SelectedValue;

                //// Check if the selected value exists in the form dropdown
                if (dropdownstdclass.Items.FindByValue(selectedValue) != null)
                {
                    // Set the selected value to the form dropdown
                    dropdownstdclass.SelectedValue = selectedValue;
                }
                else
                {
                    // Optionally handle the case where the value does not exist
                    dropdownstdclass.SelectedIndex = -1; // Set to no selection or handle as needed
                }
            }

            TextBox StdfromDate = GridCrud.Rows[e.RowIndex].FindControl("txtstfromdate") as TextBox;
            txtfromdate.Text = StdfromDate.Text;

            TextBox StdTodate = GridCrud.Rows[e.RowIndex].FindControl("txttodate") as TextBox;
            txttodate.Text = StdTodate.Text;

            SpCrud(int.Parse(txtId.Text), txtstdname.Text, txtfname.Text, dropdownstdclass.SelectedValue, txtfromdate.Text, txttodate.Text, "u");
            GridCrud.EditIndex = -1;

            Getdata();


        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            reset();
        }
    }
}