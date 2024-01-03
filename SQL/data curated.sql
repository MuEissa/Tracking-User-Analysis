use data_scientist_project;


DROP VIEW IF EXISTS purchases_info;

CREATE VIEW purchases_info AS
select 
		purchase_id,
		student_id,
        plan_id, 
        date_start,
		date_end, 
        case 
			when date_start > '2021-06-30' then 0
            when date_end < '2021-04-01' then 0
            else 1
        end as paid_q2_2021, 
        case 
			when date_start > '2022-06-30' then 0
            when date_end < '2022-04-01' then 0
            else 1
        end as paid_q2_2022
from 
(select 
		purchase_id,
		student_id,
        plan_id, 
        date_start,
        case  
			when date_refunded is null then date_end
            else date_refunded 
            end as date_end
from (
select purchase_id
    ,student_id
    ,plan_id
    ,date_purchased as date_start
    ,case plan_id
		when 0 then date_add(date_purchased, interval 1 month)
        when 1 then date_add(date_purchased, interval 3 month)
        when 2 then date_add(date_purchased, interval 12 month)
        when 4 then null 
        end as date_end
	,date_refunded 
from student_purchases) as set1
) as set2
;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT 
    minutes.student_id,
    minutes_watched,
    IF(p.date_start IS NULL,
        0,
        MAX(p.paid_q2_2021)) AS paid_in_q2
FROM
    (SELECT 
        student_id, SUM(seconds_watched) / 60 AS minutes_watched
    FROM
        student_video_watched
    WHERE
		-- Condition used for exporting data sets based on year
		YEAR(date_watched) = 2021
        -- Original filtering condition
        -- YEAR(date_watched) IN (2021, 2022) 
    GROUP BY student_id) AS minutes
        LEFT JOIN
    purchases_info p ON minutes.student_id = p.student_id
GROUP BY student_id
HAVING paid_in_q2 = 1
;




