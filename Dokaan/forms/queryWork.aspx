<%@ Page Title="" Language="C#" MasterPageFile="~/forms/mst.Master" AutoEventWireup="true" CodeBehind="queryWork.aspx.cs" Inherits="Dokaan.forms.queryWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h4 class="mb-0 px-3 py-3">nothing to see here</h4>
    </div>

    <section class="px-3">
        <div class="container-fluid">
            <div class="row pt-3">
                <div class="col-12">
                    <p class="mb-0 text-secondary">
                        Home / Query Work
                    </p>
                </div>
            </div>

            <div class="row pt-3 border-0 border-danger d-none">
                <!-- currently d-none -->
                <div class="col-3">
                    <asp:DropDownList runat="server" ID="drpSearchBy" CssClass="w-100 p-2 border-0">
                        <asp:ListItem>Select by *</asp:ListItem>
                        <asp:ListItem>Name</asp:ListItem>
                        <asp:ListItem>Mobile</asp:ListItem>
                        <asp:ListItem>Work</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Done</asp:ListItem>
                        <asp:ListItem>Balance</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <%--<div class="col-3">
            <asp:TextBox runat="server" ID="txtSearchByDate" CssClass="w-100 p-2 border-0" placeholder="Search by Date"></asp:TextBox>
        </div>--%>
                <div class="col-3 d-flex align-items-center">
                    <asp:TextBox runat="server" ID="txtSearch" CssClass="w-100 p-2 border-0" placeholder="Search here *"></asp:TextBox>
                    <asp:ImageButton runat="server" ImageUrl="../assets/img/search_icon.png" ID="btnSearch" Width="40" CssClass="img-fluid shade_2 p-2" />
                </div>
                <div class="col-6 text-end">
                    <asp:Button runat="server" ID="btnAddNew" Text="Add New" CssClass="py-2 px-3 shade_2 t_white border-0" OnClick="btnAddNew_Click" />
                </div>
            </div>

            <div class="row pt-3 mx-0 border-0 border-primary table table-responsive">
                <div class="col-12 px-0">
                    <asp:GridView runat="server" ID="gvWorkRecord" AutoGenerateColumns="false" CssClass="w-100 text-nowrap small" AlternatingRowStyle-CssClass="grey_1"
                        OnRowEditing="gvWorkRecord_RowEditing" OnRowCancelingEdit="gvWorkRecord_RowCancelingEdit" OnRowUpdating="gvWorkRecord_RowUpdating"
                        OnRowDeleting="gvWorkRecord_RowDeleting" DataKeyNames="bill_id, customer_id, work_id" OnRowDataBound="gvWorkRecord_RowDataBound">
                        <Columns>

                            <asp:TemplateField HeaderText="Name" HeaderStyle-CssClass="t_white shade_2 p-2">
                                <ItemTemplate>
                                    <div class="w-100 p-2">
                                        <a href='frmWorkEntry.aspx?bill_id=<%# Eval("bill_id") %>&c_id=<%# Eval("customer_id") %>&cw_id=<%# Eval("work_id") %>&from=queryWork.aspx' class="text-decoration-none">
                                            <%# Eval("name") %>
                                        </a>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="txtName" CssClass="w-100 p-2 border-0" Text='<%# Bind("name") %>' placeholder="Customer Name" Enabled="false" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Work" HeaderStyle-CssClass="t_white shade_2 p-2">
                                <ItemTemplate>
                                    <div class="w-100 p-2">
                                        <%# Eval("work") %>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList runat="server" ID="drpWork" CssClass="w-100 p-2 border-0" Enabled="false"></asp:DropDownList>
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
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Application Id" HeaderStyle-CssClass="t_white shade_2 p-2">
                                <ItemTemplate>
                                    <div class="w-100 p-2">
                                        <%# Eval("application_id") %>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="txtAplicationId" CssClass="w-100 p-2 border-0" Text='<%# Bind("application_id") %>' placeholder="Application ID" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Total Amount" HeaderStyle-CssClass="t_white shade_2 p-2">
                                <ItemTemplate>
                                    <div class="w-100 p-2">
                                        <%# Eval("total_amount") %>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="txtServiceCharge" CssClass="w-100 p-2 border-0" Text='<%# Bind("total_amount") %>' placeholder="Amount" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Recevied Amount" HeaderStyle-CssClass="t_white shade_2 p-2">
                                <ItemTemplate>
                                    <div class="w-100 p-2">
                                        <%# Eval("received_amount") %>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="txtReceviedAmount" CssClass="w-100 p-2 border-0" Text="0" placeholder="Balance" />
                                </EditItemTemplate>
                            </asp:TemplateField>

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
    </section>

</asp:Content>
