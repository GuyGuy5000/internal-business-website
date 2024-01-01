<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FinalAssignmentWeb.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <h3>Site built by Nadav Hilu.</h3>
        <p>This website application built using visual studio's ASP.NET framework uses a combination of HTML, JavaScript,
            CSS, and C#.</p>
        <h4>Purpose:</h4>
        <p>The purpose of this web app is educational. The business rules and logic for the site are based on a fictional client
            with a fictional business.
        </p>
        <h4>Key Features:</h4>
        <ul>
            <li>Login system using Microsoft's Identity Framework</li>
            <li>Communicates with a relational database for employee and customer data management</li>
            <li>Design standards and practices used to ensure professionalism and user friendliness</li>
        </ul>
    </main>
</asp:Content>
