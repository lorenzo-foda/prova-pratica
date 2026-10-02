Q1
select 
vo.numero_voo,
vo.origiem,
vo.destino,
aer.modelo,
p.nome
from voos vo
join aeronaves aer on aer.id = vo.aeronave_id
join pilotos p on p.id = vo.piloto_id
where vo.status = 'Agendado' or vo.status = 'Em voo';

Q2


Q3
select 
pasg.nome,
vo.numero_voo,
pasgns.assento,
pasgns.valor
from passageiros pasg
join passagens pasgns on pasgns.passageiro_id = pasg.id
join voos vo on pasgns.voo_id = vo.id
where pasgns.valor > 800.00 and pasgns.classe = 'Executiva'
group by pasg.nome, vo.numero_voo, pasgns.assento, pasgns.valor;


