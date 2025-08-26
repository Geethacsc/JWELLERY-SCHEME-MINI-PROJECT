using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using gold;

public partial class Schemes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SchemeList.DataSource = DBScheme.getSchemeList();
        SchemeList.DataBind();
    }

    protected void SchemeList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void joinScheme(object sender, EventArgs e)
    {
        Response.Redirect("JoinScheme.aspx");
    }

}