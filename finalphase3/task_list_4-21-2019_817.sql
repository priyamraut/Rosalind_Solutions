#CS 4400 Phase 3 Task List


###  Screen 1: User Login
#	User_login  
insert into `user` SET email='priyamyahar123@hotmail.com', password = 'priyam';
	
    
###  Screen 3: Register User Only
# Add Basic User Information
insert into `user` SET fname='Priyam', lname = 'Raut', username='priyam', password = 'priyam';
# Add new email for user 
insert into `email` SET username='priyam', email='priyamyahar123@hotmail.com';
# Delete existing email for user
delete from `email` WHERE username='priyam' AND email='priyamyahar123@hotmail.com';


###  Screen 4: Register Visitor Only
# Add basic visitor information
insert into `user` SET username='priyam', password='priyam', status='Approved', fname='Priyam', lname = 'Raut', etype='employee,visitor' ;
insert into `visitor` SET username='priyam';
	
    
###  Screen 5: Register Employee Only
# Add Basic Employee Information
insert into `user` SET fname='Priyam', lname = 'Raut', username='priyam', password = 'priyam';
insert into `employee` SET etype='Manager', phone='1234567890', address='123 Database Lane', city='Hell', state='GA', zipcode='12345';
# Add new email for employee
insert into `email` SET username='priyam', email='priyamyahar123@hotmail.com';
# Delete existing email for employee
delete from `email` WHERE username='priyam' AND email='priyamyahar123@hotmail.com';


###  Screen 6: Register Employee-Visitor 
# Add Basic Employee Information
insert into `user` SET fname='Priyam', lname = 'Raut', username='priyam', password = 'priyam';
insert into `visitor` SET username='priyam';
insert into `employee` SET etype='Manager', phone='1234567890', address='123 Database Lane', city='Hell', state='GA', zipcode='12345';
# Add new email for employee
insert into `email` SET username='priyam', email='priyamyahar123@hotmail.com';
# Delete existing email for employee
delete from `email` WHERE username='priyam' AND email='priyamyahar123@hotmail.com';


### Screen 15: User Take Transit
# Filter View
SELECT * from `user_take_transit` WHERE `type`='MARTA' AND `date`='2019-03-20' AND `price` BETWEEN '1.00' AND '5.00';

# Log Transit
INSERT into `take` SET `date`='2019-04-20', `transitroute`='152', `transittype`='Bus', `username`='priyam raut';

### Screen 16: User Transit History
#	Task 1: Filter Transit History
SELECT 
	`date`,
    `route`,
    `type`,
    `price`,
    `username`
FROM 
	`user_transit_history` 
WHERE
	`username` = 'maria.hernandez' AND `date` = '2019-03-20' AND `route` = 'Relay'
;

### Screen 17: Employee Manage Profile
# Task 1: Update user
UPDATE `user` SET `fname`='Priyam', `lname`='Raut' WHERE `username` ='priyamraut';
UPDATE `employee` SET `phone` ='1234567890' WHERE `employeeID`='000001234';

# update_profile_email
INSERT into email SET username='priyamraut', email='praut20@hotmail.com';
DELETE from email WHERE username='priyamraut' and email='praut20@hotmail.com';
	
    
### Screen 18: Administrator Manage User
# Task 1: Filter user
SELECT DISTINCT 
	`manage_user`.`username` AS `username`,
    `status`,
    `etype`,
    ( SELECT COUNT(  DISTINCT(`email`) ) FROM `email` WHERE `email`.`username` = `manage_user`.`username`) AS `Email Count`
FROM 
	`manage_user`
WHERE 
	`username` = 'james.smith'
;
# Task 2: Approve user	
update `user` SET `status` = 'Approved' where username = 'priyamraut';
# Task 3: Decline user
update `user` SET `status` = 'Declined' where username = 'priyamraut';
		
        
### Screen 19: Administrator Manage Site
# Task 1: Filter Site
SELECT
	`sitename`,
	`openeveryday`,
	`Manager`
FROM
	`manage_site`	
WHERE 
	`sitename` = 'Inman Park' AND `openeveryday` = '1'
;
# Task 2: Create Site
INSERT INTO `site` SET 
	`sitename` = 'IBB',
    `openeveryday` = '1',
    `address` = '123 Satans Anus',
    `city` = 'Nowhere',
    `state` = 'NA',
    `zipcode` = '66666',
    `employeeID` = '000001234'
;
# Task 3: Edit Site
UPDATE `site` SET `openeveryday` = '0' WHERE `sitename` = 'IBB';
# Task 4: Delete Site
DELETE from `site` where `sitename`='IBB';

	
### Screen 20: Administrator Edit Site
# Edit Site
UPDATE `site` SET `openeveryday` = '0' WHERE `sitename` = 'IBB';
# Get list of unassigned managers !!!!



#Screen 21: Administrator Create Site
# Create Site
INSERT INTO `site` SET 
	`sitename` = 'IBB',
    `openeveryday` = '1',
    `address` = '123 Satans Anus',
    `city` = 'Nowhere',
    `state` = 'NA',
    `zipcode` = '66666',
    `employeeID` = '000001234'
;

### Screen 22: Administrator Manage Transit
# Task 1: Generate View
SELECT DISTINCT
	`route`, 
	`type`, 
	`price`,    
    ( SELECT COUNT(  DISTINCT(`sitename`) ) FROM `connect` WHERE `connect`.`transitroute` = `manage_transit`.`route` AND `connect`.`transittype` = `manage_transit`.`type`) AS `Connected Sites`,
    ( SELECT COUNT( `transitroute` ) FROM `take` WHERE `take`.`transitroute` = `manage_transit`.`route` AND `manage_transit`.`username` = `take`.`username` ) AS `Transit Logged`
FROM
	`manage_transit`
;
			
# Task 2: Create Transit
INSERT INTO `transit` SET 
	`route` = '666',
    `type` = 'wagon',
    `price` = '0.00'
;
# Task 3: Edit Transit
UPDATE `transit` SET `type` = 'carriage' WHERE `route` = '666';
# Task 4: Delete Transit
DELETE from `transit` where `route`='666';

# Task 5: Filter	
SELECT DISTINCT
	`route`, 
	`type`, 
	`price`,    
    ( SELECT COUNT(  DISTINCT(`sitename`) ) FROM `connect` WHERE `connect`.`transitroute` = `manage_transit`.`route` AND `connect`.`transittype` = `manage_transit`.`type`) AS `Connected Sites`,
    ( SELECT COUNT( `transitroute` ) FROM `take` WHERE `take`.`transitroute` = `manage_transit`.`route` AND `manage_transit`.`username` = `take`.`username` ) AS `Transit Logged`
FROM
	`manage_transit`
WHERE
	`route` = '666'
;    
    

#### Screen 23: Administrator Edit Transit
# Get a list of all available sites
SELECT DISTINCT `sitename` FROM `site`;	
# Update the transit table (price, route name, type)
UPDATE `transit` SET `type` = 'carriage' WHERE `route` = '666' AND `price` = '5.00';
# Update the Connect table to add a new connected site to a route
INSERT INTO `connect` SET `transitroute` = '666', `transittype` = 'carriage', `sitename` = 'Westview Cemetery';
DELETE FROM `connect` WHERE `transitroute` = '666' and `transittype` = 'carriage' AND `sitename` = 'Westview Cemetery';


### Screen 24: Administrator Create Transit
INSERT INTO `transit` (`route`,`type`,`price`) VALUES
	('999','pasta','1.50')
;
INSERT INTO `connect` (`transitroute`,`transittype`,`sitename`) VALUES
	('999','pasta','Northlake Mall'),
	('999','pasta','WestEnd')
;
		
### Screen 25: Administrator Manage Event
# Filter
SELECT
	*
FROM 
	`manage_event`
WHERE
	`Total_Visits` > 2 AND `description` LIKE '%ADA%'
;

# Create New Event
INSERT INTO `event` SET `eventname`='Lab', `description`='Lab visit', `minStaffReq`='1', `capacity`='100', `price`='0.02', `enddate`='2019-04-22', `eventstartdate` = '2019-04-21',`sitename`='IBB';
# Edit Event
update `event` SET `description` = 'Lab Destruction' where `eventname` = 'Lab';
# Delete Event
DELETE FROM `event` WHERE `eventname` = 'Lab' AND `eventstartdate` = '2019-04-21';


### Screen 26: Administrator View/Edit Event 
#Task 1: Filter
SELECT
	*
FROM 
	`edit_event`
WHERE
	`Daily_Visits` > 0  AND `Daily_Revenue` < '25.00'
;
# Update EVent
UPDATE `event` set `eventstartdate` = '1914-04-14' WHERE `eventname` = 'Arboretum Walking Tour' AND `price` > '2.50';



#Screen 27: Administrator Create Event
# Create New Event
SELECT
	*
FROM 
	`create_event`
;
INSERT INTO `event` SET `eventname`='Lab', `description`='Lab visit', `minStaffReq`='1', `capacity`='100', `price`='0.02', `enddate`='2019-04-22', `eventstartdate` = '2019-04-21',`sitename`='IBB';
INSERT INTO `assign_to` SET `employeeID` = '000001234',`eventname`='Lab',`eventstartdate`='2019-04-21',`sitename`='IBB';
UPDATE `assign_to` SET `employeeID` = '000000012' WHERE `eventname`='Lab' AND `eventstartdate`='2019-04-21' AND `sitename`='IBB';

#Screen 28: Manager Manage Staff
# Create the view and filter
SELECT
	`Staff`,
    ( SELECT COUNT( `eventname`) ) AS `Event Shifts`
FROM
	`manage_staff`
# Filter on date range, and by employee ID
WHERE
	`employeeID` = '000000002' AND `eventstartdate` BETWEEN '2019-02-01' AND '2019-05-06'
;


### Screen 29: Manager Site Report
# Create the view and filter
SELECT 
	`date`,
    `Event_count`,
    `Staff_count`,
    `Total_Visits`,
    `Total_Revenue`
FROM
	`site_report`
WHERE 
	`date` BETWEEN '2019-02-01' AND '2019-02-03' AND 
    `Event_count` > '2' 
    
;




#### Screen 30: Manager Daily Detail
# Create the view
SELECT 
	`eventname`,
    `Staff`,
    `Daily_Revenue`,
    `Daily_Visits`
FROM
	`daily_detail`
;


### Screen 31: Staff View Schedule
# Create the view and filter
SELECT DISTINCT
	`eventname`,
    `Staff_count`,
    `eventstartdate`,
    `enddate`
    `sitename`
FROM
	`view_schedule`
# Filter
WHERE 
	`sitename` = 'Inman Park' AND `eventname` = 'Eastside Trail' # AND `description` LIKE '%ADA%'
;


### Screen 32: Staff Event Detail
# Get Staff Assigned to Particular Event
SELECT DISTINCT
	`eventname`,
    `sitename`,
    `eventstartdate`,
    `enddate`,
    `Duration`,
    `Staff`,
    `capacity`,
    `price`,
    `description`
   
FROM
	`staff_event_detail`
;


###   Screen 33: Visitor Explore Event
# Create the view and filter
SELECT DISTINCT
	`eventname`,
    `sitename`,
    `eventstartdate`,    
    `enddate`,    
    `price`,
    `description`,
    `Tickets Remaining`,
    `Total Visits`,
    `My Visits`
FROM
	`explore_event`
    
WHERE
	`eventname` = 'Bus Tour' AND
	`sitename` = 'Inman Park' AND
    `price` = '25.00'
;

###	Screen 34: Visitor Event Detail
SELECT DISTINCT
	`eventname`,
    `sitename`,
    `eventstartdate`,    
    `enddate`,    
    `price`,
    `description`,
    `Tickets Remaining`
FROM
	`visitor_event_detail`
#Filter

;

# Log visit
INSERT INTO `visit_event` SET `eventname`='Bus Tour', `eventstartdate`='2019-02-02', `sitename`='Inman Park', `date`='2019-02-02', `visitorusername`='priyamraut';


### Screen 35: Visitor Explore Site
SELECT DISTINCT
    `sitename`,
    `openeveryday`,
    `eventstartdate`,       
	`Event_count`,
	`Total Visits`,
    `My Visits`
FROM
	`explore_site`
#Filter
WHERE
	`sitename` = 'Inman Park' AND
    `Event_count` = '2'
;

### Screen 36: Visitor Transit Detail
SELECT DISTINCT
    `sitename`,
    `type`,
    `route`,    
    `price`,    
	`Connected Sites`
FROM
	`transit_detail`
;

# Log User transit
INSERT INTO `take` SET `transitroute`='Blue', `transittype`='MARTA', `date`='2019-02-02', `username`='priyamraut';


### Screen 38: Visitor Site Detail
SELECT DISTINCT
    `sitename`,
    `openeveryday`,
    `address`    
FROM
	`site_detail`
;

#Log Visit date
INSERT INTO `visit_site` SET `sitename`='Inman Park', `date`='2019-02-02', `visitorusername`='priyamraut';


#Screen 37: Visitor Visit History
SELECT DISTINCT
    `date`,
    `eventname`,
    `sitename`,
    `price`
    
FROM
	`visit_history`
    
WHERE
	`sitename` = 'Inman Park' AND
    `eventstartdate` = '2019-02-01'
;







