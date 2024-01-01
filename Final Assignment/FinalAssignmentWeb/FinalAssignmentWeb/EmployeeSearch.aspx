<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EmployeeSearch.aspx.cs" Inherits="FinalAssignmentWeb.EmployeeSearch" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Employee Search Page</h1>
        <div class="form-horizontal">
            <button class="btn btn-primary" type="button" onclick="toggleMinimize()" data-bs-toggle="collapse" id="filterToggle" data-bs-target="#collapseFilter" aria-expanded="true" aria-controls="collapseFilter">
                <i class="fa-solid fa-minimize" id="minimizeIcon"></i>Search
            </button>

            <div class="collapse show" id="collapseFilter">
                <div class="card card-body card-search bg-light">
                    <div class="row">
                        <div class="form-group col-md-8">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="txt-search form-control col-md-8" placeholder="Search by name or position"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4 align-self-end">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-secondary" OnClick="BtnSearch_Click" />
                            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-outline-secondary" OnClick="BtnClear_Click" />
                        </div>
                    </div>
                    <div class="form-group">
                        <button id="btnAdd" class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAdd" aria-expanded="true" aria-controls="collapseFilter">
                            + Add new employee
                        </button>
                    </div>
                    <div class="collapse" id="collapseAdd">
                        <div class="row">
                            <div class="form-group d-block">
                                <asp:TextBox ID="txtFirstAdd" placeholder="First Name" CssClass="form-control d-inline" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtLastAdd" placeholder="Last Name" CssClass="form-control d-inline" runat="server"></asp:TextBox>
                                <asp:DropDownList ID="ddlPositionAdd" CssClass="form-control form-select d-inline" runat="server" DataSourceID="odsPosition" DataTextField="posName" DataValueField="id"></asp:DropDownList>
                                <asp:Button ID="btnCreate" runat="server" CssClass="btn-update btn-update" Text="Submit" OnClick="BtnCreate_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:GridView ID="grvwEmployees" runat="server" CssClass="tbl-employees" AutoGenerateColumns="False" EnableViewState="false" DataKeyNames="id" OnDataBound="GrvwEmployees_DataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="Full Name" SortExpression="empFirst">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirst" runat="server" Text='<%# Bind("empFirst") %>' onKeyUp="ValidateEmployee()" CssClass="form-control is-valid d-inline" Width="175px"></asp:TextBox>
                        <asp:TextBox ID="txtLast" runat="server" Text='<%# Bind("empLast") %>' onKeyUp="ValidateEmployee()" CssClass="form-control is-valid d-inline" Width="200px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("empFirst") %>'></asp:Label>
                        &nbsp;
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("empLast") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Position" SortExpression="posID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlPosition" runat="server" DataSourceID="odsPosition" DataTextField="posName" DataValueField="id" CssClass="ddl-edit-editing" Enabled="False">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlPosition" runat="server" DataSourceID="odsPosition" DataTextField="posName" DataValueField="id" CssClass="ddl-edit" Enabled="False">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" CausesValidation="false" OnCommand="GrvwEmployees_RowUpdating" OnClientClick="return ValidateEmployee()" Text="Update" CssClass="btn-update btn-update" />
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="false" OnCommand="GrvwEmployees_RowCancelingEdit" Text="Cancel" CssClass="btn-cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CausesValidation="false" OnCommand="GrvwEmployees_RowEditing" Text="Edit" CssClass="btn-edit" />
                    </ItemTemplate>
                    <ControlStyle CssClass="btn-update" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsPosition" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalAssignmentLib.EmmasDataSetTableAdapters.positionTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_posName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="posName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="posName" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_posName" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </main>

    <script src="Scripts/validateEmployee.js"></script>
    <script src="Scripts/panelControls.js"></script>
    <script>
        //focuses on edit row after postback
        navigate();
        function navigate() {
            let path = window.location.pathname;
            let dropdown = document.querySelector(".ddl");
            if (dropdown != null)
                window.location.href = `#${dropdown.id}`;
        }
    </script>
</asp:Content>
