<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="Controls_ContactForm" %>
<style type="text/css">
    .auto-style1
    {
        width: 100%;
    }

    .auto-style2
    {
        height: 20px;
    }

    .auto-style3
    {
        height: 20px;
        width: 298px;
    }

    .auto-style4
    {
        width: 298px;
    }
</style>
<script>
    function validatePhoneNumbers(source, args)
    {
        var phoneHome = document.getElementById('<%= PhoneHome.ClientID %>');
        var phoneBusiness = document.getElementById('<%= PhoneBusiness.ClientID %>');
        if (phoneHome.value != '' || phoneBusiness.value != '')
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table class="auto-style1" runat="server" id="FormTable">
            <tr>
                <td colspan="3" style="text-align: center">
                    <h1>Contact me</h1>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><span style="font-family: CourierStd-Bold; font-size: 9pt; color: rgb(0,0,0); font-style: normal; font-variant: normal;"><b>Name</b></span></td>
                <td class="auto-style3">
                    <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" CssClass="ErrorMessage" ErrorMessage="Enter Your Name">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>E-mail address</td>
                <td class="auto-style4">
                    <asp:TextBox ID="EmailAddress" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailAddress" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter an e-mail address">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailAddress" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter a valid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Repeat e-mail address</td>
                <td class="auto-style4">
                    <asp:TextBox ID="ConfirmEmailAddress" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ConfirmEmailAddress" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Confirm the e-mail">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="EmailAddress" ControlToValidate="ConfirmEmailAddress" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="The e-mail addresses">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>Home phone number</td>
                <td class="auto-style4">
                    <asp:TextBox ID="PhoneHome" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter your home or business phone number" OnServerValidate="CustomValidator1_ServerValidate" ClientValidationFunction="validatePhoneNumbers">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Business phone number</td>
                <td class="auto-style4">
                    <asp:TextBox ID="PhoneBusiness" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Comments</td>
                <td class="auto-style4">
                    <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" ValidateRequestMode="Disabled"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Comments" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter a comment">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="SendButton" runat="server" Text="Send" OnClick="SendButton_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage" />
                </td>
            </tr>
        </table>
        <asp:Label ID="Message" runat="server" Text="Message Sent" Visible="false" />
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <div class="PleaseWait">
            Please Wait...
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
