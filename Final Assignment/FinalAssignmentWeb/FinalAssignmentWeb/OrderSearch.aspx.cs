using FinalAssignmentLib;
using FinalAssignmentLib.EmmasDataSetTableAdapters;
using FinalAssignmentWeb.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace FinalAssignmentWeb
{
    public partial class OrderSearch : System.Web.UI.Page, IValidLogin
    {
        internal static EmmasDataSet dsEmmas = new EmmasDataSet();

        public void ValidateLogin(IIdentity Identity, string redirectPage)
        {
            if (!Identity.IsAuthenticated)
            {
                Response.Redirect(redirectPage);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidateLogin(Context.User.Identity, "Login.aspx");
            LoadOrders("");
        }

        /// <summary>
        /// Retrieves receipt records from dataset based on a search string
        /// </summary>
        /// <param name="search"></param>
        public void LoadOrders(string search)
        {
            receiptTableAdapter daReceipt = new receiptTableAdapter();
            paymentTableAdapter daPayment = new paymentTableAdapter();

            dsEmmas.Clear();
            try
            {
                daReceipt.Fill(dsEmmas.receipt);
                daPayment.Fill(dsEmmas.payment);
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }

            //gets payment types matching the search
            var payTypes = dsEmmas.payment.Where(p => p.payType.ToLower().Contains(search.ToLower())).Select(p => p.id);

            //gets employees matching the search using name and positionID
            var searchResults = dsEmmas.receipt.Where(r =>  (r.ordNumber.ToString().ToLower().Contains(search.ToLower())
                                                         || r.ordDate.ToString("M").ToLower().Contains(search.ToLower())
                                                         || payTypes.Contains(r.paymentID))
                                                         && Convert.ToInt32(Session["StoredCustomer"]) == r.custID).ToList();
            if (searchResults.Count > 0)
            {
                grvwReceipt.DataSource = searchResults;
                grvwReceipt.DataBind();
            }
            else
            {
                grvwReceipt.DataSource = null;
                grvwReceipt.DataBind();
            }
        }


        /// <summary>
        /// Creates a Receipt row based on an order number. Creates a new row if ordNumber is null or empty
        /// </summary>
        /// <param name="ordNumber"></param>
        /// <returns></returns>
        private EmmasDataSet.receiptRow CreateReceipt(string ordNumber)
        {
            EmmasDataSet.receiptRow receipt = dsEmmas.receipt.NewreceiptRow();

            if (!String.IsNullOrEmpty(ordNumber))
                receipt = dsEmmas.receipt.FirstOrDefault(c => c.ordNumber == ordNumber);
            else
                receipt.id = dsEmmas.receipt.Last().id + 1;

            return receipt;
        }

        //changes each dropdown to display the correct payment type
        protected void GrvwReceipt_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grvwReceipt.Rows)
            {
                string ordNumber = ((Label)grvwReceipt.Rows[row.RowIndex].FindControl("ordNumber")).Text;
                EmmasDataSet.receiptRow receipt = CreateReceipt(ordNumber);

                DropDownList ddlPayment = (DropDownList)row.FindControl("ddlPayment");
                string receiptPayType = dsEmmas.payment.FirstOrDefault(p => p.id == receipt.paymentID).payType;

                //gets the index of the right payment from the dropdown
                int paymentIndex = ddlPayment.Items.IndexOf(ddlPayment.Items.FindByText(receiptPayType));
                ddlPayment.SelectedIndex = paymentIndex;

                //disables the dropdown if it's not being edited
                if (grvwReceipt.EditIndex != row.RowIndex)
                    ddlPayment.Enabled = false;
                else
                    ddlPayment.Enabled = true;

            }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadOrders(txtSearch.Text);
        }
        protected void BtnClear_Click(object sender, EventArgs e)
        {
            grvwReceipt.PageIndex = 0;
            txtSearch.Text = "";
            LoadOrders("");
        }

        protected void GrvwReceipt_RowEditing(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;

            grvwReceipt.EditIndex = row.RowIndex;
            grvwReceipt.DataBind();
        }

        protected void GrvwReceipt_RowCancelingEdit(object sender, EventArgs e)
        {
            grvwReceipt.EditIndex = -1;
            grvwReceipt.DataBind();
        }

        protected void GrvwReceipt_RowUpdating(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int rowIndex = ((GridViewRow)button.NamingContainer).RowIndex;
            receiptTableAdapter daReceipt = new receiptTableAdapter();

            //Rows[rowIndex] has the ordNumber
            string ordNumber = ((Label)grvwReceipt.Rows[rowIndex].FindControl("ordNumber")).Text;
            EmmasDataSet.receiptRow receipt = CreateReceipt(ordNumber);

            //Finds controls in the gridview
            CheckBox chkPaid = (CheckBox)grvwReceipt.Rows[rowIndex].FindControl("chkPaid");
            DropDownList ddlPayType = (DropDownList)grvwReceipt.Rows[rowIndex].FindControl("ddlPayment");

            //assigns values from the gridview
            receipt[3] = chkPaid.Checked;
            receipt[4] = Convert.ToInt32(ddlPayType.SelectedValue);

            daReceipt.Update(receipt);
            grvwReceipt.EditIndex = -1;
            grvwReceipt.DataBind();
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Session["ReceiptCount"] = dsEmmas.receipt.Count;
            Response.Redirect("OrderCreate.aspx");
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerSearch.aspx");
        }
    }
}