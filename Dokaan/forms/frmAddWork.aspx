<%@ Page Title="" Language="C#" MasterPageFile="~/forms/mst.Master" AutoEventWireup="true" CodeBehind="frmAddWork.aspx.cs" Inherits="Dokaan.forms.frmAddWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h4 class="mb-0 px-3 py-3">nothing to see here</h4>
    </div>

    <section class="p-3">
        <div class="container-fluid grey_1 p-3">
            <div class="row">
                <div class="col-12">
                    <p class="mb-0 text-secondary">
                        Home / Add Work
                    </p>
                </div>
            </div>
            <div class="row py-3 m-0">
                <div class="col-4 px-1 mt-2">
                    <asp:Label runat="server" ID="lblWorkName" AssociatedControlID="txtWorkName" CssClass="small">
                        <p class="mb-0">
                            Work Name
                        <span class="text-danger">
                            *
                        </span>
                        </p>
                    </asp:Label>
                    <asp:TextBox runat="server" ID="txtWorkName" placeholder="" CssClass="w-100 p-2 border-0"></asp:TextBox>
                </div>
                <div class="col-4 px-1 mt-2">
                    <asp:Label runat="server" ID="lblFee" AssociatedControlID="txtFee" CssClass="small">
                        <p class="mb-0">
                            Fee
                        </p>
                    </asp:Label>
                    <asp:TextBox runat="server" ID="txtFee" placeholder="" CssClass="w-100 p-2 border-0" Text="0" TextMode="Number"></asp:TextBox>
                </div>
                <div class="col-4 px-1 mt-2">
                    <asp:Label runat="server" ID="Label1" AssociatedControlID="txtLink" CssClass="small">
                        <p class="mb-0">
                            Service Charge
                        </p>
                    </asp:Label>
                    <asp:TextBox runat="server" ID="txtServiceCharge" placeholder="" CssClass="w-100 p-2 border-0" Text="0" TextMode="Number"></asp:TextBox>
                </div>
                <div class="col-4 px-1 mt-2">
                    <asp:Label runat="server" ID="lblLink" AssociatedControlID="txtLink" CssClass="small">
                        <p class="mb-0">
                            Tracking Link
                        </p>
                    </asp:Label>
                    <asp:TextBox runat="server" ID="txtLink" placeholder="" CssClass="w-100 p-2 border-0"></asp:TextBox>
                </div>
                <div class="col-4 px-1 mt-2">
                    <asp:Label runat="server" ID="lblWork" AssociatedControlID="drpStatus" CssClass="small">
                        <p class="mb-0">
                            Default Status
                            <span class="text-danger">*
                            </span>
                        </p>
                    </asp:Label>
                    <asp:DropDownList runat="server" ID="drpStatus" CssClass="w-100 p-2 border-0" AppendDataBoundItems="true">
                        <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row m-0">
                <div class="col-12 px-1 mt-2">
                    <asp:Label runat="server" ID="lblMessage"></asp:Label>
                    <asp:Button runat="server" ID="btnSave" Text="Save" CssClass=" py-2 px-4 shade_2 t_white border-0" OnClick="btnSave_Click" />
                    <asp:Button runat="server" ID="btnBack" Text="Back" CssClass=" py-2 px-4 shade_2 t_white border-0" OnClick="btnBack_Click" />
                </div>
            </div>
        </div>
    </section>

</asp:Content>
