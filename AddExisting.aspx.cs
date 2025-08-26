using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using gold;

public partial class AddExisting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String accountNo=DBScheme.addExisting(groupCode.Value, regno.Value);
        if (accountNo != null)
        {
            Session["account"] = accountNo;
            Response.Redirect("home.aspx");
        }
    }
}