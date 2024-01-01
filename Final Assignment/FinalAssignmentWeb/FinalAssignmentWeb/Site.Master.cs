using FinalAssignmentLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalAssignmentWeb
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated) //user is logged in
            {
                btnLogin.Enabled = false;
                btnLogout.Enabled = true;
                btnPanel.Enabled = true;
                btnPanel.Visible = true;
                lblLogin.Visible = false;

                //admin pannel links
                AdminLink1.Visible = true;
                AdminLink2.Visible = true;
                AdminLink4.Visible = true;
            }
            else //user isn't logged in
            {
                btnLogin.Enabled = true;
                btnLogout.Enabled = false;
                btnPanel.Enabled = false;
                btnPanel.Visible = false;
                lblLogin.Visible = true;

                //admin pannel links
                AdminLink1.Visible = false;
                AdminLink2.Visible = false;
                AdminLink4.Visible = false;
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Default.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}