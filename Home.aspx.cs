using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using gold;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt= DBScheme.getProductRate();
        p1.Text = dt.Rows[0][0].ToString();
        p2.Text = dt.Rows[1][0].ToString();

        pr1.Text=dt.Rows[0][1].ToString();
        pr2.Text=dt.Rows[1][1].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("paydue.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Ledger.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddExisting.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Schemes.aspx");
    }
}