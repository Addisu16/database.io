use hospital;
select * from doctor;
select*from patient;
select *from bill;

-- List all patients whose name starts with 'Pr'
select patient.* from patient where name='%r%';

-- Select all patients that are not located in 'Fairfield' or 'Chicago'
select * from patient where not address='Fairfield' and address!='Chicago';

-- Display the least bill paid patient details(name, amount)

select bill.amount,patient.name from bill,patient where bill.patientNo=patient.patientNo group by bill.amount,patient.name order by bill.amount,patient.name ASC;