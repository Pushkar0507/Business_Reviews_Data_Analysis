-- 1. Find number of business in each category
With CTE1 as (
Select business_id,  trim(A.value) as category
from tbl_yelp_businesses
,lateral split_to_table(categories, ',') A 
)
Select category, count(*) as No_of_business
from CTE1
group by 1
order by 2 desc

--2 Find to 10 users who have reviewed the most business in the "Resturants" category

Select a.user_id, count(distinct a.business_id)
from tbl_yelp_reviews a
inner join tbl_yelp_businesses b on a.business_id = b.business_id
where b.categories ilike '%restaurant%'
group by 1
order by 2 desc
limit 10;


--3. Find the most popular categories of business 

With CTE1 as (
Select business_id,  trim(A.value) as category
from tbl_yelp_businesses
,lateral split_to_table(categories, ',') A 
)
Select category, count(*)
from CTE1 a
inner join tbl_yelp_reviews b on a.business_id = b.business_id
group by 1
order by 2 desc;

--4. Find top 3 most recent reviews for each business
with CTE1 as (
Select a.*, b.name,
row_number() over(partition by a.business_id order by review_date desc) as rn
from tbl_yelp_reviews a
inner join tbl_yelp_businesses b on a.business_id = b.business_id
)
select * 
from CTE1
where rn <= 3;


--5. Find the month with highest number of reviews

Select month(review_date) as review_month, count(*) as NumberOfReviews
from tbl_yelp_reviews
group by 1
order by 2 desc;


--6. Find the precentage of 5-star reviews for each business
Select b.business_id, b.name, count(*) as TotalReviews,
sum(case
    when a.review_stars = 5 then 1
    else 0 end ) as Five_Star_Reviews, 
Five_Star_Reviews*100/TotalReviews as Five_Star_Reviews_Percentage
from tbl_yelp_reviews a
inner join tbl_yelp_businesses b on a.business_id = b.business_id
group by 1,2


--7. Find top 5 most reviewed business in each city
with CTE1 as (
Select b.city, b.business_id, b.name, count(*) as total_reviews
from tbl_yelp_reviews a
inner join tbl_yelp_businesses b on a.business_id = b.business_id
group by 1,2,3
)
select *
from CTE1
qualify row_number() over(partition by city order by total_reviews desc) <= 5;


--8 Find the average rating of business that have least 100 reviews
Select b.business_id, b.name, count(*) as TotalReviews, 
avg(review_stars) as average_ratings
from tbl_yelp_reviews a
inner join tbl_yelp_businesses b on a.business_id = b.business_id
group by 1,2
having count(*) >= 100;

--9 List the top 10 users who have written most reviews, along with the business they reviewed.
with CTE1 as(
Select a.user_id,count(*) as TotalReviews
from tbl_yelp_reviews a
inner join tbl_yelp_businesses b on a.business_id = b.business_id
group by 1
order by 2 desc
limit 10
)
Select user_id, business_id
from tbl_yelp_reviews
    where user_id in (
                    Select user_id
                    FRom CTE1
    )
group by 1,2
order by user_id;


--10 Find top 10 business with highest positive sentiments reviews

Select a.business_id, b.name, count(*) as total_reviews
from tbl_yelp_reviews a
inner join tbl_yelp_businesses b on a.business_id = b.business_id 
where sentiments = 'Positive'
group by 1,2
order by 3 desc
limit 10;







