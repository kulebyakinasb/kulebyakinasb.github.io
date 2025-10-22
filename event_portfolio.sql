#количество проведенных/отмененных мероприятий за февраль-март (статус active 1 или 0)
select
sch.id,
sch.active,
sch.date_of,
br.type,
c.title as category,
e.title as genre, 
sch.subtitle1 as name
from vsm.schedule sch
left join vsm.event e on e.id = sch.event_id 
left join vsm.category c on c.id = e.category_id
left join vsm.branch br on br.id = sch.branch_id
where date_of between '2019-02-01 00:00:00' AND '2019-03-31 00:00:00'
order by date_of