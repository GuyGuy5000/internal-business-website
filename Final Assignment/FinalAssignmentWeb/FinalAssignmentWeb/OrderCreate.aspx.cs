using FinalAssignmentLib;
using FinalAssignmentLib.EmmasDataSetTableAdapters;
using FinalAssignmentWeb.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalAssignmentWeb
{
    public partial class CreateOrder : System.Web.UI.Page, IValidLogin
    {
        private static EmmasDataSet dsEmmas = new EmmasDataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCustomer();
        }

        public void ValidateLogin(IIdentity Identity, string redirectPage)
        {
            if (!Identity.IsAuthenticated)
            {
                Response.Redirect(redirectPage);
            }
        }

        private void GetCustomer()
        {
            CustomerLUTTableAdapter daCustomer = new CustomerLUTTableAdapter();

            dsEmmas.Clear();
            daCustomer.Fill(dsEmmas.CustomerLUT);

            Label custID = (Label)fmvwOrder.FindControl("custID");
            int storedCustomer = Convert.ToInt32(Session["StoredCustomer"]);
            custID.Text = dsEmmas.CustomerLUT.FirstOrDefault(c => c.id == storedCustomer).FullName;
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderSearch.aspx");
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            receiptTableAdapter daReceipt = new receiptTableAdapter();

            Calendar ordDate = (Calendar)fmvwOrder.FindControl("ordDate");
            CheckBox chkPaid = (CheckBox)fmvwOrder.FindControl("ordPaidCheckBox");
            DropDownList ddlPayment = (DropDownList)fmvwOrder.FindControl("ddlPayment");
            DropDownList ddlEmployee = (DropDownList)fmvwOrder.FindControl("ddlSalesEmployees");
            Label custId = (Label)fmvwOrder.FindControl("custID");

            string ordNumber = (Convert.ToInt32(Session["ReceiptCount"]) + 1).ToString();
            DateTime receiptDate = ordDate.SelectedDate;
            bool receiptChkPaid = chkPaid.Checked;
            int receiptPaymentID = Convert.ToInt32(ddlPayment.SelectedValue);
            int receiptEmpID = Convert.ToInt32(ddlEmployee.SelectedValue);
            int receiptCustID = Convert.ToInt32(Session["StoredCustomer"]);

            daReceipt.Insert(ordNumber, receiptDate, receiptChkPaid, receiptPaymentID, receiptCustID, receiptEmpID);

            daReceipt.Update(dsEmmas.receipt);

            Response.Redirect("OrderSearch.aspx");
        }


    }
}