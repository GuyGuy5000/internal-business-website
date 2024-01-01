<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalAssignmentWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Emma's Small Engines</h1>
        <div class="grid">
            <!--About-->
            <section class="area-1" aria-labelledby="AboutSection">
                <h2 id="AboutSection">About the project</h2>
                <p>
                    Website built by: Nadav Hilu
                <br />
                    Made for: PROG1210 - RAD Client Server Project
                </p>
                <a href="About.aspx" class="homepage-link">Learn More about this project</a>
            </section>
            <!--Contact-->
            <section class="area-2" aria-labelledby="ContactSection">
                <h2 id="ContactSection">Contact information</h2>
                <p>
                    Phone: (219)-555-2368
                    <br />
                    Welland location: 123 Fake St., Welland ON
                </p>
                <a href="Contact.aspx" class="homepage-link">Contact information</a>
            </section>
            <div id="adminCustomerSection" runat="server">
                <!--Customers-->
                <section id="customerSection" class="area-3" aria-labelledby="CustomerSection">
                    <h2 id="CustomerSection">Customers Section</h2>
                    <p>This section contains navigation for customer related actions</p>
                    <a href="CustomerSearch.aspx" class="homepage-link"><i class="fa-solid fa-magnifying-glass"></i>Search for a Customer</a>
                    <a href="CustomerEdit.aspx?addCustomer=1" class="homepage-link"><i class="fa-solid fa-plus"></i>Add a customer</a>
                </section>
            </div>
            <!--Employees-->
            <div id="adminEmployeeSection" runat="server">
                <section id="employeeSection" class="area-4" aria-labelledby="employeePage">
                    <h2 id="employeePage">Employee Section</h2>
                    <p>This section contains navigation for employee related actions</p>
                    <a href="EmployeeSearch.aspx" class="homepage-link"><i class="fa-solid fa-magnifying-glass"></i>Search employees</a>
                    <a href="EmployeeSearch.aspx#btnAdd" class="homepage-link"><i class="fa-solid fa-plus"></i>Add employee</a>
                </section>
            </div>
        </div>
        <!--Login-->
        <div id="userLoginSection" runat="server">
            <section id="loginSection" style="background-color: rgb(72, 112, 45);" aria-labelledby="loginPage">
                <div style="color: #FFF; text-align: center; padding: 10px 0;">
                    <h2 id="loginPage">Log in</h2>
                    <p>Log in to gain access to restricted parts of the website</p>
                    <a href="login.aspx" class="homepage-link"><i class="fa-solid fa-user"></i> Login</a>
                </div>
            </section>
        </div>


    </main>

</asp:Content>
