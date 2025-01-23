create table cities (
    id serial primary key ,
    city_1 varchar not null,
    city_2 varchar not null,
    cost integer not null default 10
);

insert into cities(city_1, city_2, cost)
values
    ('a', 'b', 10),
    ('a', 'c', 15),
    ('a', 'd', 20),
    ('b', 'a', 10),
    ('b', 'c', 35),
    ('b', 'd', 25),
    ('c', 'a', 15),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'a', 20),
    ('d', 'b', 25),
    ('d', 'c', 30);


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
where total_cost = (select min(total_cost) from complete_tours)
order by total_cost, tour;