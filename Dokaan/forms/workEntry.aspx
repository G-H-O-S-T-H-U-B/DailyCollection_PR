<%@ Page Title="" Language="C#" MasterPageFile="~/forms/mst.Master" AutoEventWireup="true" CodeBehind="workEntry.aspx.cs" Inherits="Dokaan.forms.workEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="scriptManager"></asp:ScriptManager>
    <div>
        <h4 class="mb-0 px-3 py-3">nothing to see here</h4>
    </div>

    <section class="px-3">
        <asp:UpdatePanel runat="server" ID="updtPnl" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="container-fluid">
                    <div class="row pt-3">
                        <div class="col-12">
                            <p class="mb-0 text-secondary fw-bold h6">
                                Home / Work Entry
                            </p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-9 mt-3 order-0">
                            <asp:Button runat="server" ID="btnAddNew" Text="Add Work" CssClass="py-2 px-3 shade_2 t_white border-0" OnClick="btnAddNew_Click" />
                            <asp:Button runat="server" ID="btnAddExpense" Text="Add Expence" CssClass="py-2 px-3 shade_2 t_white border-0" OnClick="btnAddExpense_Click" />
                        </div>
                        <asp:Panel runat="server" DefaultButton="btnSearch" class="col-md-6 mt-3 order-md-1 order-2 d-flex align-items-center justify-content-between ">
                            <asp:TextBox runat="server" ID="txtFromDate" CssClass="w-100 p-2 border-0 me-1" TextMode="Date" ></asp:TextBox>
                            <asp:TextBox runat="server" ID="txtToDate" CssClass="w-100 p-2 border-0 ms-1" TextMode="Date" ></asp:TextBox>
                        </asp:Panel>
                        <div class="col-md-6 col-3 mt-3 order-md-2 order-1">
                            <asp:ImageButton runat="server" ImageUrl="../assets/img/file.png" ID="btnDailyReport" Width="40" CssClass="img-fluid p-2" ToolTip="Download Daily Report" OnClick="btnDailyReport_Click"/>
                        </div>
                        <asp:Panel runat="server" ID="pnlSearchBox" CssClass="col-md-6 mt-3 order-3 float-end" DefaultButton="btnSearch">
                            <div class="d-flex">
                                <asp:TextBox runat="server" ID="txtSearch" CssClass="w-100 p-2 border-0" placeholder="Search by ( Name / Mobile / Work / Status )"></asp:TextBox>
                                <asp:ImageButton runat="server" ImageUrl="../assets/img/search_icon.png" ID="btnSearch" Width="40" CssClass="img-fluid shade_2 p-2" OnClick="btnSearch_Click" />
                            </div>
                        </asp:Panel>
                    </div>

                    <div class="row pt-3 mx-0 border-0 border-primary">
                        <div class="col-12 px-0 table table-responsive ">
                            <asp:GridView runat="server" ID="gvWorkRecord" AutoGenerateColumns="false" CssClass="w-100 text-nowrap small" AlternatingRowStyle-CssClass="grey_1"
                                OnRowEditing="gvWorkRecord_RowEditing" OnRowCancelingEdit="gvWorkRecord_RowCancelingEdit" OnRowUpdating="gvWorkRecord_RowUpdating"
                                OnRowDeleting="gvWorkRecord_RowDeleting" DataKeyNames="bill_id, customer_id, work_id, work_master_id, status_master_id" OnRowDataBound="gvWorkRecord_RowDataBound">
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

                                    <asp:TemplateField HeaderText="Bill No." HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <div title="Print Bill">
                                                    <asp:Button runat="server" ID="btnBillId" Text='<%# Eval("bill_id") %>' CssClass="bg-transparent border-0" OnClick="btnBillId_Click" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <a href='frmWorkEntry.aspx?bill_id=<%# Eval("bill_id") %>&c_id=<%# Eval("customer_id") %>&cw_id=<%# Eval("work_id") %>&from=workEntry.aspx' class="text-decoration-none" title="Edit Mode">
                                                    <%# Eval("name") %>
                                                </a>
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
                                            <div class='w-100 px-2 py-1 text-center rounded-4 
                                                <%# Eval("status").ToString() == "Pending" ? "bg-warning text-dark" :
                                                Eval("status").ToString() == "Process" ? "bg-primary text-white" :
                                                Eval("status").ToString() == "Query" ? "bg-secondary text-white" :
                                                Eval("status").ToString() == "Reject" ? "bg-danger text-white" :
                                                Eval("status").ToString() == "Done" ? "bg-success text-white" : "bg-secondary text-white" %>'>
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
                                            <div class="w-100 py-2 px-3">
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

                                    <asp:TemplateField HeaderText="Balance Amount" HeaderStyle-CssClass="t_white shade_2 p-2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("balance_amount") %>
                                            </div>
                                        </ItemTemplate>
                                        <%--<edititemtemplate>
                                            <asp:TextBox runat="server" ID="txtBalance" CssClass="w-100 p-2 border-0" Text='<%# Bind("received_amount") %>' placeholder="Balance" />
                                        </edititemtemplate>--%>
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

                    <div class="row pt-3 border-0 border-primary">
                        <asp:Label runat="server" ID="lblMessage" Text=""></asp:Label>
                    </div>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>

</asp:Content>
