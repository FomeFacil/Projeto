/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     24/04/2021 16:54:01                          */
/*==============================================================*/


drop table if exists App_FomeFacil;

drop table if exists Apps_Parceiros;

drop table if exists Endereco;

drop table if exists FAZ_PEDIDO;

drop table if exists Forma_De_Pagamento;

drop table if exists Pedidos;

drop table if exists Restaurante;

drop table if exists Telefone;

drop table if exists Usuario_Do_App;

/*==============================================================*/
/* Table: App_FomeFacil                                         */
/*==============================================================*/
create table App_FomeFacil
(
   COD_App_FomeFacil    interger not null,
   NOM_App              char(50)
);

alter table App_FomeFacil
   add primary key (COD_App_FomeFacil);

/*==============================================================*/
/* Table: Apps_Parceiros                                        */
/*==============================================================*/
create table Apps_Parceiros
(
   COD_App_Parceiro     interger not null,
   COD_Forma_De_Pagamento interger not null,
   COD_App_FomeFacil    interger not null,
   NOM_App_Parceiro     char(200)
);

alter table Apps_Parceiros
   add primary key (COD_App_Parceiro);

/*==============================================================*/
/* Table: Endereco                                              */
/*==============================================================*/
create table Endereco
(
   COD_ENDERECO         interger not null,
   DES_ENDERECO         text
);

alter table Endereco
   add primary key (COD_ENDERECO);

/*==============================================================*/
/* Table: FAZ_PEDIDO                                            */
/*==============================================================*/
create table FAZ_PEDIDO
(
   COD_Faz_Pedido       interger not null,
   COD_Usuario          interger not null,
   COD_Pedido           interger not null
);

alter table FAZ_PEDIDO
   add primary key (COD_Faz_Pedido);

/*==============================================================*/
/* Table: Forma_De_Pagamento                                    */
/*==============================================================*/
create table Forma_De_Pagamento
(
   COD_Forma_De_Pagamento interger not null,
   COD_App_FomeFacil    interger not null
);

alter table Forma_De_Pagamento
   add primary key (COD_Forma_De_Pagamento);

/*==============================================================*/
/* Table: Pedidos                                               */
/*==============================================================*/
create table Pedidos
(
   COD_Pedido           interger not null,
   COD_App_FomeFacil    interger not null,
   VAL_Pedido           float(15,2),
   DES_Pedido           text,
   DTA_Pedido           datetime
);

alter table Pedidos
   add primary key (COD_Pedido);

/*==============================================================*/
/* Table: Restaurante                                           */
/*==============================================================*/
create table Restaurante
(
   COD_Restaurante      interger not null,
   COD_Telefone         internger,
   COD_App_FomeFacil    interger not null,
   COD_ENDERECO         interger,
   NOM_Restaurente      char(200)
);

alter table Restaurante
   add primary key (COD_Restaurante);

/*==============================================================*/
/* Table: Telefone                                              */
/*==============================================================*/
create table Telefone
(
   COD_Telefone         internger not null,
   NUM_Telefone         interger
);

alter table Telefone
   add primary key (COD_Telefone);

/*==============================================================*/
/* Table: Usuario_Do_App                                        */
/*==============================================================*/
create table Usuario_Do_App
(
   COD_Usuario          interger not null,
   COD_Telefone         internger,
   COD_Forma_De_Pagamento interger not null,
   COD_ENDERECO         interger,
   NOM_Usuario          char(100),
   DES_Email            char(200)
);

alter table Usuario_Do_App
   add primary key (COD_Usuario);

alter table Apps_Parceiros add constraint App_FomeFacil_Apps_Parceiros foreign key (COD_App_FomeFacil)
      references App_FomeFacil (COD_App_FomeFacil) on delete restrict on update restrict;

alter table Apps_Parceiros add constraint Forma_De_Pagamento_Apps_Parceiros foreign key (COD_Forma_De_Pagamento)
      references Forma_De_Pagamento (COD_Forma_De_Pagamento) on delete restrict on update restrict;

alter table FAZ_PEDIDO add constraint Pedidos_FAZ_PEDIDO foreign key (COD_Pedido)
      references Pedidos (COD_Pedido) on delete restrict on update restrict;

alter table FAZ_PEDIDO add constraint Forma_De_Pagamento_Usuario_Do_App foreign key (COD_Usuario)
      references Usuario_Do_App (COD_Usuario) on delete restrict on update restrict;

alter table Forma_De_Pagamento add constraint App_FomeFacil_Forma_De_Pagamento foreign key (COD_App_FomeFacil)
      references App_FomeFacil (COD_App_FomeFacil) on delete restrict on update restrict;

alter table Pedidos add constraint App_FomeFacil_Pedidos foreign key (COD_App_FomeFacil)
      references App_FomeFacil (COD_App_FomeFacil) on delete restrict on update restrict;

alter table Restaurante add constraint App_FomeFacil_Restaurante foreign key (COD_App_FomeFacil)
      references App_FomeFacil (COD_App_FomeFacil) on delete restrict on update restrict;

alter table Restaurante add constraint Endereco_Restaurante foreign key (COD_ENDERECO)
      references Endereco (COD_ENDERECO) on delete restrict on update restrict;

alter table Restaurante add constraint Telefone_Restaurante foreign key (COD_Telefone)
      references Telefone (COD_Telefone) on delete restrict on update restrict;

alter table Usuario_Do_App add constraint Endereco_Usuario_Do_App foreign key (COD_ENDERECO)
      references Endereco (COD_ENDERECO) on delete restrict on update restrict;

alter table Usuario_Do_App add constraint Forma_De_Pagamento_Usuario_Do_App foreign key (COD_Forma_De_Pagamento)
      references Forma_De_Pagamento (COD_Forma_De_Pagamento) on delete restrict on update restrict;

alter table Usuario_Do_App add constraint Telefone_Usuario_Do_App foreign key (COD_Telefone)
      references Telefone (COD_Telefone) on delete restrict on update restrict;

