﻿<%@ Page Title="" Language="C#" MasterPageFile="~/views/users/acls/acls.master" AutoEventWireup="true" CodeFile="imagemanagement.aspx.cs" Inherits="views_users_acls_imagemanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BreadcrumbSub2" Runat="Server">
    <li>Image Management</li>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="SubHelp">
    <a href="<%= ResolveUrl("~/views/help/index.html") %>"   target="_blank">Help</a>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ActionsRightSub">
     <asp:LinkButton ID="buttonUpdate" runat="server" OnClick="buttonUpdate_OnClick" Text="Update Image Management "  />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SubContent2" Runat="Server">
     <script type="text/javascript">
        $(document).ready(function() {
            $('#image').addClass("nav-current");
            $("[id*=gvImages] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("hover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("hover_row");
            });
        });
    </script>
     
    <asp:GridView ID="gvImages" runat="server" AllowSorting="true" AutoGenerateColumns="False" CssClass="Gridview" DataKeyNames="Id" AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:TemplateField>
                <HeaderStyle CssClass="chkboxwidth"></HeaderStyle>
                <ItemStyle CssClass="chkboxwidth"></ItemStyle>
                <HeaderTemplate>
                    <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="SelectAll_CheckedChanged"/>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelector" runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Id" Visible="False"/>
            <asp:BoundField DataField="Name" HeaderText="Name" />
        </Columns>
        <EmptyDataTemplate>
            No Images Have Been Created
        </EmptyDataTemplate>
    </asp:GridView>

</asp:Content>
