<%@ Page Title="" Language="C#" MasterPageFile="~/forms/mst.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Dokaan.forms.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h4 class="mb-0 px-3 py-3">nothing to see here</h4>
    </div>

    <section class="px-3 pb-3">
        <div class="container-fluid">

            <div class="row pt-3">
                <div class="col-12">
                    <p class="mb-0 text-secondary">
                        Home / Dashboard
                    </p>
                </div>
            </div>

            <div class="row pt-3">
                <asp:Panel runat="server" ID="pnlDate" DefaultButton="btnDate" class="col-md-3 col-sm-6 d-flex">
                    <asp:TextBox runat="server" ID="txtDate" TextMode="Date" CssClass="w-100 p-2 border-0"></asp:TextBox>
                    <asp:ImageButton runat="server" ImageUrl="../assets/img/search_icon.png" ID="btnDate" Width="40" CssClass="img-fluid shade_2 p-2" OnClick="btnDate_Click" />
                </asp:Panel>
            </div>

            <div class="row pt-3 gy-4">
                <!-- TURN OVER -->
                <div class="col-md-3 col-sm-6">
                    <div class="shade_1 t_white p-3 rounded-3">
                        <div class="">
                            <h5>TURNOVER
                            </h5>
                        </div>
                        <div class="pt-3 d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                Cash
                            </p>
                            <asp:Label runat="server" ID="lblTurnOverCash"></asp:Label>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                Online
                            </p>
                            <asp:Label runat="server" ID="lblTurnOverOnline"></asp:Label>
                        </div>
                        <hr class="text-white" />
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                Total
                            </p>
                            <asp:Label runat="server" ID="lblTurnOver" CssClass="fw-bold"></asp:Label>
                        </div>
                    </div>
                </div>

                <!-- PROFIT -->
                <div class="col-md-3 col-sm-6">
                    <div class="shade_2 t_white p-3 rounded-3">
                        <div class="">
                            <h5>PROFIT
                            </h5>
                        </div>
                        <div class="pt-3 d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                &nbsp;
                            </p>
                            <asp:Label runat="server" ID="lblProfitCash"></asp:Label>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                &nbsp;
                            </p>
                            <asp:Label runat="server" ID="lblProfitOnline"></asp:Label>
                        </div>
                        <hr class="text-white" />
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                Total
                            </p>
                            <asp:Label runat="server" ID="lblProfile" CssClass="fw-bold" style="color: var(--light_green);"></asp:Label>
                        </div>
                    </div>
                </div>

                <!-- BALANCE -->
                <div class="col-md-3 col-sm-6" data-bs-toggle="modal" data-bs-target="#modalBalance">
                    <div class="shade_3 t_white p-3 rounded-3">
                        <div class="">
                            <h5>BALANCE
                            </h5>
                        </div>
                        <div class="pt-3 d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                &nbsp;
                            </p>
                            <asp:Label runat="server" ID="lblBalanceCash"></asp:Label>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                &nbsp;
                            </p>
                            <asp:Label runat="server" ID="lblBalanceOnline"></asp:Label>
                        </div>
                        <hr class="text-white" />
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                Total
                            </p>
                            <asp:Label runat="server" ID="lblBalance" CssClass="fw-bold" style="color: var(--light_yellow);"></asp:Label>
                        </div>
                    </div>
                </div>

                <!-- EXPENCE  -->
                <div class="col-md-3 col-sm-6">
                    <div class="shade_4 t_white p-3 rounded-3">
                        <div class="">
                            <h5>EXPENCE
                            </h5>
                        </div>
                        <div class="pt-3 d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                Cash
                            </p>
                            <asp:Label runat="server" ID="lblExpenceCash"></asp:Label>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                Online
                            </p>
                            <asp:Label runat="server" ID="lblExpenceOnline"></asp:Label>
                        </div>
                        <hr class="text-white" />
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="mb-0">
                                Total
                            </p>
                            <asp:Label runat="server" ID="lblExpence" CssClass="fw-bold" style="color: var(--light_red);"></asp:Label>
                        </div>
                    </div>
                </div>

            </div>

            <!-- TRANSACTION & EXPENSE GRAPHS -->
            <div class="row pt-3 mx-0">
                <div class="col-md-6 px-0 pt-3">
                    <div style="height: 40vh; width: 100%;">
                        <canvas id="myLineChart"></canvas>
                    </div>
                </div>
                <div class="col-md-6 px-0 pt-3">
                    <div style="height: 40vh; width: 100%;">
                        <canvas id="dailyExpenseChart"></canvas>
                    </div>
                </div>          
            </div>
            <!-- TOP WORKS GRAPH -->
            <div class="row pt-3 mx-0">
                <div class="col-md-6 px-0 pt-3">
                    <div style="height: 40vh; width: 100%;">
                        <canvas id="topWorkChart"></canvas>
                    </div>
                </div>
                <div class="col-md-6 px-0 pt-3">
                    <div style="height: 40vh; width: 100%;">
                        <canvas id=""></canvas>
                    </div>
                </div>
            </div>

            <!-- MODAL FOR BALANCE WORK -->
            <div class="modal fade" id="modalBalance" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="table table-responsive mb-0">
                                <asp:GridView runat="server" ID="gvBalance" AutoGenerateColumns="false" CssClass="w-100 text-nowrap small" AlternatingRowStyle-CssClass="grey_1"
                                    DataKeyNames="customer_id, work_id, work_master_id, status_master_id">
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

                                        <asp:TemplateField HeaderText="Name" HeaderStyle-CssClass="t_white shade_2 p-2">
                                            <ItemTemplate>
                                                <div class="w-100">
                                                    <a href='frmWorkEntry.aspx?bill_id=<%# Eval("bill_id") %>&c_id=<%# Eval("customer_id") %>&cw_id=<%# Eval("work_id") %>&from=dashboard.aspx' class="text-decoration-none" title="Edit Mode">
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
                                                <div class="w-100">
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
                                                <div class="w-100">
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
                                                <div class="w-100">
                                                    <%# Eval("mobile") %>
                                                </div>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" ID="txtMobile" CssClass="w-100 p-2 border-0" Text='<%# Bind("mobile") %>' placeholder="Mobile" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Service Charge" HeaderStyle-CssClass="t_white shade_2 p-2">
                                            <ItemTemplate>
                                                <div class="w-100">
                                                    <%# Eval("total_amount") %>
                                                </div>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" ID="txtAmount" CssClass="w-100 p-2 border-0" Text='<%# Bind("total_amount") %>' placeholder="Amount" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Received Amount" HeaderStyle-CssClass="t_white shade_2 p-2">
                                            <ItemTemplate>
                                                <div class="w-100">
                                                    <%# Eval("received_amount") %>
                                                </div>
                                            </ItemTemplate>
                                            <%--<edititemtemplate>
                                            <asp:TextBox runat="server" ID="txtBalance" CssClass="w-100 p-2 border-0" Text='<%# Bind("received_amount") %>' placeholder="Balance" />
                                        </edititemtemplate>--%>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Created Date" HeaderStyle-CssClass="t_white shade_2 p-2">
                                            <ItemTemplate>
                                                <div class="w-100">
                                                    <%# Eval("work_taken_date", "{0:dd-MMM-yyyy}") %>
                                                </div>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" ID="txtCreatedDate" CssClass="w-100 p-2 border-0" TextMode="Date"></asp:TextBox>
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
                    </div>
                </div>
            </div>
            <!-- MODAL FOR BALANCE WORK END -->

            <asp:Label runat="server" ID="lblError"></asp:Label>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Access the C# variables using Literal expressions
        <%--const labels = <%= ChartLabelsJSON %>;
        const dataValues = <%= ChartDataJSON %>;

        const labels2 = <%= ChartLabelsJSON2 %>;
        const dataValues2 = <%= ChartDataJSON2 %>;--%>

        // const ctx = document.getElementById('myLineChart').getContext('2d');

        // const myChart = new Chart(ctx, {
        //     type: 'line',
        //     data: {
        //         labels: labels,
        //         datasets: [{
        //             label: 'Transaction Amount',
        //             data: workJson,
        //             borderColor: 'rgba(255, 99, 132, 1)', // Reddish color for contrast
        //             backgroundColor: 'rgba(255, 99, 132, 0.2)',
        //             borderWidth: 2,
        //             tension: 0.3 // Smooths the line
        //         },
        //         {
        //             label: 'Profit', // Your new line
        //             data: amountJson,
        //             borderColor: 'rgba(75, 192, 192, 1)',
        //             backgroundColor: 'rgba(75, 192, 192, 0.2)',
        //             borderWidth: 2,
        //             tension: 0.3
        //         }]
        //     },
        //     options: {
        //         responsive: true,
        //         scales: {
        //             y: {
        //                 beginAtZero: true
        //             }
        //         }
        //     }
        // });

    </script>
</asp:Content>
