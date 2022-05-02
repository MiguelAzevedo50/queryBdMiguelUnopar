CREATE DATABASE Universidade_Bd;

use Universidade_Bd;
create table Aluno
(
ID int primary key auto_increment,
Nome varchar(40) not null,
CPF varchar(11) not null,
Endereco varchar(200) not null
);

INSERT INTO Aluno (Nome, CPF, Endereco) values ('Miguel', '61173715274', 'Rua XPTO, 45, Bairro XPTO, Cidade XPTO, MG');
INSERT INTO Aluno (Nome, CPF, Endereco) values ('Otavio', '54474838327', 'Rua XPTO, 46, Bairro XPTO, Cidade XPTO, CE');
INSERT INTO Aluno (Nome, CPF, Endereco) values ('Pedro', '84890036105', 'Rua XPTO, 47, Bairro XPTO, Cidade XPTO, GO');



create table Professor
(
ID int primary key auto_increment,
Nome varchar(40) not null,
CPF varchar(11) not null,
Salario double(18,2) not null,
CargaHoraria int not null
);


INSERT INTO Professor (Nome, CPF, Salario, CargaHoraria) values ('Fabia', '16324968103', 3200, 144);
INSERT INTO Professor (Nome, CPF, Salario, CargaHoraria) values ('Roberto', '49381033110', 3200, 144);

create table Curso
(
ID int primary key auto_increment,
Nome varchar(50) not null,
Descricao varchar(200) not null
);
INSERT INTO Curso (Nome, Descricao) values ('SQL', 'Curso de Banco de Dados');
INSERT INTO Curso (Nome, Descricao) values ('JavaScript', 'Aprendendo JavaScript para o Front-End');

create table Matricula
(
ID int primary key auto_increment,
IdAluno int not null,
IdProfessor int not null,
IdCurso int not null,
FOREIGN KEY (IdAluno) REFERENCES Aluno(ID),
FOREIGN KEY (IdProfessor) REFERENCES Professor(ID),
FOREIGN KEY (IdCurso) REFERENCES Curso(ID)
);

INSERT INTO Matricula (IdAluno, IdProfessor, IdCurso) VALUES (1, 1, 2);
INSERT INTO Matricula (IdAluno, IdProfessor, IdCurso) VALUES (2, 1, 2);
INSERT INTO Matricula (IdAluno, IdProfessor, IdCurso) VALUES (3, 2, 1);

SELECT A.Nome AS 'Nome do Aluno', 
M.Id AS 'N® Matricula', 
C.Nome as 'Nome do Curso',
C.Descricao as 'Descrição do Curso',
P.Nome as 'Nome do Professor' FROM Matricula as M
INNER JOIN Aluno as A on A.Id = M.IdAluno
INNER JOIN Professor as P on P.Id = M.IdProfessor
INNER JOIN Curso as C on C.Id = M.IdCurso
ORDER BY M.Id asc;





