using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalAssignmentWeb.Utilities
{
    /// <summary>
    /// Interface to make sure all pages that need a login check authentication
    /// </summary>
    public interface IValidLogin
    {
        void ValidateLogin(System.Security.Principal.IIdentity Identity, string redirectPage);
    }
}