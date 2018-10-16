CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
    username character varying(12),
    city character varying(128),
    transactions_completed integer,
    transactions_attempted integer,
    account_balance numeric(12,2)
);

INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('shawn', 'chicago', 5, 10, 355.80),
('cherise', 'minneapolis', 9, 9, 4000.00),
('larry', 'minneapolis', 3, 4, 77.01),
('dallas', 'new york', 6, 12, 0.99),
('anthony', 'chicago', 0, 0, 0.00),
('travis', 'miami', 1, 100, 500000.34),
('davey', 'chicago', 9, 99, 98.04),
('ora', 'phoenix', 88, 90, 3.33),
('grace', 'miami', 7, 9100, 34.78),
('hope', 'phoenix', 4, 10, 50.17);

--Get all users from Chicago--
SELECT * FROM accounts WHERE city ILIKE 'Chicago';

--Get all users with usernames that contain the letter a--
SELECT * FROM accounts WHERE username ILIKE '%a%';

--New customer bonus: find all account balance and attempted transactions of 0; update account balance to 10--
SELECT * FROM accounts WHERE account_balance = 0 AND transactions_attempted = 0; --to verify selection before update--
UPDATE accounts SET account_balance = 10.00 WHERE account_balance = 0 AND transactions_attempted = 0;

--Select all users that have attempted 9 or more transactions--
SELECT * FROM accounts WHERE transactions_attempted >= 9;

--Get username & account_balance of 3 users with the highest balances, sort them from highest to lowest--
SELECT * FROM accounts ORDER BY account_balance DESC LIMIT 3;

--Get username & account_balance of 3 users with the lowest balances, sort them from lowest to highest--
SELECT * FROM accounts ORDER BY account_balance ASC LIMIT 3;

--Get all users with account_balance more than $100--
SELECT * FROM accounts WHERE account_balance > 100;

--Add a new record--
INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('', '', 0, 0, 0.00);

--Delete users that reside in Miami OR Phoenix who have completed fewer than 5 transactions--
SELECT * FROM accounts WHERE (city ILIKE 'Miami' OR city ILIKE 'Phoenix') AND transactions_completed < 5; --to verify selection before update--
DELETE FROM accounts WHERE (city ILIKE 'Miami' OR city ILIKE 'Phoenix') AND transactions_completed < 5;

--NOTE: I had accidentally executed the INSERT INTO list 3 times, which would explain why the new record added for Task 8 has a USER_ID of 31--
