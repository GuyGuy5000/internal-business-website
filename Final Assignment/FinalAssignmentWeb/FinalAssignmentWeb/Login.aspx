<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="FinalAssignmentWeb.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="login-main">
        <main>
            <div class="login-content">
                <h1>Sign in</h1>
                <div class="input-div">
                    <label for="Username">Username:</label>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </div>
                <div class="input-div">
                    <label for="Password">Password:</label>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="rfValidUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="rfValidPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Sign in" OnClick="SignIn_Click" />

                <!--
                    Commented out after adding users
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CausesValidation="False" OnClick="Register_Click" />
                -->

            </div>
        </main>
    </div>
</asp:Content>
