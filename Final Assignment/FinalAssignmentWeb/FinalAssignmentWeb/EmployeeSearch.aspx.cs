using FinalAssignmentLib;
using FinalAssignmentLib.EmmasDataSetTableAdapters;
using FinalAssignmentWeb.Utilities;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalAssignmentWeb
{
    public partial class EmployeeSearch : System.Web.UI.Page, IValidLogin
    {
        internal static EmmasDataSet dsEmmas = new EmmasDataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidateLogin(Context.User.Identity, "Login.aspx");
            LoadEmployees("");
        }
        //Handles authentication
        public void ValidateLogin(IIdentity Identity, string redirectPage)
        {
            if (!Identity.IsAuthenticated)
            {
                Response.Redirect(redirectPage);
            }
        }
        /// <summary>
        /// Retrieves employee records from dataset based on a search string
        /// </summary>
        /// <param name="search"></param>
        public void LoadEmployees(string search)
        {
            employeeTableAdapter daEmployee = new employeeTableAdapter();
            positionTableAdapter daPosition = new positionTableAdapter();

            dsEmmas.employee.Clear();
            try
            {
                daEmployee.Fill(dsEmmas.employee);
                daPosition.Fill(dsEmmas.position);

            }
            catch
            {
                Response.Redirect("Default.aspx");
            }

            //gets positions matching the search
            var positions = dsEmmas.position.Where(p => p.posName.ToLower().Contains(search.ToLower())).Select(p => p.id);

            //gets employees matching the search using name and positionID
            var searchResults = dsEmmas.employee.Where(e => e.empFirst.ToLower().Contains(search.ToLower())
                                                         || e.empLast.ToLower().Contains(search.ToLower())
                                                         || positions.Contains(e.posID)).ToList();



            if (searchResults.Count > 0)
            {
                grvwEmployees.DataSource = searchResults;
                grvwEmployees.DataBind();
            }
            else
            {
                grvwEmployees.DataSource = null;
                grvwEmployees.DataBind();
            }

        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadEmployees(txtSearch.Text);
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            grvwEmployees.PageIndex = 0;
            txtSearch.Text = "";
            LoadEmployees("");
        }
        /// <summary>
        /// Creates an Employee row based on an ID. Creates a new row if ID is -1
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        private EmmasDataSet.employeeRow CreateEmployee(int id)
        {
            EmmasDataSet.employeeRow employee = dsEmmas.employee.NewemployeeRow();

            if (id > -1)
                employee = dsEmmas.employee.FirstOrDefault(c => c.id == id);
            else
                employee.id = dsEmmas.employee.Last().id + 1;

            return employee;
        }

        protected void GrvwEmployees_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grvwEmployees.Rows)
            {
                //row.Cells[0] is the id
                EmmasDataSet.employeeRow employee = CreateEmployee(Convert.ToInt32(row.Cells[0].Text));

                DropDownList ddlPosition = (DropDownList)row.FindControl("ddlPosition");

                string employeePosition = dsEmmas.position.FirstOrDefault(p => p.id == employee.posID).posName;

                //gets the index of the right position from the dropdown
                int positionIndex = ddlPosition.Items.IndexOf(ddlPosition.Items.FindByText(employeePosition));

                ddlPosition.SelectedIndex = positionIndex;

                //disables the dropdown if it's not being edited
                if (grvwEmployees.EditIndex != row.RowIndex)
                    ddlPosition.Enabled = false;
                else
                    ddlPosition.Enabled = true;

            }
        }
        //Handles editing
        protected void GrvwEmployees_RowEditing(object sender, CommandEventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            grvwEmployees.EditIndex = row.RowIndex;
            grvwEmployees.DataBind();
        }
        //Handles canceling edit
        protected void GrvwEmployees_RowCancelingEdit(object sender, CommandEventArgs e)
        {
            grvwEmployees.EditIndex = -1;
            grvwEmployees.DataBind();
        }
        //Handles updating
        protected void GrvwEmployees_RowUpdating(object sender, CommandEventArgs e)
        {
            Button button = (Button)sender;
            int rowIndex = ((GridViewRow)button.NamingContainer).RowIndex;
            employeeTableAdapter daEmployee = new employeeTableAdapter();
            
            //Rows[rowIndex].Cells[0] is the id
            EmmasDataSet.employeeRow employee = CreateEmployee(Convert.ToInt32(grvwEmployees.Rows[rowIndex].Cells[0].Text));

            //Finds controls in the gridview
            TextBox txtFirst = (TextBox)grvwEmployees.Rows[rowIndex].FindControl("txtFirst");
            TextBox txtLast = (TextBox)grvwEmployees.Rows[rowIndex].FindControl("txtLast");
            DropDownList ddlPostion = (DropDownList)grvwEmployees.Rows[rowIndex].FindControl("ddlPosition");

            //assigns values from the gridview
            employee[1] = txtFirst.Text;
            employee[2] = txtLast.Text;
            employee[3] = ddlPostion.SelectedValue;
            
            //validation happens client side
            daEmployee.Update(employee);

            grvwEmployees.EditIndex = -1;
            grvwEmployees.DataBind();
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            employeeTableAdapter daEmployee = new employeeTableAdapter();
            EmmasDataSet.employeeRow employee = CreateEmployee(-1);

            if (txtFirstAdd.Text.Length != 0 && txtLastAdd.Text.Length != 0)
            {
                if (txtFirstAdd.Text.Length <= 30)
                    employee[1] = txtFirstAdd.Text;
                else
                {
                    btnCreate.CssClass += "btn-danger";
                    return;
                }
                if (txtLastAdd.Text.Length <= 50)
                    employee[2] = txtLastAdd.Text;
                else
                {
                    btnCreate.CssClass += "btn-danger";
                    return;
                }
            }
            else
            {
                btnCreate.CssClass += "btn-danger";
                return;
            }

            employee[3] = ddlPositionAdd.SelectedValue;

            daEmployee.Insert(txtFirstAdd.Text, txtLastAdd.Text, Convert.ToInt32(ddlPositionAdd.SelectedValue));
            daEmployee.Update(dsEmmas.employee);
            LoadEmployees("");
        }
    }
}