using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GridView_Update_GridViewUpdate : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["Ginie"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private void BindGridView()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string sql = "SELECT * FROM BoQ_Upload";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();

            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            con.Close();

            gridDView.DataSource = dt;
            gridDView.DataBind();
        }
    }

    //================================{ Editing GridView }================================

    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        gridDView.EditIndex = e.NewEditIndex;
        this.BindGridView();
    }

    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // fetching id by DataKeys as for PK
        GridViewRow row = gridDView.Rows[e.RowIndex];
        int customerId = Convert.ToInt32(gridDView.DataKeys[e.RowIndex].Values[0]);

        // fetching field edited value
        TextBox txtBoqQty = row.FindControl("BoqQty") as TextBox;
        int boqQty = Convert.ToInt32(txtBoqQty.Text);

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE BoQ_Upload SET BoqQty = @BoqQty where id = @id"))
            {
                cmd.Parameters.AddWithValue("@BoqQty", boqQty);
                cmd.Parameters.AddWithValue("@id", customerId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        gridDView.EditIndex = -1;
        this.BindGridView();
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        gridDView.EditIndex = -1;
        this.BindGridView();
    }
}