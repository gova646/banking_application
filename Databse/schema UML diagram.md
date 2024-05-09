+-----------------+      +----------------+        +-------------+        +---------------+
|    Customer     |      |    Account     |        | Transaction |        |     Branch    |
+-----------------+      +----------------+        +-------------+        +---------------+
| customer_id [PK]|<----*| account_id [PK]|<----*  | transaction_id [PK] |    branch_id [PK] |
| first_name      |      | account_number |        | account_id [FK]     |    branch_name   |
| last_name       |      | customer_id [FK]|        | transaction_type    |    address      |
| email           |      | account_type   |        | amount              |    phone_number |
| phone_number    |      | balance        |        | transaction_date    |                 |
| date_of_birth   |      | branch_id [FK] |                                     |                 |
| address         |      +----------------+                                     |                 |
+-----------------+                                                               +---------------+
