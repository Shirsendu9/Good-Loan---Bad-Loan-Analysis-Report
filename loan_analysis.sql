create database if not exists projects;


use projects;


select * from financial_loan;

select count(id) as total_loan_applications from financial_loan;  #total loan applications
# output - 38576

select sum(loan_amount) as Total_Funded_Amount from financial_loan; #total funded amount (total amount discharged by the bank)
# output - 435757075

select sum(total_payment) as Total_Payments_Received from financial_loan; #Total payment received from clients
#output - 473070933

select avg(int_rate) as Average_interest_rate from financial_loan; #Average interest rate
#output- 0.12048
select Round(avg(int_rate)*100,2) as Average_interest_rate from financial_loan; #To know the %
#result - 12.05S%

select avg(dti) as Average_DTI from financial_loan; #Average DTI
#output - 0.13327
select Round(avg(dti)*100,2) as Average_DTI from financial_loan; #To know the %
#result- 13.33%

 select loan_status,count(*) as Count from financial_loan group by loan_status; #to view how many types of loan status we have in out dataset
 
 select count(loan_status) as Total_Good_Loan_Applications from financial_loan 
		where loan_status='fully paid' or loan_status='current'; #To See ther total No of Good Loan Applications
 #output- 33243
 
select count(loan_status) as Total_Bad_Loan_Applications from financial_loan 
		where loan_status='charged off'; #To See ther total No of 	Bad Loan Applications
#Output - 5333

#Good Loan Application Percentage-
select (count(case when loan_status='fully paid' or loan_status='current' 
					then loan_status end)*100)/count(loan_status) 
                    as Good_Loan_Application_Percentage from financial_loan;
#output - 86%

#Bad Loan Application Percentage-
select (count(case when loan_status='charged off' 
				   then loan_status end)*100)/count(loan_status) 
                    as Bad_Loan_Application_Percentage from financial_loan;
#output - 14%

#Total Good Loan Funded Amount -
select * from financial_loan; #just to show the table once again
select sum(loan_amount) as Total_Good_Loan_Amount_Funded from financial_loan where loan_status='fully paid' or loan_status='current';
#output - 370224850

#Total Bad Loan Funded Amount -
select sum(loan_amount) as Total_Bad_Loan_Amount_Funded from financial_loan where loan_status='Charged off';
# output - 65532225

#Good Loan Total Received Amount-
select sum(total_payment) as Total_Good_Loan_Received_Amount from financial_loan where loan_status='fully paid' or loan_status='current';
#output - 435786170

#Bad Loan Total Received Amount-
select sum(total_payment) as Total_Bad_Loan_Received_Amount from financial_loan where loan_status='Charged off';
#output - 37284763
