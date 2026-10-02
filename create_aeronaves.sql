create table aeronaves (
	id serial primary key,
	modelo varchar(100) not null,
	codigo_cauda varchar(10) unique not null,
	capacidade int check (capacidade > 0)
)

create table pilotos (
	id serial primary key,
	nome varchar(100) not null,
	codigo_anac varchar(6) unique not null,
	horas_voo int default 0 check (horas_voo > 0)
)

create table voos (
	id serial primary key,
	aeronave_id int references aeronaves(id),
	piloto_id int references pilotos(id),
	numero_voo varchar not null,
	origiem varchar(100) not null,
	destino varchar(100) not null,
	data_hora timestamp default current_timestamp not null,
	status varchar(50) default 'Agendado' check (status in('Agendado', 'Em voo', 'Concluído', 'Cancelado'))
)

create table passageiros (
	id serial primary key,
	nome varchar(100) not null,
	cpf varchar(11) unique not null,
	email varchar(200) unique not null
)

create table passagens (
	id serial primary key,
	voo_id int references voos(id),
	passageiro_id int references passageiros(id),
	assento varchar(4) not null,
	classe varchar(100) default 'Economica' check(classe in ('Economica', 'Executiva')),
	valor decimal(10, 2) check(valor > 0) not null
)


