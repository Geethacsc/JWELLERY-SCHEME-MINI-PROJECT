using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using gold;

public partial class paydue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string accountNo = Session["account"].ToString();

        DataTable accountDetails = DBScheme.getSchemeDetails(accountNo);

        name.Text = accountDetails.Rows[0][0].ToString();
        account.Text = accountDetails.Rows[0][1].ToString();
        amt.Text = accountDetails.Rows[0][2].ToString();
        paidIns.Text = accountDetails.Rows[0][3].ToString();
        weight.Text = accountDetails.Rows[0][4].ToString();
        scheme.Text=accountDetails.Rows[0][5].ToString();
        Pay.Text = accountDetails.Rows[0][6].ToString();

        if (Pay.Text.Equals("Pay"))
        {
            Pay.Enabled=true;
        }
        Session["amount"] = accountDetails.Rows[0][2].ToString();
        Session["paystatus"]=accountDetails.Rows[0][6].ToString();
    }

    protected void Ledger_Click(object sender, EventArgs e)
    {
        Response.Redirect("Ledger.aspx");
    }

    protected void Pay_Click(object sender, EventArgs e)
    {
        Response.Redirect("OnlinePay.aspx");
    }

    protected void Home_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}