<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Registration.aspx.cs" Inherits="FinalAssignmentWeb.Registration" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--
        This page is not in use anywhere in the website, but can be used to add users to the database
    -->
    <div class="login-main">

        <main>
            <div class="login-content">
                <h1>Register New User</h1>
                <div class="input-div">
                    <label for="Username">Username:</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="login-txt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfValidUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                </div>
                <div class="input-div">
                    <label for="Password">Password:</label>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="login-txt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfValidPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                </div>
                <div class="input-div">
                    <label for="Confirmation">Confirm:</label>
                    <asp:TextBox ID="txtConfirm" TextMode="Password" runat="server" CssClass="login-txt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfValidConfirm" runat="server" ControlToValidate="txtConfirm" ErrorMessage="Password confirmation is required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="cprValidPassword" runat="server" ControlToValidate="txtPassword" ControlToCompare="txtConfirm" ErrorMessage="Confirmation does not match password"></asp:CompareValidator>
                </div>
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="Register_Click" />
            </div>
        </main>
    </div>
</asp:Content>
