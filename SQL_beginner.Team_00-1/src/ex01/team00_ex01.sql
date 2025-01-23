with recursive possible_tour as (
    select city_1 as start_city,
           city_2 as next_city,
           cost as total_cost,
           array[city_1, city_2] as tour
    from cities where city_1 = 'a'
    union all
    select pt.start_city,
           c.city_2 as next_city,
           pt.total_cost + c.cost as total_cost,
           pt.tour || array[c.city_2]
    from possible_tour pt
    join cities c on pt.next_city = c.city_1
    where c.city_2 != ALL(pt.tour)
),
complete_tours as (
    select pt.total_cost + c.cost as total_cost,
           pt.tour || array[pt.start_city] as tour
    from possible_tour pt
    join cities c on pt.next_city = c.city_2 and
                     c.city_1 = pt.start_city
    where array_length(pt.tour, 1) = 4
)
select total_cost, tour
from complete_tours
where total_cost is not null
order by total_cost, tour;