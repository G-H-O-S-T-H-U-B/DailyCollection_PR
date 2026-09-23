<%@ Page Title="" Language="C#" MasterPageFile="~/forms/mst.Master" AutoEventWireup="true" CodeBehind="frmExpense.aspx.cs" Inherits="Dokaan.forms.frmExpense" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* FOR SELECT 2 HEIGHT ADJUSTMENT */

        [id$='drpReason'] + .select2-container .select2-selection--single {
            height: 40px !important;
        }

        [id$='drpReason'] + .select2-container .select2-selection__rendered,
        [id$='drpReason'] + .select2-container .select2-selection__arrow {
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
            <div class="row">
                <div class="col-12">
                    <p class="mb-0 text-secondary">
                        Home / Add Expense
                    </p>
                </div>
            </div>

            <div class="row py-3 m-0">
                <div class="col-md-6 p-0">
                    <div class="row m-0">
                        <div class="col-6 px-1 mt-2">
                            <asp:Label runat="server" ID="Label2" AssociatedControlID="txtExpenseAmount" CssClass="small">
                            <p class="mb-0">
                                Expense ₹
                                <span class="text-danger">
                                    *
                                </span>
                            </p>
                            </asp:Label>
                            <asp:TextBox runat="server" ID="txtExpenseAmount" placeholder="" CssClass="w-100 p-2 border-0" Text="0" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-6 px-1 mt-2">
                            <asp:Label runat="server" ID="Label1" AssociatedControlID="txtExpenseDate" CssClass="small">
                            <p class="mb-0">
                                Expense Date
                                <span class="text-danger">
                                    *
                                </span>
                            </p>
                            </asp:Label>
                            <asp:TextBox runat="server" ID="txtExpenseDate" placeholder="" CssClass="w-100 p-2 border-0" TextMode="DateTimeLocal"></asp:TextBox>
                        </div>
                        <div class="col-6 px-1 mt-2">
                            <asp:Label runat="server" ID="lblWorkName" AssociatedControlID="drpReason" CssClass="small">
                            <p class="mb-0">
                                Expense Reason
                            <span class="text-danger">
                                *
                            </span>
                            </p>
                            </asp:Label>
                            <asp:DropDownList runat="server" ID="drpReason" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true">
                                <asp:ListItem Selected="True" Value="0">Select Reason</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-6 px-1 mt-2">
                            <asp:Label runat="server" ID="lblExpenseMode" AssociatedControlID="drpExpenseMode" CssClass="small">
                                <p class="mb-0">
                                    Expense Mode
                                <span class="text-danger">
                                    *
                                </span>
                                </p>
                            </asp:Label>
                            <asp:DropDownList runat="server" ID="drpExpenseMode" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true">
                                <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                <asp:ListItem Value="Online">Online</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 ps-md-1 ps-0 pe-0">
                    <div class="col-12 px-1 mt-2">
                        <asp:Label runat="server" ID="lblFee" AssociatedControlID="txtExpenseDescription" CssClass="small">
                        <p class="mb-0">
                            Expense Description
                        </p>
                        </asp:Label>
                        <asp:TextBox runat="server" ID="txtExpenseDescription" placeholder="" CssClass="w-100 p-2 border-0" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row m-0">
                <div class="col-12 px-1 mt-2">
                    <asp:Button runat="server" ID="btnSave" Text="Save" CssClass=" py-2 px-4 shade_2 t_white border-0" OnClick="btnSave_Click" />
                    <asp:Button runat="server" ID="btnBack" Text="Back" CssClass=" py-2 px-4 shade_2 t_white border-0" OnClick="btnBack_Click" />
                    <asp:Label runat="server" ID="lblMessage"></asp:Label>
                </div>
            </div>
        </div>

        <asp:UpdatePanel runat="server" ID="updtPnl">
            <ContentTemplate>
                <div class="row pt-3 mx-0 border-0 border-primary">
                    <div class="col-12 px-0 table table-responsive">
                        <asp:GridView runat="server" ID="gvExpense" AutoGenerateColumns="false" CssClass="w-100 text-nowrap small" AlternatingRowStyle-CssClass="grey_1"
                            OnRowEditing="gvExpense_RowEditing" OnRowCancelingEdit="gvExpense_RowCancelingEdit" OnRowUpdating="gvExpense_RowUpdating"
                            OnRowDeleting="gvExpense_RowDeleting" DataKeyNames="expense_id" OnRowDataBound="gvExpense_RowDataBound">
                            <Columns>

                                <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="t_white shade_2 p-2">
                                    <ItemTemplate>
                                        <div class="w-100 d-flex align-items-center">
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="text-primary d-block p-2" title="Edit"> <!-- btn btn-sm btn-primary -->
                                                <i class="fa fa-edit"></i>
                                            </asp:LinkButton>

                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete?');" CssClass="text-danger d-block p-2" title="Delete">
                                                <i class="fa fa-trash"></i>
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <div class="w-100 d-flex align-items-center">
                                            <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="text-success d-block p-2" title="Save">
                                                <i class="fa fa-save"></i>
                                            </asp:LinkButton>

                                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="text-secondary d-block p-2" title="Cancel">
                                                <i class="fa fa-times"></i>
                                            </asp:LinkButton>
                                        </div>
                                    </EditItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Amount" HeaderStyle-CssClass="t_white shade_2 p-2">
                                    <ItemTemplate>
                                        <div class="w-100 p-2">
                                            <%# Eval("expense_amount") %>
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtAmount" CssClass="w-100 p-2 border-0" Text='<%# Bind("expense_amount") %>' placeholder="Amount" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Ex Mode" HeaderStyle-CssClass="t_white shade_2 p-2">
                                    <ItemTemplate>
                                        <div class="w-100 p-2">
                                            <%# Eval("expense_mode") %>
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList runat="server" ID="drpEditExpenseMode" CssClass="w-100 p-2 border-0">
                                            <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                            <asp:ListItem Value="Online">Online</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Reason" HeaderStyle-CssClass="t_white shade_2 p-2">
                                    <ItemTemplate>
                                        <div class="w-100 p-2">
                                            <%# Eval("reason") %>
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <%--<asp:TextBox runat="server" ID="txtReason" CssClass="w-100 p-2 border-0" Text='<%# Bind("reason") %>' placeholder="Reason" />--%>
                                        <asp:DropDownList runat="server" ID="drpReason" CssClass="w-100 p-2 border-0">
                                            <asp:ListItem Selected="True" Value="0">Status</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Description" HeaderStyle-CssClass="t_white shade_2 p-2">
                                    <ItemTemplate>
                                        <div class="w-100 p-2">
                                            <%# Eval("expense_description") %>
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtDescription" CssClass="w-100 p-2 border-0" Text='<%# Bind("expense_description") %>' placeholder="Description" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Expense Date" HeaderStyle-CssClass="t_white shade_2 p-2">
                                    <ItemTemplate>
                                        <div class="w-100 p-2">
                                            <%# Eval("expense_date", "{0:dd-MMM-yyyy hh:mm tt}") %>
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtEditExpenseDate" CssClass="w-100 p-2 border-0" TextMode="DateTimeLocal"></asp:TextBox>
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
                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnBack" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </section>

    <script>

        $(document).ready(function () {

            // Custom dropsown to save new data also which is not present before
            $("#<%=drpReason.ClientID%>").select2({
                allowClear: false,
                tags: true,
                createTag: function (params) {
                    var term = $.trim(params.term);
                    if (term === '') {
                        return null;
                    }
                    return {
                        id: term,
                        text: term,
                        isNew: true // Custom flag to identify new tags
                    };
                }
            });

            // SHORT CUT KEY START
            $(window).on('keydown', function (e) {
                // Check for Alt + S for Saving Entry
                if ((e.altKey) && e.which === 83) {
                    e.preventDefault();
                    $("[id$='btnSave']").click();
                }
                // Check for Alt + B for Back
                if ((e.altKey) && e.which === 66) {
                    e.preventDefault();
                    $("[id$='btnBack']").click();
                }
            });

        })


    </script>
</asp:Content>
