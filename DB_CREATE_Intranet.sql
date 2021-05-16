/*Création base de donnée*/
drop database if exists IntranetTest;

create database if not exists IntranetTest;

/*Création table*/
/*Liste prof*/
drop table if exists listeProf;

create table if not exists listeProf(
	id_prof int not null primary key,
	nom_prof varchar(20) not null,
	prenom_prof varchar(20) not null,
	matiere_cours varchar(25) not null,
	loginProf varchar(20) not null
)engine = InnoDB;

/*Liste groupe*/
drop table if exists listeGroupe;

create table if not exists listeGroupe(
	id_prof int not null,
	id_etudiant int not null,
	primary key(id_prof,id_etudiant)
)engine = InnoDB;

/*Liste eleve*/
drop table if exists listeEtudiant;

create table if not exists listeEtudiant(
	id_etudiant int not null primary key,
	nom_etudiant varchar(20) not null,
	prenom_etudiant varchar(20) not null,
	loginEtud varchar(20) not null
)engine = InnoDB;

/*Liste note*/
drop table if exists listeNote;

create table if not exists listeNote(
	id_note int not null AUTO_INCREMENT primary key,
	matiere_test varchar(20) not null,
	valeur int not null,
	id_etudiant int not null
)engine = InnoDB;

/*listecompte*/
drop table if exists listecompte;

create table if not exists listecompte(
	login varchar(20) not null primary key,
	passwd int not null,
	type varchar(20) not null
)engine = InnoDB;

/*listetypeutilisateur*/
drop table if exists listetype;

create table if not exists listetype(
	type varchar(20) not null primary key
)engine = InnoDB;

alter table listeGroupe add constraint FK_GroupeProf foreign key (id_prof) references listeProf (id_prof);
alter table listeGroupe add constraint FK_GroupeEtudiant foreign key (id_etudiant) references listeEtudiant (id_etudiant);
alter table listeNote add constraint FK_NoteEtudiant foreign key (id_etudiant) references listeEtudiant (id_etudiant);

/*alter table listecompte add constraint FK_CompEtud foreign key (login) references listeEtudiant (loginEtud);
alter table listeEtudiant add constraint FK_EtudComp foreign key (id_etudiant) references listecompte (id_compte);

alter table listecompte add constraint FK_CompProf foreign key (login) references listeProf (loginProf);
alter table listeProf add constraint FK_ProfComp foreign key (id_prof) references listecompte (id_compte);*/

alter table listeEtudiant add constraint FK_EtudComp foreign key (loginEtud) references listecompte (login);

alter table listeProf add constraint FK_ProfComp foreign key (loginProf) references listecompte (login);

alter table listecompte add constraint FK_CompType foreign key (type) references listetype (type);

