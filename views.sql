create view vw_painel_aeroporto as
select
vo.numero_voo,
vo.data_hora,
vo.origiem,
vo.destino,
vo.status,
aer.modelo,
aer.codigo_cauda
from voos vo
join aeronaves aer on aer.id = vo.aeronave_id;

--oi willer. importante: o codigo n mostra nada por causa do bug que faz a o id da linha não começar em 1, por isso ele n consegue relacionar com as outras tabelas blzzzz????--


create view vw_faturamento_por_voo as
select
vo.id,
vo.numero_voo,
vo.destino,
count(pasg.id) as total_passageiros,
sum(pasgns.valor) as receita_total
from voos vo
join passageiros pasg on vo.id = pasgns.voo_id;




