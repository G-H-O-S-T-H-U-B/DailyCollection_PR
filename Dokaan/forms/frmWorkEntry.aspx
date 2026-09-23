<%@ Page Title="" Language="C#" MasterPageFile="~/forms/mst.Master" AutoEventWireup="true" CodeBehind="frmWorkEntry.aspx.cs" Inherits="Dokaan.forms.frmWorkEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* FOR SELECT 2 HEIGHT ADJUSTMENT */

        [id$='drpBillId'] + .select2-container .select2-selection--single {
            height: 40px !important;
        }

        [id$='drpBillId'] + .select2-container .select2-selection__rendered,
        [id$='drpBillId'] + .select2-container .select2-selection__arrow {
            line-height: 40px !important;
            height: 40px !important;
        }

        .select2-container {
            width: 100% !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="scriptManager"></asp:ScriptManager>
    <div>
        <h4 class="mb-0 px-3 py-3">nothing to see here</h4>
    </div>

    <section class="p-3">
        <div class="container-fluid grey_1 p-3">
            <!-- TOP LINKS START -->

            <div class="row">
                <div class="col-12">
                    <p class="mb-0 text-secondary">
                        Home / Work Entry
                    </p>
                </div>
            </div>

            <!-- TOP LINKS END -->
            <!-- ============================== -->
            <!-- FORM START -->

            <asp:UpdatePanel runat="server" ID="mainUpdatePanel" UpdateMode="Conditional">
                <ContentTemplate>

                    <div class="row py-3 m-0">
                        <div class="col-lg-9 col-12 py-3 pe-1 ps-0">
                            <div class="row m-0">
                                <!-- BILLING ID -->
                                <div class="col-lg-2 col-md-2 col-4 px-1 mt-2">
                                    <asp:Label runat="server" ID="Label3" AssociatedControlID="txtName" CssClass="small">
                                        <p class="mb-0">
                                            Bill No.
                                        </p>
                                    </asp:Label>
                                    <%--<asp:TextBox runat="server" ID="txtBillId" placeholder="" ReadOnly="true" TabIndex="-1" CssClass="w-100 p-2 border-0"></asp:TextBox>--%>
                                    <asp:DropDownList runat="server" ID="drpBillId" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="drpBillId_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="0">No.</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <!-- BILLING NAME -->
                                <div class="col-lg-2 col-md-4 col-8 px-1 mt-2">
                                    <asp:Label runat="server" ID="lblBillingName" AssociatedControlID="txtName" CssClass="small">
                                        <p class="mb-0">
                                            Bill Name
                                            <span class="text-danger">*
                                            </span>
                                        </p>
                                    </asp:Label>
                                    <asp:TextBox runat="server" ID="txtBillingName" placeholder="" CssClass="w-100 p-2 border-0"></asp:TextBox>
                                </div>
                                <!-- NAME -->
                                <div class="col-lg-4 col-md-6 col-12 px-1 mt-2">
                                    <asp:Label runat="server" ID="lblName" AssociatedControlID="txtName" CssClass="small">
                                        <p class="mb-0">
                                            Name
                                        </p>
                                    </asp:Label>
                                    <asp:TextBox runat="server" ID="txtName" placeholder="" CssClass="w-100 p-2 border-0"></asp:TextBox>
                                </div>
                                <!-- AJENT NAME -->
                                <div class="col-lg-4 col-md-6 col-12 px-1 mt-2">
                                    <asp:Label runat="server" ID="lblAgent" AssociatedControlID="drpAgent" CssClass="small">
                                        <p class="mb-0">
                                            Agent
                                        </p>
                                    </asp:Label>
                                    <asp:DropDownList runat="server" ID="drpAgent" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="drpAgent_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <!-- MOBILE -->
                                <div class="col-lg-4 col-md-6 col-12 px-1 mt-2">
                                    <asp:Label runat="server" ID="lblMobile" AssociatedControlID="txtMobile" CssClass="small">
                                        <p class="mb-0">
                                            Mobile
                                        </p>
                                    </asp:Label>
                                    <asp:TextBox runat="server" ID="txtMobile" TextMode="Phone" MaxLength="10" CssClass="w-100 p-2 border-0" placeholder=""></asp:TextBox>
                                </div>
                                <!-- STATUS -->
                                <div class="col-lg-4 col-md-6 col-12 px-1 mt-2">
                                    <asp:Label runat="server" ID="lblStatus" AssociatedControlID="drpStatus" CssClass="small">
                                        <p class="mb-0">
                                            Work Status
                                            <span class="text-danger">*
                                            </span>
                                        </p>
                                    </asp:Label>
                                    <asp:DropDownList runat="server" ID="drpStatus" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true">
                                        <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <!-- APPLICATION ID -->
                                <div class="col-lg-4 col-md-6 col-12 px-1 mt-2">
                                    <asp:Label runat="server" ID="lblApplicationId" AssociatedControlID="txtApplicationId" CssClass="small">
                                        <p class="mb-0">
                                            Application ID
                                        </p>
                                    </asp:Label>
                                    <asp:TextBox runat="server" ID="txtApplicationId" placeholder="" CssClass="w-100 p-2 border-0"></asp:TextBox>
                                </div>
                                <!-- WOTK -->
                                <div class="col-lg-4 col-md-6 col-12 px-1 mt-2">
                                    <asp:Label runat="server" ID="lblWork" AssociatedControlID="drpWork" CssClass="small">
                                        <p class="mb-0">
                                            Work
                                            <span class="text-danger">*
                                            </span>
                                        </p>
                                    </asp:Label>
                                    <asp:DropDownList runat="server" ID="drpWork" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="drpWork_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Text="-- Select --"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <!-- DESCRIPTION -->
                                <div class="col-lg-8 col-md-6 col-12 px-1 mt-2">
                                    <asp:Label runat="server" ID="lblDescription" AssociatedControlID="txtDescription" CssClass="small">
                                        <p class="mb-0">
                                            Description
                                        </p>
                                    </asp:Label>
                                    <asp:TextBox runat="server" ID="txtDescription" placeholder="" CssClass="w-100 p-2 border-0" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                </div>

                                <!-- CREATE FOLDER -->
                                <div class="col-lg-2 col-md-2 col-12 px-1 mt-2">
                                    <div class="shade_1 text-white px-2 py-1 rounded-3 d-flex align-items-center justify-content-between">
                                        <asp:Label runat="server" ID="lblCreateFolder" AssociatedControlID="chkCreateFolder" CssClass="small">
                                            <p class="mb-0">
                                                Create Folder
                                            </p>
                                        </asp:Label>
                                        <asp:CheckBox runat="server" ID="chkCreateFolder" CssClass="" />
                                    </div>
                                </div>

                                <!-- ADD BUTTON -->
                                <%--<div class="col-12 px-1 mt-2">
                                    <asp:Button runat="server" ID="btnAddWork" Text="Add" CssClass="me-0 py-2 px-4 orange t_white border-0" OnClick="btnAddWork_Click" title="Add Work one by one, Bade aaram se !" />
                                </div>--%>
                            </div>
                        </div>

                        <div class="col-lg-3 col-12 py-3 px-1 grey_2">
                            <asp:UpdatePanel runat="server" ID="updtPnl">
                                <ContentTemplate>
                                        <div class="row m-0">
                                            <!-- TOTAL AMOUNT -->
                                            <div class="col-12 px-1 mt-1 d-flex">
                                                <!-- SERVICE CHARGE -->
                                                <div class="me-1 w-75">
                                                    <asp:Label runat="server" ID="lblServiceCharge" AssociatedControlID="txtServiceCharge" CssClass="small">
                                                    <p class="mb-0">
                                                        Service
                                                        <span class="text-danger">*
                                                        </span>
                                                    </p>
                                                    </asp:Label>
                                                    <asp:TextBox runat="server" ID="txtServiceCharge" ClientIDMode="Static" placeholder="" CssClass="w-100 p-2 border-0" Text="0" TextMode="Number" onblur="if(this.value == ''){this.value = 0}"></asp:TextBox>
                                                </div>
                                                <!-- FEE -->
                                                <div class="ms-1 w-50">
                                                    <asp:Label runat="server" ID="Label1" AssociatedControlID="txtServiceCharge" CssClass="small">
                                                    <p class="mb-0">
                                                        Fee
                                                        <span class="text-danger">*
                                                        </span>
                                                    </p>
                                                    </asp:Label>
                                                    <asp:TextBox runat="server" ID="txtFee" ClientIDMode="Static" placeholder="" CssClass="w-100 p-2 border-0" Text="0" TextMode="Number" onblur="if(this.value == ''){this.value = 0}"></asp:TextBox>
                                                </div>
                                            </div>
                                            <!-- RECEIVED AMOUNT -->
                                            <div class="col-12 px-1 mt-2 d-flex">
                                                <div class="me-1 w-75">
                                                    <asp:Label runat="server" ID="lblReceivedAmount" AssociatedControlID="txtReceivedAmount" CssClass="small">
                                                    <p class="mb-0">
                                                        Tot Recived
                                                    </p>
                                                    </asp:Label>
                                                    <asp:TextBox runat="server" ID="txtReceivedAmount" ClientIDMode="Static" placeholder="" CssClass="w-100 p-2 border-0 grey_1 text-secondary" Text="0" ReadOnly="true" TabIndex="-1"></asp:TextBox>
                                                </div>
                                                <div class="ms-1 w-50">
                                                    <asp:Label runat="server" ID="Label2" AssociatedControlID="txtReceivedAmount" CssClass="small">
                                                    <p class="mb-0">
                                                        Profit
                                                    </p>
                                                    </asp:Label>
                                                    <asp:TextBox runat="server" ID="txtProfit" ClientIDMode="Static" placeholder="" CssClass="w-100 p-2 border-0 grey_1 text-secondary" Text="0" ReadOnly="true" TabIndex="-1"></asp:TextBox>
                                                </div>
                                            </div>
                                            <!-- ADD AMOUNT -->
                                            <div class="col-12 px-1 mt-2">
                                                <asp:Label runat="server" ID="lblAddAmount" AssociatedControlID="txtAddAmount" CssClass="small">
                                                <p class="mb-0">
                                                    Add Amount <%--₹--%>
                                                    <span class="text-danger">*
                                                    </span>
                                                </p>
                                                </asp:Label>
                                                <asp:TextBox runat="server" ID="txtAddAmount" ClientIDMode="Static" placeholder="" CssClass="w-100 p-2 border-0" Text="0" TextMode="Number" onblur="if(this.value == ''){this.value = 0}"></asp:TextBox>
                                            </div>
                                            <!-- PAYMENT MODE -->
                                            <div class="col-12 px-1 mt-2">
                                                <asp:Label runat="server" ID="lblPyament" AssociatedControlID="drpPayment" CssClass="small">
                                                <p class="mb-0">
                                                    Pay Mode
                                                    <span class="text-danger">*
                                                    </span>
                                                </p>
                                                </asp:Label>
                                                <asp:DropDownList runat="server" ID="drpPayment" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true">
                                                    <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                    <asp:ListItem Value="Online">Online</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <!-- BALANCE AMOUNT -->
                                            <div class="col-12 px-1 mt-2">
                                                <asp:Label runat="server" ID="lblBalance" AssociatedControlID="txtBalance" CssClass="small">
                                                <p class="mb-0">
                                                    Balance
                                                </p>
                                                </asp:Label>
                                                <asp:TextBox runat="server" ID="txtBalance" ClientIDMode="Static" placeholder="Balance" CssClass="w-100 p-2 border-0 grey_1 text-secondary" Text="0" ReadOnly="true" TabIndex="-1"></asp:TextBox>
                                            </div>
                                            <!-- TRANSACTION HISTORY BUTTON -->
                                            <div class="col-12 px-1 mt-2">
                                                <a href="#" id="btnTransHistory" class="text-decoration-none" title="Transaction History ( Ctrl + T ), Kaam nahi karta abbhi" data-bs-toggle="modal" data-bs-target="#myExampleModal">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                            </div>
                                        </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="drpWork" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <!-- WORK GRIDVIEW START -->

            <div class="row m-0 d-none">
                <div class="col-12 px-1 mt-3">
                    <asp:Button runat="server" ID="btnAdd" Text="Add" CssClass="me-0 py-2 px-4 shade_2 t_white border-0" OnClick="btnAdd_Click" title="Ctrl + S" />
                </div>
            </div>

            <asp:UpdatePanel runat="server" ID="updtPnlGridview">
                <ContentTemplate>
                    <div class="row pt-3 mx-0 border-0 border-primary">
                        <div class="col-12 px-0 table table-responsive">
                            <asp:GridView runat="server" ID="gvWorkRecord" AutoGenerateColumns="false" CssClass="w-100 text-nowrap small" AlternatingRowStyle-CssClass="grey_2">
                                <Columns>

                                    <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 d-flex align-items-center">
                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete?');" CssClass="text-danger d-block p-2" title="Delete">
                                                    <i class="fa fa-trash"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Bill No." HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <div title="Print Bill">
                                                    <%--<asp:Button runat="server" ID="btnBillId" Text='<%# Eval("bill_id") %>' CssClass="bg-transparent border-0" OnClick="btnBillId_Click" />--%>
                                                    <%# Eval("bill_id") %>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Billing Name" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <div title="Print Bill">
                                                    <%# Eval("bill_name") %>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%--<a href='frmWorkEntry.aspx?bill_id=<%# Eval("bill_id") %>&c_id=<%# Eval("customer_id") %>&cw_id=<%# Eval("work_id") %>&from=workEntry.aspx' class="text-decoration-none" title="Edit Mode">
                                            <%# Eval("name") %>
                                        </a>--%>
                                                <%# Eval("name") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtName" CssClass="w-100 p-2 border-0" Text='<%# Bind("name") %>' placeholder="Customer Name" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Work" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("work") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="drpWork" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true">
                                                <asp:ListItem Selected="True" Value="0">Work</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("status") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="drpStatus" CssClass="w-100 p-2 border-0">
                                                <asp:ListItem Selected="True" Value="0">Status</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("mobile") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtMobile" CssClass="w-100 p-2 border-0" Text='<%# Bind("mobile") %>' placeholder="Mobile" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Service Charge" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("total_amount") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtAmount" CssClass="w-100 p-2 border-0" Text='<%# Bind("total_amount") %>' placeholder="Amount" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Received Amount" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("received_amount") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtReceived" CssClass="w-100 p-2 border-0" Text='<%# Bind("received_amount") %>' placeholder="Received Amount" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Balance" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# GetBalance(Eval("total_amount"), Eval("received_amount")).ToString("0.00") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtBalance" CssClass="w-100 p-2 border-0" Text='<<%# GetBalance(Eval("total_amount"), Eval("received_amount")).ToString("0.00") %>' placeholder="Balance Amount" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Pay Mode" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("mode") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtPaymentMode" CssClass="w-100 p-2 border-0" Text='<%# Bind("mode") %>' placeholder="Payment Mode" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Application ID" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("application_id") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtApplicationId" CssClass="w-100 p-2 border-0" Text='<%# Bind("application_id") %>' placeholder="Application Id" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Created Date" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("work_taken_date", "{0:dd-MMM-yyyy hh:mm tt}") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtCreatedDate" CssClass="w-100 p-2 border-0" TextMode="DateTimeLocal"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <asp:EmptyDataTemplate>
                                    <div class="text-center p-3">
                                        <h4 class="t_secondary">No Records Found</h4>
                                    </div>
                                </asp:EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>


            <!-- WORK GRIDVIEW END -->
            <!-- FORM END -->
            <!-- ============================== -->
            <!-- BUTTONS START -->

            <div class="row m-0">
                <div class="col-12 px-1 mt-3">
                    <asp:Button runat="server" ID="btnSave" Text="Save" CssClass="me-0 py-2 px-4 shade_4 t_white border-0" OnClick="btnSave_Click" title="Ctrl + S" />
                    <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="mx-0 py-2 px-4 shade_1 t_white border-0" OnClick="btnBack_Click" />

                    <asp:Label runat="server" ID="lblMessage" Text="" CssClass="ms-2"></asp:Label>
                </div>
            </div>

            <!-- BUTTONS END -->
            <!-- ============================== -->
            <!-- MODEL FOR TRANSACTION HISTORY START -->

            <div class="modal fade" id="myExampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">

                            <asp:UpdatePanel runat="server" ID="updtPnlTransaction">
                                <ContentTemplate>
                                    <div class="table table-responsive mb-0">
                                        <asp:GridView runat="server" ID="gvTransaction" AutoGenerateColumns="false" CssClass="w-100 text-nowrap small" AlternatingRowStyle-CssClass="grey_1"
                                            DataKeyNames="transaction_master_id" OnRowEditing="gvTransaction_RowEditing" OnRowCancelingEdit="gvTransaction_RowCancelingEdit" OnRowUpdating="gvTransaction_RowUpdating"
                                            OnRowDeleting="gvTransaction_RowDeleting">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="t_white shade_2 p-2">
                                                    <ItemTemplate>
                                                        <div class="w-100 p-2 d-flex align-items-center">
                                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="text-primary d-block p-2" title="Edit"> <!-- btn btn-sm btn-primary -->
                                                                <i class="fa fa-edit"></i>
                                                            </asp:LinkButton>

                                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete?');" CssClass="text-danger d-block p-2" title="Delete">
                                                                <i class="fa fa-trash"></i>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </ItemTemplate>

                                                    <EditItemTemplate>
                                                        <div class="w-100 p-2 d-flex align-items-center">
                                                            <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="text-success d-block p-2" title="Save">
                                                                <i class="fa fa-save"></i>
                                                            </asp:LinkButton>

                                                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="text-secondary d-block p-2" title="Cancel">
                                                                <i class="fa fa-times"></i>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Transaction Date" HeaderStyle-CssClass="t_white shade_2 p-2">
                                                    <ItemTemplate>
                                                        <div class="w-100 p-2">
                                                            <asp:TextBox runat="server" ID="txx" CssClass="w-100 p-2 border-0 bg-transparent" Enabled="false" TextMode="SingleLine" Text='<%# Bind("transaction_date", "{0:dd-MM-yyyy hh:mm tt}") %>' />
                                                        </div>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" ID="txtTransactionDate" CssClass="w-100 p-2 border-0" TextMode="DateTimeLocal" Text='<%# Bind("transaction_date", "{0:yyyy-MM-ddTHH:mm}") %>' />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Mode" HeaderStyle-CssClass="t_white shade_2 p-2">
                                                    <ItemTemplate>
                                                        <div class="w-100 p-2">
                                                            <%# Eval("mode") %>
                                                        </div>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList runat="server" ID="drpTransactionMode" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true" SelectedValue='<%# Bind("mode") %>'>
                                                            <asp:ListItem Value="0">Payment Mode</asp:ListItem>
                                                            <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                            <asp:ListItem Value="Online">Online</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Received Amount" HeaderStyle-CssClass="t_white shade_2 p-2">
                                                    <ItemTemplate>
                                                        <div class="w-100 p-2">
                                                            <%# Eval("transaction_amount") %>
                                                        </div>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" ID="txtTransactionAmount" CssClass="w-100 p-2 border-0" Text='<%# Bind("transaction_amount") %>' placeholder="Transaction Amount" />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>

                                        <asp:Label runat="server" ID="lblTransactionError"></asp:Label>

                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>

            <!-- MODEL FOR TRANSACTION HISTORY END -->

        </div>
    </section>

    <!-- SCRIPT START -->
    <script>

        // AUTO CALCULATION FOR TRANSACTION START
        $(document).ready(function () {
            calcTotal();
        });

        // SHORT CUT KEY START
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_pageLoaded(function () {

            // SELECT 2 CDN 
            $("#<%=drpBillId.ClientID%>").select2({
                allowClear: false
            });

            $(window).on('keydown', function (e) {
                // Check for Alt + S for Saving Entry
                if ((e.altKey) && e.which === 83) {
                    e.preventDefault();
                    $("[id$='btnSave']").click();
                }
                // Check for Alt + T for Transaction History
                if ((e.altKey) && e.which === 84) {
                    e.preventDefault();
                    $('#myExampleModal').modal('show');
                }
                // Check for Alt + B for Back
                if ((e.altKey) && e.which === 66) {
                    e.preventDefault();
                    $("[id$='btnBack']").click();
                }
            });
        });

        // SHORT CUT KEY EDN
        // ========================================//

        // Mentains Balance Amount while updating Transactions
        function calcTotal() {
            var service_charge = parseFloat($("#txtServiceCharge").val()) || 0;
            var total_amount_received = parseFloat($("#txtReceivedAmount").val()) || 0;
            var add_amount = parseFloat($("#txtAddAmount").val()) || 0;

            var balance = service_charge - total_amount_received - add_amount;
            $("#txtBalance").val(balance.toFixed(2));
        }

        // Bill Name wrinting in Customer Name
        $(document).on("input blur", "[id$='txtBillingName']", function () {
            var billName = $(this).val();
            $("[id$='txtName']").val(billName);
        });

        // Run time Validation check for Amounts
        $(document).on("input", "#txtServiceCharge, #txtFee, #txtAddAmount", function () {
            var serviceCharge = parseFloat($("#txtServiceCharge").val()) || 0;
            var fee = parseFloat($("#txtFee").val()) || 0;
            var recivedAmount = parseFloat($("#txtReceivedAmount").val()) || 0;
            var addAmount = parseFloat($("#txtAddAmount").val()) || 0;
            var profit = parseFloat($("#txtProfit").val()) || 0;
            var balance = parseFloat($("#txtBalance").val()) || 0;

            function wrongeValue(field) {
                field.css("backgroundColor", "var(--light_red)");
            }

            function writeValue(field) {
                field.css("backgroundColor", "white");
            }

            if (serviceCharge < fee) {
                wrongeValue($(this))
            }
            else if (serviceCharge < (addAmount + recivedAmount)) {
                wrongeValue($(this))
            }
            else {
                $("#txtServiceCharge").css("backgroundColor", "white");
                $("#txtFee").css("backgroundColor", "white");
                $("#txtAddAmount").css("backgroundColor", "white");
            }
        });

        // AUTO CALCULATION FOR TRANSACTION END
        // ========================================//

    </script>
    <!-- SCRIPT END -->
</asp:Content>
