using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using gold;

public partial class Ledger : System.Web.UI.Page
{

    public DataTable transTb;
    public List<TransactionDetails> transList;
    protected void Page_Load(object sender, EventArgs e)
    {
        string accountNo = Session["account"].ToString();

        DataTable accountDetails=DBScheme.getAccountDetails(accountNo);

        name.Text = accountDetails.Rows[0][0].ToString();
        mobile.Text=accountDetails.Rows[0][1].ToString();
        accountId.Text = accountDetails.Rows[0][2].ToString();
        inst.Text = accountDetails.Rows[0][3].ToString();
        totAmt.Text = accountDetails.Rows[0][4].ToString();
        totWgt.Text = accountDetails.Rows[0][5].ToString();
        scheme.Text = accountDetails.Rows[0][6].ToString();
    }

    protected void transactionDetails_Click(object sender, EventArgs e)
    {
        RepeatInformation.DataSource = DBScheme.GetTransactionDetails(accountId.Text);
        RepeatInformation.DataBind();
        
    }

    protected void testDataGrid_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}