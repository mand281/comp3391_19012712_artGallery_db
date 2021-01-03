// CREATE USERS
 
DROP USER IF EXISTS 'John Brown'@'localhost';  
CREATE USER 'John Brown'@'localhost' IDENTIFIED BY ‘moonbird’;    
GRANT SELECT, UPDATE, INSERT, DELETE, DROP ON comp3391_19012712.* TO  'John Brown'@'localhost';   

  
DROP USER IF EXISTS 'Fred Simpson '@'localhost';  
CREATE USER 'Fred Simpson '@'localhost' IDENTIFIED BY 'duckgrub ';   
GRANT ALL PRIVILEGES ON comp3391_19012712.* TO 'Fred Simpson '@'localhost';   

DROP USER IF EXISTS 'Dennis Frost '@'localhost'; 
CREATE USER 'Dennis Frost '@'localhost' IDENTIFIED BY 'fishcrib';
GRANT UPDATE, INSERT, DELETE ON comp3391_19012712.exhibition TO 'Dennis Frost '@'localhost';   


DROP USER IF EXISTS 'Davina Kelly'@'localhost';  
CREATE USER 'Davina Kelly'@'localhost' IDENTIFIED BY 'hashkite';  
GRANT SELECT ON comp3391_19012712.sales TO 'Davina Kelly'@'localhost';   


DROP USER IF EXISTS 'Billy Russell'@'localhost';  
CREATE USER 'Billy Russell'@'localhost' IDENTIFIED BY 'snowlimp';    
GRANT SELECT, UPDATE, INSERT, DELETE, DROP ON comp3391_19012712.staff TO 'Billy Russell'@'localhost';  
GRANT SELECT, UPDATE, INSERT, DELETE, DROP ON comp3391_19012712.staff_role TO 'Billy Russell'@'localhost';
GRANT 'Personnel' to 'Billy Russell'; 
  

DROP USER IF EXISTS 'Jesse Hugh'@'localhost';  
CREATE USER 'Jesse Hugh'@'localhost' IDENTIFIED BY 'bookzip';    
GRANT SELECT, UPDATE, INSERT, DELETE, DROP ON comp3391_19012712.artwork TO 'Jesse Hugh'@'localhost';   
GRANT SELECT, UPDATE, INSERT, DELETE, DROP ON comp3391_19012712.artist TO 'Jesse Hugh'@'localhost';   

//SAVE ALL CHANGES

FLUSH PRIVILEGES; 

//CREATE ROLES

DROP ROLE  'Supervisor';  
CREATE ROLE 'Supervisor';  
GRANT ALL PRIVILEGES ON comp3391_19012712.* TO 'Supervisor';  

DROP ROLE  'Administrator';  
CREATE ROLE 'Administrator';   
GRANT CREATE, SELECT, UPDATE, DELETE, INSERT    
ON comp3391_19012712.* TO 'Administrator';  

DROP ROLE  'Personnel';  
CREATE ROLE 'Personnel';   
GRANT CREATE, SELECT, UPDATE, DELETE, INSERT ON comp3391_19012712.staff TO 'Personnel';
GRANT CREATE, SELECT, UPDATE, DELETE, INSERT ON comp3391_19012712.staff_role TO 'Personnel';
GRANT CREATE, SELECT, UPDATE, DELETE, INSERT ON comp3391_19012712.exhibition_staff TO 'Personnel';


DROP ROLE 'Curator';  
CREATE ROLE 'Curator';
GRANT CREATE, SELECT, UPDATE, DELETE, INSERT ON comp3391_19012712.artist TO 'Curator';  
GRANT CREATE, SELECT, UPDATE, DELETE, INSERT ON comp3391_19012712.artwork TO 'Curator'; 

DROP ROLE 'Events organiser';  
CREATE ROLE 'Events organiser';  
GRANT ALL PRIVILEGES ON comp3391_19012712.artwork_exhibition TO 'Events organiser'; 
GRANT ALL PRIVILEGES ON comp3391_19012712.exhibition_staff TO 'Events organiser';
GRANT ALL PRIVILEGES ON comp3391_19012712.exhibition TO 'Events organiser';

DROP ROLE  'Sales';  
CREATE ROLE 'Sales';  
GRANT SELECT, UPDATE, INSERT ON comp3391_19012712.artwork TO 'Sales';  
GRANT SELECT, UPDATE, INSERT ON comp3391_19012712.collector TO 'Sales';  
GRANT SELECT, UPDATE, INSERT ON comp3391_19012712.collector_contact TO 'Sales';  
GRANT SELECT, UPDATE, INSERT ON comp3391_19012712.customer TO 'Sales';  
GRANT SELECT, UPDATE, INSERT ON comp3391_19012712.sales TO 'Sales';  

DROP ROLE 'Information Services';  
CREATE ROLE 'Information Services';  
GRANT SELECT ON comp3391_19012712.artwork TO 'Information Services';  
GRANT SELECT ON comp3391_19012712.artist TO 'Information Services';  
GRANT SELECT ON comp3391_19012712.exhibition TO 'Information Services';  
GRANT SELECT ON comp3391_19012712.artwork_exhibition TO 'Information Services';  

//SHOW GRANTS

SHOW GRANTS FOR 'Supervisor'; 
SHOW GRANTS FOR 'Administrator'; 
SHOW GRANTS FOR 'Personnel'; 
SHOW GRANTS FOR 'Curator'; 
SHOW GRANTS FOR 'Events organiser'; 
SHOW GRANTS FOR 'Sales'; 
SHOW GRANTS FOR 'Information Services'; 

//SAVE ALL CHANGES

FLUSH PRIVILEGES; 

