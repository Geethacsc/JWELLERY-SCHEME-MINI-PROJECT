using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TransactionDetails
/// </summary>
public class TransactionDetails
{
    private int instNo;

    public int InstNo
    {
        get { return instNo; }
        set { instNo = value; }
    }

    private String typeOfTrans;

    public String TypeOfTrans
    {
        get { return typeOfTrans; }
        set { typeOfTrans = value; }
    }

    private float rateOnPay;

    public float RateOnPay
    {
        get { return rateOnPay; }
        set { rateOnPay = value; }
    }

    private DateTime paidDate;

    public DateTime PaidDate
    {
        get { return paidDate; }
        set { paidDate = value; }
    }

    private long receiptNo;

    public long ReceiptNo
    {
        get { return receiptNo; }
        set { receiptNo = value; }
    }

    private long amount;

    public long Amount
    {
        get { return amount; }
        set {  amount = value; }
    }

    private float weight;

    public float Weight
    {
        get { return weight; }
        set { weight = value; }
    }

}