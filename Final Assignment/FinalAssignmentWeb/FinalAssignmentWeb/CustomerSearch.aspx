<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerSearch.aspx.cs" Inherits="FinalAssignmentWeb.CustomerSearch" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <asp:HiddenField ID="StoredCustomer" runat="server" OnValueChanged="StoredID_ValueChanged" />
        <h1>Customer Search Page</h1>
        <!--Search-->
        <div class="form-horizontal">
            <button class="btn btn-primary" type="button" onclick="toggleMinimize()" data-bs-toggle="collapse" id="filterToggle" data-bs-target="#collapseFilter" aria-expanded="true" aria-controls="collapseFilter">
                <i class="fa-solid fa-minimize" id="minimizeIcon"></i>Search
            </button>

            <div class="collapse show" id="collapseFilter">
                <div class="card card-body card-search bg-light">
                    <div class="row">
                        <div class="form-group col-md-8">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="txt-search form-control col-md-8" placeholder="Search by name, phone, email, city, address, postal code, and order date"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4 align-self-end">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-secondary" />
                            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-outline-secondary" OnClick="BtnClear_Click" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnAdd" runat="server" Text="+ Add new customer" CssClass="btn btn-outline-primary" OnClick="BtnAdd_Click" />
                    </div>
                </div>
            </div>
        </div>
        <asp:GridView ID="grvwCustomers" runat="server" AutoGenerateColumns="False" CssClass="tbl-customers" PageSize="5" AllowPaging="True" OnPageIndexChanging="GrvwCustomers_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="FullName" HeaderText="Full Name" ReadOnly="True" SortExpression="FullName" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" ReadOnly="True" SortExpression="Phone" />
                <asp:BoundField DataField="custEmail" HeaderText="Email" SortExpression="custEmail" />
                <asp:BoundField DataField="custCity" HeaderText="City" SortExpression="custCity" />
                <asp:BoundField DataField="custAddress" HeaderText="Address" SortExpression="custAddress" />
                <asp:BoundField DataField="custPostal" HeaderText="Postal Code" SortExpression="custPostal" />
                <asp:BoundField DataField="LatestOrder" HeaderText="Latest Order" SortExpression="LatestOrder" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CssClass="btn-edit" OnClientClick=<%# "StoreCustomerID(\'" + Eval("id") + "\')"  %> Text="Details" CausesValidation="False" UseSubmitBehavior="False" OnClick="BtnDetails_Click"/>
                        <asp:Button ID="btnOrders" runat="server" CssClass="btn-orders" OnClientClick=<%# "StoreCustomerID(\'" + Eval("id") + "\')"  %> Text="Orders" CausesValidation="False" UseSubmitBehavior="False" OnClick="BtnOrders_Click"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <!--object data source only used for reference-->
        <asp:ObjectDataSource ID="odsCustomerLUT" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalAssignmentLib.EmmasDataSetTableAdapters.CustomerLUTTableAdapter"></asp:ObjectDataSource>
    </main>

    <script>
        //stores selected customer in a hidden field which triggers a ValueChanged event
        function StoreCustomerID(id) {
            document.getElementById("MainContent_StoredCustomer").value = id;
        }
        //toggles the icon for the search button collapse
        function toggleMinimize() {
            let icon = document.getElementById("minimizeIcon");

            if (icon.className.includes("minimize")) {
                icon.setAttribute("class", "fa-solid fa-maximize");
            }
            else {
                icon.setAttribute("class", "fa-solid fa-minimize");
            }
        }
    </script>
</asp:Content>
