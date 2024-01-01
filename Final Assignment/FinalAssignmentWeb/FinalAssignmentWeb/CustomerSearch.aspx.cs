using FinalAssignmentLib;
using FinalAssignmentLib.EmmasDataSetTableAdapters;
using FinalAssignmentWeb.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalAssignmentWeb
{
    public partial class CustomerSearch : System.Web.UI.Page, IValidLogin
    {
        internal static EmmasDataSet dsEmmas = new EmmasDataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidateLogin(Context.User.Identity, "Login.aspx");
            LoadCustomers(txtSearch.Text);
            Session["StoredCustomer"] = null;
        }

        //Handles Authentication
        public void ValidateLogin(IIdentity Identity, string redirectPage)
        {
            if (!Identity.IsAuthenticated)
            {
                Response.Redirect(redirectPage);
            };
        }

        /// <summary>
        /// Retrieves customer records from dataset based on a search string
        /// </summary>
        /// <param name="search"></param>
        private void LoadCustomers(string search)
        {
            CustomerLUTTableAdapter daCustomerLUT = new CustomerLUTTableAdapter();

            dsEmmas.CustomerLUT.Clear();
            try
            {
                daCustomerLUT.Fill(dsEmmas.CustomerLUT);
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }

            var searchResults = dsEmmas.CustomerLUT.Where(c => c.FullName.ToLower().Contains(search.ToLower())
                                                               || c.Phone.Contains(search.ToLower())
                                                               || c.custCity.ToLower().Contains(search.ToLower())
                                                               || c.custPostal.ToLower().Contains(search.ToLower())
                                                               || c.custAddress.ToLower().Contains(search.ToLower())
                                                               || c.custEmail.ToLower().Contains(search.ToLower())
                                                               || c.LatestOrder.ToLower().Contains(search.ToLower())).ToList();

            //Not yet implemented
            //var sortedResults = searchResults.OrderBy(c => c.FullName)
            if (searchResults.Count > 0)
            {
                grvwCustomers.DataSource = searchResults;
                grvwCustomers.DataBind();
            }
            else
            {
                grvwCustomers.DataSource = null;
                grvwCustomers.DataBind();

            }
        }
        //resets the search
        protected void BtnClear_Click(object sender, EventArgs e)
        {
            grvwCustomers.PageIndex = 0;
            txtSearch.Text = "";
            LoadCustomers("");
        }

        //stores the ID of the selected customer in the session
        protected void StoredID_ValueChanged(object sender, EventArgs e)
        {
            Session["StoredCustomer"] = StoredCustomer.Value.ToString();
        }

        //Handles paging
        protected void GrvwCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvwCustomers.PageIndex = e.NewPageIndex;
            LoadCustomers(txtSearch.Text);
        }
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerEdit.aspx?addCustomer=1");
        }
        protected void BtnOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderSearch.aspx");
        }
        protected void BtnDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerEdit.aspx");
        }
    }
}