﻿<%@ Page Title="Planet Wrox - Management - Reviews." Language="C#" MasterPageFile="~/MasterPages/Management.master" AutoEventWireup="true" CodeFile="Reviews.aspx.cs" Inherits="Management_Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
        <asp:ListItem Value="">Make a Selection</asp:ListItem>
    </asp:DropDownList>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="AddEditReview.aspx?Id={0}" DataTextField="Title" HeaderText="Title" />
            <asp:TemplateField HeaderText="Authorized" SortExpression="Authorized">
                <ItemTemplate>
                    <asp:Label ID="AuthorizedLabel" runat="server" Text='<%# GetBooleanText(Eval("Authorized")) %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreateDateTime" DataFormatString="{0:g}" HeaderText="CreateDateTime" SortExpression="CreateDateTime" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <a href="AddEditReview.aspx">Insert New Review</a>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Review] WHERE [Id] = @original_Id AND [Title] = @original_Title AND [Authorized] = @original_Authorized AND [CreateDateTime] = @original_CreateDateTime" InsertCommand="INSERT INTO [Review] ([Title], [Authorized], [CreateDateTime]) VALUES (@Title, @Authorized, @CreateDateTime)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [Title], [Authorized], [CreateDateTime] FROM [Review] WHERE ([GenreID] = @GenreID)" UpdateCommand="UPDATE [Review] SET [Title] = @Title, [Authorized] = @Authorized, [CreateDateTime] = @CreateDateTime WHERE [Id] = @original_Id AND [Title] = @original_Title AND [Authorized] = @original_Authorized AND [CreateDateTime] = @original_CreateDateTime">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Authorized" Type="Boolean" />
            <asp:Parameter Name="original_CreateDateTime" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Authorized" Type="Boolean" />
            <asp:Parameter Name="CreateDateTime" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="GenreID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Authorized" Type="Boolean" />
            <asp:Parameter Name="CreateDateTime" Type="DateTime" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Authorized" Type="Boolean" />
            <asp:Parameter Name="original_CreateDateTime" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Genre]"></asp:SqlDataSource>
    
</asp:Content>

