University DataBase project 

The best average inventory over 10 consecutive days must be found.

All codes with T-SQL !

400 رکورد در در سال 1403 از 1 فروردین تا 31 تیر و برای یک کاربر نظر گرفته شده 

بهترین بازه 10 روزه متوالی را حساب کردیم 

# Best Period Time of Year in Average Balance  

A SQL-based project for finding the best 10-day period of the year with the highest average balance.  

---

📌 Project Overview  
This project analyzes daily balance records and identifies the optimal 10-day consecutive period with the best average value.  
The current dataset contains 400 daily records for a single user, covering the period March 20, 2024 – July 21, 2024 (1 Farvardin – 31 Tir, 1403 in the Persian calendar).  

All logic is implemented in T-SQL.  

---

📂 Files & Descriptions  

| File | Description |
|------|-------------|
| Average Balance.sql | Calculates the average balance for given periods |
| Min Balance.sql | Finds the minimum balance in 10-day periods |
| First Day In Year.sql | Returns the first day of the year |
| Next Day.sql | Returns the next day based on a given date |
| Next 10 Day.sql | Returns the date after 10 days from a given date |
| Main Function.sql | Main function to find the optimal 10-day period |