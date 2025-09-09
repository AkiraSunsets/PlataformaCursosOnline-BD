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
    Nome VARCHAR (255) NOT NULL
);

CREATE TABLE Curso (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL
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

INSERT INTO Curso (Nome)
VALUES 
("Informática"),
("Inglês"),
("Photoshop")

INSERT INTO PLANO (Nome, Descricao)
("Básico", "Acesso aos cursos gratuitos e materiais básicos"),
("Premium", "Acesso a todos os cursos, certificado e suporte personalizado")

INSERT INTO Professor (Nome)
("Marcia Scanacapra"),
("Josemar de Oliveira Neto"),
("Gertrudes Fernanda de Araújo")

INSERT INTO PerfilAluno (Foto, Biografia, DataNascimento, id_aluno)
VALUES (NULL,
