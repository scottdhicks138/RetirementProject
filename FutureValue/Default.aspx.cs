/* Scott Hicks */
/* PRG 270 Lab 1 */

/* * * E X T R A S * * */

/* I added a textbox for a beginning balance. Zero is allowed to accommodate new */
/* investors while having a beginning balance allows experienced investors to use my app. */
/* I used a CompareValidator with this control. */

/* The code-behind file also contains a ValidationSummary. I preferred this because the */ 
/* placement of the individual error messages did not appear as desired. More knowledge */
/* is needed here. */

/* NOTE: I fixed this! I learned how to display the error messages inline AND summarized. */

/* The validation controls were not required for this assignment. I included */
/* RequiredFieldValidators, RangeValidators, and the previously mentioned */
/* CompareValidator as extra. */
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        
        if (!IsPostBack)
            for (int i = 50; i <= 500; i += 50)
            {
                drpInvestment.Items.Add(i.ToString());
            }
    }

    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            decimal beginBalance = Convert.ToDecimal(txtBegBal.Text);
            int monthlyInvestment = Convert.ToInt32(drpInvestment.SelectedValue);
            decimal yearlyInterestRate = Convert.ToDecimal(txtInterest.Text);
            int years = Convert.ToInt32(txtYears.Text);
            decimal futureValue = this.CalculateFutureValue(beginBalance, monthlyInvestment, yearlyInterestRate, years);
            lblValue.Text = futureValue.ToString("C");
        }
    }

    protected decimal CalculateFutureValue(decimal beginBalance, int monthlyInvestment, decimal yearlyInterestRate, int years)
    {
        int months = years * 12;
        decimal monthlyInterestRate = yearlyInterestRate / 12 / 100;
        decimal futureValue = beginBalance;

        for (int i = 0; i < months; i++)
        {
            futureValue = (futureValue + monthlyInvestment) * (1 + monthlyInterestRate);
        }

        return futureValue;
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        drpInvestment.SelectedIndex = 0;
        txtInterest.Text = "";
        txtYears.Text = "";
        lblValue.Text = "";
    }
        
}