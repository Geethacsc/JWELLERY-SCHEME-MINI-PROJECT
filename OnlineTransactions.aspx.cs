using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using gold;

public partial class OnlineTransactions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String account = Session["account"].ToString();
        OTransRepeater.DataSource = DBScheme.getOnlineTransactions(account);
        OTransRepeater.DataBind();
    }
}