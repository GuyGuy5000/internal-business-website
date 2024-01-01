using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace FinalAssignmentWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Not used in the UI. Only authenticated users should be able to create new users
        protected void Register_Click(object sender, EventArgs e)
        {
            Session["RegisterRedirectUsername"] = txtUsername.Text;
            Response.Redirect("~/Registration.aspx");
        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> store = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(store);

            IdentityUser user = manager.Find(txtUsername.Text, txtPassword.Text);

            if (user == null)
            {
                //uses javascript to show an alert
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect username or password!')", true);
            }
            else
            {
                var authernticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authernticationManager.SignIn(userIdentity);
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}