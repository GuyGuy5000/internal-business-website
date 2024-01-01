using Microsoft.Owin;
using Owin;
using System;
using System.Threading.Tasks;
using Microsoft.Owin.Security.Cookies;
using Microsoft.AspNet.Identity;

[assembly: OwinStartup(typeof(FinalAssignmentWeb.Startup1))]

namespace FinalAssignmentWeb
{
    public class Startup1
    {
        public void Configuration(IAppBuilder app)
        {
            // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=316888
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                CookieName = "LoginCookie",
                LoginPath = new PathString("/Login"),
                LogoutPath = new PathString("/Default"),
                ExpireTimeSpan = System.TimeSpan.FromMinutes(5),

            });
        }
    }
}
