<%@ Page Title="" Language="C#" MasterPageFile="~/forms/mst.Master" AutoEventWireup="true" CodeBehind="frmAddAgent.aspx.cs" Inherits="Dokaan.forms.frmAddAgent" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #overflow_div::-webkit-scrollbar {
            width: 0px;
        }

        table.dataTable>tbody>tr>th, table.dataTable>tbody>tr>td:nth-child(1) {
            padding: 0px 10px !important;
        }

        table.dataTable>tbody>tr>th, table.dataTable>tbody>tr>td:nth-child(2) {
            padding: 0px 0px !important;
        }

        table.dataTable>tbody>tr>th, table.dataTable>tbody>tr>td.dt-empty{
            padding: 8px 0px !important;
        }

    </style>

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="scriptManager"></asp:ScriptManager>
    <div>
        <h4 class="mb-0 px-3 py-3">nothing to see here</h4>
    </div>

    <section class="p-3">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-12 grey_1 p-3">

                    <div class="row">
                        <div class="col-12">
                            <p class="mb-0 text-secondary">
                                Home / Add Agent
                            </p>
                        </div>
                    </div>

                    <div class="row py-3 m-0">
                        <div class="col-sm-6 col-12 px-1 mt-2">
                            <asp:Label runat="server" ID="Label2" AssociatedControlID="txtAgentName" CssClass="small">
                                <p class="mb-0">
                                    Agent Name
                                    <span class="text-danger">
                                        *
                                    </span>
                                </p>
                            </asp:Label>
                            <asp:Panel runat="server" DefaultButton="btnDummy">
                                <asp:TextBox runat="server" ID="txtAgentName" placeholder="" CssClass="w-100 p-2 border-0"></asp:TextBox>
                            </asp:Panel>
                        </div>
                        <div class="col-sm-6 col-12 px-1 mt-2">
                            <asp:Label runat="server" ID="Label1" AssociatedControlID="txtAgentMobile" CssClass="small">
                                <p class="mb-0">
                                    Agent Mobile
                                    <span class="text-danger">
                                        *
                                    </span>
                                </p>
                            </asp:Label>
                            <asp:Panel runat="server" DefaultButton="btnDummy">
                                <asp:TextBox runat="server" ID="txtAgentMobile" placeholder="" CssClass="w-100 p-2 border-0" TextMode="Phone" MaxLength="10"></asp:TextBox>
                            </asp:Panel>
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
                <div class="col-md-6 col-12 pt-md-0 pt-3">
                    <%--<asp:UpdatePanel runat="server" ID="updtPnl">
                        <ContentTemplate>--%>

                            <div class="row">
                                <div class="col-12">
                                    <asp:Panel runat="server" DefaultButton="btnDummy">
                                        <asp:TextBox runat="server" ID="txtSearchWork" ClientIDMode="Static" placeholder="Search" CssClass="w-100 p-2 border-0"></asp:TextBox>
                                        <asp:Button ID="btnDummy" runat="server" OnClientClick="return false;" Style="display:none;" />
                                    </asp:Panel>
                                </div>
                            </div>

                            <div class="row pt-3 mx-0 border-0 border-primary">
                                <div id="overflow_div" class="col-12 px-0 table table-responsive mb-0" style="height: 70vh;">
                                    <asp:GridView runat="server" ID="gvWorkMaster" ClientIDMode="Static" AutoGenerateColumns="false"
                                        UseAccessibleHeader="true"
                                        CssClass="w-100 text-nowrap small" AlternatingRowStyle-CssClass="grey_1"
                                        DataKeyNames="work_master_id">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Check" HeaderStyle-CssClass="t_white shade_2 p-2">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblChkCon" AssociatedControlID="chkWork" CssClass="w-100 d-flex align-items-center px-2">
                                                        <asp:CheckBox runat="server" ID="chkWork" CssClass="mb-0 d-flex align-items-center" />
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Work" HeaderStyle-CssClass="t_white shade_2 p-2">
                                                <ItemTemplate>
                                                    <div class="w-100 p-2">
                                                        <%# Eval("work") %>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>

                                        <%--<asp:EmptyDataTemplate>
                                            <div class="text-center p-3">
                                                <h4 class="t_secondary">No Records Found</h4>
                                            </div>
                                        </asp:EmptyDataTemplate>--%>
                                    </asp:GridView>
                                </div>
                            </div>
                        <%--</ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnBack" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>--%>
                </div>
            </div>
        </div>

    </section>
    <script>

        $(document).ready(function () {
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


            // 1. Initialize DataTable
            var table = $('#gvWorkMaster').DataTable({
                "dom": 'rtip', 
                "paging": false, 
                "info": false,
                "ordering": false
            });

            // 2. Connect custom search input
            $('#txtSearchWork').on('keyup change clear', function () {
                table.search(this.value).draw();
            });
        })

    </script>
</asp:Content>
