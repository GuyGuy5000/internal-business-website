using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalAssignmentWeb
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated) //user is logged in
            {
                adminCustomerSection.Visible = true;
                adminEmployeeSection.Visible = true;
                userLoginSection.Visible = false;
            }
            else //user isn't logged in
            {
                adminCustomerSection.Visible = false;
                adminEmployeeSection.Visible = false;
                userLoginSection.Visible = true;
            }

        }
    }
}