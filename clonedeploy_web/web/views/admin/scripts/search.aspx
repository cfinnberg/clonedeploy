﻿<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/scripts/scripts.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="views_admin_scripts_search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BreadcrumbSub2" Runat="Server">
     <li ><a href="<%= ResolveUrl("~/views/admin/scripts/search.aspx?cat=sub1") %>">Scripts</a></li>
    <li>Search</li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SubContent2" Runat="Server">
     <script type="text/javascript">
        $(document).ready(function() {
            $('#search').addClass("nav-current");
        });
    </script>
    <div class="size-7 column">
        <asp:TextBox ID="txtSearch" runat="server" CssClass="searchbox" OnTextChanged="search_Changed"></asp:TextBox>
    </div>
    <br class="clear"/>
    <p class="total">
        <asp:Label ID="lblTotal" runat="server"></asp:Label>
    </p>
    <asp:GridView ID="gvScripts" runat="server" AllowSorting="True" DataKeyNames="Id" OnSorting="gridView_Sorting" AutoGenerateColumns="False" CssClass="Gridview" AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:TemplateField>
                <HeaderStyle CssClass="chkboxwidth"></HeaderStyle>
                <ItemStyle CssClass="chkboxwidth"></ItemStyle>
                <HeaderTemplate>
                    <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="chkSelectAll_CheckedChanged"/>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelector" runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Id" HeaderText="hostID" SortExpression="hostID" Visible="False"/>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-CssClass="width_200"></asp:BoundField>
            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" ItemStyle-CssClass="width_200 mobi-hide-smallest" HeaderStyle-CssClass="mobi-hide-smallest"/>
          
         
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/views/admin/scripts/edit.aspx?cat=sub1&scriptid={0}" Text="View"/>
        </Columns>
        <EmptyDataTemplate>
            No Hosts Found
        </EmptyDataTemplate>
    </asp:GridView>
   
    </asp:Content>
