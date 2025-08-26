using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using gold;
using System.Windows.Forms;

public partial class OnlinePay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        amt.Text = Session["amount"].ToString();
        Pay.Text = Session["paystatus"].ToString();

        if (Pay.Text.Equals("Pay"))
        {
            Pay.Enabled = true;
        }
    }

    protected void Pay_Click(object sender, EventArgs e)
    {
        String account = Session["account"].ToString();
        String transType=selectTrans.SelectedItem.Value;
        String res = DBScheme.payInstallment(transType, amt.Text, account);
        MessageBox.Show("Installment Paid Successfully");
        Response.Redirect("Paydue.aspx");
    }


    protected void selectTransChanged(object sender, EventArgs e)
    {
        if (selectTrans.SelectedItem.Value.Equals("UPI"))
        {
            Label1.Visible = true;
            upi.Visible=true;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            debit.Visible = false;
            cvc.Visible = false;
            pin.Visible = false;
        }

        else if (selectTrans.SelectedItem.Value.Equals("DEBIT")){
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            debit.Visible = true;
            cvc.Visible = true;
            pin.Visible = true;
            Label1.Visible = false;
            upi.Visible = false;
        }
           
        
    }

    
}