﻿<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/Admin.master" AutoEventWireup="true" CodeFile="pxe.aspx.cs" Inherits="views_admin_pxe" %>
<%@ MasterType VirtualPath="~/views/admin/admin.master" %>
<%@ Reference virtualPath="~/views/masters/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BreadcrumbSub" Runat="Server">
     <li><a href="<%= ResolveUrl("~/views/admin/client.aspx") %>">PXE Settings</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubContent" Runat="Server">
     <script type="text/javascript">
    $(document).ready(function() {
        $('#pxe').addClass("nav-current");
    });
</script>
    <div class="size-4 column">
    Using Proxy DHCP:
</div>
<div class="size-setting column">
    <asp:DropDownList ID="ddlProxyDHCP" runat="server" CssClass="ddlist" OnSelectedIndexChanged="ProxyDhcp_Changed" AutoPostBack="true">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:DropDownList>
</div>
<br class="clear"/>
<div class="size-4 column">
    PXE Mode:
</div>
<div class="size-setting column">
    <asp:DropDownList ID="ddlPXEMode" runat="server" CssClass="ddlist">
        <asp:ListItem>pxelinux</asp:ListItem>
        <asp:ListItem>ipxe</asp:ListItem>
        <asp:ListItem>syslinux_32_efi</asp:ListItem>
        <asp:ListItem>syslinux_64_efi</asp:ListItem>
        <asp:ListItem>ipxe_32_efi</asp:ListItem>
        <asp:ListItem>ipxe_64_efi</asp:ListItem>
        <asp:ListItem>ipxe_32_efi_snp</asp:ListItem>
        <asp:ListItem>ipxe_64_efi_snp</asp:ListItem>
        <asp:ListItem>ipxe_32_efi_snp_only</asp:ListItem>
        <asp:ListItem>ipxe_64_efi_snponly</asp:ListItem>
        <asp:ListItem>grub_64_efi</asp:ListItem>
    </asp:DropDownList>
</div>
<br class="clear"/>

<div class="size-4 column">
    Proxy Bios PXE Mode:
</div>
<div class="size-setting column">
    <asp:DropDownList ID="ddlProxyBios" runat="server" CssClass="ddlist">
        <asp:ListItem>pxelinux</asp:ListItem>
        <asp:ListItem>ipxe</asp:ListItem>
    </asp:DropDownList>
</div>
<br class="clear"/>
<div class="size-4 column">
    Proxy Efi32 PXE Mode:
</div>
<div class="size-setting column">
    <asp:DropDownList ID="ddlProxyEfi32" runat="server" CssClass="ddlist">
        <asp:ListItem>syslinux_32_efi</asp:ListItem>
        <asp:ListItem>ipxe_32_efi</asp:ListItem>
        <asp:ListItem>ipxe_32_efi_snp</asp:ListItem>
        <asp:ListItem>ipxe_32_efi_snponly</asp:ListItem>
    </asp:DropDownList>
</div>
<br class="clear"/>
<div class="size-4 column">
    Proxy Efi64 PXE Mode:
</div>
<div class="size-setting column">
    <asp:DropDownList ID="ddlProxyEfi64" runat="server" CssClass="ddlist">
        <asp:ListItem>syslinux_64_efi</asp:ListItem>
        <asp:ListItem>ipxe_64_efi</asp:ListItem>
        <asp:ListItem>ipxe_64_efi_snp</asp:ListItem>
        <asp:ListItem>ipxe_64_efi_snponly</asp:ListItem>
        <asp:ListItem>grub_64_efi</asp:ListItem>
    </asp:DropDownList>
</div>

<br class="clear"/>
       <div class="size-4 column">
    &nbsp;
</div>

<div class="size-setting column">
    <asp:LinkButton ID="btnUpdateSettings" runat="server" Text="Update PXE Settings" OnClick="btnUpdateSettings_OnClick" CssClass="submits"/>
</div>
<br class="clear"/>
</asp:Content>

