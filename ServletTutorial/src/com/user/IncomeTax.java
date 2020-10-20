package com.user;

public class IncomeTax {
	private double income;
	private int status;
	private double taxDue;
	
	double[] hhbrackets = {510300.00,204100.00,160700.00,84200.00,52850.00,13850.00,0.00};
	double[] mbrackets = {612350.00,408200.00,321450.00,168400.00,78950.00,19400.00,0.00};
	double[] sbrackets = {510300.00,204100.00,160725.00,84200.00,39475.00,9700.00,0.00};
	double[] rates = {.37,.35,.32,.24,.22,.12,.10};
	
	public IncomeTax() {

	}
	public double getIncome() {
		return income;
	}
	public void setIncome(double income) {
		this.income = income;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	public double getTaxDue() {
		return taxDue;
	}
	public void setTaxDue(double taxDue) {
		this.taxDue = taxDue;
	}
	
	public void calculateTaxes() {
		switch(this.status) {
		case 1:
			bracketCalc(sbrackets);
			break;
		case 2:
			bracketCalc(mbrackets);
			break;
		case 3:
			bracketCalc(hhbrackets);
			break;
		}
	}
	
	private void bracketCalc(double[] bracket) {
		double remainder = 0;
		for(int i = 0; i < 7; i++) {
			if(this.income > bracket[i]) {      //check if current income value is higher than bracket min
				remainder = this.income - bracket[i];  // set remainder to total amount higher than bracket min
				this.income = bracket[i];				// set income value to bracket min value
				remainder = remainder * rates[i];
				taxDue = taxDue + remainder;
			}
		}
		int temp = (int)(taxDue * 100.0);
		taxDue = ((double)temp)/100.0;    // these lines clip the value of taxDue to 2 decimal places
	}
	
	public static void  main(String[] args) {
		double value = 41049.00;
		int status = 1;
		
		IncomeTax income = new IncomeTax();
		income.setIncome(value);
		income.setStatus(status);
		income.calculateTaxes();
		System.out.println(income.getTaxDue()); // should be 4889
	
		
	}

}
