2.	/* Manually Creating Transaction Records for the Orders Table */

	/* Run the below once to get an initial record in the table */

INSERT INTO orders (ord_id, cust_id, ord_date) 
VALUES (1, 1, '2014-07-01');

	/* Now run this many times to add more records  for Cust_id = 1, this will add a new record  starting from 2nd July 2014 one day at a time */

INSERT INTO orders (ord_id, cust_id, ord_date)  
SELECT 		max(ord_id + 1),
			cust_id,
			Max(date_add(ord_date,INTERVAL 1 DAY))           
FROM 		orders
WHERE 		cust_id = 1;

	/* Now change Insert “b” above to cust_id = 2  as in ( 1, 2, ‘2014-07-01’) and run once only , then change the cust-id in Insert “d” to 2 and run many times again. */

	/* Repeat these steps for every cust_id you have in tyour Customer table */


SELECT *
FROM orders;

SELECT COUNT(*)
FROM orders;

SELECT COUNT(*), cust_id
FROM orders
Group By cust_id;




/* Same Code using a Stored Procedure with Parameters to populate */



CREATE DEFINER=`root`@`localhost` PROCEDURE `para_loadTrx_wp`(IN cust_id int(11))
BEGIN
	declare loadAmt int;
    declare orddate date;
    
	set loadAmt = 1;
    set orddate = '2014-07-01';

     /* Ensure the ord_id Field is AUTO_INCREMENT */

    	WHILE loadAmt <= 10000 DO
		INSERT INTO orders (ord_date, cust_id )  
		SELECT 		orddate, 
					cust_id
		FROM 		dual;
				
        set loadAmt = loadAmt + 1;
       	set orddate = date_add(orddate,INTERVAL 1 DAY);
         
    END WHILE;
END

/* Calling the Procedure */

CALL para_loadTrx_wp(1);
CALL para_loadTrx_wp(2);
CALL para_loadTrx_wp(3);


SELECT *
FROM orders;

SELECT COUNT(*)
FROM orders;

SELECT COUNT(*), cust_id
FROM orders
Group By cust_id;

/*  Some Select Statements */

SELECT * FROM Videos;

SELECT 		c.cust_id ID, 
			c.cust_name Name, 
			c.cust_addr_1 Street,
			c.cust_address as Address
FROM		customers c;


SELECT		o.ord_date "Date", 
			o.ord_id "Order No",
			c.cust_name "Name",
			v.vid_name "Video Name",
			od.qty "Qty Rented",
			od.date_rent_out "Rented On",
			od.date_returned "Returned"
FROM		orders o
INNER JOIN	order_details od
ON			o.ord_id = od.ord_id
INNER JOIN	videos v
ON			od.vid_id = v.vid_id
INNER JOIN	customers c
ON			c.cust_id = o.cust_id;