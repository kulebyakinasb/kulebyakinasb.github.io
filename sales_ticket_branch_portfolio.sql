#продажи билетов по дням за март 2019 с разбивкой центр/филиал
select CAST(b.created_at AS DATE) as date_of_sale,
br.type,
count(b.id) as count_ticket,
sum(b.total_cost) as amount
from vsm.booking_ticket as b
left join vsm.schedule s on s.id = b.schedule_id 
left join vsm.branch br on br.id = s.branch_id 
where b.paid = 1 and CAST(b.created_at AS DATE) between '2019-03-01' AND '2019-03-31'
group by CAST(b.created_at AS DATE), br.type
