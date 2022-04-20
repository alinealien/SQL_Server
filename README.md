# SQL - Server 

* select getdate() - Funcao do SQL -
* go
* Retorna a hora do servidor. 

...............................................................................................................................

* use master  - Acessar ao principal BD do servidor (Master)
* go
* altera o contexto do BD para master

...............................................................................................................................

- select * from sys.tables - selecao das tabelas do banco Master
- go
- Retornou as tabelas - visualmente ruim

...............................................................................................................................

- Intalar o SSMS - ferramenta de interface



_______________________________________

##### Para criar um BD :

- Por linha de comando : create database nomeDoBanco

- Lembrar de definir onde vai ser adcionado as tabelas (ex Ecommerce)

- Modo correto de criar as tabelas

  create table Teste
  (
  Descricao varchar(50) null, //Aqui o null aceita nulos
  Complemento char(10) not null //Não aceita não nulos
  )

  Tipos:

  - int : Para numeros inteiros positivos ou negativos
  - bigint : Para numeros maiores (CPF, etc)
  - varchar: Sempre deve ser indicado o valor da coluna ex: varchar(10);
  - char: Também é alfanumerico  

- Para apagar uma tabela: drop table Table

COMANDOS:

select * from cliente (vai ver a tabela)

- Insert: Insere os dados na tabela

  EX: 

  insert into Clientes (codigo, nome, TipoPessoa) values (1, 'Aline', 'F');
  insert Clientes (codigo, nome, TipoPessoa) values (2, 'Aline', 'F');
  insert Clientes (TipoPessoa, codigo, nome ) values ('F', 3, 'Aline');
  insert Clientes values (4, 'Aline', 'F');
  insert Clientes values (5, 'Aline', 'F'), (6, 'Aline', 'J');

- Select: Seleciona(indica) uma tabela ou todas:

  select * from Clientes (seleciona todas as tabelas de cliente)

  select Nome from Clientes (seleciona a tabela Nome de clientes)

  Clausura where(select e update):

  select * from Clientes where TipoPessoa = 'J' (seleciona clientes quando TipoPessoa for igual a J)

- Update : Modificar dados na tabela

  EX:

  update clientes
  set Codigo = 7,
      Nome = 'Sirius'
  where TipoPessoa = 'J'

  (Aqui para quando o Tipo de pessoa for = J ele vai modificar o nome para Sirius)

- Delete: CUIDADO SEMPRE LEMBRAR DE COLOCAR CLAUSURA WHERE

  EX:

  delete 
  from Clientes
  where Codigo in(5, 4, 3, 2)

  (Aqui ele excluiu os dados dos indices 5, 4, 3, 2)

- sp_help Clientes : PARA VER TODOS OS DADOS DA TABELA

PRINCIPAIS OPERADORES:

- AND(E): Pra uma informacao ser verdadeira TUDO é verdadeiro 

​      Para ser falso BASTA UM ser falso

| V AND V = V |
| ----------- |
| V AND F = F |
| F AND V = F |
| F AND F = F |



- OR(OU): Pra uma informacao ser verdadeira BASTA UMA SER verdadeiro 

   Para ser falso TODOS devem ser falso

  | V OR F = V |
  | ---------- |
  | V OR F = V |
  | F OR V = V |
  | F OR F = F |

  - Numeros com casas decimais é definida com .(ponto)
  - Separação de campos é com , (virgula)

- DICA: Sempre indicar as colunas que estamos inserindo 

  EX: insert Clientes (Codigo, Nome, TipoPessoa) values(2, 'Higor', 'F')

  EX2: select isnull(DataCriacao, getdate()), *
  from clientes

- PARA CONVERÇÕES: 

  EX: select *, convert(varchar, DataSolicitacao, 103) 
  from Pedido

________________________

##### O que são chaves primarias e estrangeiras?



Chave Primaria: Forma de identificar um registro. Chave UNICA para cada registro. Gera melhor peformace na busca. Pode ser unica ou composta. EX: cpf.



Chave Estrangeira: É uma chave que vai fazer uma relaçao de uma tabela com outra.