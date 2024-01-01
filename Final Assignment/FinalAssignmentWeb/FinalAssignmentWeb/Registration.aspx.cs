using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalAssignmentWeb.Utilities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace FinalAssignmentWeb
{
    public partial class Registration : System.Web.UI.Page, IValidLogin
    {
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
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> store = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(store);

            IdentityUser user = new IdentityUser(txtUsername.Text);

            IdentityResult result = manager.Create(user, txtPassword.Text);

            if (result.Succeeded)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Registered!')", true);
            }
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('${result.Errors.FirstOrDefault()}')", true);
            }
        }
    }
}