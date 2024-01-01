<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerEdit.aspx.cs" Inherits="FinalAssignmentWeb.CustomerEdit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Customer Information Page</h1>
        <div class="fmvw-containter">
            <asp:FormView ID="fmvwCustomer" runat="server" DataKeyNames="id" DataSourceID="odsCustomer" CssClass="fmvw-template">
                <EditItemTemplate>
                    <div>
                        <h4>Customer Information</h4>
                        <div class="row">
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custFirstTextBox">First Name:</label>
                                <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid h-50" CausesValidation="True" />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custLastTextBox">Last Name:</label>
                                <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid h-50" CausesValidation="True" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custPhoneTextBox">Phone #:</label>
                                <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid h-50" CausesValidation="True" />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custEmailTextBox">Email:</label>
                                <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid h-50" CausesValidation="True" />
                            </div>
                        </div>
                        <div style="text-align: center;">
                            <h5>Address</h5>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custPostalTextBox">Postal Code:</label>
                                <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid h-50" CausesValidation="True" />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custCityTextBox">City:</label>
                                <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid h-50" CausesValidation="True" />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custAddressTextBox">Street:</label>
                                <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid h-50" CausesValidation="True" />
                            </div>
                        </div>
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="False" OnClientClick="return ValidateCustomer()" Text="Update" OnClick="UpdateButton_Click" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div>
                        <h4>Customer Information</h4>
                        <div class="row">
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custFirstTextBox">First Name:</label>
                                <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid  h-50" CausesValidation="True" />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custLastTextBox">Last Name:</label>
                                <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid  h-50" CausesValidation="True" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custPhoneTextBox">Phone #:</label>
                                <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid h-50" CausesValidation="True" />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custEmailTextBox">Email:</label>
                                <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-valid h-50" CausesValidation="True" />
                            </div>
                        </div>
                        <div style="text-align: center;">
                            <h5>Address</h5>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custPostalTextBox">Postal Code:</label>
                                <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-invalid h-50" CausesValidation="True" />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custCityTextBox">City:</label>
                                <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-invalid h-50" CausesValidation="True" />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label" for="custAddressTextBox">Street:</label>
                                <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' onKeyUp="ValidateCustomer()" CssClass="form-control is-invalid h-50" CausesValidation="True" />
                            </div>
                        </div>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="New" Text="Add" OnClientClick="return ValidateCustomer()" OnClick="InsertButton_Click" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" OnClientClick="return BackToCustomerSearch()" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <div>
                        <h4>Customer Information</h4>
                        <div class="row">
                            <div class="col-sm">
                                <label class="fmvw-template-label">First Name:</label>
                                <asp:Label ID="custFirstLabel" runat="server" Text='<%# Bind("custFirst") %>' />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label">Last Name:</label>
                                <asp:Label ID="custLastLabel" runat="server" Text='<%# Bind("custLast") %>' />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm">
                                <label class="fmvw-template-label">Phone:</label>
                                <asp:Label ID="custPhoneLabel" runat="server" Text='<%# Bind("custPhone") %>' />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label">Email:</label>
                                <asp:Label ID="custEmailLabel" runat="server" Text='<%# Bind("custEmail") %>' />
                            </div>
                        </div>
                        <br />
                        <div style="text-align: center;">
                            <h5>Address</h5>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <label class="fmvw-template-label">Postal Code:</label>
                                <asp:Label ID="custPostalLabel" runat="server" Text='<%# Bind("custPostal") %>' />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label">City:</label>
                                <asp:Label ID="custCityLabel" runat="server" Text='<%# Bind("custCity") %>' />
                            </div>
                            <div class="col-sm">
                                <label class="fmvw-template-label">Street:</label>
                                <asp:Label ID="custAddressLabel" runat="server" Text='<%# Bind("custAddress") %>' />
                            </div>
                        </div>
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        <asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" OnClientClick="return BackToCustomerSearch()" Text="Back To Search" />
                        <asp:LinkButton ID="btnOrders" runat="server" CausesValidation="False" Text="View Customer Orders" OnClick="BtnOrders_Click" />
                        &nbsp;
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <div>
                <asp:Button ID="btnTablePanel" OnClientClick="return togglePanel('tblPanel' ,300, 200, 100)" runat="server" Text=">" CausesValidation="False" UseSubmitBehavior="false" CssClass="btn-panel-tbl fa-solid" />
                <div id="tblPanel" class="tbl-panel" style="width: 0px;">
                    <h4>Additional Information</h4>
                    <div id="customerInfoDiv" runat="server">
                        <asp:FormView ID="fmvwCustomerInfo" runat="server" DataKeyNames="id" DataSourceID="odsCustomerInfoLUT">
                            <ItemTemplate>
                                <div class="row">
                                    <div>
                                        <b>
                                            <asp:Label Text="Orders Made: " runat="server" CssClass="col-sm" />
                                        </b>
                                        <asp:Label ID="OrdersMadeLabel" runat="server" Text='<%# Bind("OrdersMade") %>' />
                                    </div>
                                </div>
                                <div class="row">
                                    <div>
                                        <b>
                                            <asp:Label Text="Last Order: " runat="server" CssClass="col-sm" />
                                        </b>
                                        <br />
                                        <asp:Label ID="ordDateLabel" runat="server" Text='<%# Bind("ordDate", "{0:M}") %>' />
                                        <br />
                                        <br />
                                        <b>
                                            <asp:Label Text="Paid: " runat="server" CssClass="col-sm" />
                                        </b>
                                        <asp:CheckBox ID="ordPaidCheckBox" runat="server" Checked='<%# Bind("ordPaid") %>' Enabled="false" />
                                        <br />
                                        <br />
                                        <b>
                                            <asp:Label Text="Payement option used: " runat="server" CssClass="col-sm" />
                                        </b>
                                        <asp:Label ID="payTypeLabel" runat="server" Text='<%# Bind("payType") %>' />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <asp:ObjectDataSource ID="odsCustomerInfoLUT" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalAssignmentLib.EmmasDataSetTableAdapters.CustomerInfoLUTTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="Param1" SessionField="StoredCustomer" Type="Int32" DefaultValue="0" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCustomer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalAssignmentLib.EmmasDataSetTableAdapters.customerTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_custFirst" Type="String" />
            <asp:Parameter Name="Original_custLast" Type="String" />
            <asp:Parameter Name="Original_custPhone" Type="String" />
            <asp:Parameter Name="Original_custAddress" Type="String" />
            <asp:Parameter Name="Original_custCity" Type="String" />
            <asp:Parameter Name="Original_custPostal" Type="String" />
            <asp:Parameter Name="Original_custEmail" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="custFirst" Type="String" />
            <asp:Parameter Name="custLast" Type="String" />
            <asp:Parameter Name="custPhone" Type="String" />
            <asp:Parameter Name="custAddress" Type="String" />
            <asp:Parameter Name="custCity" Type="String" />
            <asp:Parameter Name="custPostal" Type="String" />
            <asp:Parameter Name="custEmail" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="custFirst" Type="String" />
            <asp:Parameter Name="custLast" Type="String" />
            <asp:Parameter Name="custPhone" Type="String" />
            <asp:Parameter Name="custAddress" Type="String" />
            <asp:Parameter Name="custCity" Type="String" />
            <asp:Parameter Name="custPostal" Type="String" />
            <asp:Parameter Name="custEmail" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
            <asp:Parameter Name="Original_custFirst" Type="String" />
            <asp:Parameter Name="Original_custLast" Type="String" />
            <asp:Parameter Name="Original_custPhone" Type="String" />
            <asp:Parameter Name="Original_custAddress" Type="String" />
            <asp:Parameter Name="Original_custCity" Type="String" />
            <asp:Parameter Name="Original_custPostal" Type="String" />
            <asp:Parameter Name="Original_custEmail" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <script src="Scripts/validateCustomer.js"></script>
    <script src="Scripts/panelControls.js"></script>
</asp:Content>
