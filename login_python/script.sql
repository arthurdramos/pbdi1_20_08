-- Active: 1724758690293@@127.0.0.1@5432@20242_fatec_ipi_pbdi_arthur@public
CREATE TABLE tb_usuario(
    cod_usuario SERIAL PRIMARY KEY,
    login VARCHAR(200) NOT NULL, 
    senha VARCHAR(200) NOT NULL
);

INSERT INTO tb_usuario(login, senha)
VALUES
('admin', 'admin'),
('joao', '123456');


select * from tb_usuario