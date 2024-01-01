<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="OrderSearch.aspx.cs" Inherits="FinalAssignmentWeb.OrderSearch" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Order Search Page</h1>
    <div class="form-horizontal">
        <button class="btn btn-primary" type="button" onclick="toggleMinimize()" data-bs-toggle="collapse" id="filterToggle" data-bs-target="#collapseFilter" aria-expanded="true" aria-controls="collapseFilter">
            <i class="fa-solid fa-minimize" id="minimizeIcon"></i>Search
        </button>

        <div class="collapse show" id="collapseFilter">
            <div class="card card-body card-search bg-light">
                <div class="row">
                    <div class="form-group col-md-8">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="txt-search form-control col-md-8" placeholder="Search by order number, date, and payment type"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 align-self-end">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-secondary" OnClick="BtnSearch_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-outline-secondary" OnClick="BtnClear_Click" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAdd" runat="server" Text="+ Create new order" CssClass="btn btn-outline-primary" OnClick="BtnAdd_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-outline-primary" OnClick="BtnBack_Click" />
                </div>
            </div>
        </div>
    </div>
    <asp:GridView ID="grvwReceipt" runat="server" CssClass="tbl-orders" EnableViewState="False" AutoGenerateColumns="False" DataKeyNames="id" OnDataBound="GrvwReceipt_DataBound">
        <Columns>
            <asp:TemplateField HeaderText="Order #" SortExpression="ordNumber" HeaderStyle-Width="50px">
                <EditItemTemplate>
                    <asp:Label ID="ordNumber" runat="server" Text='<%# Bind("ordNumber") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="ordNumber" runat="server" Text='<%# Bind("ordNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="ordDate">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ordDate", "{0:m}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ordDate", "{0:m}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Paid" SortExpression="ordPaid">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkPaid" runat="server" Checked='<%# Bind("ordPaid") %>' CssClass="chk-paid" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkPaid" runat="server" Checked='<%# Bind("ordPaid") %>' CssClass="chk-paid" Enabled="false" />
                </ItemTemplate>
                <ControlStyle CssClass="chk-paid" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Payment type" SortExpression="paymentID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlPayment" runat="server" CssClass="ddl-edit-editing" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPayment" runat="server" CssClass="ddl-edit" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id">
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn-update" Text="Update" OnClick="GrvwReceipt_RowUpdating"></asp:Button>
                    &nbsp;<asp:Button ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn-cancel" Text="Cancel" OnClick="GrvwReceipt_RowCancelingEdit"></asp:Button>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn-edit" Text="Edit" OnClick="GrvwReceipt_RowEditing"></asp:Button>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="odsPayment" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalAssignmentLib.EmmasDataSetTableAdapters.paymentTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_payType" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="payType" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="payType" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_payType" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
