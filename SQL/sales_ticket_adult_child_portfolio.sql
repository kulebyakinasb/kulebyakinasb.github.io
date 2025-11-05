#пример запроса - продажи билетов по мероприятиям за январь-март 2019 c разбивкой на детей и взрослых
#полученные данные использованы для дашборда https://datalens.yandex/ttcu9ps68a18e
	
select
s.id,
	s.date_of as event_date,
	s.subtitle1 as event_name,
	br.name as branch_name,
	br.type,
	s.number_of_seats as plan_ticket,
	count(b.id) as count_ticket,
	sum(b.total_cost) as amount,
	sum(ba.cc ) as adults,
	sum(bch.ccch) as child
from
	vsm.booking_ticket as b
left join vsm.schedule s on s.id = b.schedule_id
left join vsm.branch br on br.id = s.branch_id
left join (
	select
		count(ba.id) as cc,
		ba.ticket_id as ta
	from
		vsm.booking_adult ba
	group by
		ba.ticket_id) ba on ba.ta = b.id
left join (
select
count(bch.id) as ccch,
bch.ticket_id
from vsm.booking_child bch
group by bch.ticket_id) bch on bch.ticket_id = b.id
where
b.paid = 1 and
	CAST(b.created_at AS DATE) between '2019-01-10' AND '2019-03-31'
group by
s.id,
	s.subtitle1,
	br.name,
	s.number_of_seats,
	s.date_of
order by

	s.date_of


