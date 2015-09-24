<%@ Page Title="Database Demo" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" 
    CodeFile="DatabaseDemo.aspx.cs" Inherits="Demos_DatabaseDemo " %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BEGASPNETConnectionString %>" SelectCommand="SELECT [username], [Id] FROM [Table]"></asp:SqlDataSource>
</asp:Content>

