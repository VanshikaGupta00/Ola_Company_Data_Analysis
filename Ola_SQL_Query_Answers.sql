Create Database Ola;
Use Ola;
select * from ola.bookings;
select count(*) from ola.bookings;
#1.Retrieve all Successful_Bookings(Answer yhi h ):
CREATE View Successful_Bookings As
SELECT * FROM ola.bookings WHERE Booking_Status="Success";

SELECT * FROM Successful_Bookings;


#2.Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_each AS
SELECT Vehicle_type,avg(Ride_Distance) AS Avg_Distance FROM ola.bookings Group BY Vehicle_Type; 

SELECT * FROM ride_distance_each;

#3.	Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_by__customers AS
SELECT COUNT(*) FROM ola.bookings WHERE Booking_Status="Canceled by Customer";

SELECT * FROM cancelled_by__customers;


#4.	List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_booked AS
SELECT Customer_ID,count(Booking_ID) AS total_rides
FROM ola.bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM top_5_booked;

#5.	Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW cancelled_by__driver AS
SELECT COUNT(*) FROM ola.bookings WHERE Canceled_Rides_by_Driver="Personal & Car related issue";

SELECT * FROM cancelled_by__driver;


#6.	Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Ratings AS
select max(Driver_Ratings) AS max_ratings,min(Driver_Ratings) AS min_ratings FROM ola.bookings WHERE Vehicle_Type="Prime Sedan";

SELECT * FROM Ratings;

#7.	Retrieve all rides where payment was made using UPI:
CREATE VIEW Pay_By_UPI AS
SELECT * FROM ola.bookings 
WHERE Payment_Method="UPI";

SELECT * FROM Pay_By_UPI;


#8.	Find the average customer rating per vehicle type:
CREATE VIEW ACRPVT AS
SELECT 	Vehicle_Type,avg(Customer_Rating) AS avg_customer_rating FROM ola.bookings GROUP BY Vehicle_Type;

SELECT * FROM ACRPVT;


#9.	Calculate the total booking value of rides completed successfully:
CREATE VIEW Success_booking_rides AS
SELECT SUM(Booking_Value) AS Total_Booking_Value FROM ola.bookings WHERE Booking_Status="Success";

SELECT * FROM Success_booking_rides;

#10.List all incomplete rides along with the reason:
 CREATE VIEW IR AS
 SELECT Booking_ID,Incomplete_Rides_Reason FROM ola.bookings 
 WHERE Incomplete_Rides="Yes";
 SELECT * FROM IR;