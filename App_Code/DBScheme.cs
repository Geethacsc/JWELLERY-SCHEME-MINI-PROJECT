using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DB
/// </summary>
/// 

namespace gold
{
    public class DBScheme
    {

        //CS ="Data Source=DESKTOP-QG346RP;Initial Catalog=capstone;Persist Security Info=True;User ID=root;Password=root;Encrypt=False;TrustServerCertificate=True"
        public static String CS = "Server=localhost;Database=capstone;User ID=root,Password=root;Trusted_Connection=True;";


        public static String login(String userId,String pwd)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spUserLogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.Parameters.AddWithValue("@pwd", pwd);

                return cmd.ExecuteScalar().ToString();
            }
        }


        public static SqlDataReader getSchemeList()
        {
            SqlConnection con = new SqlConnection(CS);

            con.Open();
            SqlCommand cmd = new SqlCommand("spSchemeList", con);
            cmd.CommandType = CommandType.StoredProcedure;

            return cmd.ExecuteReader();
        }
        public static DataTable getSchemeDetails(string accountNo)
        {
            DataTable dt = new DataTable("SchemeDetails");
            using (SqlConnection con = new SqlConnection(CS))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("spGetSchemeDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@account", accountNo);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            return dt;
        }


        public static DataTable getAccountDetails(string accountNo)
        {
            DataTable ds = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("spGetAccountDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@account", accountNo);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
            }

            return ds;
        }

        public static SqlDataReader GetTransactionDetails(String accountId)
        {
            string regno = accountId.Substring(accountId.LastIndexOf('-') + 1);
            DataTable dt = new DataTable("Transaction_Details");

            SqlConnection con = new SqlConnection(CS);
            con.Open();
            SqlCommand cmd = new SqlCommand("spGetTransactionDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@regno", regno);
            return cmd.ExecuteReader();
        }


        public static String addExisting(String groupCode, String regno)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spAddScheme", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@group_code", groupCode);
                cmd.Parameters.AddWithValue("@regno", regno);

                return cmd.ExecuteScalar().ToString();
            }
        }

        public static String payInstallment(String typeOfTrans, String amount, String accountNo)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("spPayInst", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@typeOfTrans", typeOfTrans);
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.Parameters.AddWithValue("@account", accountNo);

                cmd.ExecuteNonQuery();
            }
            return "SUCCESS";
        }

        public static DataTable getProductRate()
        {
            DataTable dt = new DataTable("product");

            using(SqlConnection con=new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("spGetProductRate",con);
                cmd.CommandType=CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                
            }
            return dt;
        }

        public static SqlDataReader getOnlineTransactions(String accountNo)
        {
            SqlConnection con = new SqlConnection(CS);
            con.Open();
            SqlCommand cmd = new SqlCommand("spGetOnlineTransactions", con);
            cmd.CommandType=CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@account", accountNo);
            return cmd.ExecuteReader();
        }
    }
}
