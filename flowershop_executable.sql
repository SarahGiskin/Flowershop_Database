#final project code, implements database for flowershop
#for CIS 205, Spring 2021
#last edited by Sarah Giskin 5/4/21


#Part I of the final project, create & insert statements below 

#create database
CREATE Database IF NOT EXISTS FlowerShop_db; 

#make all databases visible to confirm it was created
SHOW databases;

#make FlowerShop the active database in use
USE FlowerShop_db;

#make all tables in this database visible to check what exists so far
SHOW tables;


#create employee table 
CREATE TABLE Employee
(
emp_num VARCHAR (10) NOT NULL,
e_name VARCHAR (30) NOT NULL,
e_phone VARCHAR (10) NOT NULL,
e_email VARCHAR (60) NOT NULL,
pay_rate DOUBLE NOT NULL,
start_date DATE NOT NULL,

CONSTRAINT employee_PK PRIMARY KEY (emp_num)
);


#create customer table 
CREATE TABLE Customer
(
cus_num VARCHAR (10) NOT NULL,
c_name VARCHAR (30) NOT NULL,
c_phone VARCHAR (10) NOT NULL,
c_email VARCHAR (60), 
first_sale_date DATE NOT NULL,
total_sales INT NOT NULL,

CONSTRAINT customer_PK PRIMARY KEY (cus_num)
);


#create vendor table 
CREATE TABLE Vendor
(
v_name VARCHAR (30) NOT NULL,
v_phone VARCHAR (10) NOT NULL,
v_email VARCHAR (60), 
v_address VARCHAR (60) NOT NULL, 
product_type VARCHAR (20) NOT NULL, 

CONSTRAINT vendor_PK PRIMARY KEY (v_name)
);


#create inventory table 
CREATE TABLE Inventory
(
item_num VARCHAR (10) NOT NULL,
i_name VARCHAR (30) NOT NULL,
cost DOUBLE NOT NULL,
type VARCHAR (20),
color VARCHAR (15), 
quantity INT,
v_name_FK VARCHAR (30) NOT NULL,

CONSTRAINT inventory_PK PRIMARY KEY (item_num),
CONSTRAINT inventory_FK1 FOREIGN KEY (v_name_FK) REFERENCES Vendor (v_name)
);


#create sale table 
CREATE TABLE Sale
(
sale_num VARCHAR (10) NOT NULL,
total_price DOUBLE NOT NULL,
date DATE NOT NULL,
emp_num_FK VARCHAR (10) NOT NULL,
cus_num_FK VARCHAR (10) NOT NULL,

CONSTRAINT sale_PK PRIMARY KEY (sale_num),
CONSTRAINT sale_FK1 FOREIGN KEY (emp_num_FK) REFERENCES Employee (emp_num),
CONSTRAINT sale_FK2 FOREIGN KEY (cus_num_FK) REFERENCES Customer (cus_num)
);


#create sale_item table 
CREATE TABLE Sale_Item
(
si_num VARCHAR (10) NOT NULL,
item_num_FK VARCHAR (10) NOT NULL,
sale_quantity INT NOT NULL,
sale_num_FK VARCHAR (10) NOT NULL,

CONSTRAINT sale_item_PK PRIMARY KEY (si_num),
CONSTRAINT sale_item_FK1 FOREIGN KEY (item_num_FK) REFERENCES Inventory (item_num),
CONSTRAINT sale_item_FK2 FOREIGN KEY (sale_num_FK) REFERENCES Sale (sale_num)
);


#create delivery table 
CREATE TABLE Delivery
(
dev_num VARCHAR (10) NOT NULL,
d_address VARCHAR (60) NOT NULL, 
d_emp_num_FK VARCHAR (10) NOT NULL,
sale_num_FK VARCHAR (10) NOT NULL,

CONSTRAINT delivery_PK PRIMARY KEY (dev_num),
CONSTRAINT delivery_FK1 FOREIGN KEY (sale_num_FK) REFERENCES Sale (sale_num),
CONSTRAINT delivery_FK2 FOREIGN KEY (d_emp_num_FK) REFERENCES Employee (emp_num)
);


#show tables to confirm that all were created
SHOW tables;


#insert data into employee table
INSERT INTO Employee (emp_num, e_name, e_phone, e_email, pay_rate, start_date)
Values	("emp5701", "Hannah Buckwalter", "2679788576", "hannahbuck@gmail.com", 21.5, 20180506),
		("emp5702",	"Lile Floyd", "2158677465",	"lile.floyd@yahoo.com",	19.75, 20190610), 
		("emp5703",	"Zebadiah Barnett",	"2677566354", "z.barnett@aol.com", 22, 20180418),
		("emp5704",	"Jed Boroff", "2156455243",	"jedboroff1@gmail.com",	21, 20190322),
		("emp5705",	"Anna Harrison", "2675344132", "anna.harrison365@gmail.com", 22.5, 20170825),
		("emp5706",	"Molly Coombs",	"2154233021", "mollyecoombs@aol.com", 20.5, 20190517),
		("emp5707",	"Zoe Laucharoen", "2673122910",	"zoelauch@gmail.com", 20.75, 20190421)
		;


#insert data into customer table
INSERT INTO Customer (cus_num, c_name, c_phone, c_email, first_sale_date, total_sales)
Values	("cus14001", "Emily Morrison",	"2679788575", "em.mo@yahoo.com", 20200716, 3),
		("cus14002", "Daniel Moore", "2158677464", "danielmoore55@gmail.com", 20190430, 4), 
		("cus14003", "Miriam Smith", "2677566353", "miriam.smith.22@aol.com", 20161219, 10),
		("cus14004", "Steve Jones",	"2156455242", "stevejones1957@gmail.com", 20170107, 11),
		("cus14005", "Eric Vener",	"2675344131", "e.vener@aol.com", 20200623, 5),
		("cus14006", "Dina Giskin",	"2154233020", "dinagiskin@gmail.com", 20130118, 26),
		("cus14007", "Cornell Gratz", "2673122919",	"cornellgratz@yahoo.com", 20190512, 9),
		("cus14008", "Justyn Lawrence",	"2670788575", "justyn.lawrence5@gmail.com",	20140803, 8),
		("cus14009", "Malcolm Cavanaugh", "2159677464",	"mal.cav@aol.com", 20151105, 13),
		("cus14010", "Aqua Lorenzo", "2678566353",	"aqualo@gmail.com",	20151017, 16),
		("cus14011", "Patricia Goldberg", "2157455242",	"pcgoldberg@aol.com", 20130329, 7),
		("cus14012", "Rudy MacDonald", "2676344131", "rudymac@gmail.com", 20180222, 2),
		("cus14013", "Ari Reynolds", "2155233020", "arireyn@gmail.com",	20190927, 6),
		("cus14014", "Anna Harrison", "2675344132",	"anna.harrison365@gmail.com", 20161106, 3),
		("cus14015", "Molly Coombs", "2154233021", "mollyecoombs@aol.com", 20160731, 5),
		("cus14016", "Zoe Laucharoen", "2673122910", "zoelauch@gmail.com", 20160214, 8)
		;


#insert data into vendor table
INSERT INTO Vendor (v_name, v_phone, v_email, v_address, product_type)
Values	("West Philly Nursery", "2152613288", "westhillynursery@gmail.com", "9108 Clark St",	"flowers"),
		("Germantown Greenery",	"2670159264", "germantowngreen@yahoo.com", "6464 Germantown Ave", "flowers"),
		("Felicias Flowers", "2157653287", "flowersbyfelicia@gmail.com", "1209 Cheltenham Rd", "flowers"),
		("Homegrown Garden Supply Center", "2673485976", "homegrown.garden@gmail.com", "498 Lehigh Ave", "supplies"),
		("Newkirk Paper & Plastic", "2154163675", "newkirkpaper@aol.com", "3200 Newkirk St", "containers")
		;


#insert data into inventory table
INSERT INTO Inventory (item_num, i_name, cost, type, color, quantity, v_name_FK)
Values	("i3782", "lilacs", 12, "flower", "white", 32, "West Philly Nursery"),
		("i3783", "lilacs",	11,	"flower", "purple",	45,	"West Philly Nursery"),
		("i3784", "lilacs",	13,	"flower", "pink", 22, "West Philly Nursery"),
		("i3785", "lilacs",	14,	"flower", "blue", 17, "West Philly Nursery"),
		("i3786", "roses", 9.75, "flower", "pink", 130,	"Germantown Greenery"),
		("i3787", "roses", 9.5,	"flower", "red", 150, "Germantown Greenery"),
		("i3788", "roses", 10, "flower", "yellow", 40, "Germantown Greenery"),
		("i3789", "roses", 10.5, "flower", "white",	55,	"Germantown Greenery"),
		("i3790", "roses", 11, "flower", "peach", 27, "Germantown Greenery"),
		("i3791", "lillies", 7,	"flower", "white", 38, "Germantown Greenery"),
		("i3792", "carnations",	4.5, "flower", "pink", 75, "Felicias Flowers"),
		("i3793", "carnations",	4.5, "flower", "white",	92,	"Felicias Flowers"),
		("i3794", "carnations",	4.5, "flower", "red", 84, "Felicias Flowers"),
		("i3795", "carnations",	4.5, "flower", "blue", 62, "Felicias Flowers"),
		("i3796", "carnations",	4.5, "flower", "purple", 18, "Felicias Flowers"),
		("i3797", "babys breath", 3, "flower", "white",	180, "Felicias Flowers"),
		("i3798", "soil", 6.99,	"supply", NULL, 424, "Homegrown Garden Supply Center"),
		("i3799", "mulch", 5.99, "supply", NULL, 16, "Homegrown Garden Supply Center"),
		("i3800", "fertilizer",	9.99, "supply",	NULL, 9, "Homegrown Garden Supply Center"),
		("i3801", "large plastic pots",	1, "container",	"black", 139, "Newkirk Paper & Plastic"),
		("i3802", "small plastic pots",	0.5, "container", "green", 54, "Newkirk Paper & Plastic")
		;


#insert data into sale table
INSERT INTO Sale (sale_num,	total_price, date, emp_num_FK, cus_num_FK)
Values	("s7770001", 48, 20200722, "emp5701",	"cus14001"),
		("s7770002", 73.5, 20200722, "emp5701", "cus14002"),
		("s7770003", 42, 20200722, "emp5702",	"cus14003"),
		("s7770004", 27, 20200722, "emp5703",	"cus14004"),
		("s7770005", 18, 20200723, "emp5703",	"cus14005"),
		("s7770006", 11, 20200723, "emp5704",	"cus14006"),
		("s7770007", 60.75,	20200723,	"emp5705", "cus14007"),
		("s7770008", 330, 20200724, "emp5706", "cus14008"),
		("s7770009", 54, 20200724, "emp5707",	"cus14009"),
		("s7770010", 27.5, 20200724, "emp5707", "cus14010")
		;
		
		
#insert data into sale_item table
INSERT INTO Sale_Item (si_num, item_num_FK,	sale_quantity, sale_num_FK)
Values	("si3330001", "i3782", 4, "s7770001"),
		("si3330002", "i3787", 6, "s7770002"),
		("si3330003", "i3793", 3, "s7770002"),
		("si3330004", "i3797", 1, "s7770002"),
		("si3330005", "i3785", 3, "s7770003"),
		("si3330006", "i3791", 1, "s7770004"),
		("si3330007", "i3788", 2, "s7770004"),
		("si3330008", "i3792", 2, "s7770005"),
		("si3330009", "i3796", 2, "s7770005"),
		("si3330010", "i3790", 1, "s7770006"),
		("si3330011", "i3797", 2, "s7770007"),
		("si3330012", "i3782", 3, "s7770007"),
		("si3330013", "i3786", 1, "s7770007"),
		("si3330014", "i3795", 2, "s7770007"),
		("si3330015", "i3790", 30, "s7770008"),
		("si3330016", "i3791", 3, "s7770009"),
		("si3330017", "i3783", 3, "s7770009"),
		("si3330018", "i3794", 1, "s7770010"),
		("si3330019", "i3788", 2, "s7770010"),
		("si3330020", "i3797", 1, "s7770010")
		;
		
		
		#insert data into delivery table
INSERT INTO Delivery (dev_num, d_address, d_emp_num_FK, sale_num_FK)
Values	("d6601", "92 Hope St",	"emp5703", "s7770001"),
		("d6602", "379 Camac St", "emp5704", "s7770002"),
		("d6603", "3104 Taylor St",	"emp5702", "s7770003"),
		("d6604", "6919 Dover St", "emp5705", "s7770007"),
		("d6605", "109 Christian St", "emp5706", "s7770008"),
		("d6606", "607 Columbia Ave", "emp5707", "s7770009")
		;


#Part II of the final project, all queries & operations below 

#1, union 

#query to perform a Union on Employee and Customer tables 
SELECT  
	e_name, e_phone, e_email 
FROM 
	Employee
UNION 
SELECT 
	c_name, c_phone, c_email
FROM 
	Customer;  


#2, intersection 

#query to perform an Intersection on Employee and Customer tables 
SELECT  
	e_name, e_phone, e_email 
FROM 
	Employee
INTERSECT
SELECT 
	c_name, c_phone, c_email
FROM 
	Customer;  


#3, difference operations 

#query to perform a Difference Operation on Employee and Customer tables 
SELECT  
	e_name, e_phone, e_email 
FROM 
	Employee
EXCEPT
SELECT 
	c_name, c_phone, c_email
FROM 
	Customer;  


#query to perform a Difference Operation on Sale and Delivery tables 
SELECT  
	sale_num, emp_num_FK
FROM 
	SALE
INTERSECT
SELECT 
	sale_num_FK, d_emp_num_FK
FROM 
	Delivery;  


#4, join query 

#query to join several tables
SELECT 
	c_name, sale_num, i_name, sale_quantity
FROM
	Customer
JOIN
	Sale ON Customer.cus_num = Sale.cus_num_FK
JOIN
	Sale_Item ON Sale.sale_num = Sale_Item.sale_num_FK
JOIN
	Inventory ON Inventory.item_num = Sale_Item.item_num_FK; 


#5, alter tables 	

#query to alter structure of Customer table
ALTER TABLE Customer
ADD COLUMN loyalty_points INT; 


#query to alter structure of Delivery table
ALTER TABLE Delivery
ADD COLUMN is_gift BOOLEAN; 


#6, update rows 

#query to update loyalty_points attribute in Customer table
UPDATE Customer
SET loyalty_points = total_sales * 3;  


#query to update is_gift attribute in Delivery table
UPDATE 
	Delivery
SET 
	is_gift = 1
WHERE  
	d_emp_num_FK = "emp5703"
OR
	d_emp_num_FK = "emp5705";  	


#7, delete rows

#query to delete record from customer table 
DELETE
FROM 
	Customer
WHERE
	cus_num = "cus14011"; 


#query to delete record from Inventory table 
DELETE
FROM 
	Inventory
WHERE
	item_num = "i3799"; 


#8, aggregate functions 

#query performaing aggregate function on Sale table 
SELECT 
	AVG(total_price)
FROM	
	Sale; 


#query performaing aggregate function on Inventory table 
SELECT 
	SUM(quantity)
FROM	
	Inventory
WHERE
	type = "flower"; 
	

#9, having clauses 

#query using having clause on Inventory table
SELECT 
	*
FROM	
	Inventory
HAVING
	type = "container";


#query using having clause on Vendor table
SELECT 
	*
FROM	
	Vendor
HAVING
	product_type = "flowers";


#10, group by and having clauses 

#query using GROUP BY and HAVING clause on Sale table
SELECT 
	*
FROM	
	Sale
GROUP BY
	emp_num_FK
HAVING
	total_price > 25;


#query using GROUP BY and HAVING clause on Sale_Item table
SELECT 
	*
FROM	
	Sale_Item
GROUP BY
	item_num_FK
HAVING
	sale_quantity < 10;


#11, ascednding and descending order 

#query to sort results from Customer table in Ascending order
SELECT 
	c_name, c_phone, c_email, loyalty_points
FROM
	Customer
ORDER BY
	loyalty_points ASC; 


#query to sort results from Sale table in Descending order
SELECT 
	sale_num, emp_num_FK, total_price, date
FROM
	Sale
ORDER BY
	date DESC; 


#12, views 

#query to create view of most active customers
CREATE VIEW Best_Customers AS
SELECT 
	cus_num, c_name, loyalty_points, total_sales, first_sale_date
FROM
	Customer
WHERE 
	total_sales >= 10;


#query to display best_customers view
SELECT * FROM Best_Customers; 


#query to create view of lowest inventory in stock
CREATE VIEW Low_Stock AS
SELECT 
	i_name, color, quantity, v_name_FK
FROM
	Inventory
WHERE 
	quantity < 25;


#query to display best_customers view
SELECT * FROM Low_Stock; 


#13, stored procedures 

#create stored procedure with delimiter 
DELIMITER //

CREATE PROCEDURE EmployeeSales()
BEGIN
	SELECT 
		emp_num, e_name, e_phone, e_email, pay_rate, sale_num, total_price, date
	FROM 
		Employee
	JOIN
		Sale ON emp_num = emp_num_FK;
END //

DELIMITER ;


#call procedure 
CALL EmployeeSales();


#create stored procedure with a parameter 
DELIMITER //

CREATE PROCEDURE SalesByPrice(
	IN sale_min DOUBLE
)
BEGIN
	SELECT * 
 	FROM Sale
	WHERE total_price > sale_min;
END //

DELIMITER ;


#call procedure with 65 parameter
CALL SalesByPrice(65);


#14, stored triggers

#create audit table 
CREATE TABLE Cus_Audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cus_num VARCHAR (10) NOT NULL,
	c_name VARCHAR (30) NOT NULL,
    c_phone VARCHAR (10) NOT NULL, 
	c_email VARCHAR (60),
	first_sale_date DATE NOT NULL,
	total_sales INT NOT NULL,
	loyalty_points INT,
    change_date DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);


#create trigger, before update 
CREATE TRIGGER before_cus_update 
    BEFORE UPDATE ON Customer
    FOR EACH ROW 
 INSERT INTO Cus_Audit
 SET action = 'update',
     cus_num = OLD.cus_num,
	 c_name = OLD.c_name,
     c_phone = OLD.c_phone,
	 c_email = OLD.c_email,
	 first_sale_date = OLD.first_sale_date,
	 total_sales = OLD.total_sales,
	 loyalty_points = OLD.loyalty_points,
     change_date = NOW();


#select record before updating it 
SELECT 
	c_name, c_phone, loyalty_points
FROM 
	Customer
WHERE
	cus_num = "cus14003"; 


#update statement to test trigger 
UPDATE Customer 
SET 
    loyalty_points = loyalty_points + 3
WHERE
    cus_num = "cus14003"; 
	

#run select statement again to confirm update worked
SELECT 
	c_name, c_phone, loyalty_points
FROM 
	Customer
WHERE
	cus_num = "cus14003";  
	
	
#select statement to check if the trigger worked on audit table
SELECT * FROM Cus_Audit;


#create trigger, before delete 
CREATE TRIGGER before_cus_delete 
    BEFORE DELETE ON Customer
    FOR EACH ROW 
 INSERT INTO Cus_Audit
 SET action = 'delete',
     cus_num = OLD.cus_num,
	 c_name = OLD.c_name,
     c_phone = OLD.c_phone,
	 c_email = OLD.c_email,
	 first_sale_date = OLD.first_sale_date,
	 total_sales = OLD.total_sales,
	 loyalty_points = OLD.loyalty_points,
     change_date = NOW();


#select record before deleting it 
SELECT 
	c_name, c_phone, loyalty_points
FROM 
	Customer
WHERE
	cus_num = "cus14013";  


#delete statement to test trigger 
DELETE FROM 
	Customer
WHERE
	cus_num = "cus14013";  
	

#run select statement again to confirm delete worked
SELECT 
	c_name, c_phone, loyalty_points
FROM 
	Customer
WHERE
	cus_num = "cus14013"; 
	
	
#select statement to check if the trigger worked on audit table
SELECT * FROM Cus_Audit;


#15, new user

#create user
CREATE USER eric_m 
IDENTIFIED BY "ok";

#select user, to show all existing users 
SELECT USER 
FROM mysql.user; 


#grant eric_m privileges in the database 
GRANT ALL PRIVILEGES 
ON flowershop_db.* 
TO eric_m;


#exit to log out of session
exit 

#log back in as eric_m by entering this code in command line, mysql -u eric_m -p
#then enter eric_m password, ok


#show databases in eric_m has access to 
show databases;


#use flowershop_db in eric_m session
use flowershop_db;


#select query in eric_m session
SELECT * FROM Delivery; 

#query to add column to Delivery table
ALTER TABLE Delivery
ADD COLUMN on_bike BOOLEAN; 


#select query in eric_m session, to confirm alter worked 
SELECT * FROM Delivery; 


#open new session of MariaDb, using regular log in 

#in new session, revoke some privileges for eric_m
REVOKE INSERT, UPDATE, Alter, DELETE 
ON flowershop_db.*
FROM eric_m;


#show eric_m privileges 
SHOW GRANTS FOR eric_m;

