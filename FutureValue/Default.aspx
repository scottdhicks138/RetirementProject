<!-- Scott Hicks -->
<!-- PRG 270 Lab 1 -->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 2: Future Value</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 239px;
        }
        .auto-style3 {
            width: 451px;
        }
        #form1 {
            width: 439px;
            height: 217px;
        }
        .auto-style4 {
            width: 239px;
            height: 26px;
        }
        .auto-style5 {
            width: 451px;
            height: 26px;
        }
    </style>
</head>
<body>
    <img src="Images/BenjaminFranklin.png"  alt="Benjamin Franklin MIA" style="height: 186px; width: 432px"/>
    <h1 style="width: 433px">401K Future Value Calculator</h1>
    <form id="form1" runat="server">
    <div style="width: 429px">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <asp:ValidationSummary ID="ValidationSummary" runat="server" 
                    HeaderText="The following errors occurred:"
                    ForeColor="Red"
                    ShowSummary="true" DisplayMode="BulletList" />
            </tr>
            <tr>
                <td class="auto-style2">Beginning Balance</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtBegBal" runat="server" Width="69px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqBal" runat="server" ControlToValidate="txtBegBal" Display="Static" ErrorMessage="Beginning Balance is required" Text="*" ForeColor="Red" />
                    <asp:CompareValidator 
                        ID="CompareValidator1" 
                        runat="server" 
                        ControlToValidate="txtBegBal"
                        Display="Static"
                        Type="Double"
                        Operator="GreaterThanEqual"
                        ValueToCompare="0"
                        ErrorMessage="Beginning Balance must be numeric"
                        Text="Invalid"
                        ForeColor ="Red" /> 
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Monthly Investment</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="drpInvestment" runat="server" Width="79px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqMthInvestment" runat="server" ErrorMessage="Monthly Investment is required" ControlToValidate="drpInvestment" Display="Static" Text="*" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Annual Interest Rate</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtInterest" runat="server" Width="73px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqInterest" runat="server" ErrorMessage="Interest Rate is required" ControlToValidate="txtInterest" Display="Static" Text="*" ForeColor="Red" />
                    <asp:RangeValidator 
                        ID="RangeValidator1" 
                        runat="server" 
                        ControlToValidate="txtInterest"
                        Display="Static"
                        ErrorMessage="Interest rate must range from 1 to 20"
                        MaximumValue="20"
                        MinimumValue="1"
                        Type="Double"
                        Text="1 - 20 please"
                        ForeColor="Red" ></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Number of Years</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtYears" runat="server" Width="74px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqYears" runat="server" ErrorMessage="Number of Years is required" ControlToValidate="txtYears" Display="Static" Text="*" ForeColor="Red" />
                    <asp:RangeValidator 
                        ID="RangeValidator2" 
                        runat="server" 
                        ControlToValidate="txtYears"
                        Display="Static"
                        ErrorMessage="Number of years must range from 1 to 45"
                        MaximumValue="45"
                        MinimumValue="1"
                        Type="Integer"
                        Text="1 to 45 please"
                        ForeColor="Red" ></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Future Value</td>
                <td class="auto-style3">
                    <asp:Label ID="lblValue" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
        <br />
        <asp:Button ID="btnCalculate" runat="server" style="margin-left: 33px" Text="Calculate" Width="74px" OnClick="btnCalculate_Click" />
        <asp:Button ID="btnClear" runat="server" CausesValidation="False" style="margin-left: 202px" Text="Clear" Width="65px" OnClick="btnClear_Click" />
    </form>
</body>
</html>
