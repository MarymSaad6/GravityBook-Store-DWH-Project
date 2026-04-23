
use gravity_books

-------- Book_Dim

SELECT 
    b.book_id,
    CASE 
        WHEN cleaned.title_clean IS NULL 
             OR LTRIM(RTRIM(cleaned.title_clean)) = ''
             OR LEN(REPLACE(cleaned.title_clean, ' ', '')) <= 3
        THEN 'Unknown Title'
        ELSE cleaned.title_clean
    END AS title , isbn13, num_pages,publication_date , 
       bl.language_id,bl.language_name,bl.language_code,
       psh.publisher_id,  CASE 
        WHEN psh.publisher_name IS NULL
             OR LTRIM(RTRIM(REPLACE(psh.publisher_name, '?', ''))) = ''
        THEN 'Unknown Publisher'
        ELSE LTRIM(RTRIM(REPLACE(psh.publisher_name, '?', '')))
    END AS publisher_name

FROM book b
left join book_language as bl 
on b.language_id=bl.language_id
left join publisher as psh
on psh.publisher_id=b.publisher_id

CROSS APPLY (
    SELECT STRING_AGG(value, ' ') AS title_clean
    FROM STRING_SPLIT(
        REPLACE(REPLACE(REPLACE(b.title, '?', ''), ':', ''), '#', ''),
        ' '
    )
    WHERE TRY_CAST(value AS INT) IS NULL  
) cleaned;




---------------------------------------------------------------------------

-------------------------------
-------- Bridge Book_Author

SELECT DISTINCT
    bu.book_id,
    bu.author_id
FROM book_author bu



------------------------------------------------------------------------------
-------Author   

SELECT 
    author_id,
    CASE 
        WHEN TRIM(author_name) LIKE '%?%' 
        THEN 'Unknown Author'
        ELSE TRIM(author_name)
    END AS author_name
FROM author;



-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--  Customer_dim

use gravity_books
select customer_id,first_name,last_name,email from customer

use Gravity_Books_DWH
select * from Dim_Customer

-----------------------------------------------------------------------------
---- Address Dim

use gravity_books
select ad.address_id,ad.street_number,ad.street_name,ad.city,ct.country_id,ct.country_name
from address as ad left join country as ct
on ad.country_id=ct.country_id

use Gravity_Books_DWH
select * from Dim_address



-----------------------------------------------------------------------------
---  Bridge customer_address_status

use gravity_books

select * from customer_address

SELECT 
    custad.address_id,
    custad.customer_id,
    custad.status_id,
    ads.address_status
FROM customer_address AS custad
LEFT JOIN address AS ad 
    ON ad.address_id = custad.address_id
LEFT JOIN customer AS cust 
    ON cust.customer_id = custad.customer_id
LEFT JOIN address_status AS ads 
    ON ads.status_id = custad.status_id;





-----------------------------------------------------------------------------
---------------------------------------------------------------------------

---- Status_customer_dim

use gravity_books
select oh.history_id,oh.order_id,oh.status_id,oh.status_date,os.status_value
from order_history as oh
left join order_status as os
on os.status_id=oh.status_id

use Gravity_Books_DWH
select * from Dim_Status_History




-----------------------------------------------------------------------------
-------------------------------------------------------------------------
--------------- FACT

select * from Gravity_Books_DWH.dbo.Fact_Books
use Gravity_Books_DWH
select * from Fact_Books

use gravity_books
select DISTINCT co.order_id,ol.book_id, CAST(CAST(co.order_date AS datetime2(0)) AS datetime) as order_date,co.customer_id ,co.dest_address_id,
       shm.cost, ol.line_id,ol.price, ol.price+shm.cost as total,shm.method_id,shm.method_name
from order_line as ol 
left join cust_order as co
on ol.order_id=co.order_id
left join shipping_method as shm
on shm.method_id=co.shipping_method_id
left join order_history as oh
on oh.order_id=co.order_id




