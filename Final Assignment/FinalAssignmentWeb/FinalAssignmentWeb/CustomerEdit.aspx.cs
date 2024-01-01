using FinalAssignmentLib;
using FinalAssignmentLib.EmmasDataSetTableAdapters;
using FinalAssignmentWeb.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalAssignmentWeb
{
    public partial class CustomerEdit : System.Web.UI.Page, IValidLogin
    {
        private static EmmasDataSet dsEmmas = new EmmasDataSet();
        private customerTableAdapter daCustomer = new customerTableAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidateLogin(Context.User.Identity, "Login.aspx");

            daCustomer.Fill(dsEmmas.customer);

            //check for switching formview to insert mode
            if (Request.QueryString["addCustomer"] != null)
            {
                fmvwCustomer.ChangeMode(FormViewMode.Insert);
                fmvwCustomerInfo.Visible = false;
                btnTablePanel.Visible = false;
            }

            //check to see if a customer was selected from the search page
            if (fmvwCustomer.CurrentMode == FormViewMode.ReadOnly)
                if ((string)Session["StoredCustomer"] != null)
                {
                    fmvwCustomer.PageIndex = Convert.ToInt32(Session["StoredCustomer"]) -1;
                    fmvwCustomerInfo.Visible = true;
                }
                else
                    Response.Redirect("CustomerSearch.aspx");

            //check to see if a customer has any orders
            if (fmvwCustomerInfo.FindControl("OrdersMadeLabel") == null)
            {
                customerInfoDiv.InnerHtml = "<p style='width: 200px; margin: 60px auto 0 auto;'> No additional information to display</p>";
            }

        }

        public void ValidateLogin(IIdentity Identity, string redirectPage)
        {
            if (!Identity.IsAuthenticated)
                Response.Redirect(redirectPage);
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            EmmasDataSet.customerRow customer = CreateCustomer(Convert.ToInt32(Session["StoredCustomer"].ToString()));

            //validation happens client side
            daCustomer.Update(customer);
            fmvwCustomer.ChangeMode(FormViewMode.ReadOnly);
            fmvwCustomer.PageIndex = customer.id - 1;
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            EmmasDataSet.customerRow customer = CreateCustomer(-1);

            daCustomer.Insert(customer.custFirst, customer.custLast, customer.custPhone, customer.custAddress, customer.custCity, customer.custPostal, customer.custEmail);
            //validation happens client side
            daCustomer.Update(dsEmmas.customer);
            fmvwCustomer.ChangeMode(FormViewMode.ReadOnly);
            fmvwCustomer.PageIndex = customer.id - 1;
        }

        /// <summary>
        /// Creates a Customer row based on an ID. Creates a new row if ID is -1
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        private EmmasDataSet.customerRow CreateCustomer(int id)
        {
            EmmasDataSet.customerRow customer = dsEmmas.customer.NewcustomerRow();

            if (id > -1)
                customer = dsEmmas.customer.FirstOrDefault(c => c.id == id);
            else
                customer.id = dsEmmas.customer.Last().id + 1;

            //Finds controls in the formview
            TextBox first = (TextBox)fmvwCustomer.FindControl("custFirstTextBox");
            TextBox last = (TextBox)fmvwCustomer.FindControl("custLastTextBox");
            TextBox phone = (TextBox)fmvwCustomer.FindControl("custPhoneTextBox");
            TextBox email = (TextBox)fmvwCustomer.FindControl("custEmailTextBox");
            TextBox postal = (TextBox)fmvwCustomer.FindControl("custPostalTextBox");
            TextBox city = (TextBox)fmvwCustomer.FindControl("custCityTextBox");
            TextBox address = (TextBox)fmvwCustomer.FindControl("custAddressTextBox");

            //assigns values from the formview
            customer[1] = first.Text;
            customer[2] = last.Text;
            customer[3] = phone.Text;
            customer[4] = address.Text;
            customer[5] = city.Text;
            customer[6] = postal.Text.ToUpper();
            customer[7] = email.Text;

            return customer;
        }

        protected void BtnOrders_Click(object sender, EventArgs e)
        {
            if (Session["StoredCustomer"] != null)
                Response.Redirect("OrderSearch.aspx");
        }
    }
}