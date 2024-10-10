use project_1;
select * from finance_01;
select * from finance_2;
alter table finance_2 change column ï»¿id id int;


# KPI 1 : YEAR WISE LOAN AMOUNT 

SELECT 
	year(issue_d) as year_of_issue_d, 
    sum(loan_amnt) as total_loan_amnt
FROM
	finance_01
GROUP BY  
	year_of_issue_d
ORDER BY  
	year_of_issue_d;



# KPI 2 :  GRADE AND SUB_GRADE WISE REVOL_BAL

SELECT 
	grade, sub_grade, sum(revol_bal) 
FROM
	finance_01 
JOIN 
	finance_2 
ON
	finance_01.id = finance_2.id
GROUP BY 
	grade, sub_grade
ORDER BY 
	grade, sub_grade;


# KPI 3 : Total Payment for Verified Status Vs Total Payment for Non Verified Status

SELECT
	verification_status, 
	concat("$", format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
FROM 
	finance_01 
JOIN
	finance_2 
ON
	finance_01.id = finance_2.id
GROUP BY 
	verification_status; 


# KPI 4 : State wise and last_credit_pull_d wise loan status

SELECT
	 addr_state, last_credit_pull_d, loan_status 
FROM
	finance_01 
JOIN 
	finance_2
ON
	finance_01.id = finance_2.id
ORDER  BY 
	last_credit_pull_d desc;


# KPI 5 : Home ownership Vs last payment date stats

SELECT
	home_ownership, last_pymnt_d as last_payment_date 
FROM
	finance_01
JOIN
	finance_2
ON
	finance_01.id = finance_2.id
ORDER BY
	last_pymnt_d desc;



select home_ownership, last_pymnt_d 
from finance_01 inner join finance_2
on(finance_01.id = finance_2.id)
group by home_ownership,last_pymnt_d; 

select * from finance_01;
select * from finance_2;
alter table finance_2 drop column next_pymnt_d; 


























