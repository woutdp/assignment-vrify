# Tables
`SELECT * FROM customer;`
```
 id |   name
----+----------
  1 | Ryan
  2 | Jonathan
  3 | Colin
  4 | Syed
```

`SELECT * FROM customer_address;`
```
 id | customer_id |     street_address     | postal_code | country
----+-------------+------------------------+-------------+---------
  1 |           2 | 123 Big Walk Way       |       75023 | US
  2 |           3 | 509 Charter Road       |       90021 | US
  3 |           1 | 999 Night Stalker Road |       12345 | US
```


# Query
```SQL
SELECT customer.id, name, street_address, postal_code, country
FROM customer
INNER JOIN customer_address
ON customer.id = customer_address.customer_id;
```

# Result
```
 id |   name   |     street_address     | postal_code | country
----+----------+------------------------+-------------+---------
  1 | Ryan     | 999 Night Stalker Road |       12345 | US
  2 | Jonathan | 123 Big Walk Way       |       75023 | US
  3 | Colin    | 509 Charter Road       |       90021 | US
```
