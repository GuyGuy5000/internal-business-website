<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="OrderCreate.aspx.cs" Inherits="FinalAssignmentWeb.CreateOrder" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Order Creation Page</h1>
    <div class="fmvw-containter">
        <asp:FormView ID="fmvwOrder" runat="server" CssClass="fmvw-template" DataSourceID="odsReceipt" DataKeyNames="id" DefaultMode="Insert">
            <InsertItemTemplate>
                <h4>Create New Order</h4>
                <div class="row">
                    <div class="col-sm">
                        <label class="fmvw-template-label" for="ordDate">Date:</label>
                        <asp:Calendar ID="ordDate" runat="server" SelectedDate='<%# DateTime.Today %>'
                            DayStyle-ForeColor="White"
                            BackColor="#457600"
                            BorderColor="#335700"
                            BorderWidth="3px"
                            DayStyle-Height="40px"
                            DayStyle-Width="40px"
                            DayStyle-CssClass="btn-day"
                            SelectedDayStyle-BackColor="#00cc00"
                            NextPrevStyle-ForeColor="White"
                            NextPrevStyle-CssClass="btn-day"
                            TitleFormat="MonthYear"
                            TitleStyle-BackColor="#457600"></asp:Calendar>
                        <br />
                    </div>
                </div>
                <div class="row">
                    <div style="text-align: center;">
                        <h5>Payment</h5>
                    </div>
                    <div class="col-sm">
                        <br />
                        <label class="fmvw-template-label" for="ordPaid" style="display: inline;">Order Paid:</label>
                        <asp:CheckBox ID="ordPaidCheckBox" runat="server" Checked='<%# Bind("ordPaid") %>' CssClass="chk-Paid" />
                    </div>
                    <div class="col-sm">
                        <label class="fmvw-template-label" for="ddlPayment">Payment Type:</label>
                        <asp:DropDownList ID="ddlPayment" runat="server" CssClass="ddl-edit-editing" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>' />
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
                <div class="row">
                    <div style="text-align: center;">
                        <h5>Participants</h5>
                    </div>
                    <div class="col-sm">
                        <label class="fmvw-template-label" for="empID">Sales Representative:</label>
                        <asp:DropDownList ID="ddlSalesEmployees" runat="server" CssClass="ddl-edit-editing" DataSourceID="odsSalesEmployeeLUT" DataTextField="FullName" DataValueField="id" SelectedValue='<%# Bind("empID") %>' />
                    </div>
                    <div class="col-sm">
                        <label class="fmvw-template-label" for="custID" style="width: 81px">Customer:</label>
                        <asp:Label ID="custID" runat="server" Text='<%# Bind("custID") %>'></asp:Label>

                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" Text="Continue" OnClick="InsertButton_Click" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" Text="Cancel" OnClick="InsertCancelButton_Click" />
                <br />
                <br />
            </InsertItemTemplate>
        </asp:FormView>
    </div>
    <asp:ObjectDataSource ID="odsSalesEmployeeLUT" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalAssignmentLib.EmmasDataSetTableAdapters.SalesEmployeeLUTTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsReceipt" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalAssignmentLib.EmmasDataSetTableAdapters.receiptTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_ordNumber" Type="String" />
            <asp:Parameter Name="Original_ordDate" Type="DateTime" />
            <asp:Parameter Name="Original_ordPaid" Type="Boolean" />
            <asp:Parameter Name="Original_paymentID" Type="Int32" />
            <asp:Parameter Name="Original_custID" Type="Int32" />
            <asp:Parameter Name="Original_empID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ordNumber" Type="String" />
            <asp:Parameter Name="ordDate" Type="DateTime" />
            <asp:Parameter Name="ordPaid" Type="Boolean" />
            <asp:Parameter Name="paymentID" Type="Int32" />
            <asp:Parameter Name="custID" Type="Int32" />
            <asp:Parameter Name="empID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ordNumber" Type="String" />
            <asp:Parameter Name="ordDate" Type="DateTime" />
            <asp:Parameter Name="ordPaid" Type="Boolean" />
            <asp:Parameter Name="paymentID" Type="Int32" />
            <asp:Parameter Name="custID" Type="Int32" />
            <asp:Parameter Name="empID" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_ordNumber" Type="String" />
            <asp:Parameter Name="Original_ordDate" Type="DateTime" />
            <asp:Parameter Name="Original_ordPaid" Type="Boolean" />
            <asp:Parameter Name="Original_paymentID" Type="Int32" />
            <asp:Parameter Name="Original_custID" Type="Int32" />
            <asp:Parameter Name="Original_empID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
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
