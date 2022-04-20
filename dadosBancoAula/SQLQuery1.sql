select * from Clientes

insert Clientes (Codigo, Nome, TipoPessoa) values(2, 'Higor', 'F')

sp_help Clientes
sp_help Produtos
sp_help Pedido
sp_help PedidoItem

select * from Produtos

select * from Pedido

select *, convert(varchar, DataSolicitacao, 103) 
from Pedido


select * from PedidoItem

select isnull(DataCriacao, getdate()), *
from clientes


select *,
case
when TipoPessoa = 'F' then 'Jurídica'
when TipoPessoa ='J' then 'Fisica'
else 'Pessoa Indefinida'
end
from Clientes


select *
from Clientes

alter table Clientes add constraint pk_cliente primary key (Codigo)

insert Clientes values('Veronica', 'J', getdate())



create table Clientes
(
Codigo int not null,
Nome Varchar(200) not null,
TipoPessoa char(1) not null,
DataCriacao datetime null
)

insert into Clientes (codigo, nome, TipoPessoa) values (1, 'Sirius', 'F')
insert Clientes (codigo, nome, TipoPessoa) values (2, 'Veronica', 'F')
insert Clientes (TipoPessoa, codigo, nome ) values ('J', 3, 'Beth')
insert Clientes (TipoPessoa, codigo, nome) values ('J', 4, 'Gatinho')

alter table Clientes add constraint pk_cliente primary key (Codigo)

insert Clientes values( 'Gatinho', 'J', getdate())



select * from Pedido

select * from PedidoItem

alter table PedidoItem add constraint fk_pedido foreign key (CodigoPedido) references Pedido (Codigo)

alter table Pedido add CodigoStatus int
alter table Pedido add DecStatus varchar(5)

update Pedido set CodigoStatus = 1
update Pedido set  DecStatus = 'Em Andamento'

select * from Status


select * from StatusPedidoItem

select *
from PedidoItem

select * from PedidoItemLog


insert PedidoItemLog (CodigoPedido, CodigoProduto, CodigoStatusPedidoItem, DataMovimento)
select CodigoPedido, CodigoProduto, 1, getdate()
from PedidoItem

select * from Clientes cli
inner join Pedido ped
on cli.Codigo = ped.CodigoCliente

select * from Clientes cli
left join Pedido ped
on cli.Codigo = ped.CodigoCliente

select * from Pedido ped 
right join Clientes cli
on cli.Codigo = ped.CodigoCliente

select * from Pedido ped 
right join Clientes cli
on cli.Codigo = ped.CodigoCliente
where ped.TotalPedido > 10


select cli.Nome,
       ped.TotalPedido,
	   case
	      when cli.TipoPessoa = 'F' then 'Física'
		  else 'Juridica'
	   end TipoPessoa
from Clientes cli
left join Pedido ped
on cli.Codigo = ped.CodigoCliente


select *
from PedidoItem t1
inner join PedidoItemLog t2
on t1.CodigoPedido = t2.CodigoPedido
and t1.CodigoPedido = t2.CodigoProduto
inner join StatusPedidoItem t3
on t3.Codigo = t2.CodigoStatusPedidoItem
where Preco between 1 and 2

select sum(Preco * Quantidade)
from PedidoItem t1
inner join PedidoItemLog t2
on t1.CodigoPedido = t2.CodigoPedido
and t1.CodigoPedido = t2.CodigoProduto
inner join StatusPedidoItem t3
on t3.Codigo = t2.CodigoStatusPedidoItem

select avg(Preco)
from PedidoItem t1
inner join PedidoItemLog t2
on t1.CodigoPedido = t2.CodigoPedido
and t1.CodigoPedido = t2.CodigoProduto
inner join StatusPedidoItem t3
on t3.Codigo = t2.CodigoStatusPedidoItem

select count(*)
from PedidoItem t1
inner join PedidoItemLog t2
on t1.CodigoPedido = t2.CodigoPedido
and t1.CodigoPedido = t2.CodigoProduto
inner join StatusPedidoItem t3
on t3.Codigo = t2.CodigoStatusPedidoItem

select t4.Codigo,
       t4.Descricao,
	   t1.Preco * t1.Quantidade
from PedidoItem t1
inner join PedidoItemLog t2
on t1.CodigoPedido = t2.CodigoPedido
and t1.CodigoPedido = t2.CodigoProduto
inner join StatusPedidoItem t3
on t3.Codigo = t2.CodigoStatusPedidoItem
inner join Produtos t4
on t4.Codigo = t2.CodigoProduto


select t4.Codigo,
       t4.Descricao,
	  sum( t1.Preco * t1.Quantidade) Somatoria
from PedidoItem t1
inner join PedidoItemLog t2
on t1.CodigoPedido = t2.CodigoPedido
and t1.CodigoPedido = t2.CodigoProduto
inner join StatusPedidoItem t3
on t3.Codigo = t2.CodigoStatusPedidoItem
inner join Produtos t4
on t4.Codigo = t2.CodigoProduto

group by t4.Codigo,
         t4.Descricao

order by t4.Codigo desc



select t4.Codigo,
       t4.Descricao,
	  sum( t1.Preco * t1.Quantidade) Somatoria
from PedidoItem t1
inner join PedidoItemLog t2
on t1.CodigoPedido = t2.CodigoPedido
and t1.CodigoPedido = t2.CodigoProduto
inner join StatusPedidoItem t3
on t3.Codigo = t2.CodigoStatusPedidoItem
inner join Produtos t4
on t4.Codigo = t2.CodigoProduto
group by t4.Codigo,
         t4.Descricao
having sum(t1.Preco * t1.Quantidade) > 10