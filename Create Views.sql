//CREATE VIEWS FROM  comp3391_19012712 

DROP VIEW IF EXISTS artist; 

CREATE VIEW artist_VIEW AS 
SELECT * 
FROM 
artist; 
DROP VIEW IF EXISTS artist; 


DROP VIEW IF EXISTS artwork; 

CREATE VIEW artwork_VIEW AS 
SELECT * 
FROM 
artwork; 

DROP VIEW IF EXISTS artwork_exhibition; 

CREATE VIEW artwork_exhibition_VIEW AS 
SELECT * 
FROM 
artwork_exhibition; 

DROP VIEW IF EXISTS artwork_genre; 

CREATE VIEW artwork_genre_VIEW AS 
SELECT * 
FROM 
artwork_genre; 

DROP VIEW IF EXISTS artwork_medium; 

CREATE VIEW artwork_medium_VIEW AS 
SELECT * 
FROM 
artwork_medium; 

DROP VIEW IF EXISTS collector; 

CREATE VIEW collector_VIEW AS 
SELECT * 
FROM 
collector; 

DROP VIEW IF EXISTS collector_contact; 

CREATE VIEW collector_contact_VIEW AS 
SELECT * 
FROM 
collector_contact; 

DROP VIEW IF EXISTS customer; 

CREATE VIEW customer_VIEW AS 
SELECT * 
FROM 
customer;

DROP VIEW IF EXISTS exhibition; 

CREATE VIEW exhibition_VIEW AS 
SELECT * 
FROM 
exhibition; 


DROP VIEW IF EXISTS exhibition_staff; 

CREATE VIEW exhibition_staff_VIEW AS 
SELECT * 
FROM 
exhibition_staff; 


DROP VIEW IF EXISTS sales; 

CREATE VIEW sales_VIEW AS 
SELECT * 
FROM 
sales; 

DROP VIEW IF EXISTS staff; 

CREATE VIEW staff_VIEW AS 
SELECT * 
FROM 
staff; 

DROP VIEW IF EXISTS staff_role; 

CREATE VIEW staff_role_VIEW AS 
SELECT * 
FROM 
staff_role; 


//Create a view which calculates the total value of all sold artwork

DROP VIEW IF EXISTS total_value_sold_artwork_VIEW; 

CREATE VIEW total_value_sold_artwork_VIEW AS 

SELECT SUM(Artwork_Price_GBP) AS Sold Artwork Total 

FROM artwork aw
INNER JOIN sales s ON aw.Artwork_ID = s.Sales_Artwork_ID
WHERE aw.Artwork_Sold = true; 

 
//Create a view which shows staff at each exhibition 

DROP VIEW IF EXISTS exhibition_staff_VIEW;  

CREATE VIEW exhibition_staff_VIEW AS  
SELECT distinct es.Exhibition_ID, CONCAT_WS(' ',st.Staff_First_Name, st.Staff_Last_Name) Staff_Name
FROM staff st
INNER JOIN exhibition_staff es ON st.Staff_ID = es.Staff_ID
order by es.Exhibition_ID asc

 
//View showing Customer names and addresses

DROP VIEW IF EXISTS customer_details_VIEW; 

CREATE VIEW customer_details_VIEW AS 
SELECT CONCAT_WS(', ', c.Customer_First_Name, c.Customer_Last_Name) AS Customer, CONCAT_WS(', ', c.Customer_Addr1, c.Customer_Addr2, c.Customer_Addr3,c.Customer_Postcode) AS Address 
FROM customer c; 

	
// View showing each exhibiton and staff allocated

DROP VIEW IF EXISTS exhibition_staff_VIEW; 
CREATE VIEW exhibition_staff_VIEW AS 
SELECT distinct es.Exhibition_ID Exhibition ID, CONCAT_WS(' ',st.Staff_First_Name, st.Staff_Last_Name) Staff_Name 
FROM staff st
INNER JOIN exhibition_staff es ON st.Staff_ID = es.Staff_ID 
ORDER BY es.Exhibition_ID ASC;


// Select exhibition with staff name and role allocated to each

DROP VIEW IF EXISTS exhibition_staff_VIEW; 

CREATE VIEW exhibition_staff_VIEW AS 
SELECT distinct es.Exhibition_ID, CONCAT_WS(' ',st.Staff_First_Name, st.Staff_Last_Name) Staff_Name, sr.Staff_Role_Desc AS Role
from staff st
inner join exhibition_staff es ON st.Staff_ID = es.Staff_ID
inner join staff_role sr on st.Staff_Role_ID = sr.Staff_Role_ID
order by es.Exhibition_ID ASC;
 

//Create a view which shows only those artwork  which have a medium of Oil Paint 

DROP VIEW IF EXISTS Oil_Painting__VIEW; 
CREATE VIEW IF NOT EXISTSOil_Painting__VIEW AS 
SELECT   aw.Artwork_ID, aw.Artwork_Title Title , am.Art_Medium_Desc
FROM artwork aw
Inner join art_medium am ON am.Art_Medium_ID = aw.Artwork_Medium_ID
WHERE am.Art_Medium_Desc  = 'Oil Paint'; 

 
//Create a view of unsold artwork and prices

DROP VIEW IF EXISTS Unsold_Art_VIEW; 
CREATE VIEW IF NOT EXISTS Unsold_Art_VIEW AS
SELECT  DISTINCT aw.Artwork_ID, aw.Artwork_Title Title , am.Art_Medium_Desc, CONCAT_WS('£ ',aw.Artwork_Price_GBP) Price
FROM artwork aw
Inner join art_medium am ON am.Art_Medium_ID = aw.Artwork_Medium_ID
INNER JOIN sales s on s.Sales_Artwork_ID = aw.Artwork_ID
WHERE aw.Artwork_Sold = false;
 
 
 //Create a view of unsold artwork with artists and prices
 
DROP VIEW IF EXISTS Unsold_Art_VIEW; 
CREATE VIEW Unsold_Art_VIEW AS
SELECREATE VIEW IF NOT EXISTSCT  DISTINCT aw.Artwork_ID, aw.Artwork_Title Title , ar.Artist_Last_Name, am.Art_Medium_Desc, CONCAT_WS('£ ',aw.Artwork_Price_GBP) Price
FROM artwork aw
INNER JOIN artist ar ON aw.Artwork_Artist_ID = ar.Artist_ID
Inner join art_medium am ON am.Art_Medium_ID = aw.Artwork_Medium_ID
INNER JOIN sales s on s.Sales_Artwork_ID = aw.Artwork_ID
WHERE aw.Artwork_Sold = false
ORDER by ar.Artist_Last_Name asc;
 

  
// CREATE a view to show all exhibitions started in the last three momnths

DROP VIEW IF EXISTS events_in_prev_3_months_VIEW;     
CREATE VIEW events_prev_3_months_VIEW AS 
SELECT ex.Exhibition_Desc Exhibition,DATE_FORMAT(ex.Exhibition_Date_Start, '%d-%m-%Y') Exhibition
FROM exhibition ex
WHERE ex.Exhibition_Date_Start > DATE_FORMAT(DATE_ADD(ex.Exhibition_Date_Start,  INTERVAL -3 month) , '%d-%m-%Y');

	
// Create a view to show all purchases by collectors

DROP VIEW IF EXISTS collector_purchases_VIEW;     
CREATE VIEW collector_purchases_VIEW AS  
SELECT co.Collector_Name, aw.Artwork_Title, aw.Artwork_Price_GBP
FROM collector co
INNER JOIN collector_contact cc ON cc.Collector_ID = co.Collector_ID
INNER JOIN sales s ON s.Sales_Customer_ID = cc.Collector_Contact_ID
INNER JOIN  artwork aw ON s.Sales_Artwork_ID = aw.Artwork_ID
ORDER by co.Collector_Name ASC;

 
 //Create a view to show the total sales in the last 2 years

DROP VIEW IF EXISTS Total_sales_VIEW;     
CREATE VIEW Total_sales_VIEW AS  
select SUM(s.Sales_Amount_GBP)
FROM sales s
where s.Sales_Date > DATE_ADD(CURRENT_DATE(),  INTERVAL -2 year);

//GRANT read/ write access to Role 'Sales'

GRANT SELECT, UPDATE, INSERT ON comp3391_19012712.Total_sales_VIEW TO 'Sales';  
FLUSH PRIVILEGES;
 

 

 

 

 

 

 