CREATE database PlataformaCursosOnline;
USE PlataformaCursosOnline;

CREATE TABLE Plano (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL UNIQUE, 
    DescricaoBeneficio TEXT
);

CREATE TABLE Aluno (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (255) NOT NULL,
    Email VARCHAR (50) UNIQUE,
    id_plano INT NOT NULL, 
    FOREIGN KEY (id_plano) REFERENCES Plano(id)
);

CREATE TABLE PerfilAluno (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Foto VARCHAR (255),
    Biografia TEXT,
    DataNascimento DATE,
    id_aluno INT NOT NULL, /*NOT NULL é importante em tabelas importadas*/
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id)
);


CREATE TABLE Professor (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (255) NOT NULL,
	Email VARCHAR (50) UNIQUE
);

CREATE TABLE Curso (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL UNIQUE /* Para evitar cursos duplicados por alunos */
);

CREATE TABLE CursoProfessor (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    PapelProfessor VARCHAR (50) NOT NULL,
    id_professor INT NOT NULL,
    id_curso INT NOT NULL, 
    FOREIGN KEY (id_curso) REFERENCES Curso(id),
    FOREIGN KEY (id_professor) REFERENCES Professor(id)
);

CREATE TABLE ConteudoCurso (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR (50) NOT NULL,
    Ordem INT NOT NULL,
    CargaHoraria INT UNSIGNED NOT NULL, /* UNSIGNED É PARA QUE VALORES NEGATIVOS NÃO SEJAM ACEITOS */
    id_curso INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(id)
);

CREATE TABLE InscricaoCurso (
	ID INT PRIMARY KEY AUTO_INCREMENT, 
    Data DATE NOT NULL,
    Situacao VARCHAR (50) NOT NULL,
    id_curso INT NOT NULL,
    id_aluno INT NOT NULL, 
    FOREIGN KEY (id_curso) REFERENCES Curso(id),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id)
);

INSERT INTO PLANO (Nome, Descricao)
VALUES
("Básico", "Acesso aos cursos gratuitos e materiais básicos"),
("Premium", "Acesso a todos os cursos, certificado e suporte personalizado");

INSERT INTO Aluno (Nome, Email, id_plano)
VALUES
("Amanda Oliveira", "AmandinhaOliveiraa@exemplo.com", 2),
("Bruno Araújo", "brunooliveira2131@exemplo.com", 2),
("Vitória Camargo", "vickcam12@exemplo.com", 1);

INSERT INTO Curso (Nome)
VALUES 
("Informática"),
("Inglês"),
("Photoshop");

INSERT INTO Professor (Nome, Email)
VALUES
("Marcia Scanacapra", "marciascanacapra@exemplo.com"),
("Josemar de Oliveira Neto", "josemaron@exemplo.com"),
("Gertrudes Fernanda de Araújo", "gertrudesaraujo@exemplo.com");

INSERT INTO PerfilAluno (Biografia, DataNascimento, id_aluno)
VALUES 
(NULL, '2004-04-20', 1),
(NULL, '2000-08-18', 2),
(NULL, '2001-09-12', 3);

INSERT INTO InscricaoCurso (Data, Situacao, id_curso, id_aluno)
VALUES
('2024-04-09', 'Ativa', 1, 3),
('2023-07-21', 'Concluída', 3, 2),
('2024-02-10', 'Trancada', 2, 1);

INSERT INTO CursoProfessor (PapelProfessor, id_professor, id_curso)
VALUES
("Titular", 1, 1),
("Tutor", 2, 3),
("Titular", 3, 2);

INSERT INTO ConteudoCurso (Titulo, Ordem, CargaHoraria, id_curso)
VALUES
("Introdução ao Banco de Dados", 1, 240, 1),
("Introduçao ao Present Continuous", 4, 240, 2),
("Como ser o mestre da Saturação", 3, 180, 3);
		
