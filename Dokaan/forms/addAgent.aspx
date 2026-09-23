<%@ Page Title="" Language="C#" MasterPageFile="~/forms/mst.Master" AutoEventWireup="true" CodeBehind="addAgent.aspx.cs" Inherits="Dokaan.forms.addAgent" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="scriptManager"></asp:ScriptManager>
    <div>
        <h4 class="mb-0 px-3 py-3">nothing to see here</h4>
    </div>

    <section class="px-3">
        <div class="container-fluid">
            <div class="row pt-3">
                <div class="col-12">
                    <p class="mb-0 text-secondary">
                        Home / Add Agent
                    </p>
                </div>
            </div>

            <div class="row pt-3 border-0 border-danger">
                <div class="col-lg-6 col-md-5 col-12 text-start ">
                    <asp:Button runat="server" ID="btnAddNew" Text="Add New Agent" CssClass="py-2 px-3 shade_2 t_white border-0" OnClick="btnAddNew_Click" />
                </div>
                <asp:Panel class="col-lg-6 col-md-7 col-12 d-flex align-items-center mt-md-0 mt-3" runat="server" ID="pnlSearchBox" DefaultButton="btnSearch">
                    <asp:TextBox runat="server" ID="txtSearch" CssClass="w-100 p-2 border-0" placeholder="Search by Keyword"></asp:TextBox>
                    <asp:ImageButton runat="server" ImageUrl="../assets/img/search_icon.png" ID="btnSearch" Width="40" CssClass="img-fluid shade_2 p-2" OnClick="btnSearch_Click" />
                </asp:Panel>
            </div>

            <div class="row pt-3 border-0 border-primary">
                <asp:UpdatePanel runat="server" ID="updtPnl">
                    <ContentTemplate>
                        <div class="table table-responsive">
                            <asp:GridView runat="server" ID="gvWork" DataKeyNames="agent_id" AutoGenerateColumns="false" CssClass="w-100 text-nowrap small" AlternatingRowStyle-CssClass="grey_1 " OnRowEditing="gvWork_RowEditing"
                                OnRowCancelingEdit="gvWork_RowCancelingEdit" OnRowUpdating="gvWork_RowUpdating" OnRowDeleting="gvWork_RowDeleting">
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

                                    <asp:TemplateField HeaderText="Agent Name" HeaderStyle-CssClass="t_white shade_2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <a href='frmAddAgent.aspx?agent_id=<%# Eval("agent_id") %>&fm=addAgent.aspx' class="text-decoration-none">
                                                    <%# Eval("agent_name") %>
                                                </a>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtAgentName" placeholder="Work Name" CssClass="w-100 p-2 border-0" Text='<%# Bind("agent_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Agent Name" HeaderStyle-CssClass="t_white shade_2">
                                        <ItemTemplate>
                                            <div class="w-100 p-2">
                                                <%# Eval("agent_mobile") %>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtAgentMobile" placeholder="Work Name" CssClass="w-100 p-2 border-0" Text='<%# Bind("agent_mobile") %>'></asp:TextBox>
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

                        <div class="row border-0 border-primary">
                            <asp:Label runat="server" ID="lblMessage" Text=""></asp:Label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>
    </section>

</asp:Content>
