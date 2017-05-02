CREATE TABLE livro (
  cod_livro SERIAL  NOT NULL ,
  volume INTEGER   NOT NULL ,
  titulo VARCHAR   NOT NULL ,
  descricao VARCHAR   NOT NULL ,
  autor VARCHAR   NOT NULL ,
  editora VARCHAR   NOT NULL ,
  genero VARCHAR   NOT NULL   ,
PRIMARY KEY(cod_livro));



CREATE TABLE usuario (
  cod_usuario SERIAL  NOT NULL ,
  cpf INTEGER   NOT NULL ,
  idade INTEGER   NOT NULL ,
  telefone INTEGER   NOT NULL ,
  nome VARCHAR   NOT NULL ,
  email VARCHAR   NOT NULL   ,
PRIMARY KEY(cod_usuario));



CREATE TABLE reserva (
  cod_reserva SERIAL  NOT NULL ,
  usuario_cod_usuario INTEGER   NOT NULL ,
  data_ini DATE   NOT NULL ,
  data_fim DATE      ,
PRIMARY KEY(cod_reserva, usuario_cod_usuario),
  FOREIGN KEY(usuario_cod_usuario)
    REFERENCES usuario(cod_usuario));



CREATE TABLE preferencia (
  cod_preferencia SERIAL  NOT NULL ,
  usuario_cod_usuario INTEGER   NOT NULL ,
  resposta VARCHAR   NOT NULL   ,
PRIMARY KEY(cod_preferencia, usuario_cod_usuario),
  FOREIGN KEY(usuario_cod_usuario)
    REFERENCES usuario(cod_usuario));



CREATE TABLE exemplar (
  cod_exemplar SERIAL  NOT NULL ,
  reserva_usuario_cod_usuario INTEGER   NOT NULL ,
  reserva_cod_reserva INTEGER   NOT NULL ,
  livro_cod_livro INTEGER   NOT NULL ,
  disponivel BOOL   NOT NULL   ,
PRIMARY KEY(cod_exemplar, reserva_usuario_cod_usuario, reserva_cod_reserva, livro_cod_livro),
  FOREIGN KEY(reserva_cod_reserva, reserva_usuario_cod_usuario)
    REFERENCES reserva(cod_reserva, usuario_cod_usuario),
  FOREIGN KEY(livro_cod_livro)
    REFERENCES livro(cod_livro));




