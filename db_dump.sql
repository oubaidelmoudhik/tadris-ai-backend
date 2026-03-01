BEGIN TRANSACTION;
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO "auth_permission" VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES(5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES(9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES(13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES(21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES(25,7,'add_teacherinfo','Can add teacher info');
INSERT INTO "auth_permission" VALUES(26,7,'change_teacherinfo','Can change teacher info');
INSERT INTO "auth_permission" VALUES(27,7,'delete_teacherinfo','Can delete teacher info');
INSERT INTO "auth_permission" VALUES(28,7,'view_teacherinfo','Can view teacher info');
INSERT INTO "auth_permission" VALUES(29,8,'add_lesson','Can add lesson');
INSERT INTO "auth_permission" VALUES(30,8,'change_lesson','Can change lesson');
INSERT INTO "auth_permission" VALUES(31,8,'delete_lesson','Can delete lesson');
INSERT INTO "auth_permission" VALUES(32,8,'view_lesson','Can view lesson');
INSERT INTO "auth_permission" VALUES(33,9,'add_generatedpdf','Can add generated pdf');
INSERT INTO "auth_permission" VALUES(34,9,'change_generatedpdf','Can change generated pdf');
INSERT INTO "auth_permission" VALUES(35,9,'delete_generatedpdf','Can delete generated pdf');
INSERT INTO "auth_permission" VALUES(36,9,'view_generatedpdf','Can view generated pdf');
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO "auth_user" VALUES(1,'',NULL,0,'default','','default@example.com',0,1,'2026-02-24 20:43:47.649748','');
INSERT INTO "auth_user" VALUES(2,'pbkdf2_sha256$1000000$Zsc61HyWV7UKWbSeGo4lDR$9hh6JtazBwpKL3jRHd3TxC062zABjIVK6hPzofWwUN4=','2026-02-24 20:47:03.697012',1,'oubaid','','oubaidm@live.com',1,1,'2026-02-24 20:46:52.561509','');
INSERT INTO "auth_user" VALUES(7,'pbkdf2_sha256$1000000$BiGLlIaxM0LXQnXvvIE9GL$1XQMLG3ojFpHYnoMe01WsfbwgboYl5GBJkGknpBcsMg=',NULL,0,'oubaid3','','',0,1,'2026-02-25 19:20:37.947856','Adil');
INSERT INTO "auth_user" VALUES(8,'pbkdf2_sha256$1000000$DX3jlItd3UjFt6c1disLc5$MyLC+GBymn3vdOnOhnijEd0rXBj3gKesfHP/Zcm8P8U=',NULL,0,'simo','','',0,1,'2026-02-25 20:33:25.518176','Simo');
INSERT INTO "auth_user" VALUES(9,'pbkdf2_sha256$1000000$pXNuS6xx4A5rGqBvxh427K$H/x7la1D6cKYlFXQV6LFxSQy4UERqOoie780c0i1BMU=',NULL,0,'oubaid2','','',0,1,'2026-02-26 23:11:06.183444','');
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
INSERT INTO "django_admin_log" VALUES(1,'2','Teacher Info for oubaid (fr)',1,'[{"added": {}}]',7,2,'2026-02-24 20:47:32.311905');
INSERT INTO "django_admin_log" VALUES(2,'2','Teacher Info for oubaid (fr)',2,'[]',7,2,'2026-02-24 20:47:44.367072');
INSERT INTO "django_admin_log" VALUES(3,'2','Teacher Info for oubaid',1,'[{"added": {}}]',7,2,'2026-02-25 17:04:59.301488');
INSERT INTO "django_admin_log" VALUES(4,'2','Teacher Info for oubaid',2,'[{"changed": {"fields": ["User"]}}]',7,2,'2026-02-25 18:06:58.354517');
INSERT INTO "django_admin_log" VALUES(5,'6','brandnew',3,'',4,2,'2026-02-25 19:19:27.208468');
INSERT INTO "django_admin_log" VALUES(6,'5','newuser',3,'',4,2,'2026-02-25 19:19:27.208544');
INSERT INTO "django_admin_log" VALUES(7,'4','oubaid3',3,'',4,2,'2026-02-25 19:19:27.208585');
INSERT INTO "django_admin_log" VALUES(8,'3','testuser',3,'',4,2,'2026-02-25 19:19:27.208614');
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO "django_content_type" VALUES(1,'admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'auth','permission');
INSERT INTO "django_content_type" VALUES(3,'auth','group');
INSERT INTO "django_content_type" VALUES(4,'auth','user');
INSERT INTO "django_content_type" VALUES(5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'sessions','session');
INSERT INTO "django_content_type" VALUES(7,'raida','teacherinfo');
INSERT INTO "django_content_type" VALUES(8,'raida','lesson');
INSERT INTO "django_content_type" VALUES(9,'raida','generatedpdf');
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2026-02-24 20:43:45.104439');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2026-02-24 20:43:45.152081');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2026-02-24 20:43:45.192591');
INSERT INTO "django_migrations" VALUES(4,'admin','0002_logentry_remove_auto_add','2026-02-24 20:43:45.222093');
INSERT INTO "django_migrations" VALUES(5,'admin','0003_logentry_add_action_flag_choices','2026-02-24 20:43:45.243641');
INSERT INTO "django_migrations" VALUES(6,'contenttypes','0002_remove_content_type_name','2026-02-24 20:43:45.281943');
INSERT INTO "django_migrations" VALUES(7,'auth','0002_alter_permission_name_max_length','2026-02-24 20:43:45.309057');
INSERT INTO "django_migrations" VALUES(8,'auth','0003_alter_user_email_max_length','2026-02-24 20:43:45.336558');
INSERT INTO "django_migrations" VALUES(9,'auth','0004_alter_user_username_opts','2026-02-24 20:43:45.359078');
INSERT INTO "django_migrations" VALUES(10,'auth','0005_alter_user_last_login_null','2026-02-24 20:43:45.383785');
INSERT INTO "django_migrations" VALUES(11,'auth','0006_require_contenttypes_0002','2026-02-24 20:43:45.398041');
INSERT INTO "django_migrations" VALUES(12,'auth','0007_alter_validators_add_error_messages','2026-02-24 20:43:45.419904');
INSERT INTO "django_migrations" VALUES(13,'auth','0008_alter_user_username_max_length','2026-02-24 20:43:45.445682');
INSERT INTO "django_migrations" VALUES(14,'auth','0009_alter_user_last_name_max_length','2026-02-24 20:43:45.471505');
INSERT INTO "django_migrations" VALUES(15,'auth','0010_alter_group_name_max_length','2026-02-24 20:43:45.497363');
INSERT INTO "django_migrations" VALUES(16,'auth','0011_update_proxy_permissions','2026-02-24 20:43:45.520060');
INSERT INTO "django_migrations" VALUES(17,'auth','0012_alter_user_first_name_max_length','2026-02-24 20:43:45.545682');
INSERT INTO "django_migrations" VALUES(19,'sessions','0001_initial','2026-02-24 20:43:45.755370');
INSERT INTO "django_migrations" VALUES(24,'raida','0001_initial','2026-02-25 17:03:51.382273');
INSERT INTO "django_migrations" VALUES(25,'raida','0002_update_teacher_info_fields','2026-02-25 17:03:51.816850');
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('2w0l75xxtmqpld00hz2jm05c0bxjld82','.eJxVjDkOwjAQAP-yNbKMj10nJX3eEK0vHEC2FCcV4u8oUgpoZ0bzhpn3rcx7T-u8RBhBweWXeQ7PVA8RH1zvTYRWt3Xx4kjEabuYWkyv29n-DQr3AiOgCVayTc4bilabQSsVoldsOMlAV-OQpMnaD2QpKemzIkRHKHPQiBo-X8uxNuk:1vuzJ9:1fZE_yAzN-XMzGouDf-J4D3jf_DyvTuzd7ulxy77u8g','2026-03-10 20:47:03.713468');
CREATE TABLE "raida_generatedpdf" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "file" varchar(100) NOT NULL, "filename" varchar(255) NOT NULL, "generated_at" datetime NOT NULL, "expires_at" datetime NULL, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "lesson_id" bigint NOT NULL REFERENCES "raida_lesson" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "raida_lesson" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(255) NOT NULL, "subject" varchar(50) NOT NULL, "level" varchar(10) NOT NULL, "period" varchar(10) NOT NULL, "week" varchar(10) NOT NULL, "session" varchar(10) NOT NULL, "filename" varchar(255) NOT NULL, "objective" text NOT NULL, "content" text NOT NULL, "processed_content" text NULL CHECK ((JSON_VALID("processed_content") OR "processed_content" IS NULL)), "pptx_file" varchar(100) NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "raida_lesson" VALUES(1,'FR N5 P1 SEM2 S1','français','5','1','2','1','FR_N5_P1_SEM2_S1.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Oral – Dialogue
Lecture – texte  (fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 


Séance 1

Présentation du vocabulaire 
Exploitation du vocabulaire
Activités de vocabulaire sur livret
Organisation de la semaine
Description de la scène
Travail sur livret
Plan de la séance
1.  Présentation du Vocabulaire
  - La confiture - Des œufs - La recette - Du chocolat - Un kilo - Un litre
  - Cent grammes - Un sachet de levure - Le lait - La farine - Le beurre - Le sucre
Bonjour les enfants !  La leçon de français commence maintenant.  Soyez attentifs. 
Lecture de la vidéo.
Lecture de la vidéo.
Qui veut répéter ?
La recette 
Lecture de la vidéo.
Qui veut répéter ?
Un kilo
Lecture de la vidéo.
Qui veut répéter ?
Un litre
Lecture de la vidéo.
Qui veut répéter ?
Cent grammes
Lecture de la vidéo.
Qui veut répéter ?
La farine
Lecture de la vidéo.
Qui veut répéter ?
Le beurre
Lecture de la vidéo.
Répétons ensemble :  La recette - Un litre – Un kilo – Cent grammes – Le beurre  - La farine. 
Un kilo
Un litre
La recette
La farine
Le beurre
Cent grammes
Qui veut passer au tableau pour nommer les images ? 
Maintenant, on va apprendre d’autres mots avec Majd.
Lecture de la vidéo.
Qui veut répéter ?
Un sachet de levure
Lecture de la vidéo.
Qui veut répéter ?
Le lait
Lecture de la vidéo.
Qui veut répéter ?
Le sucre
Lecture de la vidéo.
Qui veut répéter ?
La confiture 


Lecture de la vidéo.
Qui veut répéter ?
Des œufs 
Lecture de la vidéo.
Qui veut répéter ?
Du chocolat
Lecture de la vidéo.
Répétons ensemble : le chocolat – le sucre  - Un sachet de levure - Le lait - La confiture- des œufs.
Le chocolat 
Le sucre
Un sachet de levure
Des œufs
Le lait
La confiture
Qui veut passer au tableau pour nommer ces images ? 
Prenez vos ardoises. 
Ecrivez le numéro du mot « Le sucre ».
Ecrivez le numéro du mot « Des oeufs ». 
Ecrivez le numéro du mot « Un litre ». 
Rangez vos ardoises. 
Qui veut nommer l’image ? 
Qui veut nommer l’image ? 
Qui veut nommer l’image ? 
Qui veut nommer l’image ? 
Activités  sur livret
Plan de la séance
2.  Exploitation du vocabulaire
Description de la scène. 
  - La confiture - Des œufs - La recette - Du chocolat - Un kilo - Un litre
  - Cent grammes - Un sachet de levure - Le lait - La farine - Le beurre - Le sucre
Observez cette scène pendant 30 secondes. Il y a des images déjà vues aujourd’hui. 
Majd va nous montrer comment décrire l’image. Soyez attentifs !
Lecture de la vidéo.
Lecture de la vidéo.
Soyez attentifs. Majd va décrire l’image une deuxième fois. 
Lecture de la vidéo.
Maintenant, je vais vous poser des questions.
Où se trouve le cuisinier?
Qu’est ce qu’il est en train de préparer?
Quels sont les ingrédients de cette recette?
Exploitation du vocabulaire 
Plan de la séance
3.  Activités de vocabulaire  sur livret
Activités sur livret
- La confiture - Des œufs - La recette - Du chocolat - Un kilo - Un litre
- Cent grammes - Un sachet de levure - Le lait - La farine - Le beurre - Le sucre
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant prépare des activités écrites à réaliser par les élèves sur cahier. 
Remarque importante :
Ouvrez le livret à la page 13.  Vous allez faire cette activité à l’oral avec votre camarade. 

À tour de rôle : l’un montre une image, l’autre dit le mot. Je passe entre les rangs pour vous aider.

Je montre l’image

1

Je dis le mot

2

La séance d’aujourd’hui est terminée. À la maison, faites les activités 1 et 2 sur le livret.Vous devez écrire les mots du vocabulaire. 
',NULL,'','2026-02-26 10:45:45.544568','2026-02-26 10:45:45.544602',1);
INSERT INTO "raida_lesson" VALUES(2,'FR N5 P1 SEM2 S2','français','5','1','2','2','FR_N5_P1_SEM2_S2.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 6

Séance 3

Séance 5

Séance 4

Séance 1
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Présentation du vocabulaire 
Exploitation du vocabulaire
Travail sur livret
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral –  Prise de parole
Ecriture – Texte  

Oral – Dialogue
Lecture - Lettre a - A
Ecriture - Lettre a - A

Séance 2

Oral – Acte de parole 1
Ecriture – Point de langue 1
Lecture – Mots avec difficultés 
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 2


Utiliser le verbe « vouloir  » au conditionnel présent.
Mots avec difficultés : « s » qui se prononce « z ».
Acte de parole 1 : « parler des ingrédients d’une recette ». 
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs !
Avant de commencer nous allons corriger les activités de vocabulaire.

Corrigez sur votre livret. Répétons ensemble ces mots. 
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. Soyez attentifs. 
Lecture de la vidéo 
Maintenant, on va poser la question comme Majd et Nada. Répétons ensemble. 
Que veux-tu acheter pour ta recette ? 
Que veux-tu acheter pour ton repas ? 
Voici d’autres exemples. Qui veut les expliquer ?  
Que veux-tu acheter pour ton goûter ? 
Que veux-tu acheter pour le déjeuner ? Que veux-tu acheter pour le dessert ? 
 


 Que veux-tu acheter pour ta recette ?  
Qui veut poser la question et l’expliquer dans sa langue ? 

Qui veut poser la question et l’expliquer dans sa langue ? 

Que veux-tu acheter pour ton petit-déjeuner ? 
Maintenant nous allons apprendre à répondre à la question.
Lecture de la vidéo 
Maintenant, on va répondre à la question comme Majd et Nada. Répétons ensemble. 
Je voudrais du lait et de la farine.
Je voudrais des œufs et des tomates. 
Voici d’autres exemples.  
Je voudrais du pain et de la confiture. 
Je voudrais des pommes et des fraises.
Qui veut passer au tableau pour jouer la scène ?  Chacun choisit un exemple différent. 

Je voudrais
_____________

Que veux-tu acheter pour  _______ ?
Chacun joue le dialogue avec son voisin. 
Je voudrais
_____________

Que veux-tu acheter pour  _______?
Acte de parole 1 : « parler des ingrédients d’une recette ». 
Mots avec difficultés « s » qui se prononce « z ».
Plan de la séance 2
Utiliser le verbe « vouloir " au conditionnel présent.
2.  Écrit : Point de langue
vouloir 
يريد 
On va faire la conjugaison du verbe « vouloir » au conditionnel présent. Écoutez bien !
Lecture de la vidéo 
Répétons ensemble. 
Je voudrais 
Tu voudrais 
Il voudrait 
Elle voudrait 
Nous voudrions
 Vous voudriez
Ils voudraient
Elles voudraient
Qui veut compléter la phrase avec le verbe « vouloir »  au conditionnel présent ? Levez la main. 
       Je  _______  acheter des œufs. 
Je  voudrais acheter des œufs. Qui veut expliquer la phrase ? 
Je voudrais acheter des œufs. 
Qui veut compléter la phrase avec le verbe « vouloir »  au conditionnel présent ? Levez la main. 
   Nous  _______  faire un gâteau. 
Nous voudrions faire un gâteau. Qui veut expliquer la phrase ? 
Nous voudrions faire un gâteau. 
Elles _______  aller à l’épicerie.
Qui veut compléter la phrase avec le verbe vouloir au conditionnel présent? Levez la main. 
Elles  voudraient aller à l’épicier du quartier. Qui veut expliquer la phrase ? 
Elles  voudraient aller à l’épicerie. 
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant prépare des activités écrites à réaliser par les élèves sur cahier. 
Remarque importante :
Prenez vos livrets à la page 17.
Sur votre livret, lisez silencieusement la conjugaison du verbe. Vous avez 1 minute. 

Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe.  
Acte de parole 1 : « parler des ingrédients d’une recette ». 
Plan de la séance 2
Utiliser le verbe « vouloir » au conditionnel présent.
Mots avec difficultés :  « s » qui se prononce « z ».
3.  Lecture
Maintenant, nous allons faire de la lecture.
On va apprendre différentes façons de lire la lettre « s ». Soyez attentifs..
s 
Lecture de la vidéo 
Lisez ces mots en silence.
maison     chose
organiser      raisin
Qui veut lire à voix haute ? 
maison     chose
organiser      raisin
Lisez ces phrases silencieusement. Après je vais diffuser une lecture audio. 
Notre classe organise un goûter collectif.
Nous prenons un kilo de raisins.
Il va apporter un gâteau fait à la maison.
il y a plein de bonnes choses à manger.
Lecture audio. 
Notre classe organise un goûter collectif.
Nous prenons un kilo de raisins.
Il va apporter un gâteau fait à la maison.
il y a plein de bonnes choses à manger.
Qui veut lire à voix haute ?
Notre classe organise un goûter collectif.
Nous prenons un kilo de raisins.
Il va apporter un gâteau fait à la maison.
il y a plein de bonnes choses à manger.
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant fait lire les élèves sur l’écran.
Remarque importante :
Prenez vos livrets à la page 15.

Lisez les mots et les phrases à votre voisin. Je vais passer entre les rangs pour vous aider. 

La séance d’aujourd’hui est terminée.  À la maison, relisez les mots et les phrases.   
',NULL,'','2026-02-26 10:45:45.774243','2026-02-26 10:45:45.774272',1);
INSERT INTO "raida_lesson" VALUES(3,'FR N5 P1 SEM2 S3','français','5','1','2','3','FR_N5_P1_SEM2_S3.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 6

Séance 5

Séance 2

Séance 4
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Lire et comprendre des phrases
Séance 3
Organisation de la semaine
 Distinguer et utiliser correctement « de la , du, de l’ et de ».
Lire et comprendre des phrases.
1.  Acte de parole
Acte de parole 2 : « parler des ingrédients d’une recette ». 
Plan de la séance 3
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons revoir la scène avec les mots du vocabulaire. 
Lecture de la vidéo 
Qui veut décrire l’image ? 
Maintenant, on passe à l’activité de l’oral. Nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo 
Répétons ensemble les questions de Majd et de Nada. 

Combien voudrais-tu de farine ?
Combien voudrais-tu de lait ?
Voici d’autres exemples. 

Combien voudrais-tu d’œufs ?
Combien voudrais-tu de sucre ?


Qui veut poser la question? 


Qui veut poser la question?
Maintenant nous allons apprendre à répondre à une question. Soyez attentifs. 
Lecture de la vidéo 
Répétons les réponses. 

Je voudrais un kilo de farine. 
Je voudrais un litre de lait.
Voici d’autres exemples. 

Je voudrais un pot de confiture. 
Je voudrais une boîte de sucre .
Je voudrais un paquet de levure.


Qui veut passer au tableau pour jouer la scène ?  Chacun donne un exemple différent.
 Combien voudrais-tu de __________?
Je voudrais
______________
Maintenant, tout le monde participe. Chacun joue le dialogue avec son voisin. Je vais passer entre les rangs pour vous aider.
 Combien voudrais-tu de ____________ ?
Je voudrais
______________
Acte de parole 2 : «  Reconnaitre  les ingrédients d’une recette ».
Lire et comprendre des phrases.
2.  Ecrit : Point de langue 
Distinguer et utiliser correctement « de la , du, de l’ et de ».
Plan de la séance 3
Maintenant, on va apprendre à parler des quantités en utilisant « du, de la et de l’ ». Soyez attentifs.  
du      de la    de l’
Lecture de la vidéo.
Lisons ensemble cette liste. 
Prenez vos ardoises.
Sur vos ardoises, écrivez le bon mot pour compléter la phrase. 
Je voudrais de l’eau.
Je voudrai un litre  ___ eau.
Levez les ardoises. 
Corrigez. 
Je voudrais de l’eau.
Je voudrai un litre  d’eau.
Sur vos ardoises, écrivez le mot qui manque. 
Tu  voudrais du beurre.
Tu voudrais cent grammes  ___ beurre.
Levez les ardoises. 
Corrigez. 
Tu  voudrais du beurre.
Tu voudrais cent grammes de beurre.
Salim voudrait un verre _____ jus.
Sur vos ardoises, écrivez le mot qui manque dans la phrase. 
Salim voudrait du jus.
Levez les ardoises. 
Corrigez. 
Salim voudrait un verre de jus.
Salim voudrait du jus.
Distinguer et utiliser correctement « de la , du, de l’ et de »..
 Acte de parole 2 : «  Reconnaitre  les ingrédients d’une recette ».

3.  Lecture
Lire et comprendre des phrases.
Plan de la séance 3
Maintenant, nous allons faire de la lecture.
Observez cette image et lisez la question. Je vais vous proposer des réponses.   
Que voudrait acheter Mouna ?
Mouna est dans l’épicerie.
Il y a de la farine.
Mouna va faire un gâteau.
Mouna voudrait acheter du lait.
Prenez vos ardoises.
Ecrivez le numéro de la bonne réponse sur votre ardoise (1, 2, 3 ou 4).  
Que voudrait acheter Mouna ?
Mouna est dans l’épicerie.
Il y a de la farine.
Mouna va faire un gâteau.
Mouna voudrait acheter du lait.
Levez vos ardoises. 
La bonne réponse est : Mouna voudrait acheter du lait. Qui veut lire et expliquer la réponse ? 
Que voudrait acheter Mouna ?
Mouna est dans l’épicerie.
Il y a de la farine.
Mouna va faire un gâteau.
Mouna voudrait acheter du lait.
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant prépare des activités écrites à réaliser par les élèves sur cahier. 
Remarque importante :
Prenez vos livrets à la page 15.   Avec votre voisin, vous allez lire et répondre aux questions de l’activité 4. Je vais circuler entre les rangs pour vous aider. 

Notez les devoirs à faire à la maison. Vous allez lire et recopier le dialogue de la page 15.  Vous allez aussi faire l’activité 2 de la page 17. 


La séance d’aujourd’hui est terminée. A bientôt.  ',NULL,'','2026-02-26 10:45:46.107564','2026-02-26 10:45:46.107591',1);
INSERT INTO "raida_lesson" VALUES(4,'FR N5 P1 SEM2 S4','français','5','1','2','4','FR_N5_P1_SEM2_S4.pptx','......','Séance 4

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 4
Texte : Fluidité et compréhension.
1.  Dialogue 
Jouer un dialogue reprenant l’acte de parole :  « Que veux-tu acheter pour ta recette? » « Combien voudrais-tu de _______? ». 
Plan de la séance 4
Bonjour les enfants !  La leçon de français commence maintenant. 
Aujourd’hui, nous allons apprendre un dialogue avec Majd et Nada. 
Lecture de la vidéo 
Nous allons écouter le dialogue une deuxième fois.
Lecture de la vidéo 
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. 
Maintenant, on va jouer ce dialogue. On va le faire en 3 étapes. Soyez attentifs. 


Etape 1

Etape 2

Etape 3
Etape 1. Je vais vous expliquer la situation.  
Situation : Le garçon et la fille se rencontrent au marché. Chacun demande à l’autre ce qu’il veut acheter pour sa recette. 


Etape 1

Etape 2

Etape 3
Etape 2.  Chacun réfléchis silencieusement à ce qu’il va dire dans le dialogue. Quels sont les ingrédients de sa recette ? 
Situation : Le garçon et la fille se rencontrent au marché. Chacun demande à l’autre ce qu’il veut acheter pour sa recette. 


Etape 1

Etape 2

Etape 3
Etape 3.  Maintenant, vous allez jouer le dialogue. Qui veut passer au tableau ? 


Etape 1

Etape 2

Etape 3
Maintenant, tout le monde participe. Jouez le dialogue avec votre voisin.
Jouer un dialogue reprenant l’acte de parole :  « Que veux-tu acheter pour ta recette? » « Combien voudrais-tu de _______? ». 
2.  Lecture
Texte : Fluidité et compréhension.
Plan de la séance 4 
Maintenant, on va faire de la lecture. On va lire des mots, puis un texte. 
C’est le mot : aujourd’hui.On va l’épeler ensemble : a – u –j –o – u – r – d – apostrophe –h –u - i.
Aujourd’hui 
chez
C’est le mot : chez. On va l’épeler ensemble : c –h – e - z.
Qui veut lire ? 
Aujourd’hui        chez 
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant fait lire les élèves sur l’écran. 
Remarque importante :
On va lire ensemble ce texte du livret. On va le découper en 3 parties. Après, vous allez le lire tout seuls. 

Lisez la première partie du texte silencieusement. Après je vais diffuser une lecture audio. 


Partie 1
Partie 2

Partie 3
Le goûter en classe
Aujourd’hui, notre classe organise un goûter collectif. Le maître va apporter des biscuits. Des élèves vont apporter de bons gâteaux faits à la maison. 

Partie 4
Lecture en cours. 


Partie 1
Partie 2

Partie 3

Partie 4
Qui veut lire le texte?


Partie 1
Partie 2

Partie 3

Partie 4
Le goûter en classe
Aujourd’hui, notre classe organise un goûter collectif. Le maître va apporter des biscuits. Des élèves vont apporter de bons gâteaux faits à la maison. 
On passe à la deuxième partie.  Lisez en silence. 


Partie 2
Partie 1

Partie 3

Partie 4
Yasmine voudrait acheter des pommes et du raisin. Karim voudrait partager du fromage. Et moi, je voudrais offrir des jus. 
Lecture audio. 


Partie 2
Partie 1

Partie 3

Partie 4
Qui veut lire le texte ?


Partie 2
Partie 1

Partie 3

Partie 4
Yasmine voudrait acheter des pommes et du raisin. Karim voudrait partager du fromage. Et moi, je voudrais offrir des jus. 
On passe à la troisième  partie.  Lisez en silence. 


Partie 1
Partie 2

Partie 3

Partie 4
Nous allons chez Rachid, l’épicier, pour acheter ce qu’il faut : nous prenons deux litres de jus, un kilo de pommes, un kilo de raisins et deux paquets de fromage. 
Nous payons l’épicier et nous allons à l’école, qui se trouve juste en face de l’épicerie de Rachid.
Lecture audio. 


Partie 1
Partie 2

Partie 3

Partie 4
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3

Partie 4
Nous allons chez Rachid, l’épicier, pour acheter ce qu’il faut : nous prenons deux litres de jus, un kilo de pommes, un kilo de raisins et deux paquets de fromage. 
Nous payons l’épicier et nous allons à l’école, qui se trouve juste en face de l’épicerie de Rachid.
On passe à la quatrième et dernière partie.  Lisez en silence. 


Partie 1
Partie 2

Partie 4

Partie 3
 En classe, tout le monde participe au grand goûter : sur la table, il y a plein de bonnes choses à manger. On se régale tous !
Lecture audio. 


Partie 1
Partie 2

Partie 4

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 4

Partie 3
 En classe, tout le monde participe au grand goûter : sur la table, il y a plein de bonnes choses à manger. On se régale tous !
Maintenant, on va essayer de comprendre le texte, partie par partie. Pour chaque partie du texte, on va suivre les mêmes étapes. 

Etape 1
Je lis en silence et j’essaie de comprendre le texte.

Etape 2
Je repère les mots difficiles et je demande à mon enseignant(e) de me les expliquer

Etape 3
Je lis la question, puis je cherche la réponse dans le texte. 


Lisez silencieusement le texte et essayez de la comprendre. 
Etape 1
Partie 1/3

Etape 2

Etape 3
Aujourd’hui, notre classe organise un goûter collectif. Le maître va apporter des biscuits. Des élèves vont apporter de bons gâteaux faits à la maison. 
Yasmine voudrait acheter des pommes et du raisin. Karim voudrait partager du fromage. Et moi, je voudrais offrir des jus. 

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 1/3
Etape 2

Etape 3
Aujourd’hui, notre classe organise un goûter collectif. Le maître va apporter des biscuits. Des élèves vont apporter de bons gâteaux faits à la maison. 
Yasmine voudrait acheter des pommes et du raisin. Karim voudrait partager du fromage. Et moi, je voudrais offrir des jus. 
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 1 : Que vont apporter les élèves avec eux? 

Etape 1
Partie 1/3

Etape 2

Etape 3
Aujourd’hui, notre classe organise un goûter collectif. Le maître va apporter des biscuits. Des élèves vont apporter de bons gâteaux faits à la maison. 
Yasmine voudrait acheter des pommes et du raisin. Karim voudrait partager du fromage. Et moi, je voudrais offrir des jus. 
La question est : Que vont apporter les élèves ?. Je cherche dans le texte ce qui va être apporté. La réponse est : Les élèves vont apporter de bons gâteaux.
Question 1 : Que vont apporter les élèves avec eux? 

Etape 1
Partie 1/3

Etape 2

Etape 3
Aujourd’hui, notre classe organise un goûter collectif. Le maître va apporter des biscuits. Des élèves vont apporter de bons gâteaux faits à la maison. 
Yasmine voudrait acheter des pommes et du raisin. Karim voudrait partager du fromage. Et moi, je voudrais offrir des jus. 

On passe à la deuxième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 2/3

Etape 2

Etape 3
Nous allons chez Rachid, l’épicier, pour acheter ce qu’il faut : nous prenons deux litres de jus, un kilo de pommes, un kilo de raisins et deux paquets de fromage. 
Nous payons l’épicier et nous allons à l’école, qui se trouve juste en face de l’épicerie de Rachid.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 2/3
Etape 2

Etape 3
Nous allons chez Rachid, l’épicier, pour acheter ce qu’il faut : nous prenons deux litres de jus, un kilo de pommes, un kilo de raisins et deux paquets de fromage. 
Nous payons l’épicier et nous allons à l’école, qui se trouve juste en face de l’épicerie de Rachid.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 2 : Où se trouve l’école ? 

Etape 1
Partie 2/3

Etape 2

Etape 3
Nous allons chez Rachid, l’épicier, pour acheter ce qu’il faut : nous prenons deux litres de jus, un kilo de pommes, un kilo de raisins et deux paquets de fromage. 
Nous payons l’épicier et nous allons à l’école, qui se trouve juste en face de l’épicerie de Rachid.
La question est « où ? ». Je cherche un lieu dans le texte. La réponse est : « L’école, se trouve juste en face de l’épicerie de Rachid ».. 

Etape 1
Partie 2/3

Etape 2

Etape 3
Question 2 : Où se trouve l’école ? 
Nous allons chez Rachid, l’épicier, pour acheter ce qu’il faut : nous prenons deux litres de jus, un kilo de pommes, un kilo de raisins et deux paquets de fromage. 
Nous payons l’épicier et nous allons à l’école, qui se trouve juste en face de l’épicerie de Rachid.

On passe à la troisième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 3/3

Etape 2

Etape 3
 En classe, tout le monde participe au grand goûter : sur la table, il y a plein de bonnes choses à manger. On se régale tous !

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 3/3
Etape 2

Etape 3
 En classe, tout le monde participe au grand goûter : sur la table, il y a plein de bonnes choses à manger. On se régale tous !
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 3 :  Qu’est ce qu’il y a sur la table ? 

Etape 1
Partie 3/3

Etape 2

Etape 3
 En classe, tout le monde participe au grand goûter : sur la table, il y a plein de bonnes choses à manger. On se régale tous !

Etape 1
Partie 3/3

Etape 2

Etape 3
La question est « qu’est-ce qu’il y a  sur la table? ». Je cherche un objet dans le texte. La réponse est : « sur la table, il y a plein de bonnes choses à manger ».
Question 3 :  Qu’est ce qu’il y a sur la table ? 
 En classe, tout le monde participe au grand goûter : sur la table, il y a plein de bonnes choses à manger. On se régale tous !
Prenez vos livrets à la page 16.

Lisez le texte à votre voisin puis changez les rôles.
La séance d’aujourd’hui est terminée. À la maison relisez le texte et répondez aux questions.


En cas d’indisponibilité du livret : chaque élève lit le texte à son voisin. ',NULL,'','2026-02-26 10:45:46.590216','2026-02-26 10:45:46.590243',1);
INSERT INTO "raida_lesson" VALUES(5,'FR N5 P1 SEM2 S5','français','5','1','2','5','FR_N5_P1_SEM2_S5.pptx','......','Séance 4




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 4

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 5
Oral –  Prise de parole
Ecriture – Texte 
Écrire un texte.
1.  Prise de parole
Prendre la parole pour parler de ses achats.
Plan de la séance 5
Bonjour les enfants !  La leçon de français commence maintenant.
Aujourd’hui nous allons apprendre à parler de nos achats. Écoutez bien.
Lecture de la vidéo 
À votre tour ! Qui veut passer au tableau pour prendre la parole ? 

Pour _______ [nom de la recette], 
je voudrais ____________ [ingrédients et quantités]. 
À votre tour ! Qui veut parler des ingrédients de sa recette. Chacun choisit un exemple différent. 
Prendre la parole pour parler de ses achats.
2.  Écriture 
Écrire un texte.
Plan de la séance  5 
Lisez et observez ce texte silencieusement. Après, on va faire une dictée. 
Pour préparer un gâteau d’anniversaire, je voudrais un kilo de farine, un litre de lait et cent grammes de chocolat.
Prenez vos cahiers. Tenez-vous prêts. La dictée va commencer avec un enregistrement audio. 
Dictée en cours. Première lecture.
Dictée en cours. Deuxième lecture. 
Je vais refaire la dictée. 


Corrigez. 
Pour préparer un gâteau d’anniversaire, je voudrais un kilo de farine, un litre de lait et cent grammes de chocolat.
Qui veut expliquer ce paragraphe dans sa langue ? 
Pour préparer un gâteau d’anniversaire, je voudrais un kilo de farine, un litre de lait et cent grammes de chocolat.
Maintenant, on apprendre à écrire un paragraphe semblable, avec « je voudrais ».
Je voudrais
Je commence par me poser une question : Qu’est-ce que je voudrais préparer ?Qui veut me donner des propositions ? Levez la main. 
Qu’est-ce que je voudrais préparer ?
Il y a plusieurs réponses possibles. Une réponse peut être : Une salade. 
Je voudrais préparer une salade.
Je me pose une autre question : J’irai où pour acheter les ingrédients ?Qui veut me donner des propositions ? Levez la main. 
J’irai où pour acheter les ingrédients ?
Il y a plusieurs réponses possibles. Une réponse peut être : J’irai au marché. 
Pour acheter les ingrédients, j’irai au marché. 
Je me pose une autre question :  Je voudrais acheter quoi au marché ? Qui veut me donner des propositions ? Levez la main. 
Je voudrais acheter quoi au marché ?
Il y a plusieurs réponses possibles. Une réponse peut être : je voudrais des tomates, des olives et de la laitue. 
Je voudrais des tomates, des olives et de la laitue.  
Maintenant, je peux écrire mon paragraphe complet. 
Pour préparer une salade, j’irai au marché pour acheter les ingrédients. Je voudrais des olives, des tomates et de la laitue. 
Retenez bien. Pour écrire le paragraphe, je me suis posé les questions suivantes : 
Je veux préparer quoi ? 
J’irai où pour acheter les  ingrédients ? 
Je voudrais acheter quoi ?
Prenez vos cahiers. Vous allez écrire un paragraphe en vous posant les mêmes questions.  Je vais circuler entre les rangs pour vous aider. 
Qui veut lire son paragraphe ? 
La séance d’aujourd’hui est terminée. À la maison, écrivez un autre paragraphe sur votre cahier.
','{"subject": "fran\u00e7ais", "level": "5", "period": "1", "week": "2", "session": "5", "objective": "Prendre la parole pour parler de ses achats et \u00e9crire un paragraphe sur les ingr\u00e9dients.", "steps": [{"name": "Oral \u2013 Prise de parole", "duration": "20min", "icon": "\ud83d\udde3\ufe0f", "content": "Les \u00e9l\u00e8ves prennent la parole pour parler de leurs achats en utilisant des phrases comme ''Je voudrais...'' et partagent leurs exemples au tableau."}, {"name": "Ecriture \u2013 Texte", "duration": "25min", "icon": "\ud83d\udcdd", "content": "Les \u00e9l\u00e8ves \u00e9crivent un paragraphe en se posant des questions sur ce qu''ils veulent pr\u00e9parer, o\u00f9 acheter les ingr\u00e9dients et ce qu''ils souhaitent acheter, puis partagent leurs \u00e9crits."}], "title": "FR N5 P1 SEM2 S5"}','','2026-02-26 10:45:46.784652','2026-02-26 23:12:35.103167',1);
INSERT INTO "raida_lesson" VALUES(6,'FR N5 P1 SEM2 S6','français','5','1','2','6','FR_N5_P1_SEM2_S6.pptx','......','



Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 5

Séance 4

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 6
Révision 
Lecture offerte
Lire un texte.
Écrire un paragraphe.
Répondre aux questions.
Histoire du cahier magique.
1. Révision
Plan de la séance 6
(ة)خاص بالأستاذ 

Au terme de cette séance de révision, l’enseignant doit vérifier qu’au moins 80% des élèves sont capables de : 
Lire et comprendre un texte.
Ecrire  un paragraphe.
Répondre spontanément à des questions sur le contenu de la semaine. 
* Si ce taux n’est pas atteint, il convient de mettre en place des actions de remédiation, collectives ou individuelles. 
Bonjour les enfants. Aujourd’hui, nous allons réviser les leçons de la semaine passée. Soyez attentifs.
Qui veut lire ce paragraphe ? 
 Ma mère est en train de faire les courses pour préparer le dîner. Elle a sorti la liste des ingrédients nécessaires pour sa recette de poulet au citron et aux herbes.
 Ma mère est en train de faire les courses pour préparer le dîner. Elle a sorti la liste des ingrédients nécessaires pour sa recette de poulet au citron et aux herbes.
Qui veut expliquer ce paragraphe dans sa langue ?  
Qui veut lire la question et y répondre en français ? 
Que fait la maman? 
Ma mère est en train de faire les courses pour préparer le dîner. Elle a sorti la liste des ingrédients nécessaires pour sa recette de poulet au citron et aux herbes.
La mère est en train de faire les courses pour préparer le dîner. 
Que fait la maman? 
Ma mère est en train de faire les courses pour préparer le dîner. Elle a sorti la liste des ingrédients nécessaires pour sa recette de poulet au citron et aux herbes.
Qui veut lire ce paragraphe ? 
Elle choisit soigneusement les meilleurs ingrédients : des citrons frais, des herbes aromatiques, des pommes de terre et bien sûr, du poulet de qualité. Elle vérifie les prix et les quantités, s''assurant de ne rien oublier
Qui veut expliquer ce paragraphe dans sa langue ? 
Elle choisit soigneusement les meilleurs ingrédients : des citrons frais, des herbes aromatiques, des pommes de terre et bien sûr, du poulet de qualité. Elle vérifie les prix et les quantités, s''assurant de ne rien oublier
Qui veut lire la question et y répondre en français ? 
Qu’est-ce qu’elle a acheté de  l’épicerie ?
Elle choisit soigneusement les meilleurs ingrédients : des citrons frais, des herbes aromatiques, des pommes de terre et bien sûr, du poulet de qualité. Elle vérifie les prix et les quantités, s''assurant de ne rien oublier
Elle a acheté des citrons frais, des herbes aromatiques, des pommes de terre et du poulet.
Qu’est-ce qu’elle a acheté de  l’épicerie ?
Elle choisit soigneusement les meilleurs ingrédients : des citrons frais, des herbes aromatiques, des pommes de terre et bien sûr, du poulet de qualité. Elle vérifie les prix et les quantités, s''assurant de ne rien oublier
Qui veut lire ce paragraphe ? 
Avec un sourire satisfait, elle met les achats dans son panier et se dirige vers la maison, prête à préparer un délicieux repas pour la famille.
Qui veut expliquer ce paragraphe dans sa langue ? 
Avec un sourire satisfait, elle met les achats dans son panier et se dirige vers la maison, prête à préparer un délicieux repas pour la famille.
Qui veut lire la question et y répondre en français ? 
Pourquoi la maman a fait des achats?
Avec un sourire satisfait, elle met les achats dans son panier et se dirige vers la maison, prête à préparer un délicieux repas pour la famille.
 Pour préparer un repas pour la famille.
Pourquoi la maman a fait des achats?
Avec un sourire satisfait, elle met les achats dans son panier et se dirige vers la maison, prête à préparer un délicieux repas pour la famille.
Prenez vos cahiers. Vous allez écrire un paragraphe pour parler de vos achats. 
Chacun va écrire un paragraphe différent, étape par étape, en suivant l’ordre de ces questions. Tenez-vous prêts.
D’abord, écrivez une phrase pour répondre à cette question : Je veux préparer quoi ? Vous pouvez parler d’une recette ou d’un repas. 
Qui veut lire sa phrase ?
On passe à la phrase suivante. Ecrivez une phrase pour répondre à cette question : J’irai où pour acheter les ingrédients ? Vous devez parler d’un lieu. 
Qui veut lire sa phrase ?
Enfin, écrivez une phrase pour répondre à cette question :  Je voudrais acheter quoi ? Vous devez parler des ingrédients ou des aliments que vous voulez acheter. 
Qui veut lire sa phrase ?
Maintenant, écrivez un paragraphe complet à partir de vos trois phrases. Vérifiez que vous avez bien répondu aux trois questions.  Je vais circuler entre les rangs.
Qui veut lire son paragraphe complet ?
Maintenant, c’est l’activité des questions en rafales. Je vais désigner des élèves au hasard pour répondre. Tenez-vous prêts. 
?
?
?

Comment ça va ? 
Comment ça va ?
?
Comment tu t’appelles?
Comment tu t’appelles?
?
Quel est ton prénom ?
Quel est ton prénom ?
?
Quel est ton nom ?
Quel est ton nom ?
?
Tu as quel âge ?
Tu as quel âge ?
?
Tu es en quelle classe ?
Tu es en quelle classe ?
?
Tu es à quelle école ?
Tu es à quelle école ?
?
Tu habites où ?
Tu habites où ?
?
Comment s’appelle ta maîtresse ou ton maître ?
Comment s’appelle ta maîtresse ou ton maître ?
?
Qu’est-ce que c’est ? 
Qu’est-ce que c’est ?
?
Qu’est-ce que je peux acheter ici ? 
Qu’est-ce que je peux acheter ici ?
?
Que va acheter Karim à l’épicerie ? 
Que va acheter Karim à l’épicerie ?
?
Pourquoi Karim a besoin de lait ? 
Pourquoi Karim a besoin de lait ?
?
Lire un texte.
Écrire des phrases.
Répondre aux questions.
Histoire du cahier magique.
2. Lecture offerte
Plan de la séance 6
Nous avons déjà vu le premier épisode de l’histoire Le secret de mon quartier. Qui veut nous rappeler ce qu’on a vu dans cet épisode ? 
On va  regarder  le premier épisode une nouvelle fois. Après, on verra le deuxième épisode. Soyez attentifs.
Lecture de la vidéo.
Maintenant, nous allons découvrir un nouvel épisode de l’histoire Le secret de mon quartier. Est-ce que vous êtes prêts ? Ecoutez bien. 
Lecture de la vidéo.
Nous allons écouter l’histoire une deuxième fois. Soyez attentifs.
Lecture de la vidéo.
Maintenant, je vais vous poser des questions. 
Est-ce que Yasmine a trouvé ce qu’elle voulait chez monsieur Abdallah ? 
Pourquoi Yasmine n’a rien trouvé ? 
Qui a acheté tout le sucre, tous les œufs et tout le chocolat ? 
À votre avis, que se passera-t-il au prochain épisode ?
A la maison, écrivez trois phrases que vous avez entendues dans Le secret du quartier. 
La séance d’aujourd’hui est terminée.  ',NULL,'','2026-02-26 10:45:47.037972','2026-02-26 10:45:47.037999',1);
INSERT INTO "raida_lesson" VALUES(7,'MATH N5 P1 SEM2 S1','mathématiques','5','1','2','1','MATH_N5_P1_SEM2_S1.pptx','......','
5 
الدرس 5 

2
1
أيقونات توجيهية
توجيهات الأستاذ (ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور إلى الشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
الدرس 5
الأعداد الصحيحة الطبيعية: الجداء
درس اليوم

الأعداد الصحيحة الطبيعية: الجداء
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
1
1
1
1
1
(ة)خاص بالأستاذ 

وضع وإنجاز عمليات ضرب عدد من 3 أرقام في عدد من رقمين أو 3 أرقام
مرحباً سنتابع درسا جديدا مع مجد وندى.
(ة)خاص بالأستاذ 
صححوا :
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
عرض فيديو الحساب الذهني 
صححوا :
(ة)خاص بالأستاذ 
الآن، سنتعلم كيف نضع وننجز عمليات ضرب عدد من 3 أرقام في عدد من رقمين أو من 3 أٌرقام.
عرض فيديو النمذجة
من يذكرنا بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا ألواحكم
 سنضع وننجز العملية الآتية باتباع نفس الخطوات.
247 × 123
ماذا نفعل في الخطوة الأولى؟ 
أضع
1
أضع نقطتين
3
أضع نقطة 
2
أحسب
4
247 × 123
خذوا الألواح .نضع العملية ونضرب وحدات العامل الثاني في أرقام العامل الأول.
أضع
1
أضع نقطتين
3
أضع نقطة 
2
أحسب
4
247 × 123
ارفعوا الألواح.
لنصحح. من يتقدم إلى السبورة ليشرح لنا كيف أنجز الخطوة الأولى؟
أضع
1
أضع نقطتين
3
أضع نقطة 
2
أحسب
4
ماذا نفعل في الخطوة الثانية؟ 
أضع 
1
أضع نقطتين
3
أضع نقطة
2
أحسب
4
خذوا الألواح. ضعوا نقطة ثم احسبوا جداء رقم عشرات العامل الثاني في أرقام العامل الأول.
أضع 
1
أضع نقطتين
3
أضع نقطة
2
أحسب
4
ارفعوا الألواح.
نصحح، من يتقدم إلى السبورة ليشرح لنا الخطوة الثانية؟
أضع 
1
أضع نقطتين
3
أضع نقطة
2
أحسب
4
ماذا نفعل في الخطوة الثالثة؟
أضع
1
أضع نقطتين
3
أضع نقطة
2
أحسب
4
خذوا الألواح .ضعوا نقطتين واضربوا رقم مئات العامل الثاني في أرقام العامل الأول.
أضع
1
أضع نقطتين
3
أضع نقطة
2
أحسب
4
ارفعوا الألواح.
صححوا. من يتقدم إلى السبورة ليشرح لنا كيف أنجز الخطوة الثالثة.
أضع
1
أضع نقطتين
3
أضع نقطة
2
أحسب
4
ماذا نفعل في الخطوة الرابعة؟
أضع
1
أضع نقطتين
3
أضع نقطة 
2
أحسب
4
خذوا الألواح .احسبوا مجموع الجداءات.
أضع
1
أضع نقطتين
3
أضع نقطة 
2
أحسب
4
ارفعوا الألواح.
نصحح. من يتقدم إلى السبورة ليشرح لنا كيف أنجز الخطوة الرابعة.
أضع
1
أضع نقطتين
3
أضع نقطة 
2
أحسب
4
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا الألواح. ضعوا وأنجزوا العملية التالية :
560 × 309
ارفعوا الألواح.
نصحح، من يتقدم ليشرح لنا الخطوات المتبعة.
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن، خذوا كراساتكم الصفحة 19.

لديكم دقيقتان للإنجاز، سأمر بين الصفوف لمساعدتكم.
كل واحد يقارن إنجازه بإنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات. 
صححوا ! 
+
+
(ة)خاص بالأستاذ 
خذوا الكراسات، الصفحة 19 وأنجزوا النشاط 4. لديكم 5 دقائق للإنجاز.
سأمر بين الصفوف لأقدم المساعدة وأدون ملاحظاتي في كراساتكم.

صححوا على كراساتكم ! 
+
+
+
انتبهوا جيدا ! في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم.
 في الحصة القادمة سأختار أحدكم لتصحيح النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة 
(ة)خاص بالأستاذ ',NULL,'','2026-02-26 10:45:47.308265','2026-02-26 10:45:47.308292',1);
INSERT INTO "raida_lesson" VALUES(8,'MATH N5 P1 SEM2 S2','mathématiques','5','1','2','2','MATH_N5_P1_SEM2_S2.pptx','......','5 
2
1


 الدرس 5

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
المضاعف المشترك الأصغر
الدرس 6
درس اليوم

المضاعف المشترك الأصغر
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

إيجاد المضاعف المشترك الأصغر لعددين صحيحين طبيعيين
(ة)خاص بالأستاذ 
خذوا الكراسة، الصفحة 19
 لديكم دقيقة واحدة. صححوا 

4
2
1
مرحباً، سنتابع درسا جديدا في الرياضيات مع مجد وندى.
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز هذه العمليات. دوّنوا النتيجة فقط في دفاتركم.
 لديكم دقيقة واحدة للتصحيح.
(ة)خاص بالأستاذ 
الآن، سنتعلم كيف نجد المضاعف المشترك الأصغر لعددين.
عرض فيديو النمذجة
من يذكرنا بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 
خذوا ألواحكم. سنجد المضاعف المشترك الأصغر للعددين 2 و4 باتباع نفس الخطوات.
ماذا نفعل في الخطوة الأولى؟ أوجدوا المضاعفات الأولى للعددين 2و4.
نصحح. من يقوم إلى السبورة ليشرح لنا كيف وجد المضاعفات الأولى للعددين.
ماذا نفعل في الخطوة الثانية؟ حددوا المضاعفات المشتركة للعددين 2 و4
نصحح. من يقوم إلى السبورة ليشرح لنا كيف حدد المضاعفات المشتركة
ماذا نفعل في الخطوة الثالثة؟ حددوا المضاعف المشترك الأصغر للعددين 2 و4
نصحح. من يقوم إلى السبورة ليشرح لنا كيف حدد المضاعف المشترك الأصغر. 
4


(ة)خاص بالأستاذ 
خذوا الألواح، أوجدوا المضاعف المشترك الأصغر للعددين 5 و6
5
6
5
ارفعوا الألواح
من يقوم ليشرح لنا كيف وجد النتيجة مذكرا بالخطوات؟ 
(ة)خاص بالأستاذ 
الآن، خذوا كراساتكم الصفحة 21.

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
(ة)خاص بالأستاذ 
خذوا الكراسات ، الصفحة21، وأنجزوا النشاط 4 لديكم 5 دقائق.
سأمر بين الصفوف لأقدم لكم المساعدة وأدون ملاحظاتي في كراساتكم.

صححوا على كراساتكم. 
انتبهوا جيدا !  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح التمارين المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:47.508314','2026-02-26 10:45:47.508342',1);
INSERT INTO "raida_lesson" VALUES(9,'MATH N5 P1 SEM2 S3','mathématiques','5','1','2','3','MATH_N5_P1_SEM2_S3.pptx','......','
5 
الدرس 5

2
1
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الأول
(ة)خاص بالأستاذ 
القاسم المشترك الأكبر
درس اليوم

القاسم المشترك الأكبر
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

إيجاد القاسم المشترك الأكبر لعددين صحيحين طبيعيين
(ة)خاص بالأستاذ 
1
مرحباً سنتابع درسا جديدا مع مجد وندى
 لديكم دقيقة واحدة. صححوا 
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
لديكم دقيقة واحدة لحل هذه العمليات. دوّنوا النتيجة فقط في دفاتركم.
صححوا .
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نجد القاسم المشترك الأكبر لعددين
عرض فيديو النمذجة.
من يذكرنا بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 
خذوا ألواحكم. سنجد القاسم المشترك الأكبر للعددين 6 و12 باتباع نفس الخطوات
ماذا نفعل في الخطوة الأولى؟ 
على الألواح ، اكتبوا قواسم العددين 6 و12
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف وجد قواسم العددين
ماذا نفعل في الخطوة الثانية؟ 
على الألواح ، اكتبوا القواسم المشتركة للعددين 6 و12
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف حدد القواسم المشتركة
ماذا نفعل في الخطوة الثالثة؟ 
اكتبوا القاسم المشترك الأكبر للعددين 6 و12 على الألواح
ارفعوا الألواح
من يقوم إلى السبورة ليشرح لنا الخطوة الثالثة؟ 
(ة)خاص بالأستاذ 
خذوا الألواح؛ جدوا القاسم المشترك الأكبر للعددين 16 و28
ارفعوا الألواح
نصحح، من يقوم ليشرح لنا كيف وجد النتيجة مذكرا بالخطوات؟ 
(ة)خاص بالأستاذ 
الآن خذوا كراساتكم الصفحة 23

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا.
صححوا.
(ة)خاص بالأستاذ 
خذوا الكراسات 23 وأنجزوا النشاط 4. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
(ة)خاص بالأستاذ 
اختتام الدرس
5
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم للتصحيح
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل.
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:47.672082','2026-02-26 10:45:47.672110',1);
INSERT INTO "raida_lesson" VALUES(10,'MATH N5 P1 SEM2 S4','mathématiques','5','1','2','4','MATH_N5_P1_SEM2_S4.pptx','......','5 
2
1
الدرس 1

2الدرس

3الدرس

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
الدرس 8
حل المسائل 
درس اليوم

حل المسائل
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

توظيف المضاعف المشترك الأصغر والقاسم المشترك الأكبر لحل المسائل
(ة)خاص بالأستاذ 
مرحباً سنتابع درسا جديدا في الرياضيات مع مجد وندى.
 لديكم دقيقة واحدة. صححوا. 
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
لديكم دقيقة واحدة لحساب هذه العمليات على السطر. دوّنوا النتيجة على دفاتركم.
 لديكم دقيقة واحدة للتصحيح.
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نحل مسألة بتوظيف المضاعف المشترك الأصغر والقاسم المشترك الأكبر. 
عرض فيديو النمذجة
من يذكرنا بما تعلمناه مع مجد وندى؟
1: أَقْرَأُ الْمَسْأَلَةَ وَأَتَخَيَّلُها؛

2: أَجِدُ المُضاعَفَ المُشْتَرَكَ الأَصْغَرَ أَوِ الْقاسِمَ المُشْتَرَكَ الْأَكْبَرَ لِلْعَدَدَيْنِ؛

3: أَحُلُّ الْمَسْأَلَةَ بِتوْظيفِ المُضاعَفِ المُشْتَرَكِ الأَصْغَرِ أَوِ الْقاسِمِ المُشْتَرَكِ الْأَكْبَرِ لِلْعَدَدَيْنِ.
(ة)خاص بالأستاذ 
.خذوا ألواحكم. سنحل مسألة باتباع نفس الخطوات
 ماذا نفعل في الخطوة الأولى؟ 
أقرأ المسألة
1
أحل
3
أجد المضاعف أو القاسم
2
تُريدُ أُمٌّ تَوْزيعَ 18 حَلْوى فَراوِلَةٍ وَ15 حَلْوى شوكولاتَةٍ في أَطْباقٍ،بِحَيْثُ يَكونُ في كُلِّ طَبَقٍ نَفْسُ العَدَدِ مِنْ نَوْعَيِ الحَلْوى مَعاً.
ما أَكْبَرُ عَدَدٍ مُمْكِنٍ مِنَ الأَطْباقِ الَّتي يُمْكِنُها إِعْدادُهُ؟
 اقرؤوا المسألة وتخيلوها لديكم دقيقة واحدة.
أقرأ المسألة
1
أحل
3
أجد المضاعف أو القاسم
2
تُريدُ أُمٌّ تَوْزيعَ 18 حَلْوى فَراوِلَةٍ وَ15 حَلْوى شوكولاتَةٍ في أَطْباقٍ،بِحَيْثُ يَكونُ في كُلِّ طَبَقٍ نَفْسُ العَدَدِ مِنْ نَوْعَيِ الحَلْوى مَعاً.
ما أَكْبَرُ عَدَدٍ مُمْكِنٍ مِنَ الأَطْباقِ الَّتي يُمْكِنُها إِعْدادُهُ؟
من يقول لنا ماذا فهم من المسألة وكيف تخيلها؟
أقرأ المسألة
1
أحل
3
أجد المضاعف أو القاسم
2
تُريدُ أُمٌّ تَوْزيعَ 18 حَلْوى فَراوِلَةٍ وَ15 حَلْوى شوكولاتَةٍ في أَطْباقٍ،بِحَيْثُ يَكونُ في كُلِّ طَبَقٍ نَفْسُ العَدَدِ مِنْ نَوْعَيِ الحَلْوى مَعاً.
ما أَكْبَرُ عَدَدٍ مُمْكِنٍ مِنَ الأَطْباقِ الَّتي يُمْكِنُها إِعْدادُهُ؟
ماذا نفعل في الخطوة الثانية؟ 
أقرأ المسألة
1
أحل
3
أجد القاسم
2
تُريدُ أُمٌّ تَوْزيعَ 18 حَلْوى فَراوِلَةٍ وَ15 حَلْوى شوكولاتَةٍ في أَطْباقٍ،بِحَيْثُ يَكونُ في كُلِّ طَبَقٍ نَفْسُ العَدَدِ مِنْ نَوْعَيِ الحَلْوى مَعاً.
ما أَكْبَرُ عَدَدٍ مُمْكِنٍ مِنَ الأَطْباقِ الَّتي يُمْكِنُها إِعْدادُهُ؟
اكتبوا القاسم المشترك الأكبر للعددين 18 و15 على الألواح.
أقرأ المسألة
1
أحل
3
أجد المضاعف أو القاسم
2
تُريدُ أُمٌّ تَوْزيعَ 18 حَلْوى فَراوِلَةٍ وَ15 حَلْوى شوكولاتَةٍ في أَطْباقٍ،بِحَيْثُ يَكونُ في كُلِّ طَبَقٍ نَفْسُ العَدَدِ مِنْ نَوْعَيِ الحَلْوى مَعاً.
ما أَكْبَرُ عَدَدٍ مُمْكِنٍ مِنَ الأَطْباقِ الَّتي يُمْكِنُها إِعْدادُهُ؟
ارفعوا الألواح.
نصحح. من يقوم إلى السبورة ليذكرنا بالخطوات لإيجاد القاسم المشترك الأكبر. 
أقرأ المسألة
1
أحل
3
أجد القاسم
2
تُريدُ أُمٌّ تَوْزيعَ 18 حَلْوى فَراوِلَةٍ وَ15 حَلْوى شوكولاتَةٍ في أَطْباقٍ،بِحَيْثُ يَكونُ في كُلِّ طَبَقٍ نَفْسُ العَدَدِ مِنْ نَوْعَيِ الحَلْوى مَعاً.
ما أَكْبَرُ عَدَدٍ مُمْكِنٍ مِنَ الأَطْباقِ الَّتي يُمْكِنُها إِعْدادُهُ؟
3
ماذا نفعل في الخطوة الثالثة؟ 
أقرأ المسألة
1
أحل
3
أجد المضاعف أو القاسم
2
تُريدُ أُمٌّ تَوْزيعَ 18 حَلْوى فَراوِلَةٍ وَ15 حَلْوى شوكولاتَةٍ في أَطْباقٍ،بِحَيْثُ يَكونُ في كُلِّ طَبَقٍ نَفْسُ العَدَدِ مِنْ نَوْعَيِ الحَلْوى مَعاً.
ما أَكْبَرُ عَدَدٍ مُمْكِنٍ مِنَ الأَطْباقِ الَّتي يُمْكِنُها إِعْدادُهُ؟
3
على الألواح، اكتبوا حل المسألة.
أقرأ المسألة
1
أحل
3
أجد المضاعف أو القاسم
2
تُريدُ أُمٌّ تَوْزيعَ 18 حَلْوى فَراوِلَةٍ وَ15 حَلْوى شوكولاتَةٍ في أَطْباقٍ،بِحَيْثُ يَكونُ في كُلِّ طَبَقٍ نَفْسُ العَدَدِ مِنْ نَوْعَيِ الحَلْوى مَعاً.
ما أَكْبَرُ عَدَدٍ مُمْكِنٍ مِنَ الأَطْباقِ الَّتي يُمْكِنُها إِعْدادُهُ؟
3
ارفعوا الألواح.
نصحح. من يقوم إلى السبورة ليكتب الحل.
أقرأ المسألة
1
أحل
3
أجد المضاعف أو القاسم
2
تُريدُ أُمٌّ تَوْزيعَ 18 حَلْوى فَراوِلَةٍ وَ15 حَلْوى شوكولاتَةٍ في أَطْباقٍ،بِحَيْثُ يَكونُ في كُلِّ طَبَقٍ نَفْسُ العَدَدِ مِنْ نَوْعَيِ الحَلْوى مَعاً.
ما أَكْبَرُ عَدَدٍ مُمْكِنٍ مِنَ الأَطْباقِ الَّتي يُمْكِنُها إِعْدادُهُ؟
3
3
3 أَطبَاقٍ، في كُلِّ طَبَقٍ 5 حَلَوِيَّاتٍ شُوكُولاتَةٍ و6 حَلَوِيَّاتٍ فَرَاوِلَةٍ
(ة)خاص بالأستاذ 
النشاط 1
النشاط 2
أنجزو التمرين رقم 2 صفحة 24

لديكم 4 دقائق  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا. 
(ة)خاص بالأستاذ 
 خذوا الكراسات ص:25 وأنجزوا النشاط 3 لديكم 5 دقائق
سأمر بين الصفوف لأقدم لكم المساعدة وأدون ملاحظاتي في كراساتكم.
صححوا على كراساتكم. 
(ة)خاص بالأستاذ 
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 

إلى اللقاء. في الحصة القادمة،
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:47.856576','2026-02-26 10:45:47.856602',1);
INSERT INTO "raida_lesson" VALUES(11,'MATH N5 P1 SEM2 S5','mathématiques','5','1','2','5','MATH_N5_P1_SEM2_S5.pptx','......','
5 
الدرس 5

2
1
أيقونات توجيهية
توجيهات الأستاذ (ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور إلى الشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين الصفوف
برمجة الأسبوع  الثاني
(ة)خاص بالأستاذ 
مراجعة
(ة)خاص بالأستاذ 
درس اليوم

مراجعة دروس الأسبوع

تدابير حصة مراجعة دروس الأسبوع
(ة)خاص بالأستاذ 
مراجعة كل درس تتم عبر المراحل التالية : 
رائز التحقق من الهدف الرئيسي للدرس
احتساب نسبة التحكم
أقل من 80%
أكثر من 80%
إعادة عرض شريط النمذجة 
المرور مباشرة إلى التدرب على الكراسة
إنجاز نشاط مراجعة الدرس على الكراسة
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 

وضع وإنجاز عملية ضرب لعددين صحيحين طبيعيين من 3 أرقام
إيجاد المضاعف المشترك الأصغر لعددين صحيحين طبيعيين
إيجاد القاسم المشترك الأكبر لعددين صحيحين طبيعيين
توظيف المضاعف المشترك الأصغر والقاسم المشترك الأكبر لحل المسائل

(ة)خاص بالأستاذ 
مرحباً يا أصدقاء. اليوم، سنراجع دروس الأسبوع.

صححوا، لديكم دقيقة واحدة.
5
8 وردات في كل باقة: 3 وردات حمراء و5 وردات بيضاء
(ة)خاص بالأستاذ 

تصحيح الواجبات المنزلية
 افتتاح الدرس
1
الحساب الذهني
سنمر الآن إلى الحساب الذهني. خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز المطلوب. دوّنوا النتيجة فقط في دفاتركم.
 لديكم دقيقة واحدة للتصحيح.
(ة)خاص بالأستاذ 

وضع وإنجاز عملية ضرب لعددين صحيحين طبيعيين من 3 أرقام
مراجعة الدرس 5
2
خذوا كراساتكم ، النشاط 1 الصفحة 26. ضعوا وأنجزوا هذه العملية على الألواح :

ارفعوا الألواح.
 من يتقدم إلى السبورة ليشرح لنا كيف وجد النتيجة ويذكرنا بالخطوات؟ 
486 × 53 = 25 758
+
فيديو نمذجة الدرس 5 
أكملوا  إنجاز النشاط رقم 1  على الكراسات.
486 × 53 = 25 758
 صححوا. 
486 × 53 = 25 758
726 × 143 = 103 818
(ة)خاص بالأستاذ 

إيجاد المضاعف المشترك الأصغر لعددين صحيحين طبيعيين
مراجعة الدرس 6
3
خذوا النشاط 2 وأوجدوا المضاعف المشترك الأصغر للعددين 8 و12.

ارفعوا الألواح.
 من يتقدم ليشرح لنا كيف وجد النتيجة ويذكرنا بالخطوات؟ 
فيديو نمذجة الدرس 6 
 أكملوا إنجاز النشاط رقم 2.
24
12 24 36  48 60 72 84 96 108          8   16  24 32 40  48 56 64 72
صححوا.
24
12 24 36  48 60 72 84 96 108            8   16  24 32 40 48  56  64 72
6   12  18 24 30 36 42 48 54             9   18  27 36 45  54  63 72
18
(ة)خاص بالأستاذ 

إيجاد القاسم المشترك الأكبر لعددين صحيحين طبيعيين
مراجعة الدرس 7
4
خذوا الألواح، أنجزوا النشاط 3.
ارفعوا الألواح.
 صححوا. من يتقدم إلى السبورة ليشرح كيف توصل إلى النتيجة الصحيحة؟
1; 2; 3; 4;        6       9; 12; 18;  36
1; 2; 3; 4; 6;   8  ; 12; 16; 24;  48
12







فيديو نمذجة الدرس 7 
خذوا الألواح، أوجدوا القاسم المشترك الأكبر للعددين 15 و21.
ارفعوا الألواح.
 صححوا. 
1;     3;                          7;    21
1;     3;                           5;   15
3


(ة)خاص بالأستاذ 

مراجعة الدرس 8
5
توظيف المضاعف المشترك الأصغر والقاسم المشترك الأكبر لحل المسائل.
خذوا الألواح، أنجزوا المسألة 1 من النشاط 4.

ارفعوا الألواح.
من يتقدم ليشرح لنا كيف وجد النتيجة ويذكرنا بالخطوات؟ 
سنوزع بالتساوي. لذلك سأبحث عن القاسم المشترك الأكبر للعددين 48 و72
القاسم المشترك الأكبر للعددين 48 و72 هو 24.
أكبر عدد من المحافظ التي يمكن للمؤسسة إعدادها هو 24.
فيديو نمذجة الدرس 8 
1

3
 أكملوا إنجاز النشاط رقم 4.
سنوزع بالتساوي. إذن سأبحث عن القاسم المشترك الأكبر للعددين 48 و72
القاسم المشترك الأكبر للعددين 48 و72 هو  24
أكبر عدد هو  24
صححوا.
سنوزع بالتساوي. إذن سأبحث عن القاسم المشترك الأكبر للعددين 48 و72
القاسم المشترك الأكبر للعددين 48 و72 هو  24
أكبر عدد هو  24
المضاعف المشترك الأصغر  للعددين 4 و60  هو 120.
ستعود الحافلتان معا إلى المحطة بعد  120 دقيقة.
(ة)خاص بالأستاذ 
اختتام الدرس
6
في المنزل، أنجزوا الأنشطة المتبقية الصفحتين 26 و27.

إلى اللقاء، في الحصة القادمة !',NULL,'','2026-02-26 10:45:48.134809','2026-02-26 10:45:48.134836',1);
INSERT INTO "raida_lesson" VALUES(12,'FR N5 P1 SEM3 S1','français','5','1','3','1','FR_N5_P1_SEM3_S1.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Oral – Dialogue
Lecture – texte  (fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 


Séance 1

Présentation du vocabulaire 
Exploitation du vocabulaire
Activités de vocabulaire sur livret
Organisation de la semaine
Description de la scène
Travail sur livret
Plan de la séance
1.  Présentation du vocabulaire
Le voisin - Connaître - Grand  - Gentil - Rencontrer- Poli 
Maigre - Sympa - Gros - Méchant - Depuis longtemps- Joli
Bonjour les enfants !  La leçon de français commence maintenant.  Soyez attentifs. 
Lecture de la vidéo.
Lecture de la vidéo.
Qui veut répéter ?
Le voisin
Lecture de la vidéo.
Qui veut répéter ?
Grand
Lecture de la vidéo.
Qui veut répéter ?
Gentil
Lecture de la vidéo.
Qui veut répéter ?
Rencontrer
Lecture de la vidéo.
Qui veut répéter ?
Poli


Lecture de la vidéo.

Répétons ensemble : Le voisin - Grand- Gentil - Rencontrer- Poli.
Le voisin
Rencontrer
Poli
Gentil
Grand
Maintenant, on va apprendre d’autres mots avec Majd.
Lecture de la vidéo.
Qui veut répéter ?
Maigre
Lecture de la vidéo.
Qui veut répéter ?
Gros

Gros est le contraire de maigre.  
≠

Gros
Maigre
Lecture de la vidéo.
Qui veut répéter ?
Sympa
Lecture de la vidéo.
Qui veut répéter ?
Méchant

Gentil est le contraire de méchant.  
≠

Gentil
Méchant
Lecture de la vidéo.
Vidéo de:
 Depuis longtemps
Qui veut répéter ?
Depuis longtemps
Lecture de la vidéo.
Qui veut répéter ?
Joli
Lecture de la vidéo.
Répétons ensemble :  Maigre- Sympa- Gros- Méchant - Depuis longtemps – Joli.
Maigre
Joli
Sympa
Méchant
Depuis longtemps
Gros
Prenez vos ardoises. 
Ecrivez le numéro du mot « Gentil».
Ecrivez le numéro du mot « Grand ».
Ecrivez le numéro du mot « Poli ».
Ecrivez le numéro du mot « Le voisin ».
Rangez vos ardoises. 
Qui veut nommer l’image ? Montrer une image à nommer
Qui veut nommer l’image ? Montrer une image à nommer
Qui veut nommer l’image ? Montrer une image à nommer
Qui veut nommer l’image ? Montrer une image à nommer
Activités  sur livret
Plan de la séance
2.  Exploitation du vocabulaire
Description de la scène. 
Le voisin - Connaître - Grand  - Gentil - Rencontrer- Poli 
Maigre - Sympa - Gros - Méchant - Depuis longtemps- Joli
Observez cette scène pendant 30 secondes. Il y a des images déjà vues aujourd’hui. 
Majd va nous montrer comment décrire l’image. Soyez attentifs !
Lecture de la vidéo.
Lecture de la vidéo.
Soyez attentifs. Majd va décrire l’image une deuxième fois. 
Lecture de la vidéo.
Maintenant, je vais vous poser des questions.
Qui est-ce ?

Comment est le chien du voisin ?

Comment est Sami ?

Comment est Kamal ?

Maintenant, c’est à vous. Qui veut décrire la scène comme Majd ?
Exploitation du vocabulaire 
Plan de la séance
3.  Activités de vocabulaire  sur livret
Activités sur livret
Le voisin - Connaître - Grand  - Gentil - Rencontrer- Poli 
Maigre - Sympa - Gros - Méchant - Depuis longtemps- Joli
Ouvrez le livret à la page 18.  Vous allez faire cette activité à l’oral avec votre camarade. 

À tour de rôle : l’un montre une image, l’autre dit le mot. Je passe entre les rangs pour vous aider.

Je montre l’image

1

Je dis le mot

2

La séance d’aujourd’hui est terminée. À la maison, faites les activités 1 et 2 sur le livret.Vous devez écrire les mots du vocabulaire. 
',NULL,'','2026-02-26 10:45:48.386711','2026-02-26 10:45:48.386738',1);
INSERT INTO "raida_lesson" VALUES(13,'FR N5 P1 SEM3 S2','français','5','1','3','2','FR_N5_P1_SEM3_S2.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 6

Séance 3

Séance 5

Séance 4

Séance 1
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Présentation du vocabulaire 
Exploitation du vocabulaire
Travail sur livret
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral –  Prise de parole
Ecriture – Texte  

Oral – Dialogue
Lecture - Lettre a - A
Ecriture - Lettre a - A

Séance 2

Oral – Acte de parole 1
Ecriture – Point de langue 1
Lecture – Mots avec difficultés 
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 2


Le pronom « qui ».
Mots avec difficultés :  lire des mots avec « il ».
Acte de parole 1 : « Parler de mes voisins ». 
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs !
Avant de commencer nous allons corriger les activités de vocabulaire.

Corrigez sur votre livret. Répétons ensemble ces mots. 
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. Soyez attentifs. 
Lecture de la vidéo 
Maintenant, on va poser la question comme Majd et Nada. Répétons ensemble. 
Qui est-ce ? 

 Qui est-ce ?  
Qui veut poser la question et l’expliquer dans sa langue ? 
Maintenant nous allons apprendre à répondre à la question.
Lecture de la vidéo 
Maintenant, on va répondre à la question comme Majd et Nada. Répétons ensemble. 
C’est le voisin qui habite en face.
C’est la voisine qui habite à côté du parc.
Voici d’autres exemples.  
C’est mon cousin qui habite à la campagne.
C’est mon amie qui joue avec moi au parc.
Qui veut passer au tableau pour jouer la scène ?  Chacun choisit un exemple différent. 

C’est ________
qui ___________ .

Qui est-ce ?
Chacun joue le dialogue avec son voisin. 
C’est ________
qui ___________

Qui est-ce ?
Acte de parole 1 : « parler de mes voisins ». 
Mots avec difficultés :  lire des mots avec « il  ».
Plan de la séance 2
Le pronom « qui ».
2.  Écrit : Point de langue
Le pronom  qui 
Nous allons apprendre à relier deux phrases en utilisant le pronom qui.
Lecture de la vidéo.              
Je retiens:
Qui veut relier ces deux phrases en utilisant le pronom qui ? Levez la main. 
C’est ma voisine. 
Ma voisine habite à Rabat.
_________________________________ .
C’est ma voisine qui habite à Rabat . Qui veut expliquer la phrase ? 
C’est ma voisine. 
Ma voisine habite à Rabat.
C’est ma voisine qui habite à Rabat .
Qui veut relier ces deux phrases en utilisant le pronom qui ? Levez la main. 
C’est mon ami. 
Mon ami habite à côté de l’école.
_________________________________ .
C’est mon ami qui habite à côté de l’école. Qui veut expliquer la phrase ? 
C’est mon ami. 
Mon ami habite à côté de l’école.
C’est mon ami qui habite à côté de l’école.
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant prépare des activités écrites à réaliser par les élèves sur cahier. 
Remarque importante :
Prenez vos livrets à la page 22.

Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe. 
C’est ma voisine qui joue avec moi.
C’est mon ami qui va à l’école à pied.
 Acte de parole 1 : « parler de mes voisins ». 

Plan de la séance 2
Le pronom qui.
Mots avec difficultés : lire des mots avec « il ».
3.  Lecture
Maintenant, nous allons faire de la lecture.
On va apprendre différentes façons de lire « il ». Soyez attentifs..
il
Lecture de la vidéo 
Lisez ces mots en silence.
gentil       outil      fusil
Qui veut lire à voix haute ? 
gentil       outil      fusil
Lisez ces phrases silencieusement. Après je vais diffuser une lecture audio. 
Le voisin s’appelle Karim.
C’est un homme grand et souriant.
Il salue les enfants qui vont à l’école.
Mon voisin est gentil.
Lecture audio. 
Le voisin s’appelle Karim.
C’est un homme grand et souriant.
Il salue les enfants qui vont à l’école.
Mon voisin est gentil.
Qui veut lire à voix haute ?
Le voisin s’appelle Karim.
C’est un homme grand et souriant.
Il salue les enfants qui vont à l’école.
Mon voisin est gentil.
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant fait lire les élèves sur l’écran.
Remarque importante :
Prenez vos livrets à la page 20.

Lisez les mots et les phrases à votre voisin. Je vais passer entre les rangs pour vous aider. 

La séance d’aujourd’hui est terminée.  À la maison, relisez les mots et les phrases.   
',NULL,'','2026-02-26 10:45:48.728639','2026-02-26 10:45:48.728665',1);
INSERT INTO "raida_lesson" VALUES(14,'FR N5 P1 SEM3 S3','français','5','1','3','3','FR_N5_P1_SEM3_S3.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2

Séance 4
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – lecture phrase
Séance 3
Organisation de la semaine
L’accord des adjectifs qualificatifs.
Lire et comprendre des phrases.
1.  Acte de parole
Acte de parole 2 : « Parler de mes voisins». 
Plan de la séance 3
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons revoir la scène avec les mots du vocabulaire. 
Lecture de la vidéo 
Qui veut décrire l’image ? 
Maintenant, on passe à l’activité de l’oral. Nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo 
Répétons ensemble les questions de Majd et de Nada. 

Comment est ton voisin ?
Comment est ta voisine ?
Voici d’autres exemples. 

Comment est ton frère ?
Comment est ton amie ?


Qui veut poser la question? 


Qui veut poser la question?
Maintenant nous allons apprendre à répondre à une question. Soyez attentifs. 
Lecture de la vidéo 
Répétons les réponses. 

Mon voisin est très gentil. 
Ma voisine est polie.
Voici d’autres exemples. 

Mon ami est  sympa. 
Ma sœur est jolie.

Qui veut passer au tableau pour jouer la scène ?  Chacun donne un exemple différent.
 Comment est __________?
_________ est
______________
Maintenant, tout le monde participe. Chacun joue le dialogue avec son voisin. Je vais passer entre les rangs pour vous aider.
 Comment est __________?
_________  est
______________
Acte de parole 2 : «  Parler de mes voisins».
Lire et comprendre des phrases.
2.  Ecrit : Point de langue 
L’accord des adjectifs qualificatifs.
Plan de la séance 3
Maintenant, nous allons apprendre à utiliser les adjectifs qualificatifs pour dire comment sont des personnes et des choses.
L’accord des adjectifs qualificatifs
Lecture de la vidéo.
Lisons ensemble ces exemples. Soyez attentifs.
Prenez vos ardoises.
Sur vos ardoises, complétez la phrase avec le bon adjectif.
La maison est __________________ .
grand 
grande
Levez les ardoises. 
Corrigez. 
La maison est grande .
grand 
grande
Le chien est __________________ .
méchant 
méchante
Sur vos ardoises, complétez la phrase avec le bon adjectif.
Levez les ardoises. 
Corrigez. 
Le chien est __________________ .
méchant 
méchante
Les chats sont __________________ .
jolis 
joli
Sur vos ardoises, complétez la phrase avec le bon adjectif.
Levez les ardoises. 
Corrigez. 
Les chats sont jolis.
jolis 
joli
L’accord des adjectifs qualificatifs.
 Acte de parole 2 : «  parler de mes voisins ».

3.  Lecture
Lire et comprendre des phrases.
Plan de la séance 3
Maintenant, nous allons faire de la lecture.
Observez cette image et lisez la question. Je vais vous proposer des réponses.   
Comment est ta voisine Nada ?
Nada est méchante.
Nada habite à côté du parc.
Nada est grande.
Nada est gentille.
Prenez vos ardoises.
Ecrivez le numéro de la bonne réponse sur votre ardoise (1, 2, 3 ou 4).  
Comment est ta voisine Nada ?
Nada est méchante.
Nada habite à côté du parc.
Nada est grande.
Nada est gentille.
Levez vos ardoises. 
La bonne réponse est : Nada est gentille. Qui veut lire et expliquer la réponse ? 
Comment est ta voisine Nada ?
Nada est méchante.
Nada habite à côté du parc.
Nada est grande.
Nada est gentille.
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant prépare des activités écrites à réaliser par les élèves sur cahier. 
Remarque importante :
Prenez vos livrets à la page 20.   Avec votre voisin, vous allez lire et répondre aux questions de l’activité 4. Je vais circuler entre les rangs pour vous aider. 

Notez les devoirs à faire à la maison. Vous allez lire et recopier le dialogue de la page 20.  Vous allez aussi faire l’activité 1 de la page 22. 


La séance d’aujourd’hui est terminée. A bientôt.  ',NULL,'','2026-02-26 10:45:48.936515','2026-02-26 10:45:48.936542',1);
INSERT INTO "raida_lesson" VALUES(15,'FR N5 P1 SEM3 S4','français','5','1','3','4','FR_N5_P1_SEM3_S4.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 4
Texte : Fluidité et compréhension.
1.  Dialogue 
Jouer un dialogue reprenant l’acte de parole :  
       « Comment est ton voisin ? ». 
Plan de la séance 4
Bonjour les enfants !  La leçon de français commence maintenant. 
Aujourd’hui, nous allons apprendre un dialogue avec Majd et Nada. 
Lecture de la vidéo 
Nous allons écouter le dialogue une deuxième fois.
Lecture de la vidéo 
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. 
On continue à répéter ensemble le dialogue. 
Maintenant, on va jouer ce dialogue. On va le faire en 3 étapes. Soyez attentifs. 


Etape 1

Etape 2

Etape 3
Etape 1. Je vais vous expliquer la situation.  
Situation : Le garçon et la fille se rencontrent au parc. Chacun demande à l’autre comment est son voisin ou sa voisine. 


Etape 1

Etape 2

Etape 3
Etape 2.  Chacun réfléchit silencieusement à ce qu’il va dire dans le dialogue.  Comment est son voisin ?  Comment est sa voisine ?


Etape 1

Etape 2

Etape 3
Situation : Le garçon et la fille se rencontrent au parc. Chacun demande à l’autre comment est son voisin ou sa voisine. 
Etape 3.  Maintenant, vous allez jouer le dialogue. Qui veut passer au tableau ? 


Etape 1

Etape 2

Etape 3
Maintenant, tout le monde participe. Jouez le dialogue avec votre voisin.
Jouer un dialogue reprenant l’acte de parole :  
      « Comment est ton voisin ? »
2.  Lecture
Texte : Fluidité et compréhension.
Plan de la séance 4 
Maintenant, on va faire de la lecture. On va lire des mots, puis un texte. 
C’est le mot : toujours.On va l’épeler ensemble : t – o – u – j – o – u – r - s.
toujours 
aussi 
C’est le mot : aussi. On va l’épeler ensemble : a –u – s – s - i.
Qui veut lire ? 
toujours        aussi 
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant fait lire les élèves sur l’écran. 
Remarque importante :
On va lire ensemble ce texte du livret. On va le découper en 3 parties. Après, vous allez le lire tout seuls. 

Lisez la première partie du texte silencieusement. Après je vais diffuser une lecture audio. 


Partie 1
Partie 2

Partie 3
Le gentil voisin

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Karim. C’est un homme grand et souriant. Il parle toujours avec gentillesse.
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte?


Partie 1
Partie 2

Partie 3
Le gentil voisin

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Karim. C’est un homme grand et souriant. Il parle toujours avec gentillesse.
On passe à la deuxième partie.  Lisez en silence. 

Le matin, il salue les enfants qui vont à l’école. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de ma maman, qui était fatiguée après le marché.


Partie 2
Partie 1

Partie 3
Lecture audio. 


Partie 2
Partie 1

Partie 3
Qui veut lire le texte ?

Le matin, il salue les enfants qui vont à l’école. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de ma maman, qui était fatiguée après le marché.


Partie 2
Partie 1

Partie 3
On passe à la troisième  partie.  Lisez en silence. 


Partie 1
Partie 2

Partie 3

Monsieur Karim a un jardin derrière notre immeuble. Il invite parfois les voisins à boire du thé avec lui. Tout le monde dit que c’est un voisin gentil et serviable, un homme qui aide les gens.
Lecture audio. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3

Monsieur Karim a un jardin derrière notre immeuble. Il invite parfois les voisins à boire du thé avec lui. Tout le monde dit que c’est un voisin gentil et serviable, un homme qui aide les gens.
Maintenant, on va essayer de comprendre le texte, partie par partie. Pour chaque partie du texte, on va suivre les mêmes étapes. 

Etape 1
Je lis en silence et j’essaie de comprendre le texte.

Etape 2
Je repère les mots difficiles et je demande à mon enseignant(e) de me les expliquer

Etape 3
Je lis la question, puis je cherche la réponse dans le texte. 


Lisez silencieusement le texte et essayez de le comprendre. 
Etape 1
Partie 1/3

Etape 2

Etape 3
Le gentil voisin

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Karim. C’est un homme grand et souriant. Il parle toujours avec gentillesse.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 1/3
Etape 2

Etape 3
Le gentil voisin

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Karim. C’est un homme grand et souriant. Il parle toujours avec gentillesse.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 1 : Comment est le voisin ? 

Etape 1
Partie 1/3

Etape 2

Etape 3
Le gentil voisin

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Karim. C’est un homme grand et souriant. Il parle toujours avec gentillesse.
La question est : Comment est le voisin ? Je cherche dans le texte une description. La réponse est : le voisin est gentil, grand et souriant.

Etape 1
Partie 1/3

Etape 2

Etape 3
Question 1 : Comment est le voisin ? 
Le gentil voisin

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Karim. C’est un homme grand et souriant. Il parle toujours avec gentillesse.

On passe à la deuxième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 2/3

Etape 2

Etape 3
Le matin, il salue les enfants qui vont à l’école. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de ma maman, qui était fatiguée après le marché.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 2/3
Etape 2

Etape 3
Le matin, il salue les enfants qui vont à l’école. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de ma maman, qui était fatiguée après le marché.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 2 : Comment  était la maman ? 

Etape 1
Partie 2/3

Etape 2

Etape 3
Le matin, il salue les enfants qui vont à l’école. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de ma maman, qui était fatiguée après le marché.
La question est « comment ? ». Je cherche une description dans le texte. La réponse est : « La maman était fatiguée ». 

Etape 1
Partie 2/3

Etape 2

Etape 3
Question 2 : Comment  était la maman ? 
Le matin, il salue les enfants qui vont à l’école. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de ma maman, qui était fatiguée après le marché.

On passe à la troisième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 3/3

Etape 2

Etape 3
 Monsieur Karim a un jardin derrière notre immeuble. Il invite parfois les voisins à boire du thé avec lui. Tout le monde dit que c’est un voisin gentil et serviable, un homme qui aide les gens.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 3/3
Etape 2

Etape 3
Monsieur Karim a un jardin derrière notre immeuble. Il invite parfois les voisins à boire du thé avec lui. Tout le monde dit que c’est un voisin gentil et serviable, un homme qui aide les gens.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 3 :  Que boivent les voisins avec Karim ? 

Etape 1
Partie 3/3

Etape 2

Etape 3
Monsieur Karim a un jardin derrière notre immeuble. Il invite parfois les voisins à boire du thé avec lui. Tout le monde dit que c’est un voisin gentil et serviable, un homme qui aide les gens.

Etape 1
Partie 3/3

Etape 2

Etape 3
La question est « Que boivent ? ». Je cherche une boisson dans le texte. La réponse est : « les voisins boivent du thé ».
Question 3 :  Que boivent les voisins avec Karim ? 
Monsieur Karim a un jardin derrière notre immeuble. Il invite parfois les voisins à boire du thé avec lui. Tout le monde dit que c’est un voisin gentil et serviable, un homme qui aide les gens.
Prenez vos livrets à la page 21.

Lisez le texte à votre voisin puis changez les rôles.
La séance d’aujourd’hui est terminée. À la maison relisez le texte et répondez aux questions.


En cas d’indisponibilité du livret : chaque élève lit le texte à son voisin. ',NULL,'','2026-02-26 10:45:49.226159','2026-02-26 10:45:49.226186',1);
INSERT INTO "raida_lesson" VALUES(16,'FR N5 P1 SEM3 S5','français','5','1','3','5','FR_N5_P1_SEM3_S5.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 4

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 5
Oral –  Prise de parole
Ecriture – Texte 
Écrire un texte.
1.  Prise de parole
Prendre la parole pour parler d’un voisin.
Plan de la séance 5
Bonjour les enfants !  La leçon de français commence maintenant.
Aujourd’hui nous allons apprendre à parler d’un voisin ou d’une voisine. Écoutez bien.
Lecture de la vidéo 
À votre tour ! Qui veut passer au tableau pour prendre la parole ? 

C’est ______ [ une personne] qui habite _________ [ un lieu]. 
Mon voisin est _____ [description]  et  _____  [description].
Maintenant, tout le monde participe. Chacun parle de son voisin ou de sa voisine.
Prendre la parole pour parler d’un voisin.
2.  Écriture 
Écrire un texte.
Plan de la séance  5 
Lisez et observez ce texte silencieusement. Après, on va faire une dictée. 
J’ai un voisin qui s’appelle Jalil. Il habite à côté de la pharmacie. Il est très sympa et il aime aider les gens.
Prenez vos cahiers. Tenez-vous prêts. La dictée va commencer avec un enregistrement audio. 
Dictée en cours. Première lecture.
Dictée en cours. Deuxième lecture. 
Je vais refaire la dictée. 

Corrigez. 
J’ai un voisin qui s’appelle Jalil. Il habite à côté de la pharmacie. Il est très sympa et il aime aider les gens.
Qui veut expliquer ce paragraphe dans votre langue ? 
J’ai un voisin qui s’appelle Jalil. Il habite à côté de la pharmacie. Il est très sympa et il aime aider les gens.
Maintenant, on va apprendre à écrire un paragraphe semblable, avec le verbe j’ai.
J’ai
Je commence par me poser une question : J’ai qui ?  Qui veut me donner des propositions ? Levez la main. 
J’ai qui ?
Il y a plusieurs réponses possibles. Une réponse peut être : j’ai un voisin. Mais je peux dire aussi : j’ai une voisine, j’ai des voisins, j’ai un ami…
J’ai un voisin.
Après, je me pose une autre question : comment il s’appelle? Qui veut me donner des propositions ? Levez la main.  
Comment il s’appelle?
Une réponse peut être : j’ai un voisin qui s’appelle Ali. Mais je peux dire aussi : j’ai une voisine qui s’appelle Salma…
J’ai un voisin qui s’appelle Ali. 
Ensuite, je me pose une autre question. Comment est le voisin Ali ? Qui veut me donner des propositions ? Levez la main. 
Comment  est le voisin Ali ?  
Une réponse peut être : J’ai un voisin qui s’appelle Ali. Il est très gentil.  Mais je peux aussi dire : il est très serviable, il est très poli...
J’ai un voisin qui s’appelle Ali. Il est très gentil. 
Je me pose une dernière question : Qu’est ce qu’il aime faire ?  Qui veut me donner des propositions ? Levez la main.
Qu’est ce qu’il aime faire? 
Je peux dire : Il aime aider les voisins à porter des sacs lourds. Mais je peux aussi dire : lI aime inviter ses voisins à boire du thé.
J’ai un voisin qui s’appelle Ali. Il est très gentil. Il aime aider ses voisins à porter des sacs lourds. 
Maintenant, je peux écrire mon paragraphe complet.
 J’ai un voisin qui s’appelle Ali. Il est très gentil. Il aime aider ses voisins à porter des sacs lourds. 
Retenez bien. Pour écrire le paragraphe, je me suis posé les questions suivantes : 
J’ai qui ? 
Il s’appelle comment ? 
Comment il est ? 
Qu’est ce qu’il aime faire? 
Prenez vos cahiers. Vous allez écrire un paragraphe en vous posant les mêmes questions.  Je vais circuler entre les rangs pour vous aider. 
J’ai qui ? 
Il s’appelle comment ? 
Comment il est ? 
Qu’est ce qu’il aime faire? 
Qui veut lire son paragraphe ? 
La séance d’aujourd’hui est terminée. À la maison, écrivez un autre paragraphe sur votre cahier.
',NULL,'','2026-02-26 10:45:49.439147','2026-02-26 10:45:49.439175',1);
INSERT INTO "raida_lesson" VALUES(17,'FR N5 P1 SEM3 S6','français','5','1','3','6','FR_N5_P1_SEM3_S6.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 5

Séance 4

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 6
Révision 
Lecture offerte
Vocabulaire.
Lire un texte.
Écrire un paragraphe.
Répondre à des questions en rafales. 
Histoire : Le secret du quartier.
1. Révision
Plan de la séance 6
(ة)خاص بالأستاذ 

Au terme de cette séance de révision, l’enseignant doit vérifier qu’au moins 80% des élèves sont capables de : 
Reconnaitre les mots de vocabulaire.
Lire et comprendre un texte.
Ecrire un paragraphe.
Répondre spontanément à des questions sur le contenu de la semaine. 
* Si ce taux n’est pas atteint, il convient de mettre en place des actions de remédiation, collectives ou individuelles. 
Bonjour les enfants. Aujourd’hui, nous allons réviser les leçons de la semaine passée. Soyez attentifs.
Répétons ensemble :  L’épicerie – La banque – La poste – La boulangerie –                       Le quartier – En face 
Répétons ensemble : À  gauche - À droite – Derrière - Devant– À côté - Loin.
Répétons ensemble :  La recette - Un litre – Un kilo – Cent grammes – Le beurre  - La farine. 
Un litre
La recette
Cent grammes
Le beurre 
La farine
Un kilo
Répétons ensemble : le chocolat – le sucre  - Un sachet de levure - Le lait - La confiture- des œufs.
La confiture
Le lait
Des œufs 
Le sucre
Le chocolat
Un sachet de levure
Nous allons jouer au jeu des mots invisibles. 
Jeu des mots invisibles. 
Répétons ensemble : Le voisin - Grand- Gentil - Rencontrer- Poli.
Le voisin
Rencontrer
Poli
Grand
Gentil
Observez bien les images. Je vais masquer deux images. Qui veut expliquer la consigne en arabe ? 
Le voisin
Rencontrer
Poli
Grand
Gentil
Quelles sont les images qui manquent ?
Le voisin
Poli
Gentil
?
?
Les deux images qui manquent sont: Grand et rencontrer.
Le voisin
Rencontrer
Poli
Grand
Gentil


Nous allons jouer au jeu des mots qui bougent. 
Jeu des mots qui bougent 
Répétons ensemble : Maigre- Sympa- Gros- Méchant - Depuis longtemps – Joli.
Depuis longtemps
Gros
Joli
Maigre
Méchant
Sympa
Observez bien. Je vais faire bouger 2 mots. Qui veut expliquer la consigne en arabe ? 
Quels sont les 2 mots qui ont bougé ? 
Les deux mots qui ont bougé sont : Sympa  et Depuis longtemps

<
Maintenant, nous allons faire de la lecture. Qui veut lire ce paragraphe ? 

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Sami. C’est un homme gros et souriant. Il parle toujours avec gentillesse.
Qui veut expliquer ce paragraphe dans sa langue ? 

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Sami. C’est un homme gros et souriant. Il parle toujours avec gentillesse.
Qui veut lire la question et y répondre ? 
Comment s’appelle le voisin ? 

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Sami. C’est un homme gros et souriant. Il parle toujours avec gentillesse.
Il s’appelle Sami.
Comment s’appelle le voisin ? 

Dans notre quartier, nous avons un voisin très gentil. Il s’appelle Sami. C’est un homme gros et souriant. Il parle toujours avec gentillesse.
Qui veut lire ce paragraphe ? 
Le matin, il salue les gens qui vont au travail. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de la voisine Fatima, qui était fatiguée après le marché.
Qui veut expliquer ce paragraphe dans sa langue ? 
Le matin, il salue les gens qui vont au travail. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de la voisine Fatima, qui était fatiguée après le marché.
Qui veut lire la question et y répondre ? 
Que fait le voisin le matin ?
Le matin, il salue les gens qui vont au travail. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de la voisine Fatima, qui était fatiguée après le marché.
 Le matin, il salue les gens qui vont au travail.
Que fait le voisin le matin ?
Le matin, il salue les gens qui vont au travail. Il aide aussi les personnes âgées qui font leurs courses. Hier, il a porté les sacs de la voisine Fatima, qui était fatiguée après le marché.
Prenez vos cahiers. Vous allez écrire un paragraphe en vous posant les questions suivantes.  Je vais circuler entre les rangs pour vous aider. 
C’est qui ? 
Il s’appelle comment ? 
Comment il est ? 
Qu’est ce qu’il aime faire? 
Qui veut lire son paragraphe ?
Maintenant, c’est l’activité des questions en rafales. Je vais désigner des élèves au hasard pour répondre. Tenez-vous prêts. 
?
?
?

Comment ça va ? 
Comment ça va ?
Comment tu t’appelles ?
Comment tu t’appelles?
Quel est ton prénom ?
Quel est ton prénom ?
Quel est ton nom ?
Quel est ton nom ?
Tu as quel âge ?
Tu as quel âge ?
Comment est le garçon ?
Comment est le garçon ?
Que fait-il ?
Que fait-il ?
Vocabulaire.
Lire un texte.
Écrire un paragraphe.
Répondre à des questions en rafales. 
Histoire  du secret du quartier.
2. Lecture offerte
Plan de la séance 6
Nous avons déjà vu les deux premiers épisodes de l’histoire le secret du quartier. Qui veut nous rappeler ce qu’on a vu ?  En français ou dans votre langue. 
On va regarder le deuxième épisode une nouvelle fois. Après, on verra le troisième épisode. Soyez attentifs.
Lecture de la vidéo.
Maintenant, nous allons découvrir un nouvel épisode de l’histoire le secret de mon quartier. Est-ce que vous êtes prêts ? Ecoutez bien. 
Lecture de la vidéo.
Nous allons écouter l’histoire une deuxième fois. Soyez attentifs.
Lecture de la vidéo.
Que cherche Yasmine ?
Yasmine cherche monsieur Hassan.
Yasmine cherche monsieur Hassan.
Que demande Yasmine au monsieur ?
Comment est ton voisin ?
Comment est ton voisin ?
Que répond le monsieur ?  
Il est gentil et très généreux.
Il est gentil et très généreux.
Est-ce que Hassan est vieux ?  
Non, il est grand, toujours content et il rit souvent.
Non, il est grand, toujours content et il rit souvent.
Depuis combien de temps il connait son voisin Hassan ?  
Depuis plus de vingt ans.
Depuis plus de vingt ans.
Pourquoi Hassan a acheté tout le sucre, le chocolat et les œufs ?  
Parce qu’il prépare une surprise.
Parce qu’il prépare une surprise.
Qu’aperçoit Yasmine à côté de l’épicerie ?  
Elle aperçoit un camion rouge.
Elle aperçoit un camion rouge.
On va retrouver Yasmine la semaine prochaine pour un nouvel épisode. 
À la maison, écrivez trois phrases que vous avez entendues dans l’histoire. 
La séance d’aujourd’hui est terminée.  ',NULL,'','2026-02-26 10:45:49.743035','2026-02-26 10:45:49.743061',1);
INSERT INTO "raida_lesson" VALUES(18,'MATH N5 P1 SEM3 S1','mathématiques','5','1','3','1','MATH_N5_P1_SEM3_S1.pptx','......','
5 
الدرس 1

3
1
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
الدرس 9
الأعداد الكسرية 1
درس اليوم

الأعداد الكسرية (1): توحيد المقام
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
توحيد مقامي عددين كسريين
مرحباً سنتابع درسا جديدا مع مجد وندى
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
أنجزوا العمليات على دفاتر البحث. اكتبوا النتيجة فقط. لديكم دقيقة واحدة فقط
صححوا
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نوحد مقامي عددين كسريين
عرض فيديو النمذجة
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا ألواحكم. سنوحد مقامي عددين كسريين باتباع نفس الخطوات
ماذا نفعل في الخطوة الأولى؟ 
أجد المضاعف المشترك للمقامين
1
أجد الكسرين المكافئين
2
نجد المضاعف المشترك الأصغر لمقامي العددين
أجد المضاعف المشترك للمقامين
1
أجد الكسرين المكافئين
2
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف أنجز الخطوة الأولى
أجد المضاعف المشترك للمقامين
1
أجد الكسرين المكافئين
2
30
30
ماذا نفعل في الخطوة الثانية؟ 
30
30
أجد المضاعف المشترك للمقامين
1
أجد الكسرين المكافئين
2
أوجدوا العددين الكسريين المكافئين
30
30
أجد المضاعف المشترك للمقامين
1
أجد الكسرين المكافئين
2
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
أجد المضاعف المشترك للمقامين
1
أجد الكسرين المكافئين
2
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا الألواح؛ وحدوا مقامي العددين الكسريين
ارفعوا الألواح
نصحح، من يقوم ليشرح لنا الخطوات
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة 29

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛

كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 29 وأنجزوا النشاط 6. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:49.957190','2026-02-26 10:45:49.957216',1);
INSERT INTO "raida_lesson" VALUES(19,'MATH N5 P1 SEM3 S2','mathématiques','5','1','3','2','MATH_N5_P1_SEM3_S2.pptx','......','
5 
3
1
الدرس 9

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثالث
(ة)خاص بالأستاذ 
درس اليوم

الأعداد الكسرية (2): الاختزال
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

كتابة أعداد كسرية على شكل مختزل
(ة)خاص بالأستاذ 
1
مرحباً سنتابع درسا جديدا
صححوا. لديكم دقيقة واحدة



(ة)خاص بالأستاذ 
1
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
عرض فيديو الحساب الذهني 
صححوا
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نكتب عددا كسريا على شكل مختزل
عرض فيديو النمذجة
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 
خذوا ألواحكم. سنكتب عددا كسريا على شكل مختزل باتباع نفس الخطوات
ماذا نفعل في الخطوة الأولى؟ 
نجد القاسم المشترك الأكبر للبسط والمقام
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف أنجز الخطوة الأولى
القاسم المشترك الأكبر للعددين 15 و20 هو: 5
ماذا نفعل في الخطوة الثانية؟ 
القاسم المشترك الأكبر للعددين 15 و20 هو: 5
نفكك البسط والمقام 
القاسم المشترك الأكبر للعددين 15 و20 هو: 5
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
القاسم المشترك الأكبر للعددين 15 و20 هو: 5
=
ماذا نفعل في الخطوة الثالثة؟ 
=
نختزل بالعامل المشترك
=
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثالثة؟
(ة)خاص بالأستاذ 
خذوا الألواح؛ اكتبوا العدد الكسري على شكل مختزل
ارفعوا الألواح
نصحح، من يقوم ليشرح لنا الخطوات
(ة)خاص بالأستاذ 
الآن خذوا كراساتكم الصفحة 31

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 31 وأنجزوا النشاط 5. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم
صححوا على كراساتكم 
(ة)خاص بالأستاذ 
اختتام الدرس
5
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:50.095417','2026-02-26 10:45:50.095444',1);
INSERT INTO "raida_lesson" VALUES(20,'MATH N5 P1 SEM3 S3','mathématiques','5','1','3','3','MATH_N5_P1_SEM3_S3.pptx','......','
5 
3
1
الدرس 11

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثالث
(ة)خاص بالأستاذ 
الدرس 11
حساب مجموع وفرق عددين كسريين 
درس اليوم

حساب مجموع وفرق عددين كسريين
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5

(ة)خاص بالأستاذ 
حساب مجموع وفرق عددين كسريين
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
لديكم دقيقة واحدة لحل هذه العمليات. دوّنوا النتيجة فقط في دفاتركم كما في المثال
الحساب الذهني 
صححوا، لديكم دقيقة واحدة
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نحسب مجموع عددين كسريين
عرض فيديو النمذجة
من يذكرنا بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا ألواحكم. سنحسب مجموع العددين الكسريين باتباع نفس الخطوات
ماذا نفعل في الخطوة الأولى؟ 
أوحد المقام
1
أجد الكسرين المكافئين
2
أجد المجموع أو الفرق
3
نوحد مقامي العددين
أوحد المقام
1
أجد الكسرين المكافئين
2
أجد المجموع أو الفرق
3
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف أنجز الخطوة الأولى
أوحد المقام
1
أجد الكسرين المكافئين
2
أجد المجموع أو الفرق
3
ماذا نفعل في الخطوة الثانية؟ 
أوحد المقام
1
أجد الكسرين المكافئين
2
أجد المجموع أو الفرق
3
نجد المكسرين المكافئين
أوحد المقام
1
أجد الكسرين المكافئين
2
أجد المجموع أو الفرق
3
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
أوحد المقام
1
أجد الكسرين المكافئين
2
أجد المجموع أو الفرق
3
ماذا نفعل في الخطوة الثالثة؟ 
أوحد المقام
1
أجد الكسرين المكافئين
2
أجد المجموع أو الفرق
3
نحسب مجموع البسطين
أوحد المقام
1
أجد الكسرين المكافئين
2
أجد المجموع أو الفرق
3
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثالثة؟
أوحد المقام
1
أجد الكسرين المكافئين
2
أجد المجموع أو الفرق
3
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا الألواح؛ احسبوا فرق  العددين الكسريين
ارفعوا الألواح
نصحح، من يقوم ليشرح لنا الخطوات
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة 33

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 33 وأنجزوا النشاط 6. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

قبل الاشتغال صححوا العملية الثانية. المقام 5 عوض 65
صححوا على كراساتكم 
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:50.292060','2026-02-26 10:45:50.292086',1);
INSERT INTO "raida_lesson" VALUES(21,'MATH N5 P1 SEM3 S4','mathématiques','5','1','3','4','MATH_N5_P1_SEM3_S4.pptx','......','
5 
الدرس  11

3
1
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثالث
(ة)خاص بالأستاذ 
الدرس 12
حل المسائل
درس اليوم

حل المسائل من خطوتين باعتماد نموذج الأشرطة
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5

(ة)خاص بالأستاذ 
حل المسائل من خطوتين باعتماد نموذج الأشرطة
مرحباً سنتابع درسا جديدا في الرياضيات
(ة)خاص بالأستاذ 
 لديكم دقيقة واحدة. صححوا 
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
لديكم دقيقة واحدة لحل هذه العمليات. دوّنوا النتيجة فقط في دفاتركم كما في المثال
الحساب الذهني 
صححوا، لديكم دقيقة واحدة
(ة)خاص بالأستاذ 
الآن سنتعلم  كيف نحل مسألة من خطوتين باعتماد نموذج الأشرطة
عرض فيديو النمذجة
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 
خذوا ألواحكم. سنحل مسألة باتباع نفس الخطوات
 ماذا نفعل في الخطوة الأولى؟ 
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
 اقرؤوا المسألة وتخيلوها لديكم دقيقة واحدة
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
من يقول لنا ماذا فهم من المسألة وكيف تخيلها؟
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
ماذا نفعل في الخطوة الثانية؟ 
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
نحدد خطوات المسألة.
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا الخطوات لحل المسألة؟
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
ماذا نفعل في الخطوة الثالثة؟ 
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
على الألواح، مثلوا الخطوة الأولى وجدوا المعطى الناقص
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليمثل الخطوة الأولى ويجد المعطى الناقص؟
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
125
50
؟
125 + 50 = 175
لدى عماد 175 درهما
ماذا نفعل في الخطوة الرابعة؟ 
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
125
50
؟
125 + 50 = 175
لدى عماد 175 درهما
على الألواح، مثلوا الخطوة الثانية واكتبوا حل المسألة
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
125
50
؟
125 + 50 = 175
لدى عماد 175 درهما
ارفعوا الألواح
لَدى عِمادٍ 125 دِرْهَماً، أَعْطَتْهُ أُمُّهُ 50 دِرْهَمًا.كَمْ يَلْزَمُهُ لِشِراءِ لُعْبَةٍ ثَمَنُها 200 دِرْهَمٍ؟
نصحح. من يقوم إلى السبورة ليمثل الخطوة الثانية ويحل المسألة؟
أقرأ المسألة
1
أمثل
3
أحدد الخطوات
2
أمثل وأحل
4
(ة)خاص بالأستاذ 
الآن خذوا كراساتكم الصفحة 34

لديكم 4 دقائق  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
(ة)خاص بالأستاذ 
 خذوا الكراسات 35 وأنجزوا النشاط 3 لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
(ة)خاص بالأستاذ 
اختتام الدرس
5
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 

إلى اللقاء. في الحصة القادمة،
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:50.520150','2026-02-26 10:45:50.520179',1);
INSERT INTO "raida_lesson" VALUES(22,'MATH N5 P1 SEM3 S5','mathématiques','5','1','3','5','MATH_N5_P1_SEM3_S5.pptx','......','
5 
الدرس 9

3
1
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع  الثالث
(ة)خاص بالأستاذ 
مراجعة
مراجعة وتثبيت دروس الأسبوع
(ة)خاص بالأستاذ 
درس اليوم

مراجعة دروس الأسبوع

تدابير حصة المراجعة  الأسبوع
(ة)خاص بالأستاذ 
مراجعة كل درس تتم عبر المراحل التالية : 
رائز التحقق من الهدف الرئيسي للدرس
احتساب نسبة التحكم
أقل من 80%
أكبر من 80%
إعادة عرض شريط النمذجة 
المرور مباشرة للتدرب على الكراسة
إنجاز نشاط مراجعة الدرس على الكراسة
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 

توحيد مقامي عددين كسريين مختلفي المقام
كتابة عدد كسري على شكل مختزل
حساب مجموع وفرق عددين كسريين
حل المسائل من خطوتين باعتماد نموذج الأشرطة
(ة)خاص بالأستاذ 
1
صححوا، لديكم دقيقة واحدة
(ة)خاص بالأستاذ 
1
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
لديكم دقيقة واحدة لحل هذه العمليات. دوّنوا النتيجة فقط في دفاتركم.
 لديكم دقيقة واحدة للتصحيح.
(ة)خاص بالأستاذ 

توحيد مقامي عددين كسريين مختلفي المقام
مراجعة الدرس 9
2
خذوا الألواح، أنجزوا النشاط 1 صفحة 36 على كراساتكم. ضعوا وأنجزوا
ارفعوا الألواح
 من يقوم ليشرح لنا كيف وجد النتيجة مذكرا بالخطوات؟ 
فيديو نمذجة الدرس 1 
أكملوا  إنجاز النشاط رقم 1  على الكراسات
 صححوا. 
(ة)خاص بالأستاذ 

كتابة عدد كسري على شكل مختزل
مراجعة الدرس 10
3
خذوا النشاط 2 واكتبوا الأعداد الكسرية على شكل مختزل
ارفعوا الألواح
 من يقوم ليشرح لنا كيف وجد النتيجة مذكرا بالخطوات؟ 
فيديو نمذجة الدرس 2 
 أكملوا إنجاز النشاط رقم 2
صححوا
(ة)خاص بالأستاذ 

حساب مجموع وفرق عددين كسريين
مراجعة الدرس 11
4
خذوا الألواح، أنجزوا النشاط 3
ارفعوا الألواح
 صححوا. من يقوم إلى السبورة ليشرح كيف وصل إلى النتيجة الصحيحة
12
10
20
22
20
11
10
فيديو نمذجة الدرس 3 
خذوا الألواح،  أكملوا إنجاز النشاطين 3 و4
ارفعوا الألواح
 صححوا. 
(ة)خاص بالأستاذ 

مراجعة الدرس 12
5
حل المسائل من خطوتين باعتماد نموذج الأشرطة.
خذوا الألواح، أنجزوا النشاط 6
ارفعوا الألواح
نصحح، من يقوم ليشرح لنا كيف وجد النتيجة مذكرا بالخطوات؟ 
فيديو نمذجة الدرس 4 
(ة)خاص بالأستاذ 
اختتام الدرس
6
في المنزل، أنجزوا جميع الأنشطة المتبقية الصفحتين 26 و27
إلى اللقاء. في الحصة القادمة،',NULL,'','2026-02-26 10:45:50.698576','2026-02-26 10:45:50.698607',1);
INSERT INTO "raida_lesson" VALUES(23,'FR N5 P1 SEM4 S1','français','5','1','4','1','FR_N5_P1_SEM4_S1.pptx','......','Semaine 4

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Oral – Dialogue
Lecture – texte  (fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 


Séance 1

Présentation du vocabulaire 
Exploitation du vocabulaire
Activités de vocabulaire sur livret
Organisation de la semaine
Description de la scène
Travail sur livret
Plan de la séance
1.  Présentation du vocabulaire
Inviter – Appeler –  Après une heure – Remercier – Rencontrer – Heureux .
Déménager – Se souvenir – Dans dix minutes  – Répondre – Consoler – Aider  
Bonjour les enfants !  La leçon de français commence maintenant.  Soyez attentifs. 
Lecture de la vidéo.
Lecture de la vidéo.
Qui veut répéter ?
Inviter
Lecture de la vidéo.
Qui veut répéter ?
Appeler
Lecture de la vidéo.
Qui veut répéter ?
Après
 une heure
Lecture de la vidéo.
Qui veut répéter ?
Remercier
Lecture de la vidéo.
Qui veut répéter ?


Rencontrer
Lecture de la vidéo.
Qui veut répéter ?
Heureux
Lecture de la vidéo.

Répétons ensemble : - Inviter – Appeler –  Après une heure – Remercier – Rencontrer – Heureux 
Inviter
Remercier
Rencontrer
Après une heure
Appeler
Heureux
Maintenant, on va apprendre d’autres mots avec Majd. 
Lecture de la vidéo.
Qui veut répéter ?
Déménager
Lecture de la vidéo.
Qui veut répéter ?
Se souvenir
Lecture de la vidéo.
Qui veut répéter ?
Dans dix minutes
Lecture de la vidéo.
Qui veut répéter ?
Répondre
Lecture de la vidéo.
Qui veut répéter ?
Consoler
Lecture de la vidéo.
Qui veut répéter ?
Aider
Lecture de la vidéo.
Répétons ensemble : - Déménager – Se souvenir – Dans dix minutes – Répondre – Consoler – Aider
Déménager
Aider
Se souvenir
Répondre
Consoler
Dans dix minutes
Prenez vos ardoises. 
Ecrivez le numéro du mot « Appeler».
Ecrivez le numéro du mot « Consoler ».
Ecrivez le numéro du mot « Se souvenir ».
Rangez vos ardoises. 
Qui veut nommer l’image ? Levez la main.
Qui veut nommer l’image ? Levez la main.
Qui veut nommer l’image ? Levez la main.
Qui veut nommer l’image ? Levez la main.
Activités  sur livret
Plan de la séance
2.  Exploitation du vocabulaire
Description de la scène. 
Inviter – Appeler – Après une heure – Remercier – Rencontrer – Heureux .
Déménager – Se souvenir – Dans dix minutes  – Répondre – Consoler – Aider  
Observez cette scène pendant 30 secondes. Il y a des images déjà vues aujourd’hui. 
Majd va nous montrer comment décrire l’image. Soyez attentifs.
Lecture de la vidéo.
Lecture de la vidéo.
Soyez attentifs. Majd va décrire l’image une deuxième fois. 
Lecture de la vidéo.
Maintenant, je vais vous poser des questions.
C’est la maison de qui ?
Que fait la famille de Salma ?
Pourquoi Nada est venue voir Salma ?
Comment est Kamal ?
Que fait Réda ?
Que fait Adam ?
Maintenant, c’est à vous. Qui veut décrire la scène comme Majd ?
Exploitation du vocabulaire 
Plan de la séance
3.  Activités de vocabulaire  sur livret
Activités sur livret
Inviter – Appeler –  Après une heure – Remercier – Rencontrer – Heureux 
Déménager – Se souvenir – Dans dix minutes  – Répondre – Consoler – Aider  
Ouvrez le livret à la page 23.  Vous allez faire cette activité à l’oral avec votre camarade. 

À tour de rôle : l’un montre une image, l’autre dit le mot. Je passe entre les rangs pour vous aider.

Je montre l’image

1

Je dis le mot

2

La séance d’aujourd’hui est terminée. À la maison, faites les activités 1 et 2 sur le livret.Vous devez écrire les mots du vocabulaire. 
',NULL,'','2026-02-26 10:45:50.951791','2026-02-26 10:45:50.951821',1);
INSERT INTO "raida_lesson" VALUES(24,'FR N5 P1 SEM4 S2','français','5','1','4','2','FR_N5_P1_SEM4_S2.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 6

Séance 3

Séance 5

Séance 4

Séance 1
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Présentation du vocabulaire 
Exploitation du vocabulaire
Travail sur livret
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral –  Prise de parole
Ecriture – Texte  

Oral – Dialogue
Lecture - Lettre a - A
Ecriture - Lettre a - A

Séance 2

Oral – Acte de parole 1
Ecriture – Point de langue 1
Lecture – Mots avec difficultés 
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 2


Les marqueurs du futur.
Mots avec difficultés :  lire des mots avec le son « é ».
Acte de parole 1 : « Parler de mes voisins ». 
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons corriger les activités de vocabulaire.

Corrigez sur votre livret. 
Répondre
Inviter
Déménager 
Dans dix minutes
Se voir 
Se souvenir
Dans une heure
Remercier
Appeler
Heureux
Consoler
Aider
Répétons ensemble ces mots. 
Répondre
Inviter
Déménager 
Dans dix minutes
Se voir 
Se souvenir
Dans une heure
Remercier
Appeler
Heureux
Consoler
Aider
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. Soyez attentifs. 
Lecture de la vidéo.
Maintenant, on va poser la question comme Majd et Nada. Répétons ensemble. 
Dans combien de temps tu vas voir ton voisin ? 

 Dans combien de temps tu vas 
voir ton voisin ? 

Qui veut poser la question et l’expliquer dans sa langue ? 

 Dans combien de temps tu vas 
voir ta voisine ? 

Qui veut poser la question et l’expliquer dans sa langue ? 
Maintenant, nous allons apprendre à répondre à la question : dans combien de temps tu vas voir ton voisin ? 
Lecture de la vidéo.
Maintenant, on va répondre à la question comme Majd et Nada. Répétons ensemble. 
Je vais voir mon voisin dix minutes.
Je vais voir ma voisine   dans une heure.
Voici d’autres exemples.  
Je vais voir mon ami dans quinze minutes.
Je vais voir mon amie  dans deux heures.
Qui veut passer au tableau pour jouer la scène ?  Chacun choisit un exemple différent. 

Je vais voir  ________
dans ___________ .

Dans combien  de temps tu vas 
voir _______ ? 
Chacun joue le dialogue avec son voisin. 
Je vais  voir ________
dans  ___________

Dans combien  de temps tu vas 
voir _________  ?
Acte de parole 1 : « parler de mes voisins ». 
Mots avec difficultés :  lire des mots avec le son « é ».
Plan de la séance 2
Les marqueurs du futur.
2.  Écrit : Point de langue
Les marqueurs du futur
Nous allons apprendre les marqueurs du futur.
Lecture de la vidéo.              
Je retiens :
Qui veut choisir le marqueur du futur convenable ? Levez la main. 
Le bus part à 18h30. Il est 18h maintenant.
Il part ………………………………………………………………
dans une heure 
dans une demi-heure
Qui peut expliquer la phrase ? Levez la main. 
Le bus part à 18h30. Il est 18h maintenant.
Il part dans une demi-heure.
Qui veut choisir le marqueur du futur convenable ? Levez la main. 
Les vacances commencent dans sept jours. 
Les vacances commencent …………………………….
dans une semaine 
dans un jour
Qui peut expliquer la phrase ? Levez la main. 
Les vacances commencent dans sept jours. 
Les vacances commencent dans une semaine.
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant prépare des activités écrites à réaliser par les élèves sur cahier. 
Remarque importante :
Prenez vos livrets à la page 27.

Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe. 
dans une demi-heure.
dans une semaine.
dans une heure.
dans un jour.
 Acte de parole 1 : « parler de mes voisins ». 

Plan de la séance 2
Les marqueurs du futur.
Mots avec difficultés :  lire des mots avec le son « é ».
3.  Lecture
Maintenant, nous allons faire de la lecture.
On va apprendre comment lire des mots avec le son« é ». Soyez attentifs.
é  -  er  - ez  
Lecture de la vidéo. 
Lisez ces mots en silence.
marché     nager     nez
Qui veut lire ces mots ?
marché     nager     nez
Qui veut lire ces phrases à haute voix ? 
Hier, j’ai marché sous la pluie.
Nous allons acheter  des pommes et des bananes.
Sami va chez le dentiste.
Lecture audio. 
 Hier, j’ai marché sous la pluie.
Nous allons acheter  des pommes et des bananes.
Sami va chez le dentiste.
Qui veut lire à voix haute ?
 Hier, j’ai marché sous la pluie.
Nous allons acheter  des pommes et des bananes.
Sami va chez le dentiste.
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant fait lire les élèves sur l’écran.
Remarque importante :
Prenez vos livrets à la page 25.

Lisez les mots et les phrases à votre voisin. Je vais passer entre les rangs pour vous aider. 

La séance d’aujourd’hui est terminée.  À la maison, relisez les mots et les phrases.   
',NULL,'','2026-02-26 10:45:51.169682','2026-02-26 10:45:51.169708',1);
INSERT INTO "raida_lesson" VALUES(25,'FR N5 P1 SEM4 S3','français','5','1','4','3','FR_N5_P1_SEM4_S3.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2

Séance 4
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – lecture phrase
Séance 3
Organisation de la semaine
Les pronoms COD.
Lire et comprendre des phrases.
1.  Acte de parole
Acte de parole 2 : « Parler de mes voisins ». 
Plan de la séance 3
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons revoir la scène avec les mots du vocabulaire. 
Lecture de la vidéo. 
Qui veut décrire l’image ? 
Maintenant, on passe à l’activité de l’oral. Nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo. 
Répétons ensemble les questions de Majd et de Nada. 

Pourquoi tu vas voir ton voisin ?
Pourquoi tu vas voir ta voisine ?
Voici d’autres exemples : 

Pourquoi tu vas voir ton ami ?
Pourquoi tu vas voir ta cousine ?


Qui veut poser la question ? 
Pourquoi tu vas voir ________ ?


Qui veut poser la question ?
Pourquoi tu vas voir ________ ?
Maintenant, nous allons apprendre à répondre à une question. Soyez attentifs. 
Lecture de la vidéo. 
Répétons les réponses. 

Je vais voir mon voisin pour le remercier.
Je vais voir ma voisine pour la consoler.
Voici d’autres exemples. 

Je vais voir ma voisine pour l’inviter.

Qui veut passer au tableau pour jouer la scène ?  Chacun donne un exemple différent.
 Pourquoi tu vas voir__________?
Je vais voir_________ 
pour _________________
Maintenant, tout le monde participe. Chacun joue le dialogue avec son voisin. Je vais passer entre les rangs pour vous aider.
 Pourquoi tu vas voir__________?
Je vais voir_________ 
pour _________________
Acte de parole 2 : «  Parler de mes voisins».
Lire et comprendre des phrases.
2.  Ecrit : Point de langue 
Les pronoms COD.
Plan de la séance 3
Maintenant, nous allons apprendre à utiliser les pronoms COD : le, la, les, l’..
le   la   les  l’
Lecture de la vidéo.
Lisons ensemble ces exemples. Soyez attentifs.
Prenez vos ardoises.
Sur vos ardoises, complétez la phrase avec le pronom qui convient.
Najib boit le jus.
Najib ______ boit.
le 
la
l’ 
les 
Levez les ardoises. 
Corrigez. 
Najib boit le jus.
Najib le boit.
le 
la
l’ 
les 
Nadia range les affaires.
Nadia  __________ range.
le
la
Sur vos ardoises, complétez la phrase avec le pronom  qui convient.
les
l’
Levez les ardoises. 
Corrigez.
Nadia range les affaires.
Nadia  les range.
le
la
les
l’
Les pronoms COD.
 Acte de parole 2 : «  parler de mes voisins ».

3.  Lecture
Lire et comprendre des phrases.
Plan de la séance 3
Maintenant, nous allons faire de la lecture.
Observez cette image et lisez la question. Je vais vous proposer des réponses. 
Pourquoi Karima va-t-elle voir sa grand-mère ? 
Karima va voir sa grand-mère pour l’aider.
Karima va voir sa grand-mère cet après-midi. 
Karima va voir sa grand-mère dans le salon.  
Karima va voir sa grand-mère pour la remercier. 
Prenez vos ardoises.
Ecrivez le numéro de la bonne réponse sur votre ardoise (1, 2, 3 ou 4).  
Pourquoi Karima va-t-elle voir sa grand-mère ? 
Karima va voir sa grand-mère pour l’aider.
Karima va voir sa grand-mère cet après-midi. 
Karima va voir sa grand-mère dans le salon.  
Karima va voir sa grand-mère pour la remercier. 
La bonne réponse est : Karima va voir sa grand-mère pour la remercier. 
Qui veut lire et expliquer la réponse ? 
Pourquoi Karima va-t-elle voir sa grand-mère ? 
Karima va voir sa grand-mère pour l’aider.
Karima va voir sa grand-mère cet après-midi. 
Karima va voir sa grand-mère dans le salon.  
Karima va voir sa grand-mère pour la remercier. 
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant prépare des activités écrites à réaliser par les élèves sur cahier. 
Remarque importante :
Prenez vos livrets à la page 25.   Avec votre voisin, vous allez lire et répondre aux questions de l’activité 4. Je vais circuler entre les rangs pour vous aider. 
Notez les devoirs à faire à la maison. Vous allez lire et recopier le dialogue de la page 25.  Vous allez aussi faire l’activité 1 de la page 27. 


La séance d’aujourd’hui est terminée. A bientôt.  ',NULL,'','2026-02-26 10:45:51.456587','2026-02-26 10:45:51.456614',1);
INSERT INTO "raida_lesson" VALUES(26,'FR N5 P1 SEM4 S4','français','5','1','4','4','FR_N5_P1_SEM4_S4.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 4
Texte : Fluidité et compréhension.
1.  Dialogue 
Jouer un dialogue reprenant les actes de parole enseignés.
Plan de la séance 4
Bonjour les enfants !  La leçon de français commence maintenant. 
Aujourd’hui, nous allons apprendre un dialogue avec Majd et Nada. 
Lecture de la vidéo.
Nous allons écouter le dialogue une deuxième fois.
Lecture de la vidéo.
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. Puis, on va continuer à répéter le dialogue.
On va continuer la répétition du dialogue. Je vais lire chaque réplique et vous allez répéter après moi. 
On va continuer la répétition du dialogue. Je vais lire chaque réplique et vous allez répéter après moi. 
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. 
Maintenant, on va jouer ce dialogue. On va le faire en 3 étapes. Soyez attentifs. 


Etape 1

Etape 2

Etape 3
Etape 1. Je vais vous expliquer la situation.  
Situation : Le garçon et la fille se rencontrent dans le quartier. Chacun demande à l’autre les questions suivantes: 


Etape 1

Etape 2

Etape 3
Est-ce que tu iras  [ lieu ] ?
Où se trouve [ lieu ] ?
Que veux-tu acheter pour ta recette ?
Combien voudrais-tu de [ ingrédient ] ?
Qui est-ce ?
Dans combien de temps tu vas voir [ personne ] ?
Pourquoi tu vas le/la voir ? 
Etape 2.  Chacun réfléchit silencieusement à ce qu’il va dire dans le dialogue.

Etape 1

Etape 2

Etape 3
Situation : Le garçon et la fille se rencontrent dans le quartier. Chacun demande à l’autre les questions suivantes: 

Est-ce que tu iras  [ lieu ] ?
Où se trouve [ lieu ] ?
Que veux-tu acheter pour ta recette ?
Combien voudrais-tu de [ ingrédient ] ?
Qui est-ce ?
Dans combien de temps tu vas voir [ personne ] ?
Pourquoi tu vas le/la voir ? 
Etape 3.  Maintenant, vous allez jouer le dialogue. Qui veut passer au tableau ? 

Etape 1

Etape 2

Etape 3
Maintenant, tout le monde participe. Jouez le dialogue avec votre voisin.
Jouer un dialogue reprenant les actes de parole enseignés.
2.  Lecture
Texte : Fluidité et compréhension.
Plan de la séance 4 
Maintenant, on va faire de la lecture. On va lire des mots, puis un texte. 
C’est le mot : Après-midi.On va l’épeler ensemble : a – p – r –è – s - m– i – d - i.
Après-midi 
ensuite 
C’est le mot : ensuite. On va l’épeler ensemble : e – n – s – u – i – t - e.
Qui veut lire ? 
Après-midi      ensuite
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant fait lire les élèves sur l’écran. 
Remarque importante :
On va lire ensemble ce texte du livret. On va le découper en 2 parties. Après, vous allez le lire tout seuls. 

Lisez la première partie du texte silencieusement. Après, je vais diffuser une lecture audio. 


Partie 1
Partie 2
                            Une visite chez mon voisin
  Cet après-midi, je vais rendre visite à mon voisin et ami Aymene parce qu’il est fatigué. Ma maman m’a dit : « Hamza, va voir ton ami Aymene. Apporte-lui des fruits et un livre. »
Je vais  acheter quelques fruits chez l’épicier et je vais voir mon voisin dans sa maison. 
Lecture en cours. 

Partie 1

Partie 2
Qui veut lire le texte ?


Partie 1
Partie 2
                            Une visite chez mon voisin
  Cet après-midi, je vais rendre visite à mon voisin et ami Aymene parce qu’il est fatigué. Ma maman m’a dit : « Hamza, va voir ton ami Aymene. Apporte-lui des fruits et un livre. »
Je vais  acheter quelques fruits chez l’épicier et je vais voir mon voisin dans sa maison. 
On passe à la deuxième partie.  Lisez en silence. 
Partie 1
 Quand j’arrive chez lui, sa maman m’ouvre la porte. Je lui dis bonjour et j''entre quelques instants.
Aymene est au lit. Je lui donne le livre et les fruits. Je lui demande comment il se sent. Il dit que ça va mieux. Il me remercie avec un grand sourire. Ensuite, je rentre à la maison et je raconte ma visite à ma maman.


Partie 1
Partie 2
Lecture audio. 


Partie 1
Partie 2
Qui veut lire le texte ?


Partie 1
Partie 2
 Quand j’arrive chez lui, sa maman m’ouvre la porte. Je lui dis bonjour et j''entre quelques instants.
Aymene est au lit. Je lui donne le livre et les fruits. Je lui demande comment il se sent. Il dit que ça va mieux. Il me remercie avec un grand sourire. Ensuite, je rentre à la maison et je raconte ma visite à ma maman.
Maintenant, on va essayer de comprendre le texte, partie par partie. Pour chaque partie du texte, on va suivre les mêmes étapes. 

Etape 1
Je lis en silence et j’essaie de comprendre le texte.

Etape 2
Je repère les mots difficiles et je demande à mon enseignant(e) de me les expliquer

Etape 3
Je lis la question, puis je cherche la réponse dans le texte. 


Lisez silencieusement le texte et essayez de le comprendre. 
Etape 1
Partie 1/2

Etape 2

Etape 3
                        Une visite chez mon voisin
  Cet après-midi, je vais rendre visite à mon voisin et ami Aymene parce qu’il est fatigué. Ma maman m’a dit : « Hamza, va voir ton ami Aymene. Apporte-lui des fruits et un livre. »
Je vais  acheter quelques fruits chez l’épicier et je vais voir mon voisin dans sa maison. 

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 1/2
Etape 2

Etape 3
                        Une visite chez mon voisin
  Cet après-midi, je vais rendre visite à mon voisin et ami Aymene parce qu’il est fatigué. Ma maman m’a dit : « Hamza, va voir ton ami Aymene. Apporte-lui des fruits et un livre. »
Je vais  acheter quelques fruits chez l’épicier et je vais voir mon voisin dans sa maison. 
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 1 : Pourquoi hamza a rendu visite à son ami Aymene ? 

Etape 1
Partie 1/2

Etape 2

Etape 3
                        Une visite chez mon voisin
  Cet après-midi, je vais rendre visite à mon voisin et ami Aymene parce qu’il est fatigué. Ma maman m’a dit : « Hamza, va voir ton ami Aymene. Apporte-lui des fruits et un livre. »
Je vais  acheter quelques fruits chez l’épicier et je vais voir mon voisin dans sa maison. 
La question est : « Pourquoi ? ». Je cherche dans le texte une cause. La réponse est : parce qu’il est fatigué.

Etape 1
Partie 1/2

Etape 2

Etape 3
                        Une visite chez mon voisin
  Cet après-midi, je vais rendre visite à mon voisin et ami Aymene parce qu’il est fatigué. Ma maman m’a dit : « Hamza, va voir ton ami Aymene. Apporte-lui des fruits et un livre. »
Je vais  acheter quelques fruits chez l’épicier et je vais voir mon voisin dans sa maison. 
Question 1 : Pourquoi hamza a rendu visite à son ami Aymene ? 

On passe à la deuxième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 2/2

Etape 2

Etape 3
 Quand j’arrive chez lui, sa maman m’ouvre la porte. Je lui dis bonjour et j''entre quelques instants.
Aymene est au lit. Je lui donne le livre et les fruits. Je lui demande comment il se sent. Il dit que ça va mieux. Il me remercie avec un grand sourire. Ensuite, je rentre à la maison et je raconte ma visite à ma maman.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 2/2
Etape 2

Etape 3
 Quand j’arrive chez lui, sa maman m’ouvre la porte. Je lui dis bonjour et j''entre quelques instants.
Aymene est au lit. Je lui donne le livre et les fruits. Je lui demande comment il se sent. Il dit que ça va mieux. Il me remercie avec un grand sourire. Ensuite, je rentre à la maison et je raconte ma visite à ma maman.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 2 : Comment Aymene remercie-t-il Hamza pour sa visite ? 

Etape 1
Partie 2/2

Etape 2

Etape 3
 Quand j’arrive chez lui, sa maman m’ouvre la porte. Je lui dis bonjour et j''entre quelques instants.
Aymene est au lit. Je lui donne le livre et les fruits. Je lui demande comment il se sent. Il dit que ça va mieux. Il me remercie avec un grand sourire. Ensuite, je rentre à la maison et je raconte ma visite à ma maman.
La question est « comment ? ». Je cherche une manière dans le texte. La réponse est : « Il me remercie avec un grand sourire ». 

Etape 1
Partie 2/2

Etape 2

Etape 3
 Quand j’arrive chez lui, sa maman m’ouvre la porte. Je lui dis bonjour et j''entre quelques instants.
Aymene est au lit. Je lui donne le livre et les fruits. Je lui demande comment il se sent. Il dit que ça va mieux. Il me remercie avec un grand sourire. Ensuite, je rentre à la maison et je raconte ma visite à ma maman.
Question 2 : Comment Aymene remercie-t-il Hamza pour sa visite ? 
Prenez vos livrets à la page 26.

Lisez le texte à votre voisin puis changez les rôles.
La séance d’aujourd’hui est terminée. À la maison relisez le texte et répondez aux questions.


En cas d’indisponibilité du livret : chaque élève lit le texte à son voisin. ',NULL,'','2026-02-26 10:45:51.783209','2026-02-26 10:45:51.783236',1);
INSERT INTO "raida_lesson" VALUES(27,'MATH N5 P1 SEM4 S1','mathématiques','5','1','4','1','MATH_N5_P1_SEM4_S1.pptx','......','
5 
الدرس 13

4
1
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
الدرس 13
الكتابة المختلطة للكسور المركبة
درس اليوم

الكتابة المختلطة للكسور المركبة
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

أكتب أعدادا كسرية مركبة كتابة مختلطة
(ة)خاص بالأستاذ 
1
مرحباً سنتابع درسا جديدا مع مجد وندى
صححوا. لديكم دقيقة واحدة
(ة)خاص بالأستاذ 
1
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
ضعوا وأنجزوا   
صححوا
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نفكك عددا كسريا بكتابة مختلطة
عرض فيديو النمذجة
من يذكرنا بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 
خذوا ألواحكم. سنكتب عددا كسريا مركبا كتابة مختلطة باتباع نفس الخطوات
ماذا نفعل في الخطوة الأولى؟ 
23
9
نجد أكبر مضاعف للمقام وأصغر من البسط. اكتبوه على الألواح
23
9
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف أنجز الخطوة الأولى
23
9
ماذا نفعل في الخطوة الثانية؟ 
23
9
نفكك العدد . اكتبوا التفكيك على الألواح
23
9
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
23
9
18
9
5
9
=
+
ماذا نفعل في الخطوة الثالثة؟ 
23
9
18
9
5
9
=
+
نكتب العدد كتابة مختلطة. اكتبوا على الألواح
23
9
18
9
5
9
=
+
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
23
9
18
9
5
9
=
+
5
9
=
2
(ة)خاص بالأستاذ 
خذوا الألواح؛ اكتبوا العدد الكسري المركب على شكل كتابة مختلطة
ارفعوا الألواح
نصحح، من يقوم ليشرح لنا الخطوات
(ة)خاص بالأستاذ 
الآن خذوا كراساتكم الصفحة 39

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا. 
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 39 وأنجزوا النشاط 5. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم
صححوا على كراساتكم 
(ة)خاص بالأستاذ 
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:51.958142','2026-02-26 10:45:51.958170',1);
INSERT INTO "raida_lesson" VALUES(28,'MATH N5 P1 SEM4 S2','mathématiques','5','1','4','2','MATH_N5_P1_SEM4_S2.pptx','......','
5 
4
1
الدرس 13

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الأول
(ة)خاص بالأستاذ 
الدرس 14
الكسور العشرية 1
درس اليوم

الكسور العشرية (1)
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

قراءة وتمثيل كسور عشرية على المستقيم العددي
(ة)خاص بالأستاذ 
1
مرحباً سنتابع درسا جديدا
صححوا. لديكم دقيقة واحدة
(ة)خاص بالأستاذ 
1
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
عرض فيديو الحساب الذهني 
صححوا
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نكتب ونمثل كسورا عشرية على المستقيم العددي
عرض فيديو النمذجة
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 
خذوا ألواحكم. سنكتب ونمثل كسريا عشريا على المستقيم العددي باتباع نفس الخطوات
ماذا نفعل في الخطوة الأولى؟ 
نحدد الوحدة. اكتبوا على الألواح عدد الوحدات التي تظهر من المستقيم العددي
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف أنجز الخطوة الأولى
الوحدة الأولى
الوحدة الثانية


ماذا نفعل في الخطوة الثانية؟ 
نحدد قيمة التدريجات الكبيرة لأن البطاقة على تدريجة كبيرة.

ارفعوا الألواح
نصحح، قيمة هذه التدريجات عُشُرٌ. قسمت كل وحدة إلى 10 أجزاء


نكتب الكسور الموافقة للوحدات. هنا 7 وحدات يقابلها الكسر 70 على 10. 
على الألواح اكتبوا الكسر العشري الموافق ل8 وحدات.  
صححوا؛ من يشرح لنا كيف وجد الجواب الصحيح؟ 
ماذا نفعل في الخطوة الثالثة؟ 
نعد لنمثل العدد الكسري في البطاقة. اكتبوا على الألواح العدد المناسب للبطاقة
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثالثة؟
(ة)خاص بالأستاذ 
اكتبوا على الألواح العدد الكسري المناسب للبطاقة على المستقيم العددي
ارفعوا الألواح
نصحح، من يقوم ليشرح لنا الخطوات
(ة)خاص بالأستاذ 
الآن خذوا كراساتكم الصفحة 41
لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا.
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 41 وأنجزوا النشاط 5. قبل البدء – صححوا التمرين. 
أنجزوا؛ أمامكم 5 دقائق - سأمر لمساعدتكم
صححوا على كراساتكم 
(ة)خاص بالأستاذ 
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:52.572726','2026-02-26 10:45:52.572754',1);
INSERT INTO "raida_lesson" VALUES(29,'MATH N5 P1 SEM4 S3','mathématiques','5','1','4','3','MATH_N5_P1_SEM4_S3.pptx','......','
5 
4
1
الدرس 13

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الأول
(ة)خاص بالأستاذ 
الدرس 15
الكسور العشرية 2
درس اليوم

تفكيك عدد كسري عشري مركب إلى كتابة مختلطة
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
تفكيك عدد كسري عشري مركب إلى كتابة مختلطة
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
15
21
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
عرض فيديو الحساب الذهني 
صححوا
(ة)خاص بالأستاذ 
الآن سنتعلم كيف تفكك عددا كسريا عشريا إلى كتابة مختلطة
عرض فيديو النمذجة
من يذكرنا بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا ألواحكم. سنكتب عددا كسريا عشريا مركبا كتابة مختلطة باتباع نفس الخطوات
ماذا نفعل في الخطوة الأولى؟ 
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
نجد أكبر مضاعف للمقام وأصغر من البسط. اكتبوه على الألواح
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف أنجز الخطوة الأولى
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
ماذا نفعل في الخطوة الثانية؟ 
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
نفكك العدد . اكتبوا التفكيك على الألواح
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
ماذا نفعل في الخطوة الثالثة؟ 
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
نكتب العدد كتابة مختلطة. اكتبوا على الألواح
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثالثة؟
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
أكملوا العبارة على الألواح. كم لدينا من وحدة وكم من عشر؟
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
... وحدات و... أعشار
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا كيف وصل إلى النتيجة؟
أجد المضاعف
1
أفكك العدد
2
أكتب كتابة مختلطة
3
4 وحدات و8 أعشار
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا الألواح؛ فككوا واكتبوا العدد الكسري العشري كتابة مختلطة
ارفعوا الألواح
نصحح، من يقوم ليشرح لنا الخطوات
7 وحدات و49 جزءا من المئة
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة 42

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
1
25
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 43 وأنجزوا النشاط 4. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

قبل البدء تأكدوا من أن مقامي العددين داخل الإطار مقامهما 100

صححوا على كراساتكم 
3
8
3
19
3
97
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:53.892778','2026-02-26 10:45:53.892812',1);
INSERT INTO "raida_lesson" VALUES(30,'MATH N5 P1 SEM4 S4','mathématiques','5','1','4','4','MATH_N5_P1_SEM4_S4.pptx','......','
5 
الدرس 13

4
1
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
درس اليوم

حل مسائل  وضعيات مقارنة باعتماد نموذج الأشرطة
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

حل مسائل وضعيات مقارنة باعتماد نموذج الأشرطة
(ة)خاص بالأستاذ 
1
مرحباً سنتابع درسا جديدا في الرياضيات
 لديكم دقيقة واحدة. صححوا 
(ة)خاص بالأستاذ 
1
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
لديكم دقيقة واحدة لحساب هذه العمليات على السطر. دوّنوا النتيجة على دفاتركم.
 لديكم دقيقة واحدة للتصحيح.
(ة)خاص بالأستاذ 
الآن سنتعلم  كيف نحل مسألة وضعية مقارنة باعتماد نموذج الأشرطة
عرض فيديو النمذجة.
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 
خذوا ألواحكم. سنحل مسألة باتباع نفس الخطوات
 ماذا نفعل في الخطوة الأولى؟ 
 اقرؤوا المسألة وتخيلوها لديكم دقيقة واحدة
على الألواح اكتبوا الحرف الذي يوافق عم أبحث
القيمة الكبرى
القيمة الصغرى
الفرق بين القيمتين
A
B
C
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف تعرف الجواب
القيمة الكبرى
القيمة الصغرى
الفرق بين القيمتين
A
B
C
ماذا نفعل في الخطوة الثانية؟ 
نمثل المسألة باستعمال نموذج الأشرطة.
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح لنا كيف مثل المسألة؟
ماذا نفعل في الخطوة الثالثة؟ 
على الألواح، اكتبوا المتساوية
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح كيف استنتج المتساوية؟
ماذا نفعل في الخطوة الرابعة؟ 
على الألواح، اكتبوا  عبارة حل المسألة
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليمثل الخطوة الثانية ويحل المسألة؟
(ة)خاص بالأستاذ 
الآن خذوا كراساتكم الصفحة 45

لديكم 4 دقائق  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا؛ من يشرح لنا كيف حل المسألة؟  
(ة)خاص بالأستاذ 
 خذوا الكراسات 45 وأنجزوا النشاط 3 لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم
صححوا على كراساتكم 
(ة)خاص بالأستاذ 
اختتام الدرس
5
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة،
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:54.085315','2026-02-26 10:45:54.085361',1);
INSERT INTO "raida_lesson" VALUES(31,'MATH N4 P1 SEM2 S2','mathématiques','4','1','2','2','MATH_N4_P1_SEM2_S2.pptx','......','4 
1
2


 الدرس 5

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
الدرس 6
طَرْحُ الْأَعدادِ مِنْ 0 إِلى 999 9
درس اليوم

طَرْحُ الْأَعدادِ مِنْ 0 إِلى 999 9
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس 
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

طَرْحِ الْأَعداد مِنْ 0 إِلى 999 9
(ة)خاص بالأستاذ 
1
خذوا كراساتكم . الصفحة 19، سنصحح الواجب المنزلي.
صححوا  التمرين الثاني.  لديكم دقيقة واحدة.
صححوا  التمرين الخامس.  لديكم دقيقة واحدة.  من يشرح كيف نجيب؟
(ة)خاص بالأستاذ 
1
سنبدأ بالحساب الذهني. خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز هذه العمليات. دوّنوا النتيجة فقط في دفاتركم كما في المثال.
عرض فيديو الحساب الذهني 
صححوا. لديكم دقيقة واحدة.
(ة)خاص بالأستاذ 
1
 خذوا ألواحكم.

اكتبوا حرف العملية الصحيحة.
ارفعوا  ألواحكم.

صححوا.

 من يتحقق ويشرح لنا ؟
(ة)خاص بالأستاذ 
الآن، سنتعلم كيفية طرح الْأَعداد من 0 إِلى 999 9.
انتبهوا جيدا لشريط درس اليوم.
من يذكرنا بخطوات وضع وإنجاز عملية طرح.
(ة)خاص بالأستاذ 
النشاط 2

احسبوا هذا الفرق: 3 607 – 1 890. 
 
3 607- 1 890
ماذا نفعل في الخطوة الأولى؟  
3 607- 1 890
 على الألواح ، ضعوا العملية عموديا.

3 607- 1 890
ارفعوا  ألواحكم.
صححوا.



ما العمل في الخطوة الثانية؟ 


على ألواحكم، احسبوا الفرق منزلة منزلة وانتبهوا إلى المبادلات.
ارفعوا  ألواحكم.


صححوا.
خذوا ألواحكم.


ما العمل في الخطوة الثالثة؟ 


فليتقدم أحدكم ليعيد العملية ويتحقق من صحتها  ويكتب المتساوية.

3 607 – 1 890 =1 717
(ة)خاص بالأستاذ 
النشاط 1
أنجزوا العملية وانتبهوا إلى المبادلات.
ارفعوا  ألواحكم.
صححوا.  من يشرح كيف أنجز العملية؟ 
ضعوا عملية الطرح وانتبهوا إلى المبادلات.
ارفعوا  ألواحكم.
من يتقدم ويعيد العملية. للتحقق.
(ة)خاص بالأستاذ 
النشاط 2
الآن، خذوا كراساتكم الصفحة 21.

لديكم 5 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا . لديكم أربع دقائق؟
(ة)خاص بالأستاذ 
على الصفحة 21 أنجزوا النشاط رقم 5. لديكم 5 دقائق.
سأمر بين الصفوف لأقدم  المساعدة وأدون ملاحظاتي في كراساتكم.

صححوا على كراساتكم .لديكم دقيقتان.
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحتين 20 و 21.
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:54.345778','2026-02-26 10:45:54.345808',1);
INSERT INTO "raida_lesson" VALUES(32,'MATH N4 P1 SEM2 S3','mathématiques','4','1','2','3','MATH_N4_P1_SEM2_S3.pptx','......','
4 
1
2
الدرس 5
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
حَلُّ الْمَسَائلِ(اَلْبَحْثُ عَنِ الْكُلِّ أوِ الْجُزْءِ)-خطوتين-
جَمْعُ وَطَرْحُ الْأَعدادِ مِنْ 0 إِلى 999 9
درس اليوم

جَمْعُ وَطَرْحُ الْأَعدادِ مِنْ 0 إِلى 999 9
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

جَمْعِ وَطَرْحِ الْأَعدادِ مِنْ 0 إِلى 999 9.
(ة)خاص بالأستاذ 
1
 خذوا كراساتكم الصفحة 20. سنصحح الواجب المنزلي.
صححوا  التمرين 3.  لديكم دقيقة واحدة.
(ة)خاص بالأستاذ 
1
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
 أنجزوا في دقيقة.
صححوا في دقيقة.
(ة)خاص بالأستاذ 
1
 خذوا ألواحكم.

ضعوا وانجزوا العملية.
ارفعوا ألواحكم.

صححوا. من يتحقق.

ضعوا وانجزوا العملية.
ارفعوا ألواحكم.

صححوا. من يتحقق.
(ة)خاص بالأستاذ 
الآن سنتعلم جَمْعُ وَطَرْحُ الْأَعدادِ مِنْ 0 إِلى 999 9
عرض فيديو النمذجة
من يذكرنا بالخطوات.
(ة)خاص بالأستاذ 
 خذوا ألواحكم.
ماذا نفعل في الخطوة الأولى؟  

 على الألواح ، أنجزوا عملية الطرح.


ارفعوا ألواحكم.
صححوا.



ما العمل في الخطوة الثانية؟ 


على ألواحكم، تحققوا بإنجاز عملية الجمع.

ارفعوا ألواحكم.


صححوا. من يتحقق؟ 


ما العمل في الخطوة الثالثة؟ 


تَحَقّقوا مِن العمليتين. واكتبوا المتساويتين.
ارفعوا  ألواحكم.


صححوا.
(ة)خاص بالأستاذ 
 خذوا ألواحكم.
أنجزوا وتحققوا ثم أكملوا المتساويتين.
أولا : اكتبوا متساوية الطرح.

ارفعوا ألواحكم.
صححوا.
تحققوا بإنجاز العملية العكسية ، ثم اكتبوا المتساوية.

ارفعوا  ألواحكم.
تحققوا بإنجاز العملية العكسية ، ثم اكتبوا المتساوية.
(ة)خاص بالأستاذ 
الآن، خذوا كراساتكم الصفحة 23.

لديكم 5 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا . لديكم دقيقتان.
(ة)خاص بالأستاذ 

على الصفحة 23، أنجزوا  النشاط رقم 4. لديكم 5 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.
صححوا على كراساتكم .لديكم دقيقتان.
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحتين 22 و 23.
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:54.531956','2026-02-26 10:45:54.531985',1);
INSERT INTO "raida_lesson" VALUES(33,'MATH N4 P1 SEM2 S4','mathématiques','4','1','2','4','MATH_N4_P1_SEM2_S4.pptx','......','
4 
1
2
الدرس 1

خدو الكراسة
أيقونات توجيهية
توجيهات الاستاد
خذوا الألواح
عرض فيديو 
دفتر التمارين
دفاتر البحث
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
درس اليوم
حَلُّ الْمَسَائلِ(اَلْبَحْثُ عَنِ الْكُلِّ أوِ الْجُزْءِ)-خُطْوَتَين-
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس 
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

حَلُّ الْمَسَائلِ(اَلْبَحْثُ عَنِ الْكُلِّ أوِ الْجُزْءِ)-خُطْوَتَين-
(ة)خاص بالأستاذ 
تصحيح الواجب المنزلي
 خوذوا كراساتكم . الصفحة 21، سنصحح التمرين  رقم 6.

صححوا . لديكم دقيقة واحدة.
(ة)خاص بالأستاذ 
تصحيح الواجب المنزلي
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
 أنجزوا في دقيقية.
صححوا في دقيقة.
(ة)خاص بالأستاذ 
نتابع مع مجد وندى حل مسألة – انتبهوا 
عرض فيديو النمذجة.
من يذكرنا بالخطوات.
(ة)خاص بالأستاذ 
ماذا نفعل في الخطوة الأولى؟  

من يحكي ما فهمه من شريط المسألة؟

من يحكي ما فهمه من شريط المسألة؟ عم نبحث؟

نبحث عن قيمة الهدايا التي حصل عليها عماد.



ما العمل في الخطوة الثانية؟ 
ارفعوا  ألواحكم.


على ألواحكم، مثلوا معطيات الخطوة الأولى وحددوا المعطى الناقص.
؟
540
470


على ألواحكم، مثلوا معطيات الخطوة الأولى وحددوا المعطى الناقص.
؟
540
470
مَجْموعُ قِصَصِ الْعَربِيّةِ وَالْفَرَنْسِيّةِ:
540 + 470 = 1010    
2 540 – 1 870 = 670 
عَدَدُ  أَشْجارِ الزّيتونِ : 670 شَجَرَة.
1010
157
?


ما العمل في الخطوة الثالثة؟  
؟
540
470
مَجْموعُ قِصَصِ الْعَربِيّةِ وَالْفَرَنْسِيّةِ:
540 + 470 = 1010    
1010
157
?


استنتجوا متساوية الحل   وأنجزوا العملية على الألواح.
؟
540
470
مَجْموعُ قِصَصِ الْعَربِيّةِ وَالْفَرَنْسِيّةِ:
540 + 470 = 1010    
1010
157
?
ارفعوا  ألواحكم.


صححوا.
؟
540
470
مَجْموعُ قِصَصِ الْعَربِيّةِ وَالْفَرَنْسِيّةِ:
540 + 470 = 1010    
1010 -157 = 853
1010
157
?


ما العمل في الخطوة الرابعة؟
؟
540
470
مَجْموعُ قِصَصِ الْعَربِيّةِ وَالْفَرَنْسِيّةِ:
540 + 470 = 1010    
1010 -157 = 853
1010
157
?


اكتبوا متساوية الحل.
ارفعوا  ألواحكم.


صححوا.
(ة)خاص بالأستاذ 
خذوا الكرياسات صفحة 25.
اقرؤوا وافهموا ثم حلوا المسألة.
لديكم 6 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا.
؟
259
49
مَجْموعُ ثَمَنُ الْمُشْترَياتِ:
259 + 49 = 308 دِرْهَماً  
400 -308 = 92
400
308
?
اَلْمَبْلَغُ الّذي تَبَقّى لَدى عِماد: 
92 دِرْهَماً
(ة)خاص بالأستاذ 
على الصفحة 25 أنجزوا  لنشاط رقم 4. لديكم 5 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.
صححوا على كراساتكم .لديكم دقيقتان.
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحتين 24 و 25.
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:54.762997','2026-02-26 10:45:54.763038',1);
INSERT INTO "raida_lesson" VALUES(34,'MATH N4 P1 SEM2 S5','mathématiques','4','1','2','5','MATH_N4_P1_SEM2_S5.pptx','......','
4 
1
2
الدرس 6

الدرس 7

الدرس 8

الدرس 5

أيقونات توجيهية
توجيهات الأستاذ (ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور إلى الشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين الصفوف
برمجة الأسبوع الثاني 
(ة)خاص بالأستاذ 
مراجعة
مُراجَعَة وَتَثْبيتُ دُروسِ الْأُ سْبوعِ
درس اليوم

مُراجَعَة وَتَثْبيتُ دُروسِ الْأُ سْبوعِ
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 

جَمْعِ الْأعْدادِ مِنْ 0 إلى 9999 ؛ 
طَرْحِ الْأَعْدادِ مِنْ 0 إلى 9999؛          
حَلِّ الْمَسائِلِ(الْبَحْثُ عَنِ الْكُلِّ أَوِ الْجَزْءِ).
(ة)خاص بالأستاذ 

 افتتاح الدرس
1
حساب ذهني
تصحيح الواجب المنزلي
مرحباً يا أصدقاء. اليوم، سنراجع دروس الأسبوع.

نصحح التمرين رقم   5في الصفحة 25.
صححوا. من يقرأ نص المسـألة؟ أين الكل؟ أين الجزء 1 ؟ الجزء 2؟ ما المطلوب؟
(ة)خاص بالأستاذ 

 افتتاح الدرس
1
حساب ذهني
تصحيح الواجب المنزلي
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز العمليات. دوّنوا النتيجة فقط في دفاتركم كما في المثال.
عرض فيديو الحساب الذهني .
صححوا في دقيقة.
خذوا ألواحكم.
 أنجزوا العملية الأولى.

ارفعوا الألواح. 
صححوا.
 أنجزوا العملية الثانية.
ارفعوا الألواح. 
صححوا.
 أنجزوا العملية الثالثة.
صححوا.
2
5
(ة)خاص بالأستاذ 
خذوا الكراسات، الصفحة 26 .

ضعوا وأنجزوا ثم اكتبوا المتساوية. ابدؤا بالعملية الأولى.

صححوا. من يشرح لنا كيف توصل إلى الجواب؟
المرور بين الصفوف وتسجيل النسبة المئوية لعدد الإجابات الصحيحة.

+
 يعاد عرض فيديو نمذجة استراتيجية جمع  الأعداد من 0 إلى  9 999فقط كلما قلت نسبة التحكم عن .80%
صححوا. 
+
+
+
(ة)خاص بالأستاذ 
ضعوا وأنجزوا ثم اكتبوا المتساوية. ابدؤوا بالعملية الأولى.

صححوا. من يشرح لنا كيف توصل إلى الجواب؟
المرور بين الصفوف وتسجيل النسبة المئوية لعدد الإجابات الصحيحة. 
 يعاد عرض فيديو نمذجة استراتيجية طرح  الأعداد من 0 إلى 9 999 فقط كلما قلت نسبة التحكم عن .80%
صححوا. لديكم دقيقتين.
(ة)خاص بالأستاذ 
 يعاد عرض فيديو نمذجة استراتيجية جَمْعُ وَطَرْحُ الْأَعْدادِ مِنْ 0 إلى 9999
فقط كلما قلت نسبة التحكم عن .80%
(ة)خاص بالأستاذ 
خذوا الكراسات، الصفحة 27 .

افهموا المسألة وتخيلوا شريطها ثم قوموا بحلها.
صححوا. من يشرح لنا كيف توصل إلى الجواب؟
المرور بين الصفوف وتسجيل النسبة المئوية لعدد الإجابات الصحيحة.
يعاد عرض فيديو نمذجة استراتيجية حل المسائل (البحث عن الكل أو الجزء) فقط كلما قلت نسبة التحكم عن .80%
خذوا الكراسات، الصفحة 26 .

افهموا المسألة، تخيلوا شريطها ثم حلوها.
صححوا.

7    9    9     10
اقرؤا  واكتبوا الاعداد بالأرقام أو  بالحروف في النشاط رقم 5.
صححوا .

(ة)خاص بالأستاذ 
اختتام الدرس
5
إلى اللقاء.أكملوا إنجاز ما تبقى من التمارين في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:54.986291','2026-02-26 10:45:54.986321',1);
INSERT INTO "raida_lesson" VALUES(35,'MATH N4 P1 SEM3 S1','mathématiques','4','1','3','1','MATH_N4_P1_SEM3_S1.pptx','......','
4 
1
3
الدرس 9

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثالث
(ة)خاص بالأستاذ 
درس اليوم
ضرْبُ عَدَدٍ مِنْ رَقْمَينِ في عَدَدٍ مِنْ رَقْمَيْنِ.
(ة)خاص بالأستاذ 
          افتتاح الدرس
           نمذجة
2
           ممارسة الموجهة
3
           ممارسة المستقلة
4
            اختتام الدرس
5
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 

ضَرْبِ عَدَدٍ مِنْ رَقْمَينِ في عَدَدٍ مِنْ رَقْمَينِ.
(ة)خاص بالأستاذ 
أنشطة تمهيدية
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
  سيبدأ العداد؛ أنجزوا في دقيقة. 
صححوا في دقيقة.
(ة)خاص بالأستاذ 
أنشطة تمهيدية
 خذوا ألواحكم.

أنجزوا العملية.
ارفعوا ألواحكم.

صححوا. من يتحقق.

احسبوا بسرعة.
ارفعوا ألواحكم.

صححوا.

صححوا. من يشرح كيف نحسب بسرعة؟  لحساب  7x30 أحسب7x3  فقط وأكتب 0  على اليمين.



(ة)خاص بالأستاذ 
نشاهد الآن فيديو لكيفية إنجاز عمليات ضرب عددين من رقمين أو أكثر 
عرض فيديو النمذجة.
من يذكرنا بالخطوات.
(ة)خاص بالأستاذ 
النشاط 3
 خذوا ألواحكم.
ماذا نفعل في الخطوة الأولى؟ لحساب الجداء 26 x 34  

ضعوا العملية على الألواح.

ارفعوا الألواح. 
صححوا. 


ما العمل في الخطوة الثانية؟ 


على الألواح ، احسبوا جداء رقم وحدات العامل الثاني في أرقام العامل الأول.
ارفعوا  ألواحكم.


صححوا. من يشرح كيف حسب الجداء الأول؟


ما العمل في الخطوة الثالثة؟  


على الألواح. احسبوا الجداء الثاني؟
ارفعوا  ألواحكم.


صححوا. من يشرح  لماذا نكتب الصفر أولا؟


ما العمل في الخطوة الرابعة؟  


احسبوا مجموع الجداءين
ارفعوا  ألواحكم.


صححوا.
(ة)خاص بالأستاذ 
النشاط 3
على الألواح، ضعوا  وأنجزوا. لديكم دقيقتان.

ارفعوا  ألواحكم.
صححوا؛ من يقوم ليشرح لنا كيف أنجز العملية

(ة)خاص بالأستاذ 
النشاط 2
خذوا الكراسات صفحة 29.
أنجزوا التمرين رقم 4 صفحة 29.
لديكم 5 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا. لديكم دقيقتين.
(ة)خاص بالأستاذ 
على الصفحة 25 أنجزوا  النشاط رقم 5. لديكم 5 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.
صححوا على كراساتكم .لديكم دقيقتان.
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحة 29.
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:55.214695','2026-02-26 10:45:55.214736',1);
INSERT INTO "raida_lesson" VALUES(36,'MATH N4 P1 SEM3 S2','mathématiques','4','1','3','2','MATH_N4_P1_SEM3_S2.pptx','......','
4 
1
3
الدرس 9

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثالث
(ة)خاص بالأستاذ 
الدرس10 
ضرْبُ عَدَدٍ مِنْ رَقْمَينِ في عَدَدٍ مِنْ رَقْمَينِ.
ضرْبُ عَدَدٍ منْ ثَلاثةِ  أَرْقامٍ في عَدَدٍ مِنْ رَقْمَيْنِ.
درس اليوم
ضرْبُ عَدَدٍ منْ ثَلاثةِ  أَرْقامٍ في عَدَدٍ مِنْ رَقْمَيْنِ
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 

ضَرْبُ عَدَدٍ منْ ثَلاثةِ  أَرْقامٍ في عَدَدٍ مِنْ رَقْمَيْنِ.
(ة)خاص بالأستاذ 
1
 خذوا الكراسات الصفحة 28 . لنصحح التمرين رقم 3.
صححوا. لديكم دقيقتان.
 خذوا دفاتر البحث.
(ة)خاص بالأستاذ 
1
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
 أنجزوا في دقيقية.
صححوا. لديكم دقيقة واحدة
(ة)خاص بالأستاذ 
1
 خذوا ألواحكم.

اكتبوا على اللوحة الجداء فقط.
ارفعوا ألواحكم.

صححوا. 

من يشرح كيف نحسب الجداء دون إنجاز عملية.
أضرب 2 في 8 وأضيف صفرين على اليمين.

 احسبوا بسرعة . اكتبوا الجداء فقط .
ارفعوا ألواحكم.

صححوا. من يشرح كيف نحسب الجداء دون إنجاز عملية.
أضرب 4 في 5 وأضيف ثلاثة أصفار على اليمين.
(ة)خاص بالأستاذ 
 خذوا ألواحكم.
 أنجزوا العملية على الألواح.  .207 x 56
ارفعوا ألواحكم.
صححوا.
 أنجزوا العملية الثانية على الألواح.   .426 x 65
ارفعوا ألواحكم.
صححوا. 
 يعاد عرض فيديو نمذجة استراتيجية ضرب الأعداد  كلما قلََّتْ نسبة الإنجاز الصحيح للعمليتين عن .80%
من يذكرنا بخطوات إنجاز عملية ضرب
لاحظوا. من الآن فصاعدا نضع النقطة بدل الصفر عندما نمر إلى ضرب العشرات.


(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 31.

أنجزوا التمرين رقم 4 صفحة 31.
لديكم 5 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا. لديكم دقيقتين.
(ة)خاص بالأستاذ 
على الصفحة 31 أنجزوا  النشاط رقم 5. لديكم 10 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.
صححوا على كراساتكم .لديكم 3 دقائق.
(ة)خاص بالأستاذ 
اختتام الدرس
4
 انتبهوا جيدا! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحة 30.
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:55.528556','2026-02-26 10:45:55.528606',1);
INSERT INTO "raida_lesson" VALUES(37,'MATH N4 P1 SEM4 S1','mathématiques','4','1','4','1','MATH_N4_P1_SEM4_S1.pptx','......','
4 
1
4
  الدرس 13

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
الدرس 13
قِراءَةُ مِبْياناتٍ بِالْأَعْمِدَةِ  (1)
الدرس 15
الدرس 14
درس اليوم

قِراءَةُ مِبْيانٍ بِالْأَعْمِدَةِ  (1)
(ة)خاص بالأستاذ 
          افتتاح الدرس
           نمذجة
2
           ممارسة الموجهة
3
           ممارسة المستقلة
4
            اختتام الدرس
5
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 

تَعَرّفِ وَقِراءَةِ مِبْيانٍ بِالْأَعْمِدَةِ وَعَناصرِهِ.
(ة)خاص بالأستاذ 
أنشطة تمهيدية
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
الحساب الذهني. 
5 x 8  = 40
5 x 5 = ..
5 x 9 = ..
5 x 7  = ..
6 x 8  = ..
6 x 9  = ..
6 x 4  = ..
6 x 6  = ..
6 x 7  = ..
5 x 10  = ..
5 x 8  = 40
5 x 5 = 25
5 x 9 = 45
5 x 7  = 35
6 x 8  = 48
6 x 9  = 54
6 x 4  = 24
6 x 6  = 36
6 x 7  = 42
5 x 10  = 50
صححوا في دقيقة.
(ة)خاص بالأستاذ 
أنشطة تمهيدية
 خذوا ألواحكم.

يُمَثّلُ الْجَدْوَلُ الآتي بَياناتِ مَجْموعةٍ مِنَ التّلاميذِ حَوْلَ هِواياتِهِمْ المُفَضّلَة.  

اكتبوا على الألواح عدد التلاميذ الذين يفضلون كرة القدم.
ارفعوا ألواحكم.

صححوا.


اكتبوا على الألواح الهواية الأقل تفضيلا.
ارفعوا ألواحكم.

صححوا. المطالعة، 8 تلاميذ.


ما عدد التلاميذ الذين عبروا عن هواياتهم المفضلة؟
ارفعوا ألواحكم.

صححوا.من يشرح كيف حصل على الإجابة الصحيحة.  
12 + 9 + 8 = 
29
(ة)خاص بالأستاذ 
عرض فيديو النمذجة.
من يذكرنا بخطوات تعرف وقراءة مبيان بالأعمدة.
(ة)خاص بالأستاذ 
ارفعوا  ألواحكم.

تعرفوا عناصر هذا المبيان واقرؤوا بياناته.
ماذا نفعل في الخطوة الأولى؟  
 على الألواح ، اكتبوا عنوان المبيان.
1
أَتَعَرّفُ
أًقْرًأُ الْبَياناتِ
أَتَعَرّفُ
أَتَعَرّفُ
2
3
4
صححوا. ما السؤال الذي يجيب عليه العنوان. عم يتحدث المبيان؟ ما المعلومات التي يقدمها؟
1
أَتَعَرّفُ
أًقْرًأُ الْبَياناتِ
أَتَعَرّفُ
أَتَعَرّفُ
2
3
4

ما العمل في الخطوة الثانية؟ 
اكتبوا الألواح ماذا يقدم المحور الأفقي؟
ارفعوا  ألواحكم.
صححوا. المحور الأفقي يقدم المواد التي اجتازت فيها ندى االمراقبة المستمرة الأولى.

من يذكرنا بالسؤال الذي يجيب عليه المحور أو الخط العمودي. ما الذي نحسبه او نحصيه؟



ما العمل في الخطوة الثالثة؟ 


اكتبوا على الألواح ما الممثل على المحور أو الخط االعمودي؟
ارفعوا  ألواحكم.


صححوا.



ما العمل في الخطوة الرابعة؟ 


اكتبوا على الألواح المادة التي حصلت فيها ندى على أعلى نقطة.
ارفعوا  ألواحكم.


صححوا. من يتقدم إلى السبورة ليتححق بالمسطرة.




الآن : ما المادتان اللتان حصلت فيهما ندى على نفس الدرجة أو النقطة؟


نعم العربية والأمازيغية. 



هكذا، تعرفنا وقرأنا بيانات مبيان حول نقط ندى في  المراقبة المستمرة  الأولى.
من يذكرنا بالخطوات.
(ة)خاص بالأستاذ 


خذوا الكراسة صفحة 38 . 













أنجزوا التمرين رقم 1 صفحة 38.
لديكم 5 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا. لديكم دقيقتان.
اَلْقِراءَةُ ؛ اَلرّسْمُ؛ اَلطَّبْخ؛ تَرْبِيّةُ الْقِطَطِ؛ 
صححوا. 
صححوا. 
اَلْقِراءَةُ ؛ اَلرّسْمُ؛ اَلطَّبْخ؛ تَرْبِيّةُ الْقِطَطِ؛ 
اَلرّسْمُ.

12 تِلْميذًا
اَلطّبْخُ.
5 تَلاميذ.
5
(ة)خاص بالأستاذ 
على الصفحة 39 أنجزوا  النشاط رقم 2. لديكم 5 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.








صححوا على كراساتكم .لديكم دقيقتان.
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا ! أنجزوا النشاط رقم 3 في الصفحة 39 في المنزل.






إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح النشاط رقم 3.
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:55.753855','2026-02-26 10:45:55.753886',1);
INSERT INTO "raida_lesson" VALUES(38,'MATH N4 P1 SEM3 S3','mathématiques','4','1','3','3','MATH_N4_P1_SEM3_S3.pptx','......','
4 
1
3
الدرس 9

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثالث
(ة)خاص بالأستاذ 
ضرْبُ عَدَدٍ مِنْ رَقْمَينِ في عَدَدٍ مِنْ رَقْمَينِ.
ضرْبُ عَدَدٍ منْ ثَلاثةِ  أَرْقامٍ في عَدَدٍ مِنْ رَقْمَيْنِ.
وَضْعُ وَإنْجازُ عَمَليّاتِ الضّرْبِ.
درس اليوم
وَضْعُ وَإنْجازُ عَمَليّاتِ الضّرْبِ.
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 

وَضْعُ وَإنْجازُ عَمَليّاتِ الضّرْبِ.
(ة)خاص بالأستاذ 
1
 خذوا الكراسات الصفحة 31. لنصحح التمرين رقم 2.
صححوا. لديكم دقيقة واحدة. تحققوا باستعمال الآلة الحاسبة.
(ة)خاص بالأستاذ 
1
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
 أنجزوا في دقيقة.
 صححوا في دقيقة.
(ة)خاص بالأستاذ 
 خذوا ألواحكم.
ارفعوا ألواحكم.
صححوا. تحققوا باستعمال الآلة الحاسبة.
 أنجزوا العملية الثانية على الألواح :   .584 X 64
ارفعوا ألواحكم.
صححوا. تحققوا باستعمال الآلة الحاسبة.
 يعاد عرض فيديو نمذجة استراتيجية ضرب  الأعداد  كلما قلت نسبة الإنجاز الصحيح للعمليتين عن .80%
من يذكرنا بخطوات إنجاز عملية ضرب؟
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 32.

أنجزوا التمرين رقم 2 صفحة 32 
لديكم 4 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا. لديكم دقيقتين.
(ة)خاص بالأستاذ 
على الصفحة 33 أنجزوا  النشاط رقم 3. لديكم 10 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.
صححوا على كراساتكم .لديكم 3 دقائق. تحققوا باستعمال الآلة الحاسبة.
(ة)خاص بالأستاذ 
اختتام الدرس
4
 انتبهوا جيدا! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحة32و33.
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:55.909431','2026-02-26 10:45:55.909458',1);
INSERT INTO "raida_lesson" VALUES(39,'MATH N4 P1 SEM4 S2','mathématiques','4','1','4','2','MATH_N4_P1_SEM4_S2.pptx','......','
4 
1
4
الدرس      13

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
قِراءَةُ مِبْياناتٍ بِالْأَعْمِدَةِ  (1)
قِراءَةُ مِبْياناتٍ بِالْأَعْمِدَةِ  (2)
قِراءَةُ مِبْياناتٍ بِالْأَعْمِدَةِ  (3)  
حَلُّ الْمَسَائلِ:
(اَلْبَحْثُ عَنِ الْكُلِّ أَوِ الْجُزْءِ- خُطْوَتَينِ).
درس اليوم
قِراءَةُ مِبْيانٍ بِالْأَعْمِدَةِ  (2)
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

قِراءَةِ وَتأْويلِ بَياناتِ مِبْيانٍ بِالْأَعْمِدَةِ.
(ة)خاص بالأستاذ 
1
مرحباً سنتابع درسا جديدا مع مجد وندى
 خذوا الكراسات، الصفحة 39 .لنصحح النشاط رقم 3.

صححوا، من يذكر بخطوات تعرف وقراءة بيانات مبيان بالأعمدة.
(ة)خاص بالأستاذ 
1
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
  سيبدأ العداد؛ أنجزوا في دقيقة. 
صححوا في دقيقة.
(ة)خاص بالأستاذ 
1
 لاحظوا المبيان ، من يحدد عنوانه؟
صحيح.المبيان يتحدث عن توزيع عدد التلاميذ المشاركين في حصص الدعم حسب المستويات.



خذوا ألواحكم.
تعرفوا المبيان  واكتبوا الحرف الصحيح لما يمثله المحور الأفقي؟
ارفعوا ألواحكم.
صححوا.




الآن، اكتبوا الحرف المناسب لما يمثله المحور العمودي.
ارفعوا  ألواحكم.
صححوا.




الآن:انتبهوا إلى السلم واكتبوا على الألواح كم تمثل كل تدريجة كبيرة من التلاميذ.
ارفعوا ألواحكم.
صححوا.  كل تدريجة كبيرة تمثل 5 تلاميذ؛  0؛ 5؛ 10؛ 15تلميذا ، 30،25،20.
هكذا، تعرفنا عناصر المبيان.
اَلْمُسَتَوياتُ الدّراسِيّةُ
عَدَدُ التّلاميذِ

(ة)خاص بالأستاذ 

قِراءَةِ وَتأْويلِ بَياناتِ مِبْيانٍ بِالْأَعْمِدَةِ.
 نمذجة 
2
عرض فيديو النمذجة.
من يذكرنا بخطوات قراءة  وتأويل بيانات مبيان بالأعمدة.
(ة)خاص بالأستاذ 

اقرؤوا بيانات هذا المبيان.

4

ما العمل للأجابة على  هذا السؤال.
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
أُحَدّدُ

بعد ما تعرفتم عناصر المبيان.الآن :في الخطوة الثانية، من يحدد المعلومة المطلوبة في السؤال. 

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
أُحَدّدُ
صحيح، السؤال يطلب عدد تلاميذ المستوى الرابع المشاركين في حصص الدعم.



4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
أُحَدّدُ
ماذا نفعل في الخطوة الثالثة؟



4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
من يحدد أين نجد عدد تلاميذ المستوى الرابع المشاركين في حصص الدعم؟



4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
بعدما حددنا عمود المستوى الرابع على المحور الأفقي، نبحث عن القيمة المطابقة لأعلى العمود على المحور العمودي.



4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
ارفعوا  ألواحكم.
صححوا.



4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
25
(ة)خاص بالأستاذ 

4
أولوا بيانات المبيان لتجيبوا على الأسئلة؟
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
ما العمل للإجابة على هذا السؤال.

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ

لقد تعرفتم عناصر المبيان. من يحدد المطلوب في هذا السؤال؟

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ

المعلومة المطلوبة ليست موجودة في المبيان مباشرة مما يستدعي تأويل البيانات.

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ

 اكتبوا الإجابة على الألواح. 

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
ارفعوا ألواحكم.

مجموع التلاميذ المشاركين في الدعم هو: 100.

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ


 من يشرح كيف نحصل على الإجابة الصحيحة.
24+16+25+21+14

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ

14
21
16
21
25
24
16
21
24

الآن: ماذا نفعل للإجابة على السؤال الآتي؟

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ

 من  يحدد المعلومة المطلوبة في السؤال؟

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ

المطلوب: تحديد الفرق بين عدد المشاركين في حصص الدعم بين المستويين الخامس والسادس.

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ

استخرجوا المعلومات وأولوها واكتبوا الإجابة على الألواح.

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ
ارفعوا ألواحكم.

صححوا.  

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ


24 – 16 = 8

  من يشرح كيف حصل على إجابة صحيحة.

4
أَسْتَخْرِجُ وأُؤَوِّلُ
أُحَدّدُ


24 – 16 = 8
24
16
هكذا، تعرفنا وقرأنا وأولنا بيانات مبيان بالأعمدة. من يذكرنا بالخطوات.
(ة)خاص بالأستاذ 


خذوا الكراسة صفحة 40 . 





أنجزوا التمرين رقم 2 صفحة 40.
104
لديكم 5 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
104
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا. لديكم دقيقتان؛ السؤال الأول.
صححوا السؤال الثاني.
22 دِرْهَمًا



22
صححوا السؤال الثالث.
22 دِرْهَمًا


13
22
25
17
27
صححوا السؤال الرابع.

يَوْمُ الْجُمُعَة.
22 دِرْهَمًا


(ة)خاص بالأستاذ 
على الصفحة 41 أنجزوا  النشاط رقم 3. لديكم 5 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.
صححوا على كراساتكم .لديكم دقيقتان.
تِطوان.
27-22= 5 دَرجاتٍ
الجديدة.
وَجْدَة وَ الْجَديدَة.




(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا ! أنجزوا النشاط رقم   4في الصفحة 41 في المنزل.






إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح النشاط رقم 4.
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:56.156160','2026-02-26 10:45:56.156191',1);
INSERT INTO "raida_lesson" VALUES(40,'MATH N4 P1 SEM5 S1','mathématiques','4','1','5','1','MATH_N4_P1_SEM5_S1.pptx','......','4 
1
5
أيقونات توجيهية
توجيهات الأستاذ (ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور إلى الشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
(ة)خاص بالأستاذ 
برمجة الأسبوع الخامس
اَلْكُسورُ الْمُتَكافِئَةُ
حَلُّ الْمَسائِلِ – توليف-
درس اليوم

اَلْكُسورُ
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

تَعَرُّفِ وَتَمْثيلِ الْكُسورِ.
(ة)خاص بالأستاذ 
1
لديكم دقيقة واحدة لإنجاز هذه العمليات. دوّنوا النتيجة فقط على دفاتركم كما في المثال.
عرض فيديو الحساب الذهني 
صححوا في دقيقة.
(ة)خاص بالأستاذ 
1
مرحباً، سنتابع درسا جديدا.
 خذوا ألواحكم.
اكتبوا  الكسر المناسب للجزء الملون من الوحدة في التمثيل.
ارفعوا ألواحكم.
صححوا.
 من يشرح كيف حصل على إجابة صحيحة.
التوجيه إلى كون الكسر يمثل ثلاثة أجزاء الوحدة أو ثلاثة أجزاء من أربعة أجزاء.
اكتبوا  على الألواح حرف التمثيل المناسب للكسر 2 من 5 أو اثنان على خمسة.
ارفعوا ألواحكم.
صححوا.

 خذوا الكراسات صفحة48. لننجز التمرين الأول.

اكتبوا الكسر المعبر عن الجزء الملون من كل تمثيل.
صححوا.
(ة)خاص بالأستاذ 
عرض فيديو النمذجة
من يذكرنا  بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 
النشاط 2
خذوا ألواحكم. سنتعرف ونكتب الكسور الممثلة باتباع نفس الخطوات.
 ماذا نفعل في الخطوة الأولى؟ 
حددوا الوحدة واكتبوا عدد أجزائها في مقام الكسر.
ارفعوا ألواحكم.
صححوا. من يتحقق من ذلك؟
 أبدأ من 0،  1، 2 ، 3 ، 4 ، 5. خمسة أجزاء.
ما العمل في الخطوة الموالية؟
اكتبوا عدد الأجزاء الملونة في بسط الكسر.
ارفعوا ألواحكم.
صححوا.

هناك 8 أجزاء ملونة. 1، 2، 3 ، 4 ، 5 ، 6 ، 7 ،8 . الكسر المناسب هو: 8 على 5.
1
2
3
4
5
6
7
8
ما العمل في الخطوة الثالثة؟
1
2
3
4
5
6
7
8
ما العمل في الخطوة الثالثة؟
قارنوا الكسر 8 على 5 مع واحد.
ارفعوا ألواحكم.
صححوا. من يشرح لماذا؟ 
أَكْبَرُ
كيف نتعرف كسرا أصغر من 1؟ يكون البسط أصغر من المقام.
أَكْبَرُ
هكذا، كتبنا الكسر المناسب للجزء الملون من التمثيل وقارناه ب 1.
أَكْبَرُ
من يذكرنا  بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 
النشاط 2
الآن، خذوا كراساتكم الصفحة 49.

أكملوا إنجاز النشاط لديكم 4 دقائق. سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا.لديكم دقيقتان.
كيف عرفتم أن 5 على 7 أصغر من 1؟
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 49.

اكتبوا الكسور الممثلة للجزء الملون ثم قارنوها ب1.
صححوا على كراساتكم. لديكم دقيقتان 
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا ! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحتين 48 و 49.
إلى اللقاء. في الحصة القادمة، سنقوم بالتصحيح. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:56.318497','2026-02-26 10:45:56.318524',1);
INSERT INTO "raida_lesson" VALUES(41,'MATH N4 P1 SEM5 S2','mathématiques','4','1','5','2','MATH_N4_P1_SEM5_S2.pptx','......','4 
1
5
أيقونات توجيهية
توجيهات الأستاذ (ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور إلى الشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
(ة)خاص بالأستاذ 
برمجة الأسبوع الخامس
اَلْكُسورُ الْمُتَكافِئَةُ
حَلُّ الْمَسائِلِ – توليف-
درس اليوم

تَفْكيكُ الْكُسورِ
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

كِتابَةِ كُسورٍ أَكْبَرُ مِنْ 1 كِتابَةً مُخْتَلِطَةً.
(ة)خاص بالأستاذ 
1
الحساب الذهني
 خذوا الكراسات صفحة 49 . لنصحح النشاطين 5 و 6.

صححوا النشاط6.
صححوا النشاط6.
(ة)خاص بالأستاذ 
1
الحساب الذهني
لديكم دقيقة واحدة لإنجاز هذه العمليات. دوّنوا النتيجة فقط على دفاتركم كما في المثال.
عرض فيديو الحساب الذهني 
صححوا في دقيقة.
(ة)خاص بالأستاذ 
1
الحساب الذهني
خذوا ألواحكم.
اكتبوا الكسر الأكبر من واحد؟
صححوا.
اكتبوا الكسر الأصغر من واحد.
ارفعوا ألواحكم.
صححوا.
خذوا الكراسات صفحة 50، لننجز التمرين 2.

لونوا الجزء المناسب للكسر المركب كما في المثال.

صححوا.

(ة)خاص بالأستاذ 
عرض فيديو النمذجة
من يذكرنا  بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 
النشاط 2
خذوا ألواحكم. سنفكك كسرا ونكتبه على شكل كتابة مختلطة باتباع نفس الخطوات.
 ماذا نفعل في الخطوة الأولى؟ 
فككوا الكسر إلى وحدات كاملة.
ارفعوا ألواحكم.
صححوا. من يشرح كيف نفعل ذلك؟ الوحدة هي أربعة أرباع.
وَحَدَةٌ
 كامِلَةٌ

وَحَدَةٌ
 كامِلَةٌ

ما العمل في الخطوة الثانية؟
وَحَدَةٌ
 كامِلَةٌ

وَحَدَةٌ
 كامِلَةٌ

بعدما تعرفنا الوحدات الكاملة. اكتبوا كسر الوحدة غير الكاملة .
وَحَدَةٌ غَيْرُ
 كامِلَةٍ

وَحَدَةٌ
 كامِلَةٌ

وَحَدَةٌ
 كامِلَةٌ

ارفعوا ألواحكم.
صححوا. 
وَحَدَةٌ غَيْرُ
 كامِلَةٍ

وَحَدَةٌ
 كامِلَةٌ

وَحَدَةٌ
 كامِلَةٌ

ما العمل في الخطوة الثالثة؟



اكتبوا الكسر المركب  10 على 4 كتابة مختلطة.



صححوا. من يقرأ ؟  وحدتان كاملاتان وجزءان من الوحدة. أو 2 و2على4
هكذا فككنا الكسر 10على 4 وكتبناه كتابة مختلطة أي عدد صحيح وبمحاذاته كسر.
من يذكرنا  بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 
النشاط 2
الآن، خذوا كراساتكم الصفحة 51.

أكملوا إنجاز النشاط 4 كما في المثال، لديكم 4 دقائق. سأمر بين الصفوف لمساعدتكم.

 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا.لديكم دقيقتان.
4
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 51.

فككوا و ركبوا الكسور. لديكم3 دقائق.
صححوا على كراساتكم. لديكم دقيقتان. 
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا ! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحتين 50 و 51.
إلى اللقاء. في الحصة القادمة، سنقوم بالتصحيح. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:56.452533','2026-02-26 10:45:56.452560',1);
INSERT INTO "raida_lesson" VALUES(42,'MATH N4 P1 SEM4 S3','mathématiques','4','1','4','3','MATH_N4_P1_SEM4_S3.pptx','......','
4 
1
4
الدرس   14 

  الدرس 15

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
درس اليوم
قِراءَةُ مِبْيانٍ بِالْأَعْمِدَةِ  (3)
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

تَعَرّفِ وَتَأويلِ بَياناتِ مِبْيانٍ تِكْرارِيّ.
(ة)خاص بالأستاذ 
1
مرحباً سنتابع درسا جديدا مع مجد وندى
 خذوا الكراسات صفحة 41. لنصحح التمرين رقم 4.
صححوا.
صححوا.
(ة)خاص بالأستاذ 
1
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
  سيبدأ العداد؛ أنجزوا في دقيقة. 
صححوا في دقيقة.
(ة)خاص بالأستاذ 
1
 خذوا ألواحكم.
 لاحظوا المبيان ، من يحدد عنوانه؟
صحيح.المبيان يتحدث عن توزيع التلاميذ الذكور والاناث حسب المستويات الدراسية.
تعرفوا  المبيان  واكتبوا الحرف الصحيح لما يمثله المحور الأفقي؟
ارفعوا  ألواحكم.
صححوا.




الآن، اكتبوا الحرف المناسب لما يمثله المحور العمودي.
ارفعوا  ألواحكم.
صححوا.




الآن، اقرؤا المفتاح واكتبوا الحرف المناسب لما تشير إليه الأعمدة الزرقاء.
ارفعوا ألواحكم.




صححوا.

(ة)خاص بالأستاذ 
سنتعرف الآن نوع هذه المبيانات وكيف نقرأ ونؤول معطياتها
عرض فيديو النمذجة الجزء 1.
من يذكرنا بخطوات قراءة  وتأويل بيانات مبيان تكراري. نواصل متابعة كيفية تأويل معطيات مبيان تكراري
عرض فيديو النمذجة الجزء 2.
(ة)خاص بالأستاذ 

من يقرأ  عناصر هذا المبيان؟ 

ما العمل للأجابة على السؤال الأول.

بعد ما تعرفتم عناصر المبيان. من يحدد المعلومة المطلوبة في السؤال؟ 
صحيح، السؤال يطلب عدد التلاميذ الذكور في  المستوى الأول.


ماذا نفعل في الخطوة الثالثة؟


من يحدد أين نجد عدد التلاميذ الذكور في  المستوى الأول؟ اكتبوا الإجابة على الألواح.


ارفعوا  ألواحكم.
صححوا.


14

(ة)خاص بالأستاذ 
الآن : استخرجوا المعلومات وأولوا بيانات المبيان وأجيبوا عن الأسئلة؟
ما العمل للإجابة على السؤال الثاني؟

لقد تعرفتم عناصر المبيان. من يحدد المطلوب في هذا السؤال؟

نستخرج المعلومة المطلوبة مباشرة من المبيان . اكتبوا على الألواح المستوى الذي يتساوى فيه علو عمودي الذكور والإناث.
ارفعوا  ألواحكم.

صححوا. 
اَلْمُسْتَوى الثّاني


الأن : ما العمل للإجابة على السؤال الآتي؟

من يحدد المعلومة المطلوبة؟ مجموع تلاميذ المستوى الرابع.

لا يمكن استخراج عدد تلاميذ المستوى الرابع مباشرة من المبيان. اكتبوا على الألواح الإجابة.
ارفعوا  ألواحكم.

صححوا. من يشرح كيف نحصل على الإجابة الصحيحة.
(ة)خاص بالأستاذ 


خذوا الكراسة صفحة 42 . 







أنجزوا التمرين رقم 2 صفحة 42.
لديكم 5 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا. لديكم دقيقتان. السؤال الأول.
الْمُسْتَوى السّادِس


صححوا السؤال الثاني.
صححوا السؤال الثالث. هي المستويات حيث العمود البرتقالي أعلى من العمود الأزرق.
صححوا السؤال الرابع. 
الْمُسْتَوى السّادِس
الْمُسْتَوى السّادِس

اَلأَوّلُ؛ الثّاني؛ الرّابعُ؛ الْخامِسُ
15
16
15 + 16 = 31 تِلْميذَةً وَتِلْميذًا
(ة)خاص بالأستاذ 
على الصفحة 43 أنجزوا  النشاط رقم 3. لديكم 5 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.
يَقِلُّ
صححوا على كراساتكم .لديكم دقيقتان.
5
10
15 – 10 = 5 كُتُبٍ
يَقِلُّ

يَومُ الْجُمُعَة.
10 +5 = 15 كِتابًا
8 كُتُبٌ  
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا ! أنجزوا النشاط رقم   4في الصفحة 43 في المنزل.

إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح النشاط رقم 4.
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:56.742078','2026-02-26 10:45:56.742122',1);
INSERT INTO "raida_lesson" VALUES(43,'MATH N4 P1 SEM5 S3','mathématiques','4','1','5','3','MATH_N4_P1_SEM5_S3.pptx','......','4 
1
5
أيقونات توجيهية
توجيهات الأستاذ (ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور إلى الشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
(ة)خاص بالأستاذ 
برمجة الأسبوع الخامس
اَلْكُسورُ الْمُتَكافِئَةُ
حَلُّ الْمَسائِلِ – توليف-
درس اليوم

اَلْكُسورُ الْمُتَكافِئَةُ
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

تَحْديدِ كَسْرٍ مُكافئٍ لِكَسْرٍ آخَرَ.
(ة)خاص بالأستاذ 
1
أنشطة تمهيدية
 خذوا الكراسات الصفحتين  50 و 51 . لنصحح النشاطين 5 و 6.


صححوا النشاط 3  صفحة 50   
صححوا النشاط6 صفحة 51.
(ة)خاص بالأستاذ 
1
أنشطة تمهيدية
لديكم دقيقة واحدة لإنجاز هذه العمليات. دوّنوا النتيجة فقط على دفاتركم كما في المثال.
عرض فيديو الحساب الذهني. 
صححوا في دقيقة.
(ة)خاص بالأستاذ 
1
أنشطة تمهيدية
خذوا ألواحكم.
احسبوا على الألواح.
5x2= …
ارفعوا ألواحكم.
صححوا.
5x2= 10
احسبوا بسرعة.
5x2= 10
÷ 10 5 = …
ارفعوا ألواحكم.
صححوا. القسمة عملية عكسية للضرب.
5x2= 10
÷ 10  5= 2
لاحظوا  التمثيلات واكتبوا كسورا  تعبر عن النصف.
ارفعوا ألواحكم.
(ة)خاص بالأستاذ 
عرض فيديو النمذجة
من يذكرنا  بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 
النشاط 2
النشاط 3
 ماذا نفعل في الخطوة الأولى؟ 
اضربوا البسط و المقام في 2.
صححوا .
ما العمل في الخطوة الثانية؟
اكتبوا الكسر المكافئ.
ارفعوا ألواحكم.
ما العمل في الخطوة الثالثة؟
تحققوا . من يتحقق؟
1 x 2=  2
3 x 2=  6
(ة)خاص بالأستاذ 
النشاط 2
النشاط 3
 ماذا نفعل في الخطوة الأولى؟ 
اقسموا البسط والمقام على 2.
ارفعوا ألواحكم.
صححوا .
ما العمل في الخطوة الثانية؟
اكتبوا الكسر المكافئ.
ارفعوا ألواحكم.
ما العمل في الخطوة الثالثة؟
تحققوا . من يتحقق؟
2 ÷ 2=  1
4 ÷ 2=  2
من يذكرنا  بما تعلمناه مع مجد وندى؟
(ة)خاص بالأستاذ 
النشاط 2
النشاط 3
الآن، خذوا كراساتكم الصفحة 53.

أكملوا إنجاز النشاط 3 كما في المثالين، لديكم 4 دقائق. سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا.لديكم دقيقتان.
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 53.

فككوا و ركبوا الكسور. لديكم3 دقائق.
صححوا على كراساتكم. لديكم دقيقتان. 
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا ! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحتين 52 و 53.
إلى اللقاء. في الحصة القادمة، سنقوم بالتصحيح. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:56.910619','2026-02-26 10:45:56.910646',1);
INSERT INTO "raida_lesson" VALUES(44,'MATH N4 P1 SEM5 S4','mathématiques','4','1','5','4','MATH_N4_P1_SEM5_S4.pptx','......','4 
1
5
أيقونات توجيهية
توجيهات الأستاذ (ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور إلى الشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
(ة)خاص بالأستاذ 
برمجة الأسبوع الخامس
اَلْكُسورُ الْمُتَكافِئَةُ
حَلُّ الْمَسائِلِ – توليف-
درس اليوم

حَلُّ الْمَسائِلِ
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
4
5
(ة)خاص بالأستاذ 

حَلِّ الْمَسائِلِ.
(ة)خاص بالأستاذ 
1
 خذوا الكراسات الصفحتين  52 و 53 . لنصحح النشاطين 2 و 5.


صححوا النشاط 2  صفحة 52.   
صححوا النشاط5 صفحة 53.


(ة)خاص بالأستاذ 
1
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز هذه العمليات. دوّنوا النتيجة فقط على دفاتركم كما في المثال.
عرض فيديو الحساب الذهني. 
صححوا في دقيقة.
(ة)خاص بالأستاذ 
النشاط 1
النشاط 2
النشاط 3
خذوا الكراسات صفحة 54. 
اقرؤوا وافهموا المسألة وأحيطوا نموذج الأشرطة المناسب لتمثيل معطياتها، ثم اشرحوا لماذا.
من يذكرنا بالخطوات.
صححوا.

صححوا. من يشرح لماذا؟

صححوا. من يشرح لماذا؟

لَدَيْنا:
 اَلْجُزْءُ الْأَوَّلُ: اَلْمَسافَةُ الْمَقْطوعَةُ ذَهابًا: 576 كيلومِترًا
اَلْجُزءُ الثّاني: اَلْمَسافَةُ الْمَقْطوعَةُ إِيَّابًا 485 كيلومِتْرًا
اَلْمَطلوبُ : حِسابُ الْكُلِّ أَيْ جَمْعُ الْجُزْءَيْنِ.
تعاد النمذجة من طرف الأستاذ/ة كلما لزم ذلك.
(ة)خاص بالأستاذ 
النشاط 1
النشاط 2
النشاط 3
اقرؤوا وافهموا  وحلوا المسألة.
من يذكرنا بالخطوات.
صححوا.
صححوا. من يشرح كيف حصل على إجابة صحيحة.

تعاد النمذجة من طرف الأستاذ/ة كلما لزم ذلك.
(ة)خاص بالأستاذ 
النشاط 1
النشاط 3
النشاط 2
اقرؤوا وافهموا  وحلو المسألة . 
من يذكرنا بخطوات حل مسألة من خطوتين.
صححوا. من يشرح كيف نجيب بشكل صحيح.
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 55.

اقرؤوا وافهموا  وحلو المسألة  في النشاط 4.
صححوا على كراساتكم. لديكم دقيقتان. 
من يشرح كيف حصل على إجابة صحيحة.
(ة)خاص بالأستاذ 
اختتام الدرس
4
 انتبهوا جيدا ! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحتين 54 و 55.
إلى اللقاء. في الحصة القادمة، سنقوم بالتصحيح. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:57.065343','2026-02-26 10:45:57.065382',1);
INSERT INTO "raida_lesson" VALUES(45,'MATH N4 P1 SEM3 S4','mathématiques','4','1','3','4','MATH_N4_P1_SEM3_S4.pptx','......','
4 
1
3
الدرس 10

الدرس 11

الدرس 9

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثالث
(ة)خاص بالأستاذ 
ضرْبُ عَدَدٍ مِنْ رَقْمَينِ في عَدَدٍ مِنْ رَقْمَينِ.
ضرْبُ عَدَدٍ منْ ثَلاثةِ  أَرْقامٍ في عَدَدٍ مِنْ رَقْمَيْنِ.
وَضْعُ وَإنْجازُ عَمَليّاتِ الضّرْبِ.
حَلُّ الْمَسَائلِ:
(اَلْبَحْثُ عَنِ الْكُلِّ أَوِ الْجُزْءِ- اَلأَجْزاءُ الْمُتساوِيّة).
درس اليوم
حَلُّ الْمَسَائلِ:(اَلْبَحْثُ عَنِ الْكُلِّ أَوِ الْجُزْءِ- اَلأَجْزاءُ الْمُتساوِيّة).
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
           افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
1
1
1
1

1
2
3
4
5
(ة)خاص بالأستاذ 

حَلُّ الْمَسَائلِ:
(اَلْبَحْثُ عَنِ الْكُلِّ أَوِ الْجُزْءِ- اَلأَجْزاءُ الْمُتساوِيّة).
(ة)خاص بالأستاذ 
1
 خذوا الكراسات الصفحة 33 . لنصحح التمرين رقم 4.

صححوا. لديكم دقيقتان. من يشرح لماذا وظفنا عملية الضرب. 
(ة)خاص بالأستاذ 
1
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
 أنجزوا في دقيقية.
صححوا في دقيقة.
(ة)خاص بالأستاذ 
1
 خذوا ألواحكم.

اقرؤا المسألة واكتبوا رقم الشريط المتخيل المناسب على الألواح.
في مَدْرَسَةٍ 750 تِلْميذَةً وَتِلْميذاً .     
 ما عَدَدُ التّلاميذِ الذُّكورِ إِذا بَلَغَ عَدَدُ التّلِميذاتِ 500 تِلْميذَةً؟
ارفعوا ألواحكم.

صححوا. السيناريو الصحيح هو رقم 3.
في مَدْرَسَةٍ 750 تِلْميذَةً وَتِلْميذاً .     
 ما عَدَدُ التّلاميذِ الذُّكورِ إِذا بَلَغَ عَدَدُ التّلِميذاتِ 500 تِلْميذَةً؟


لاحظوا التمثيل واكتبوا على الألواح رقم العبارة التي تحيل على  المطلوب والعملية المناسبة؟
ارفعوا ألواحكم.

صححوا. 
(ة)خاص بالأستاذ 
لنتذكر مع مجد وندى خطوات حل المسائل باستخدام نموذج الأشرطة 
عرض فيديو النمذجة.
من يذكرنا بالخطوات الأربع لحل مسألة.
(ة)خاص بالأستاذ 
ماذا نفعل في الخطوة الأولى؟ لحل هذه المسألة؟  

في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 
من يتقدم، يغمض عينيه ويحكي شريط المسألة؟
انتداب تلميذ لسرد شريط المسألة مع  التركيز على 8 صور تتكرر 12 مرة.

في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 
من يحدد المطلوب؟
اَلْمَطْلوبُ:  ...............................................................................  
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 
نعم: المطلوب حساب الكل. أي كل الصور في الملف العائلي.
اَلْمَطْلوبُ:  اَلْعَدَدُ الْكُلّيُ لِلصُّوَرِ في الْمَلَفِّ.  
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 
 خذوا ألواحكم.


ما العمل في الخطوة الثانية؟ 
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 


مثلوا معطيات  المسألة على الألواح بالأشرطة لتعرف العملية المناسبة
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 
ارفعوا  ألواحكم.


صححوا.  12 شريطا  متشابها لتمثيل صفحات الملف و داخل كل شريط أكتب 8 أي 8 صور.
بينما المطلوب الذي هو كل الصور، أمثله بشريط كبير بطول الأشرطة الإثنا عشر. 
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 


ما العمل في الخطوة الثالثة؟  


على الألواح. استنتجوا متساوية الحل؟
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 
ارفعوا  ألواحكم.


صححوا.   لأجد الكل حيث تتكرر 8 إثناعشر مرة، أضرب 12 في8.
أَسْتَنْتِجُ مُتَساوِيّةَ الْحَلِّ: 
 12 X 8 = 96
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 


ما العمل في الخطوة الرابعة؟  
أَسْتَنْتِجُ مُتَساوِيّةَ الْحَلِّ: 
 12 X 8 = 96
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 


ما العمل في الخطوة الرابعة؟  
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 
أَسْتَنْتِجُ مُتَساوِيّةَ الْحَلِّ: 
 12 X 8 = 96


اكتبوا عبارة الحل على الألواح.
في مَلَفِّ صُوَرٍ عائِلِيَّةٍ. 12 صَفْحَةً، في كُلِّ صَفْحَةٍ 8 صُوَرٍ. 
ما عَدَدُ الصُّوَرِ في هَذا الْمَلَفِّ؟ 
أَسْتَنْتِجُ مُتَساوِيّةَ الْحَلِّ: 
 12 X 8 = 96
ارفعوا  ألواحكم.


صححوا. هكذا وجدنا حل المسألة بحساب الكل بتوظيف عملية الضرب.
أَسْتَنْتِجُ مُتَساوِيّةَ الْحَلِّ: 
 12 X 8 = 96
أَكْتُبُ عِبارَةَ الْحَلِّ: 
عَدَدُ الصُّوَرِ في الْمَلَفِّ هُوَ:
 96 صورَةً.
(ة)خاص بالأستاذ 
خذوا الكراسة صفحة34 . لننجز التمرين الأول. 


 قوموا بحل المسألة.لديكم 3 دقائق.

صححوا.

(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 34.

أنجزوا التمرين رقم 2 صفحة 34.
لديكم 3 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا. لديكم دقيقتين.
(ة)خاص بالأستاذ 
على الصفحة 35 أنجزوا  النشاط رقم 3. لديكم 5 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.
صححوا على كراساتكم .لديكم دقيقتان.
1
1
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا! أكملوا في المنزل الأنشطة التي لم نقم بإنجازها في  الصفحة 35.
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:57.286962','2026-02-26 10:45:57.286991',1);
INSERT INTO "raida_lesson" VALUES(46,'MATH N4 P1 SEM5 S5','mathématiques','4','1','5','5','MATH_N4_P1_SEM5_S5.pptx','......','
4 
1
5
  الدرس 17

خدو الكراسة
أيقونات توجيهية
توجيهات الاستاد
خذوا الألواح
عرض فيديو 
دفتر التمارين
دفاتر البحث
(ة)خاص بالأستاذ 
برمجة الأسبوع الخامس
اَلْكُسورُ الْمُتَكافِئَةُ
حَلُّ الْمَسائِلِ – توليف-
درس اليوم
مًراجَعَة وَتَثْبيتُ دَروسِ الأُسْبوع 5 .
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 


تَعَرُّفِ وَتَمْثيلِ الْكُسورِ.
 أَكْتُبُ كُسوراً أَكْبَرَ مِنَ الْوَحَدَةِ كِتَابَةً مُخْتَلِطَةً
تَحْديدِ كَسْرٍ مُكافئٍ لِكَسْرٍ آخَرَ.
حَلِّ الْمَسَائلِ .
مرحباً يا أصدقاء. اليوم، سنراجع ما تعلمناه.

(ة)خاص بالأستاذ 
 خذوا الكراسات الصفحة 55. لنصحح التمرين رقم 5.
من يقرأ نص مسألته؟ من يشرح كيف نكتب نصوغ مسألة مناسبة للتمثيل.
صححوا. يجب أن تقدم المسألة وضعية ضربية.  18x25
مِثالٌ:
في قاعَةِ  سينِما، 18 صَفًّا مِنَ الْكَراسي،
 في كُلِّ صَفٍّ 25 كُرْسِيًّا.
ما الْعَدَدُ الْكُلّي لِلْكَراسي في الْقاعَةِ؟
(ة)خاص بالأستاذ 
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز هذه العمليات. دوّنوا النتيجة فقط على دفاتركم كما في المثال.
سيبدأ العداد؛ أنجزوا في دقيقة.
صححوا في دقيقة.
(ة)خاص بالأستاذ 
خذوا الألواح.
اقرؤوا وركبوا هذا العدد المفكك.
200 000 + 50 000 + 600 + 10 + 7
..............
ارفعوا  ألواحكم.
صححوا. من يذكر  بطريقة تركيب الأعداد. لماذا كتبتم 0 في منزلة  وحدات الألف.
200 000 + 50 000 + 600 + 10 + 7
250 617
اكتبوا على الألواح القيمة الصحيحة الرقم 7 في هذا العدد من بين القيم المعروضة:
72 150
ارفعوا  ألواحكم.
72 150
صححوا. من يذكر  يتقدم و يذكر قيم كل الأرقام.
حددوا  العشرة الأقرب للعدد 43.
..
...
..
ارفعوا  ألواحكم.
صححوا. من يشرح كيف حصل على إجابة صحيحة. 
50
40
حددوا  المئة الأقرب للعدد 764.  
...
ارفعوا  ألواحكم.
صححوا.   من يشرح كيف حصل على إجابة صحيحة. 
(ة)خاص بالأستاذ 
خذوا الكراسات 56

 أنجزوا التمرين رقم 1 صفحة 56.

صححوا. من يشرح لنا كيف توصل إلى الجواب؟ من يذكرنا بالخطوات المتبعة.
(ة)خاص بالأستاذ 
الآن ، مروا إلى الصفحة 57 .

في التمرين رقم 5، فككوا واكتبوا على شكل كسر مركب.
صححوا. من يشرح لنا كيف توصل إلى الجواب؟ من يذكرنا بالخطوات المتبعة.
وَحَدَتانِ
وَحَدَةٌ 
8
6
15

6
(ة)خاص بالأستاذ 
أنجزوا التمرين رقم 4 الصفحة 56

حددوا الكسور المكافئة لهذه الكسور. لا تنسوا توظيف الضرب أو القسمة.
صححوا. من يشرح لنا كيف توصل إلى الجواب؟ من يذكرنا بالخطوات المتبعة.
7
30
15
2
10
5
2
30
(ة)خاص بالأستاذ 
النشاط 5
حلوا المسألة في التمرين رقم7 الصفحة 57.

افهموا المسألة ، تخيلوا شريطها، ثم حلوها.
صححوا.
370
؟              356
 370  -  356 = 14
عَدَدُ النُّقَطِ الَّتِي حَصَلَ عَلَيْها عِمادُ في الْجَوْلَةِ الثّانِيّة هي : 14 نُقِطَة. 

(ة)خاص بالأستاذ 
اختتام الدرس
5
إلى اللقاء.أكملوا إنجاز ما تبقى من التمارين في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:57.527064','2026-02-26 10:45:57.527106',1);
INSERT INTO "raida_lesson" VALUES(47,'MATH N4 P1 SEM4 S4','mathématiques','4','1','4','4','MATH_N4_P1_SEM4_S4.pptx','......','
4 
1
4
الدرس   14 

  الدرس 15

أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
درس اليوم
حَلُّ الْمَسَائلِ: (اَلْبَحْثُ عَنِ الْكُلِّ أَوِ الْجُزْءِ- خُطْوَتَينِ).

(ة)خاص بالأستاذ 
          افتتاح الدرس
           نمذجة
2
           ممارسة الموجهة
3
           ممارسة المستقلة
4
            اختتام الدرس
5
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 

حَلِّ الْمَسَائلِ: (اَلْبَحْثُ عَنِ الْكُلِّ أَوِ الْجُزْءِ- خُطْوَتَينِ).

(ة)خاص بالأستاذ 
1
 خذوا الكراسات، الصفحة 43 .لنصحح النشاط رقم 4.







صححوا السؤال الأول.
صححوا السؤال الثاني.
صححوا السؤال الثالث.
20
15

صححوا السؤال الرابع.
20
12

13
25
23
12

12+ 23+25+20+12+13=105 تلاميذ
(ة)خاص بالأستاذ 
1
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
  سيبدأ العداد؛ أنجزوا في دقيقة. 
صححوا في دقيقة.
(ة)خاص بالأستاذ 
عرض فيديو النمذجة.
من يذكرنا بخطوات تعرف وقراءة مبيان بالأعمدة.
(ة)خاص بالأستاذ 
خذوا  ألواحكم.

حلوا المسألة.
 
ماذا نفعل في الخطوة الأولى؟  

افهموا المسألة وحددوا المعطى الناقص. 

ارفعوا  ألواحكم.
صححوا.

مَجْموعُ عَدَدِ الْوُرودِ:
ما العمل بعد ذلك؟

في خطوة أولى استعينوا بتمثيل واحسبوا مجموع عدد الورود.

ارفعوا  ألواحكم.
صححوا.

135
15
15
......
الخطوة1

9 مرات
ما الخطوة الموالية؟

في خطوة أخرى : احسبوا المطلوب في المسألة، استعينوا بتمثيل ثان.

ارفعوا  ألواحكم.
صححوا.

هكذا، تعرفنا كيف نحل مسألة من خطوتين.من يذكرنا بالخطوات.
(ة)خاص بالأستاذ 


خذوا الكراسة صفحة 44 . 






أنجزوا التمرين رقم 2 صفحة 44.
لديكم 5 دقائق  لإنجاز هذا النشاط، سأمر بين الصفوف لمساعدتكم.
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا. لديكم دقيقتان.
(ة)خاص بالأستاذ 
على الصفحة 45 أنجزوا  النشاط رقم 3. لديكم 5 دقائق.
سأمر بين الصفوف لأقدم  المساندة وأدون ملاحظاتي في كراساتكم.





صححوا على كراساتكم .لديكم دقيقتان.
(ة)خاص بالأستاذ 
اختتام الدرس
5
 انتبهوا جيدا ! أنجزوا النشاطين رقم 4  و 5 في الصفحة 45 في المنزل.







إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح النشاطين رقم 4  و 5 في الصفحة 45 .
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:57.810945','2026-02-26 10:45:57.810974',1);
INSERT INTO "raida_lesson" VALUES(48,'MATH N4 P1 SEM3 S5','mathématiques','4','1','3','5','MATH_N4_P1_SEM3_S5.pptx','......','
4 
1
3
الدرس 9

خدو الكراسة
أيقونات توجيهية
توجيهات الاستاد
خذوا الألواح
عرض فيديو 
دفتر التمارين
دفاتر البحث
برمجة الأسبوع الثالث
(ة)خاص بالأستاذ 
درس اليوم
مراجعة دروس الأسبوع
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 

وَضْعُ وَإنْجازُ عَمَليّاتِ الْجَمْعِ وَالطّرْحِ.
حَلُّ الْمَسَائلِ:
(اَلْبَحْثُ عَنِ الْكُلِّ أَوِ الْجُزْءِ- اَلأَجْزاءُ الْمُتساوِيّة).
وَضْعُ وَإنْجازُ عَمَليّاتِ الضّرْبِ.
مرحباً يا أصدقاء. اليوم، سنراجع ما تعلمناه.

(ة)خاص بالأستاذ 
 خذوا الكراسات الصفحة 35. لنصحح التمرين رقم 4.

صححوا. لديكم دقيقتان.
1
……
1
(ة)خاص بالأستاذ 
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
الحساب الذهني
 صححوا في دقيقة.
(ة)خاص بالأستاذ 
ننجز التمرين رقم 4

صححوا. من يشرح لنا كيف توصل إلى الجواب؟ من يذكرنا بالخطوات المتبعة.
المرور بين الصفوف وتسجيل النسبة المئوية لعدد الإجابات الصحيحة.

 في حالة ما إذا كانت نسبة التحكم تقل عن 80% يعيد الأستاذ نمذجة الحل على السبورة. 
صححوا. 
 في التمرين الثالث :فككوا العدد 350 781 في السطر الأول.


صححوا. من يشرح لنا كيف توصل إلى الجواب؟ من يذكرنا بالخطوات المتبعة.
المرور بين الصفوف وتسجيل النسبة المئوية لعدد الإجابات الصحيحة.
 في حالة ما إذا كانت نسبة التحكم تقل عن 80% يعيد الأستاذ نمذجة الحل على السبورة. 
صححوا. 
(ة)خاص بالأستاذ 
أنجزوا العملية الأولى في التمرين 2.













صححوا. من يشرح لنا كيف توصل إلى الجواب؟ من يذكرنا بالخطوات المتبعة.
المرور بين الصفوف وتسجيل النسبة المئوية لعدد الإجابات الصحيحة.
 في حالة ما إذا كانت نسبة التحكم تقل عن 80% يعيد الأستاذ نمذجة الحل على السبورة. 
صححوا. 
(ة)خاص بالأستاذ 
افهموا المسألة في التمرين رقم 5، تخيلوا شريطها، ثم حلوها.
صححوا.
تحديد عدد أشجار الصنوبر
تحديد عدد أشجار الصنوبر
اتمموا إنجاز عمليات الضرب في التمرين رقم 4

اتمموا إنجاز عمليات الضرب في التمرين رقم 4
 ستشتغلون في ثنائيات . 
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
صححوا.استعملوا الآلة الحاسبة للتحقق من الإجابات.
(ة)خاص بالأستاذ 
اختتام الدرس
5
إلى اللقاء.أكملوا إنجاز ما تبقى من التمارين في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:57.952487','2026-02-26 10:45:57.952529',1);
INSERT INTO "raida_lesson" VALUES(49,'FR N4 P1 SEM2 S2','français','4','1','2','2','FR_N4_P1_SEM2_S2.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 6

Séance 3

Séance 5

Séance 4

Séance 1
Oral  - Acte de parole  2
Ecriture – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Présentation du vocabulaire 
Exploitation du vocabulaire
Travail sur livret
Oral – Dialogue
Lecture – texte
Ecriture – Phrases 
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 

Oral – Dialogue
Lecture - Lettre a - A
Ecriture - Lettre a - A

Séance 2

Oral – Acte de parole 1
Ecriture – Point de langue 1
Lecture – Mots avec difficultés 
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 2


Acte de parole 1 : « parler des métiers de l’école ». 
Utiliser le verbe « accueillir » au présent.
Mots avec difficultés: le son « ueil ».
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
La directrice
Le maitre 
La bibliothécaire 
Une nouvelle leçon
Le cuisinier
Le gardien
Avant de commencer, nous allons réviser les mots de vocabulaire. Répétons ensemble.
Qui veut passer au tableau pour nommer les images ? 
Répétons ensemble. 
Ouvrir
Expliquer 
S’occuper 
Prêter
Accueillir 
Cuisiner
Qui veut passer au tableau pour nommer les images ? 
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo 
Maintenant, on va poser la question comme Majd et Nada. Répétons ensemble. 
Que fait la directrice à l’école ? 
Que fait le gardien à l’école ? 

Voici d’autres exemples.  
Que fait le maître à l’école ? 
Que fait le directeur à l’école ?
Que fait la maîtresse à l’école ? 

À votre tour.  Qui veut poser la question en français  ?  Donnez différents exemples.

 Que fait _______ à l’école ?
Maintenant nous allons apprendre à répondre à la question. Soyez attentifs.
Lecture de la vidéo 
Maintenant, on va répondre comme Majd et Nada. Répétons ensemble. 
À l’école, la directrice accueille les élèves.
À l’école, le gardien ouvre la porte.
Voici d’autres exemples.  
À l’école, la maîtresse explique la leçon. 
À l’école, la bibliothécaire prête des livres.
À l’école, le cuisinier prépare le repas. 


Qui veut passer au tableau pour jouer la scène ? Choisissez différents exemples.   
 Que fait _______ à l’école ?
À l’école, ____
Chacun joue le dialogue avec son voisin. 
 Que fait _______ à l’école ?
À l’école, ____
Plan de la séance 2
Utiliser le verbe « accueillir » au présent.
2.  Ecrit : point de langue
Acte de parole 1 : « Parler des métiers de l’école  ». 
Mots avec difficultés : le son « ueil »..
Maintenant on va faire la conjugaison du verbe « accueillir ». « Accueillir »  ça veut dire يستقبل
Accueillir يستقبل 
Lecture de la vidéo 
Répétons ensemble. 
J’accueille                              Nous apprenons  
Tu accueilles                          Vous accueillez
Il accueille                              Ils accueillent 
Elle accueille                          Elles accueillent
  
Qui veut compléter la phrase avec le verbe accueillir? Levez la main. 
             J’_______   des amis.  
J’accueille des amis. Qui veut expliquer cette phrase ?  
             J’accueille des amis.  
Qui veut compléter la phrase avec le verbe accueillir? Levez la main. 
            La directrice _______ les maitresses.
La directrice accueille les élèves. Qui veut expliquer cette phrase ? 
            La directrice accueille les maitresses.
Qui veut compléter la phrase avec le verbe accueillir ? Levez la main. 
             Ils _______ les élèves.  
Ils accueillent les élèves. Qui veut expliquer cette phrase ? 
             Ils accueillent les élèves.  
Prenez vos livrets à la page 17.
Lisez silencieusement la conjugaison du verbe. Vous avez 1 minute. 

Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe.  
Utiliser le verbe « accueillir » au présent.
Acte de parole 1 : « parler des métiers de l’école ». 
Plan de la séance 2
Lecture
Mots avec difficultés : le son « ueil ».
Maintenant, nous allons faire de la lecture.
On va apprendre à lire différents mots avec le son « ueil ». Soyez attentifs.  
ueil
Lecture de la vidéo 
Lisez ces mots en silence.
accueil
recueil
accueillir
cueillir
Qui veut lire à voix haute ? 
accueil
recueil
accueillir
cueillir
Maintenant, on va apprendre à lire en faisant les liaisons.  Soyez attentifs.
Lisez ces phrases silencieusement. Après je vais diffuser une lecture audio. 
Lecture de l’audio. 
Ils écoutent le maitre. 
Les maitres  nous accueillent. 
Elles nous prêtent des albums.
Qui veut lire à haute voix ?
Prenez vos livrets à la page 15.

Lisez les mots et les phrases à votre voisin. Je vais passer entre les rangs pour vous aider. 

La séance d’aujourd’hui est terminée.  À la maison, relisez les mots et les phrases sur le livret.  
',NULL,'','2026-02-26 10:45:58.161778','2026-02-26 10:45:58.161830',1);
INSERT INTO "raida_lesson" VALUES(50,'FR N4 P1 SEM2 S3','français','4','1','2','3','FR_N4_P1_SEM2_S3.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes


Contenu de la semaine 

Séance 6

Séance 5

Séance 2

Séance 4
Oral – Dialogue
Lecture – Texte
Ecriture – Phrases
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 
Révision
Lecture offerte
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture - Phrases
Séance 3
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 3


Acte de parole 2 : dialogue comprenant les actes de parole : « Que fait la bibliothécaire? La bibliothécaire nous prête des livres ».
Remplacer des mots par me-te-lui-nous-vous-leur.
Lire et comprendre des phrases.
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons revoir la scène avec les mots du vocabulaire. Soyez attentifs.  
Lecture de la vidéo.
Qui veut décrire la scène ? 
Maintenant, on va passer à l’activité de l’oral. Nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo 
Répétons ensemble les questions comme Nada et Majd. 

Que fait la bibliothécaire à l’école ?
      Que fait le maitre à l’école ?

  Qui veut poser une question en français  ? 

Que fait _____ à l’école ? 



  Qui veut poser une autre question en français  ? 
Que fait _____ à l’école ? 
Maintenant nous allons apprendre à répondre aux questions.  Soyez attentifs. 
Lecture de la vidéo 
Répétons les réponses de Nada et de Majd. 

La bibliothécaire nous prête des livres. 
Le maitre nous explique la leçon.
Voici d’autres exemples. 

Le gardien nous ouvre la porte. 
Le cuisinier nous fait à manger.

Qui veut passer au tableau pour jouer la scène ? Choisissez des personnes différentes.   
 Que fait _______ à l’école ?
________  nous ______
Chacun joue le dialogue avec son voisin. 
 Que fait _______ à l’école ?
____  nous ______
Acte de parole 2 : dialogue comprenant les actes de parole : « Que fait la bibliothécaire? La bibliothécaire nous prête des livres ».

Lire et comprendre des phrases.
2.  Écrit : Point de langue 
Remplacer des mots par : me-te-lui-nous-vous-leur.
Plan de la séance 3
Maintenant, on va faire de la grammaire.  On va apprendre à remplacer des mots par des pronoms . Soyez attentifs. 
me      te      lui      nous      vous     leur
Lecture de la vidéo.
Retenons la règle. 
Prenez vos ardoises. 
Écrivez le bon pronom pour compléter la phrase. 
Le maitre explique la leçon à ses élèves.
Le maitre _______ explique la leçon.
Levez vos ardoises. 
Corrigez.  Qui veut expliquer sa réponse ? 
 Le maitre leur explique la leçon.
Le maitre explique la leçon  à ses élèves.
La directrice ____ parle.
La directrice parle  à la maitresse. 
Écrivez le bon pronom pour compléter la phrase. 
Levez vos ardoises. 
La directrice lui parle.
La directrice parle à la maitresse. 
Corrigez.  Qui veut expliquer sa réponse ? 
La bibliothécaire  ____  donne un livre.
La bibliothécaire donne un livre à moi. 
Écrivez le bon pronom pour compléter la phrase. 
Levez vos ardoises. 
Corrigez.  Qui veut expliquer sa réponse ? 
La bibliothécaire  me  donne un livre.
La bibliothécaire donne un livre à moi. 
Le gardien ___ parle.
Le gardien parle à toi. 
Écrivez le bon pronom pour compléter la phrase. 
Levez vos ardoises. 
Corrigez.  Qui veut expliquer sa réponse ? 
Le gardien te parle.
Le gardien parle à toi. 
Remplacer des mots par : me-te-lui-nous-vous-leur.
Acte de parole 2: dialogue comprenant les actes de parole : « Que fait la bibliothécaire? La bibliothécaire nous prête des livres ».
3.  Lecture
Lire et comprendre des phrases.
Plan de la séance 3
Maintenant, nous allons lire des phrases, les comprendre et répondre à des questions. 
Regardez cette image. 


Lisez cette question en silence.  

La directrice parle à la maitresse. 
La directrice parle aux élèves. 
La directrice explique une leçon.
La directrice parle au gardien.
Que fait la directrice  ?
Prenez vos ardoises.
Ecrivez le numéro de la bonne réponse sur votre ardoise (1, 2, 3 ou 4).  

Que fait la directrice  ?
La directrice parle à la maitresse. 
La directrice parle aux élèves. 
La directrice explique une leçon.
La directrice parle au gardien.
Levez vos ardoises. 
La bonne réponse est : « La directrice parle aux élèves  ». Qui veut lire et expliquer la réponse ? 

Que fait la directrice  ?
La directrice parle à la maitresse. 
La directrice parle aux élèves. 
La directrice explique une leçon.
La directrice parle au gardien.
Prenez vos livrets à la page 15.   Avec votre voisin, vous allez lire et répondre aux questions de l’activité 4. Je vais circuler entre les rangs pour vous aider. 

Notez les devoirs à faire à la maison. Vous allez lire et recopier le dialogue de la page 15.  Vous allez aussi faire l’activité 2 de la page 17. 


La séance d’aujourd’hui est terminée. A bientôt.  ',NULL,'','2026-02-26 10:45:58.437699','2026-02-26 10:45:58.437726',1);
INSERT INTO "raida_lesson" VALUES(51,'MATH N4 P1 SEM4 S5','mathématiques','4','1','4','5','MATH_N4_P1_SEM4_S5.pptx','......','
4 
1
4
  الدرس 13

خدو الكراسة
أيقونات توجيهية
توجيهات الاستاد
خذوا الألواح
عرض فيديو 
دفتر التمارين
دفاتر البحث
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
درس اليوم
مًراجَعَة وَتَثْبيتُ دَروسِ الأُسْبوعِ.
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 


تعَرُف وَقِراءَةِ مِبْيانِ بِالْأَعْمِدَةِ وَعِناصِرهِ؛
 قِراءَةِ وَتَأويلِ بَياناتِ مِبْيانٍ بِالْأَعْمِدَةِ؛
قِرَاءَةِ وَتَأْويلِ بَيَاناتِ مِبْيانٍ تِكْرَارِيٍّ؛
حَلِّ الْمَسَائلِ: (اَلْبَحْثُ عَنِ الْكُلِّ أَوِ الْجُزْءِ- خُطْوَتَينِ).
مرحباً يا أصدقاء. اليوم، سنراجع ما تعلمناه.

(ة)خاص بالأستاذ 
 خذوا الكراسات الصفحة 45. لنصحح التمرينين 4 و 5.










لنصحح التمرين رقم 4. لديكم دقيقتان.
12
12
......

2 250 مَرّةً
لنصحح التمرين رقم 5. 
دعوة تلميذ واحد لقراءة نص المسألة المناسب للتمثيل.
(ة)خاص بالأستاذ 
 خذوا دفاتر البحث.
لديكم دقيقة واحدة لإنجاز  العمليات .دوّنوا النتيجة فقط.
 سيبدأ العداد؛ أنجزوا في دقيقة. 
صححوا في دقيقة.
(ة)خاص بالأستاذ 
تعَرُف وَقِراءَةِ مِبْيانِ بِالْأَعْمِدَةِ وَعِناصِرهِ؛
ننجز التمرين رقم1

 أنجزوا التمرين رقم 1 صفحة 46.

صححوا. من يشرح لنا كيف توصل إلى الجواب؟ من يذكرنا بالخطوات المتبعة.
المرور بين الصفوف وتسجيل النسبة المئوية لعدد الإجابات الصحيحة.
 تَوْزيعُ عدَدُ تَلاميذِ قِسْمِ الرّابِعِ حَسَبَ
 النّشاطِ الْمُفضّلِ لقَضاءِ وَقْتِ الْفَراغِ
 النّشاطُ الْمُفضّلُ
الْأَلْعابُ الْإلِكْترونِيّة. 
الرّياضَةُ  
عَدَدُ التَلاميذِ



 في حالة ما إذا كانت نسبة التحكم تقل عن 80% يعيد الأستاذ النمذجة. 
(ة)خاص بالأستاذ 
 قِراءَةُ وَتَأويلِ بَياناتِ مِبْيانٍ بِالْأَعْمِدَةِ؛
ننجز التمرين رقم2

أنجزوا التمرين رقم 2 صفحة 46.
صححوا. من يشرح لنا كيف توصل إلى الجواب؟ من يذكرنا بالخطوات المتبعة.
المرور بين الصفوف وتسجيل النسبة المئوية لعدد الإجابات الصحيحة.
تَوزيعُ دَرجاتِ الْحَرارَةِ الْمُسَجّلَةِ  خِلالَ شَهْرِ أكْتوبَر بِبَعْضِ الْمُدُنِ الْمَغْرِبِيّة. 
32° :  مَكْناس
22°
بَركان ؛  العُيون  ؛  مَكْناس
22°
32°
 في حالة ما إذا كانت نسبة التحكم تقل عن 80% يعيد الأستاذ النمذجة. 
(ة)خاص بالأستاذ 
قِرَاءَةُ وَتَأْويلِ بَياناتِ مِبْيانٍ تِكْرارِيٍّ؛
ننجز التمرين رقم 3

أنجزوا التمرين رقم 3صفحة 47.
صححوا. من يشرح لنا كيف توصل إلى الجواب؟ من يذكرنا بالخطوات المتبعة.
المرور بين الصفوف وتسجيل النسبة المئوية لعدد الإجابات الصحيحة.
 13 تِلْميذاً 
مُسْتَوياتُ مَوْضَعَةِ تَلاميذِ الْمُسْتَوَيَيَنِ
 الرّابِعِ وَالْخامِسِ في مَادّةِ الرّياضِيّاتِ 
مُسْتَوى التّحَكّم الّذي يَتَساوى فيهِ عَدَدُ التّلاميذِ في الْمُسْتَوَيَينِ هُو : رَقْمَينِ 
17 تِلْميذاً 

6
7


 في حالة ما إذا كانت نسبة التحكم تقل عن 80% يعيد الأستاذ النمذجة. 
 في حالة ما إذا كانت نسبة التحكم تقل عن 80% يعيد الأستاذ النمذجة. 
(ة)خاص بالأستاذ 
مراجعة الدرس16 
ننجز النشاط  رقم4 

افهموا المسألة في التمرين رقم 4 ، تخيلوا شريطها، ثم حلوها.
صححوا.
حِسابُ الْمَسافَةِ الّتي قَطَعَتْهَا الْحافِلةُ خِلاَلَ الْيَوْمِ الثّاني (حِسابُ الْجُزْءِ) 
950   -  574  =376 
اَلْمَسافَةُ الّتي قَطَعَتْها الْحافِلَةُ خِلالَ الْيَوْمِ الثّاني هي :
 376 كيلومِتْرًا
 في حالة ما إذا كانت نسبة التحكم تقل عن 80% يعيد الأستاذ النمذجة. 
(ة)خاص بالأستاذ 
اختتام الدرس
5
إلى اللقاء.أكملوا إنجاز ما تبقى من التمارين في المنزل. 
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:45:58.649851','2026-02-26 10:45:58.649880',1);
INSERT INTO "raida_lesson" VALUES(52,'FR N4 P1 SEM3 S1','français','4','1','3','1','FR_N4_P1_SEM3_S1.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Oral – Dialogue
Lecture – Texte
Ecriture – Phrases
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 
Organisation de la semaine


Séance 1

Présentation du vocabulaire 
Exploitation du vocabulaire
Activités de vocabulaire sur livret
Description de la scène
Travail sur livret
Plan de la séance
1.  Présentation du vocabulaire
Le règlement de la classe – Le devoir -  Lever le doigt – S’excuser – Respecter – Écouter
 Se moquer – Se disputer - Courir -  Crier -  Polie - Impolie
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs. 
Lecture de la vidéo.
Lecture de la vidéo.
Qui veut répéter ?
Le règlement de la classe
Lecture de la vidéo.
Qui veut répéter ?
Le devoir 
Lecture de la vidéo.
Qui veut répéter ?
Lever le doigt
Lecture de la vidéo.
Qui veut répéter ?
S’excuser
Lecture de la vidéo.
Qui veut répéter ?
Respecter
Lecture de la vidéo.
Qui veut répéter ?
Écouter
Lecture de la vidéo.
Répétons ensemble :  Le règlement de la classe – Le devoir–  Lever le doigt – S’excuser – Respecter - Écouter .
Le règlement de la classe
Le devoir
Respecter
Écouter
S’excuser
Lever le doigt
Maintenant, on va apprendre d’autres mots avec Majd.
Lecture de la vidéo.
Qui veut répéter ?
Se moquer
Lecture de la vidéo.
Qui veut répéter ?
Se disputer
Lecture de la vidéo.
Qui veut répéter ?
Courir
Lecture de la vidéo.
Qui veut répéter ?
Crier
Lecture de la vidéo.
Qui veut répéter ?
Polie
Lecture de la vidéo.
Qui veut répéter ?
Impolie

« Polie » est le contraire d’« impolie ».
Impolie
Polie
≠
Lecture de la vidéo.
Répétons ensemble :  Se moquer – Se disputer–  Courir – Crier – Poli - Impoli.
Se moquer 
Se disputer
Poli 
Impoli
Crier
Courir 
Prenez vos ardoises. 
Écrivez le numéro du mot «  Devoir ».
Écrivez le numéro du mot « Lever le doigt  ».
Écrivez le numéro du mot « S’excuser ».
Écrivez le numéro du mot « Respecter ».
Écrivez le numéro du mot « Règlement de la classe ».
Écrivez le numéro du mot « Se moquer ».
Rangez vos ardoises. 
Qui veut nommer l’image ? Levez la main.  
Qui veut nommer l’image ? Levez la main.  
Qui veut nommer l’image ? Levez la main.  
Qui veut nommer l’image ? Levez la main.  
Activités  sur livret
Plan de la séance
2.  Exploitation du vocabulaire
Description de la scène 
Le règlement de la classe – Le devoir -  Lever le doigt – S’excuser – Respecter – Écouter
 Se moquer – Se disputer - Courir -  Crier -  Polie - Impolie

Observez cette scène pendant 30 secondes. Il y a des images déjà vues aujourd’hui. 
Majd va nous montrer comment décrire l’image. Soyez attentifs.
Lecture de la vidéo.
Lecture de la vidéo.
Soyez attentifs. Majd va décrire la scène une deuxième fois. 
Lecture de la vidéo.
Maintenant, je vais vous poser des questions.
Qu’est ce que c’est ?

Que font ces garçons ?

Ils sont polis ou impolis ?

Que fait ce garçon ?

Il est poli ou impoli ?

Maintenant, c’est à vous. Qui veut décrire la scène comme Majd ? 
Exploitation du vocabulaire 
Plan de la séance
3.  Activités de vocabulaire  sur livret
Activités sur livret
Le règlement de la classe – Le devoir -  Lever le doigt – S’excuser – Respecter – Écouter
 Se moquer – Se disputer - Courir -  Crier -  Polie - Impolie
Ouvrez le livret à la page 18.  Vous allez faire cette activité à l’oral avec votre camarade. 

À tour de rôle : l’un montre une image, l’autre dit le mot. Je passe entre les rangs pour vous aider.

Je montre l’image

1

Je dis le mot

2

La séance d’aujourd’hui est terminée.  À la maison, faites les activités 1 et 2 sur le livret.Vous devez écrire les mots du vocabulaire. 
',NULL,'','2026-02-26 10:45:58.974807','2026-02-26 10:45:58.974833',1);
INSERT INTO "raida_lesson" VALUES(53,'FR N4 P1 SEM4 S1','français','4','1','4','1','FR_N4_P1_SEM4_S1.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Écrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Oral – Dialogue
Lecture – Texte
Écriture – Phrases
Oral – Acte de parole 1
Écrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Écriture – Phrases 
Organisation de la semaine


Séance 1

Présentation du vocabulaire 
Exploitation du vocabulaire
Activités de vocabulaire sur livret
Décrire de la scène.
Travail sur livret
Plan de la séance
1.  Présentation du vocabulaire


Travail sur livret.
Visiter - Un musée – Un tableau -  Une œuvre d’art – Une sculpture – Un atelier.
La peinture – Le peintre – Un artiste -  Le guide -  Une sortie – Un pique-nique.
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs. 
Lecture de la vidéo.
Il y a des noms masculins et des noms féminins.  « Musée » est un nom masculin. « Œuvre d’art » est un nom féminin. 
Un musée
Une œuvre d’art
Lecture de la vidéo.
Qui veut répéter ?
Visiter
Lecture de la vidéo.
Qui veut répéter ?
Un musée
Lecture de la vidéo.
Qui veut répéter ?
Un tableau
Lecture de la vidéo.
Qui veut répéter ?
Une œuvre d’art
Lecture de la vidéo.
Qui veut répéter ?
Une sculpture
Lecture de la vidéo.
Qui veut répéter ?
Un atelier
Lecture de la vidéo.
Répétons ensemble :  Visiter – Un musée –  Un tableau – Une œuvre d’art – Une sculpture – Un atelier.
Visiter
Un musée
Une sculpture
Un atelier
Une œuvre d’art
Un tableau
Maintenant, on va apprendre d’autres mots avec Majd.
Lecture de la vidéo.
Qui veut répéter ?
La peinture
Lecture de la vidéo.
Qui veut répéter ?
Le peintre
Lecture de la vidéo.
Qui veut répéter ?
Un artiste
Lecture de la vidéo.
Qui veut répéter ?
Le guide
Lecture de la vidéo.
Qui veut répéter ?
Une sortie 
Lecture de la vidéo.
Qui veut répéter ?
Un pique-nique 
Lecture de la vidéo.
Répétons ensemble : La peinture – Le peintre – Un artiste – Un guide – Une sortie – Un pique-nique.  
Le peintre
Un artiste
La peinture
Une sortie
Un guide
Un pique-nique
Prenez vos ardoises. 
Écrivez le numéro du mot «  Un musée ».
Écrivez le numéro du mot « Un atelier ».
Écrivez le numéro du mot « Un pique-nique ».
Écrivez le numéro du mot « Une sculpture ».
Écrivez le numéro du mot « Une œuvre d’art ».
Écrivez le numéro du mot « Une sortie ».
Rangez vos ardoises. 
Qui veut nommer l’image ? Levez la main. 
Qui veut nommer l’image ? Levez la main. 
Qui veut nommer l’image ? Levez la main. 
Qui veut nommer l’image ? Levez la main. 
Maintenant, on va faire un jeu. Qu’est-ce qu’on dit : le musée  ou la musée ? Levez la main. 
Le/ La           musée
On dit le musée. 
Le musée
Qu’est-ce qu’on dit : le tableau ou la tableau ?  Levez la main.  
Le / La             tableau
On dit le tableau. 
Le tableau
Un garçon – Une fille -  Des yeux – Des cheveux  - Petit – Grand.          
Plan de la séance
2.  Exploitation du vocabulaire
Description de la scène.


Visiter - Un musée – Un tableau -  Une œuvre d’art – Une sculpture – Un atelier.
La peinture – Le peintre – Un artiste -  Le guide -  Une sortie – Un pique-nique.

Observez cette scène pendant 30 secondes. 
Majd va nous montrer comment décrire l’image. Soyez attentifs.
Lecture de la vidéo.
Lecture de la vidéo.
Soyez attentifs. Majd va décrire l’image une deuxième fois. 
Lecture de la vidéo.
Maintenant, je vais vous poser des questions.
Où sont les élèves ?
Qu’est-ce que c’est ?

Que font les élèves ?

Qui veut parler de la scène comme Majd ?
Exploitation du vocabulaire. 
Plan de la séance
3.  Activités de vocabulaire  sur livret
Activités sur livret.


Visiter - Un musée – Un tableau -  Une œuvre d’art – Une sculpture – Un atelier.
La peinture – Le peintre – Un artiste -  Le guide -  Une sortie – Un pique-nique.

Ouvrez le livret à la page 23.  Vous allez faire cette activité à l’oral avec votre camarade. 

À tour de rôle : l’un montre une image, l’autre dit le mot. Je passe entre les rangs pour vous aider.

Je montre l’image

1

Je dis le mot

2

La séance d’aujourd’hui est terminée.  À la maison, faites les activités 1 et 2 sur le livret.Vous devez écrire les mots du vocabulaire. 
',NULL,'','2026-02-26 10:45:59.306317','2026-02-26 10:45:59.306344',1);
INSERT INTO "raida_lesson" VALUES(54,'FR N4 P1 SEM5 S1','français','4','1','5','1','FR_N4_P1_SEM5_S1.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine de soutien 

Séance 4

Séance 2
Activités orales 
Organisation de la semaine de révision

Séance 3
Activités de lecture
Activités d’écriture
Séance 1
Activités de vocabulaire
Faire des phrases avec des mots de vocabulaire.
Travail sur livret
Plan de la séance 1
1.  Activité 1
Rappel des mots de vocabulaire.
Jeux de vocabulaire.
(ة)خاص بالأستاذ 

Au terme de cette séance de révision, l’enseignant doit vérifier qu’au moins 80% des élèves sont capables de : 
Reconnaitre et produire des mots de vocabulaire.
Faire des phrases avec des mots de vocabulaire. 
* Si ce taux n’est pas atteint, il convient de mettre en place des actions de remédiation, collectives ou individuelles. 
Bonjour les enfants. Aujourd’hui, nous allons réviser les mots de vocabulaire des semaines précédentes. Soyez attentifs.
Répétons ensemble :  Une langue – Mesurer – Calculer – La solution – Lire – Intéressant.
Pour chaque image, je vais désigner un élève pour dire le mot. C’est quel mot ? 
Répétons ensemble : Ecrire – Facile – Difficile – Résoudre – Une opération  – Un problème.
Pour chaque image, je vais désigner un élève pour dire le mot. C’est quel mot ? 
Répétons ensemble : La directrice – Le maitre – Le garçon – La bibliothécaire – Le cuisinier – Une nouvelle leçon.
Pour chaque image, je vais désigner un élève pour dire le mot. C’est quel mot ? 
Répétons ensemble : Ouvrir – Expliquer – Cuisiner – S’occuper – Accueillir – Prêter.
Pour chaque image, je vais désigner un élève pour dire le mot. C’est quel mot ? 
Répétons ensemble :  Le règlement de la classe – Le devoir–  Lever le doigt – S’excuser – Respecter - Écouter .
Le devoir
Respecter
S’excuser
Lever le doigt
Écouter
Le règlement de la classe
Pour chaque image, je vais désigner un élève pour dire le mot. C’est quel mot ? 
Répétons ensemble :  Se moquer – Se disputer–  Courir – Crier – Poli - Impoli.
Se moquer 
Se disputer
Poli 
Impoli
Crier
Courir 
Pour chaque image, je vais désigner un élève pour dire le mot. C’est quel mot ? 
Répétons ensemble :  Visiter – Un musée –  Un tableau – Une œuvre d’art – Une sculpture – Un atelier.
Un musée
Une sculpture
Un atelier
Une œuvre d’art
Un tableau
Visiter
Pour chaque image, je vais désigner un élève pour dire le mot. C’est quel mot ? 
Répétons ensemble : La peinture – Le peintre – Un artiste – Un guide – Une sortie – Un pique-nique.  
Le peintre
Un artiste
La peinture
Une sortie
Un guide
Un pique-nique
Pour chaque image, je vais désigner un élève pour dire le mot. C’est quel mot ? 
Nous allons jouer au jeu des mots invisibles. 
Jeu des mots invisibles. 
Observez bien les images. Je vais masquer trois images.
Un musée
Une sculpture
Un atelier
Une œuvre d’art
Un tableau
Visiter
Observez bien les images. Je vais masquer trois images.
?
?
?
Les trois images qui manquent sont : visiter, un tableau et une sculpture.



Nous allons jouer au jeu des mots qui bougent. 
Jeu des mots qui bougent 
Observez bien. Je vais faire bouger trois mots.
Quelles sont les 3 images qui ont bougé ? 
Les trois images qui ont bougé sont : facile, difficile et un problème.



Activités  sur livret
Plan de la séance
2.  Activité 2
Faire des phrases avec des mots de vocabulaire.
Rappel des mots de vocabulaire.
Jeux de vocabulaire.
Maintenant, on va faire des phrases avec les mots de vocabulaire. Observez ces images. Qui veut dire une phrase ? 
Le maitre 
Une nouvelle leçon
Expliquer
Voici une phrase correcte : Le maitre explique une nouvelle leçon.
Le maitre explique une nouvelle leçon.
Observez ces images. Qui veut dire une phrase ? 
Facile
Une opération
L’opération est très facile.
Voici une phrase correcte : L’opération est très facile.
Observez ces images. Qui veut dire une phrase ? 
Le peintre
Un tableau
Le peintre dessine un tableau.
Voici une phrase correcte : Le peintre dessine un tableau.
Observez ces images. Qui veut dire une phrase ? 
Un musée
Visiter
Les élèves vont visiter le musée.
Voici une phrase correcte : Les élèves vont visiter le musée.
Observez ces images. Qui veut dire une phrase ? 
Le cuisinier
Cuisiner
Voici une phrase correcte : Le cuisinier cuisine des repas.
Le cuisinier cuisine des repas.
Observez ces images. Qui veut dire une phrase ? 
Crier
Courir 
Voici une phrase correcte : Je ne dois pas crier et courir dans la classe.
Je ne dois pas crier et courir dans la classe.
Faire des phrases avec des mots de vocabulaire.
Plan de la séance
3.  Activités de vocabulaire  sur livret
Activités sur livret
Rappel des mots de vocabulaire.
Jeux de vocabulaire.
Ouvrez le livret à la page 28.  Vous allez faire cette activité à l’oral avec votre camarade. 

À tour de rôle : l’un montre une image, l’autre dit le mot. Je passe entre les rangs pour vous aider.

Je montre l’image

1

Je dis le mot

2

La séance d’aujourd’hui est terminée. À la maison, faites l’ activité 1 sur le livret.Vous devez écrire les mots du vocabulaire. 
',NULL,'','2026-02-26 10:45:59.580705','2026-02-26 10:45:59.580732',1);
INSERT INTO "raida_lesson" VALUES(55,'FR N4 P1 SEM2 S4','français','4','1','2','4','FR_N4_P1_SEM2_S4.pptx','......','2

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte
Ecriture – Phrases
Séance 4
Texte : Fluidité.
Écrire des phrases.
1.  Dialogue
Dialogue reprenant les actes de parole « Que fait la directrice ? Que fait la bibliothécaire? ». 
Plan de la séance 4
Bonjour les enfants !  La leçon de français commence maintenant. 
Aujourd’hui, nous allons apprendre un dialogue en français avec Majd et Nada. Soyez attentifs.
Lecture de la vidéo 
Nous allons écouter le dialogue une deuxième fois.
Lecture de la vidéo 
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. 
Qui veut jouer le dialogue en français ? 
Situation : Le garçon et la fille sont à l’école. Ils parlent de ce que font les personnes qui travaillent à l’école.


Maintenant, tout le monde participe. Jouez le dialogue avec votre voisin.
Dialogue reprenant les actes de parole « que fait la directrice ? Que fait la bibliothécaire? ». 
Écrire des phrases.
2.  Lecture
Texte : Fluidité. 
Plan de la séance  4 
Maintenant, on va faire de la lecture. 
C’est le mot : beaucoup. On va l’épeler  : b- e- a- u - c - o - u - p. 
beaucoup
C’est le mot : tout. On va l’épeler ensemble : t -o – u - t- . 
tout
Qui veut lire ? 
Beaucoup      tout
On va lire ensemble ce texte du livret. On va le découper en 5 parties. Après, vous allez le lire tout seuls. 

Lisez la première partie du texte silencieusement. Après je vais diffuser une lecture audio. 


Partie 1
Partie 2

Partie 3
À l’école, on s’occupe bien de nous 
Beaucoup de personnes s’occupent de nous à l’école. Quand nous arrivons le matin, les maitres et les maitresses nous accueillent gentiment en classe.
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3
À l’école, on s’occupe bien de nous 
Beaucoup de personnes s’occupent de nous à l’école. Quand nous arrivons le matin, les maitres et les maitresses nous accueillent gentiment en classe.
On passe à la deuxième partie du texte. Lisez en silence.


Partie 1
Partie 2

Partie 3
 Le directeur aide les élèves quand ils ont un problème. Il les écoute et leur donne des conseils. La bibliothécaire nous prête des livres. Elle nous aide aussi à choisir de belles histoires à lire.
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3
 Le directeur aide les élèves quand ils ont un problème. Il les écoute et leur donne des conseils. La bibliothécaire nous prête des livres. Elle nous aide aussi à choisir de belles histoires à lire.
Lisez la troisième partie du texte silencieusement. 


Partie 3
Partie 2

Partie 1
Le cuisinier prépare le repas de midi avec soin. Il nous fait de bons plats. Miam !  À la récréation, les maitres nous surveillent pour que tout se passe bien.  
À l’école, tout le monde travaille pour nous aider à apprendre et à grandir.
Lecture en cours. 


Partie 3
Partie 2

Partie 1
Qui veut lire le texte ?


Partie 3
Partie 2

Partie 1
Le cuisinier prépare le repas de midi avec soin. Il nous fait de bons plats. Miam !  À la récréation, les maitres nous surveillent pour que tout se passe bien.  
À l’école, tout le monde travaille pour nous aider à apprendre et à grandir.
Prenez vos livrets à la page 16.

Lisez le texte à votre voisin. Je vais passer entre les rangs pour vous aider. 
Texte : Fluidité.
Dialogue comprenant les actes de parole « que fait la directrice ? Que fait la bibliothécaire? ». 
Plan de la séance 4
3.  Écriture
Écrire des phrases.
Maintenant, on va faire de l’écriture. On va apprendre à écrire des phrases comme celles-ci. Qui veut les lire ?  
Le directeur accueille les enfants. 
La maîtresse nous apprend le français.
Le maître nous explique la leçon.
Le gardien nous ouvre la porte.
Qui veut lire ? 
La bibliothécaire nous donne des livres.
Le maître nous explique la leçon.
Prenez vos cahiers.  
Ces mots sont en désordre. Ecrivez sur vos cahiers une phrase correcte à partir de ces mots. 

accueille

les élèves

la directrice
Qui veut lire sa phrase ? 
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
La directrice accueille les élèves. 
Ces mots sont en désordre. Ecrivez sur vos cahiers une phrase correcte à partir de ces mots. 

des livres

donne

la maîtresse
nous
Qui veut lire sa phrase ?
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
La maîtresse nous donne des livres . 
Ces mots sont en désordre. Ecrivez sur vos cahiers une phrase correcte à partir de ces mots. 

explique

nous

le maître
la leçon
Qui veut lire sa phrase ?
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Le maître nous explique la leçon . 
La séance d’aujourd’hui est terminée. À la maison vous allez mettre ordre ces mots pour écrire une phrase correcte.
',NULL,'','2026-02-26 10:45:59.772676','2026-02-26 10:45:59.772703',1);
INSERT INTO "raida_lesson" VALUES(56,'FR N4 P1 SEM3 S2','français','4','1','3','2','FR_N4_P1_SEM3_S2.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes


Contenu de la semaine 

Séance 6

Séance 3

Séance 5

Séance 4

Séance 1
Oral  - Acte de parole  2
Ecriture – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Présentation du vocabulaire 
Exploitation du vocabulaire
Travail sur livret
Oral – Dialogue
Lecture – texte
Ecriture – Phrases 
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 

Oral – Dialogue
Lecture - Lettre a - A
Ecriture - Lettre a - A

Séance 2

Oral – Acte de parole 1
Ecriture – Point de langue 1
Lecture – Mots avec difficultés 
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 2


Acte de parole 1 : « Demander et dire ce qu’on  doit faire à l’école ». 
Utiliser le verbe « devoir » au présent.
La lettre « t » qui se prononce « s ».
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons réviser les mots de vocabulaire. Répétons ensemble.
Le règlement de la classe
Le devoir
Respecter
Écouter
S’excuser
Lever le doigt
Qui veut passer au tableau pour nommer les images ? 
Répétons ensemble. 
Se moquer 
Se disputer
Poli 
Impoli
Crier
Courir 
Qui veut passer au tableau pour nommer les images ? 
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo 
Maintenant, on va poser la question comme Majd et Nada. Répétons ensemble. 
Qu’est-ce que tu dois faire à l’école ? 
Voici d’autres exemples.  
Qu’est-ce que tu dois faire en classe ?
Qu’est-ce que tu dois faire dans la cour ?
Qu’est-ce que tu dois faire au parc de jeux ?
Maintenant nous allons apprendre à répondre à la question. Soyez attentifs.
Lecture de la vidéo 
Maintenant, on va répondre comme Majd et Nada. Répétons ensemble. 
À l’école, je dois respecter le règlement.
Voici d’autres exemples.  
À l’école, je dois lever le doigt . 
À l’école, je dois écouter la maitresse.

Qui veut passer au tableau pour jouer la scène ? Choisissez différents exemples.   
 Qu’est-ce que tu dois faire  à l’école ?
À l’école, 
je dois  ____
Chacun joue le dialogue avec son voisin. 
 Qu’est-ce que tu dois faire  à l’école ?
À l’école, 
je dois  ____
Plan de la séance 2
Utiliser le verbe « devoir » au présent.
2.  Ecrit : point de langue
Acte de parole 1 : « Demander et dire ce qu’on doit faire à l’école ». 
La lettre « t » qui se prononce « s ».
Maintenant on va faire la conjugaison du verbe « devoir ». « devoir »  ça veut dire  يجب
Devoir 
Lecture de la vidéo 
Répétons ensemble. 
Qui veut compléter la phrase avec le verbe devoir? Levez la main. 
             Je _______   écouter le maitre.  
Je dois écouter le maitre. Qui veut expliquer cette phrase ?  
 Je dois écouter le maitre.  
Qui veut compléter la phrase avec le verbe devoir ? Levez la main. 
Nous _______ respecter le règlement de l’école.
Nous devons respecter le règlement de l’école. Qui veut expliquer cette phrase ? 
 Nous devons respecter le règlement de l’école.
Qui veut compléter la phrase avec le verbe devoir ? Levez la main. 
             Tu  _______ lever le doigt.  
Tu dois lever le doigt. Qui veut expliquer cette phrase ? 
             Tu _______ lever le doigt.  
Prenez vos livrets à la page 22.

Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe.  
doivent
dois
devez
devons
doit
dois
Utiliser le verbe « devoir » au présent.
Acte de parole 1 : « Demander et dire ce qu’on doit faire à l’école ». 
Plan de la séance 2
Lecture
La lettre « t » qui se prononce « s ».
Maintenant, nous allons faire de la lecture.
On va apprendre à lire différents mots avec la lettre « t » qui se prononce « s ». Soyez attentifs.  
Lecture de la vidéo 
Lisez ces mots en silence.
attention     récréation
opération     solution
Qui veut lire à voix haute ? 
attention     récréation
opération     solution
Maintenant, on va apprendre à lire en faisant les liaisons.  Soyez attentifs.
On  écoute le maitre. 
Lisez ces phrases silencieusement. Après je vais diffuser une lecture audio. 
Elles écoutent la maitresse. 
Les élèves ont fait leurs devoirs. 
On attend son tour pour parler.
Lecture de l’audio. 
Elles écoutent la maitresse. 
Les élèves ont fait leurs devoirs. 
On attend son tour pour parler.
Qui veut lire à haute voix ?
Elles écoutent la maitresse. 
Les élèves ont fait leurs devoirs. 
On attend son tour pour parler.
Prenez vos livrets à la page 20.

Lisez les mots et les phrases à votre voisin. Je vais passer entre les rangs pour vous aider. 


La séance d’aujourd’hui est terminée.  À la maison, relisez les mots et les phrases.  
',NULL,'','2026-02-26 10:45:59.976426','2026-02-26 10:45:59.976454',1);
INSERT INTO "raida_lesson" VALUES(57,'FR N4 P1 SEM4 S2','français','4','1','4','2','FR_N4_P1_SEM4_S2.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes


Contenu de la semaine 

Séance 6

Séance 3

Séance 5

Séance 4

Séance 1
Oral  - Acte de parole  2
Écriture – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Présentation du vocabulaire 
Exploitation du vocabulaire
Travail sur livret
Oral – Dialogue
Lecture – texte
Écriture – Phrases 
Oral –  Prise de parole
Lecture – Compréhension de texte
Écriture – Phrases 

Oral – Dialogue
Lecture - Lettre a - A
Ecriture - Lettre a - A

Séance 2

Oral – Acte de parole 1
Écriture – Point de langue 1
Lecture – Mots avec difficultés 
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 2


Acte de parole 1 : « Parler d’une prochaine sortie scolaire ». 
Utiliser le verbe « découvrir » au futur.
Le son « eille ».
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons réviser les mots de vocabulaire. Répétons ensemble.
Visiter
Un musée
Une sculpture
Un atelier
Une œuvre d’art
Un tableau
Qui veut passer au tableau pour nommer les images ? 
Répétons ensemble. 
Le peintre
Un artiste
La peinture
Une sortie
Un guide
Un pique-nique
Qui veut passer au tableau pour nommer les images ? 
Le peintre
Un artiste
La peinture
Une sortie
Un guide
Un pique-nique
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo 
Maintenant, on va poser la question comme Majd et Nada. Répétons ensemble. 
On va où pour la prochaine sortie scolaire ? 
Maintenant, nous allons apprendre à répondre à la question : « On va où pour la prochaine sortie scolaire ? ». Soyez attentifs.
Lecture de la vidéo 
Maintenant, on va répondre comme Majd et Nada. Répétons ensemble. 
On va au musée Mohamed VI d’art moderne.
On va au musée Dar El Bacha.

Qui veut passer au tableau pour jouer la scène ? Choisissez différents exemples.   
 On va où pour la prochaine sortie scolaire ?
On va ____
Chacun joue le dialogue avec son voisin. 
 On va où pour la prochaine sortie scolaire ?
On va ____
Plan de la séance 2
Utiliser le verbe « découvrir » au futur.
2.  Ecrit : point de langue
Acte de parole 1 : « Parler d’une prochaine sortie scolaire ». 
Le son « eille ».
Maintenant, on va faire la conjugaison du verbe « découvrir » au futur. « découvrir »  ça veut dire يكتشف
Découvrir 
Lecture de la vidéo 
Répétons ensemble. 
Je découvrirai
Tu découvriras
Il découvrira
Elle découvrira

Nous découvrirons
Vous découvrirez
Ils découvriront
Elles découvriront
Qui veut compléter la phrase avec la bonne forme du verbe découvrir au futur ? Levez la main. 
Je   ________  le musée.  
découvrira 
découvrirai
Je découvrirai le musée. Qui veut expliquer cette phrase ?  
             Je découvrirai le musée.  
Qui veut compléter la phrase avec la bonne forme du verbe découvrir au futur ? Levez la main. 
            Tu  _______  des tableaux.
découvriras 
découvrira
Tu découvriras des tableaux. Qui veut expliquer cette phrase ? 
            Tu  découvriras  des tableaux.
Qui veut compléter la phrase avec la bonne forme du verbe découvrir au futur ? Levez la main. 
             Vous ___________  des sculptures.  
découvrirez 
découvrirai
Vous découvrirez des sculptures. Qui veut expliquer cette phrase ? 
             Vous découvrirez des sculptures.  
Prenez vos livrets à la page 27.

Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe.  
découvrirons
découvrirai
découvrira
découvrirez
découvriront
découvriras
Utiliser le verbe « découvrir » au futur.
Acte de parole 1 : « Parler d’une prochaine sortie scolaire ». 

Plan de la séance 2
Lecture
Maintenant, nous allons faire de la lecture.
On va apprendre à lire différents mots avec le son « eille ». Soyez attentifs.  
eil     eille
Lecture de la vidéo 
Lisez ces mots en silence.
soleil             réveil  
  bouteille          abeille
Qui veut lire à voix haute ? 
soleil             réveil  
  bouteille          abeille
Maintenant, on va apprendre à lire en faisant les liaisons.  Soyez attentifs.
On  découvrira des ateliers. 
Lisez ces phrases silencieusement. Après, je vais diffuser une lecture audio. 
Je vais au musée avec mon école. 
On a pris des bouteilles d’eau. 
Au musée, les élèves écoutent le guide. 
Lecture de l’audio. 
Je vais au musée avec mon école. 
Au musée, les élèves écoutent le guide. 
On a pris des bouteilles d’eau. 
Qui veut lire à haute voix ?
Je vais au musée avec mon école. 
C’est une sortie scolaire. 
Au musée, les élèves écoutent le guide. 
Prenez vos livrets à la page 25.

Lisez les mots et les phrases à votre voisin. Je vais passer entre les rangs pour vous aider. 


La séance d’aujourd’hui est terminée.  À la maison, relisez les mots et les phrases.  
',NULL,'','2026-02-26 10:46:00.163711','2026-02-26 10:46:00.163738',1);
INSERT INTO "raida_lesson" VALUES(58,'FR N4 P1 SEM2 S5 V2','français','4','1','2','5','FR_N4_P1_SEM2_S5_V2.pptx','......','Séance 5

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 4

Séance 2

Séance 3
Oral – Dialogue
Lecture – texte
Ecriture – Phrases
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 
Révision
Lecture offerte
Séance 5
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Organisation de la semaine
Comprendre un texte.
Écrire des phrases.
1.  Prise de parole
Prendre la parole pour parler des métiers de l’école.
Plan de la séance 5
Bonjour les enfants !  La leçon de français commence maintenant.
Aujourd’hui nous allons apprendre à parler des métiers de l’école en français. Écoutez bien.
Lecture de la vidéo.
À votre tour ! Qui veut parler des ingrédients de sa recette. Chacun choisit des exemples différents. 

À l’école, la directrice _____________ .
La maitresse   ________________  .
Le gardien _____________________ . 
Maintenant, tout le monde participe. Chacun parle des ingrédients de sa recette. Je vais passer entre les rangs pour vous aider.
Prendre la parole pour parler des métiers de l’école.  
Écrire des phrases.
2.  Lecture
Comprendre un texte.
Plan de la séance  5 
Prenez vos livrets à la page 16. Nous avons déjà lu ce texte. Maintenant, on va essayer de le comprendre, partie par partie. 




Pour chaque partie du texte, on va suivre les mêmes étapes. 

Etape 1
Je lis en silence et j’essaie de comprendre le texte.

Etape 2
Je repère les mots difficiles et je demande à mon enseignant(e) de me les expliquer

Etape 3
Je lis la question, puis je cherche la réponse dans le texte. 


Lisez silencieusement le texte et essayez de le comprendre. 
Etape 1
Partie 1/3

Etape 2

Etape 3
                          À l’école, on s’occupe bien de nous !

Beaucoup de personnes s’occupent de nous à l’école. Quand nous arrivons le matin, les maitres et les maitresses nous accueillent gentiment en classe.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 1/3
Etape 2

Etape 3
                          À l’école, on s’occupe bien de nous !

Beaucoup de personnes s’occupent de nous à l’école. Quand nous arrivons le matin, les maitres et les maitresses nous accueillent gentiment en classe.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question : Que font les maitres et les maitresses ? 

Etape 1
Partie 1/3

Etape 2

Etape 3
Beaucoup de personnes s’occupent de nous à l’école. Quand nous arrivons le matin, les maitres et les maitresses nous accueillent gentiment en classe.
La réponse est : Les maitres et les maitresses nous accueillent en classe . 
Question : Que font les maitres et les maitresses ? 

Etape 1
Partie 1/3

Etape 2

Etape 3
Beaucoup de personnes s’occupent de nous à l’école. Quand nous arrivons le matin, les maitres et les maitresses nous accueillent gentiment en classe.

On passe à la deuxième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 2/3

Etape 2

Etape 3
Le directeur aide les élèves quand ils ont un problème. Il les écoute et leur donne des conseils.
La bibliothécaire nous prête des livres. Elle nous aide aussi à choisir de belles histoires à lire.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 2/3
Etape 2

Etape 3
Le directeur aide les élèves quand ils ont un problème. Il les écoute et leur donne des conseils.
La bibliothécaire nous prête des livres. Elle nous aide aussi à choisir de belles histoires à lire.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question  : Que fait la bibliothécaire ? 

Etape 1
Partie 2/3

Etape 2

Etape 3
Le directeur aide les élèves quand ils ont un problème. Il les écoute et leur donne des conseils.
La bibliothécaire nous prête des livres. Elle nous aide aussi à choisir de belles histoires à lire.
La réponse est : « la bibliothécaire nous prête des livres. Elle nous aide aussi à choisir de belles histoires à lire ».
Question  : Que fait la bibliothécaire ? 
Partie 2/3

Etape 1
Partie 2/3

Etape 2

Etape 3
Le directeur aide les élèves quand ils ont un problème. Il les écoute et leur donne des conseils.
La bibliothécaire nous prête des livres. Elle nous aide aussi à choisir de belles histoires à lire.

On passe à la troisième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 3/3

Etape 2

Etape 3
Le cuisinier prépare le repas de midi avec soin. Il nous fait de bons plats. Miam !
À la récréation, les maitres nous surveillent pour que tout se passe bien.
À l’école, tout le monde travaille pour nous aider à apprendre et à grandir.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 3/3
Etape 2

Etape 3
Le cuisinier prépare le repas de midi avec soin. Il nous fait de bons plats. Miam !
À la récréation, les maitres nous surveillent pour que tout se passe bien.
À l’école, tout le monde travaille pour nous aider à apprendre et à grandir.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  

Etape 1
Partie 3/3

Etape 2

Etape 3
Question  :  Que fait le cuisinier ? 
Le cuisinier prépare le repas de midi avec soin. Il nous fait de bons plats. Miam !
À la récréation, les maitres nous surveillent pour que tout se passe bien.
À l’école, tout le monde travaille pour nous aider à apprendre et à grandir.
La réponse est : le cuisinier prépare le repas de midi. 

Etape 1
Partie 3/3

Etape 2

Etape 3
Question  :  Que fait le cuisinier ? 

Le cuisinier prépare le repas de midi avec soin. Il nous fait de bons plats. Miam !
À la récréation, les maitres nous surveillent pour que tout se passe bien.
À l’école, tout le monde travaille pour nous aider à apprendre et à grandir.
Prenez vos livrets à la page 16. Relisez le texte en silence pour le comprendre. Si vous ne comprenez pas un mot, demandez à votre voisin ou levez la main pour que je vous aide.

Comprendre un texte.
Prendre la parole pour parler des métiers de l’école.
3.  Écriture  
Écrire des phrases.
Plan de la séance 5
Maintenant, nous allons faire de l’écriture.  Prenez vos cahiers.
Lisez et observez cette phrase. Vous allez l’écrire après. Tenez-vous prêts.  
Le maitre nous explique la leçon.
Dictée en cours.
Je vais refaire la dictée. 


Corrigez. 
Maintenant, écrivez sur vos cahiers une phrase correcte avec les deux mots suivants. 
leçon   -    maîtresse
Qui veut lire sa phrase ?
Corrigez. 
Lisez et observez cette phrase. Vous allez l’écrire après. Tenez-vous prêts.  
Le gardien nous ouvre la porte.
Dictée en cours.
Je vais refaire la dictée. 


Corrigez. 
Maintenant, écrivez sur vos cahiers une phrase correcte avec les deux mots suivants. 
 porte    -    directeur
Qui veut lire sa phrase ?
Corrigez. 
La séance d’aujourd’hui est terminée. À la maison, relisez le texte de la page 16 et répondez aux questions.
',NULL,'','2026-02-26 10:46:00.372229','2026-02-26 10:46:00.372256',1);
INSERT INTO "raida_lesson" VALUES(59,'FR N4 P1 SEM4 S3','français','4','1','4','3','FR_N4_P1_SEM4_S3.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes


Contenu de la semaine 

Séance 6

Séance 5

Séance 2

Séance 4
Oral – Dialogue
Lecture – Texte
Écriture – Phrases
Oral – Acte de parole 1
Écrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Écriture – Phrases 
Révision
Lecture offerte
Oral  - Acte de parole  2
Écrit – Point de langue 2
Lecture - Phrases
Séance 3
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 3


Acte de parole 2 : « Demander et dire ce qu’on va faire ».
Utiliser le mot « On ».
Lire et comprendre des phrases.
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons revoir la scène avec les mots du vocabulaire. Soyez attentifs.  
Lecture de la vidéo.
Qui veut décrire la scène ? 
Maintenant, on va passer à l’activité de l’oral. Nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo 
Répétons ensemble la question comme Nada et Majd. 

Qu’est ce qu’on va faire au musée ?
Voici d’autres exemples. 

Qu’est ce qu’on va faire à l’école ?
Qu’est ce qu’on va faire au parc ?
  Qui veut poser une question en français  ? 

Qu’est-ce qu’on va faire 
au musée ? 


  Qui veut poser une autre question en français  ? 
Qu’est-ce qu’on va faire en classe ? 
Maintenant nous allons apprendre à répondre à la question : «  Qu’est ce qu’on va faire au musée ? ».  Soyez attentifs. 
Lecture de la vidéo 
Répétons les réponses de Nada et de Majd. 

Au musée, on découvrira des tableaux d’art.
Au musée, on découvrira un atelier de peinture.
Voici d’autres exemples. 

Au musée, on découvrira des œuvres d’art.
Au musée, on découvrira des sculptures.

Qui veut passer au tableau pour jouer la scène ? Choisissez des activités différentes.   
On découvrira _______________.
Qu’est-ce qu’on va faire au musée ? 
Chacun joue le dialogue avec son voisin. 
On découvrira _______________.
Qu’est-ce qu’on va faire au musée ? 
Acte de parole 2 : demander et dire ce qu’on ne doit pas faire en classe.

Lire et comprendre des phrases.
2.  Écrit : Point de langue 
Utiliser le mot « on ».
Plan de la séance 3
Acte de parole 2 : « Demander et dire ce qu’on va faire ».
Maintenant, on va apprendre utiliser le mot « on ». Soyez attentifs. 
On
Lecture de la vidéo.
Retenons la règle. 
Prenez vos ardoises. 
On va visiter le musée.
 Nous  ____________________________.
Complétez la phrase suivante en remplaçant « on » par « nous ».
Levez vos ardoises. 
Corrigez.  Qui veut expliquer sa réponse ? 
On va visiter le musée.
Nous  allons visiter le musée.
On découvrira des tableaux.
Les gens  ______________________ .
Complétez la phrase suivante en remplaçant « on » par « les gens ».
Levez vos ardoises. 
On découvrira des tableaux. 
Les gens découvriront des tableaux.
Corrigez.  Qui veut expliquer sa réponse ? 
On a cassé la fenêtre.
Quelqu’un ______________________ .
Complétez la phrase suivante en remplaçant « on » par « quelqu’un ».
Levez vos ardoises. 
Corrigez.  Qui veut expliquer sa réponse ? 
On a cassé la fenêtre.
Quelqu’un a cassé la fenêtre .
3.  Lecture
Lire et comprendre des phrases.
Plan de la séance 3
Utiliser le mot « on ».
Acte de parole 2 : « Demander et dire ce qu’on va faire » .
Maintenant, nous allons lire des phrases, les comprendre et répondre à des questions. 
Regardez cette image. 
Lisez cette question en silence.  
Prenez vos ardoises.
Ecrivez le numéro de la bonne réponse sur votre ardoise ( 1, 2, 3 ou 4 ).  
Levez vos ardoises. 
La bonne réponse est : « Les élèves vont au musée d’art ». Qui veut lire et expliquer la réponse ? 
x
Prenez vos livrets à la page 25.   Avec votre voisin, vous allez lire et répondre aux questions de l’activité 4. Je vais circuler entre les rangs pour vous aider. 

Notez les devoirs à faire à la maison. Vous allez lire et recopier le dialogue de la page 25.  Vous allez aussi faire l’activité 2 de la page 27. 


La séance d’aujourd’hui est terminée. À bientôt.  ',NULL,'','2026-02-26 10:46:00.641125','2026-02-26 10:46:00.641153',1);
INSERT INTO "raida_lesson" VALUES(60,'FR N4 P1 SEM2 S6','français','4','1','2','6','FR_N4_P1_SEM2_S6.pptx','......','



Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 5

Séance 4

Séance 2

Séance 3
Oral – Dialogue
Lecture – texte
Ecriture – Phrases
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Révision
Lecture offerte
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 
Séance 6
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Organisation de la semaine
Lire un texte.
Écrire des phrases.
Répondre aux questions.
Histoire du cahier magique.
1. Révision
Plan de la séance 6
(ة)خاص بالأستاذ 

Au terme de cette séance de révision, l’enseignant doit vérifier qu’au moins 80% des élèves sont capables de : 
Lire et comprendre un texte.
Ecrire des phrases.
Répondre spontanément à des questions sur le contenu de la semaine. 
* Si ce taux n’est pas atteint, il convient de mettre en place des actions de remédiation, collectives ou individuelles. 
Bonjour les enfants. Aujourd’hui, nous allons réviser les leçons de la semaine passée. Soyez attentifs.
Qui veut lire ce paragraphe ? 
À l’école, beaucoup de personnes travaillent. Le gardien ouvre les portes le matin et accueille les élèves.  Les élèves entrent dans la classe avec le maitre ou la maitresse. 
Qui veut expliquer ce paragraphe dans sa langue ?  
À l’école, beaucoup de personnes travaillent. Le gardien ouvre les portes le matin et accueille les élèves.  Les élèves entrent dans la classe avec le maitre ou la maitresse. 
Qui veut lire la question et y répondre en français ? 
Que fait le gardien à l’école ? 
À l’école, beaucoup de personnes travaillent. Le gardien ouvre les portes le matin et accueille les élèves.  Les élèves entrent dans la classe avec le maitre ou la maitresse. 
Le gardien ouvre les portes et accueille les élèves. 
Que fait le gardien à l’école ? 
À l’école, beaucoup de personnes travaillent. Le gardien ouvre les portes le matin et accueille les élèves.  Les élèves entrent dans la classe avec le maitre ou la maitresse. 
Qui veut lire ce paragraphe ? 
Les maitres et les maitresses expliquent les leçons aux élèves. La bibliothécaire travaille à la bibliothèque de l’école. Elle donne des livres aux élèves et elle lit des histoires. 
Qui veut expliquer ce paragraphe dans sa langue ? 
Les maitres et les maitresses expliquent les leçons aux élèves. La bibliothécaire travaille à la bibliothèque de l’école. Elle donne des livres aux élèves et elle lit des histoires. 
Qui veut lire la question et y répondre en français ? 
Que fait la bibliothécaire ? 
Les maitres et les maitresses expliquent les leçons aux élèves. La bibliothécaire travaille à la bibliothèque de l’école. Elle donne des livres aux élèves et elle lit des histoires. 
La bibliothécaire donne des livres aux élèves et lit des histoires.
Les maitres et les maitresses expliquent les leçons aux élèves. La bibliothécaire travaille à la bibliothèque de l’école. Elle donne des livres aux élèves et elle lit des histoires. 
Que fait la bibliothécaire ? 
Prenez vos cahiers.
Ces mots sont en désordre. Ecrivez sur vos cahiers une phrase correcte à partir de ces mots.

le gardien

la porte

ouvre
Qui veut lire sa phrase ?
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Le gardien ouvre la porte. 
Maintenant, écrivez sur vos cahiers une phrase correcte en utilisant ces mots. Attention, il faut ajouter d’autres mots pour obtenir une phrase correcte. 
directeur ●  porte
Qui veut lire sa phrase ?
Corrigez. 
Le directeur ouvre la porte. 
On passe à une autre phrase. Ces mots sont en désordre. Ecrivez sur vos cahiers une phrase correcte à partir de ces mots.



la leçon
explique
la maitresse
Qui veut lire sa phrase ?
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
La maitresse explique la leçon.
Maintenant, écrivez sur vos cahiers une phrase correcte en utilisant ces mots. Attention, il faut ajouter d’autres mots pour obtenir une phrase correcte. 
maître  ●  leçon
Qui veut lire sa phrase ?
Corrigez. 
Le maître explique la leçon. 
Maintenant, c’est l’activité des questions en rafales. Je vais désigner des élèves au hasard pour répondre. Tenez-vous prêts. 
?
?
?

Qui ouvre la porte de l’école le matin ? 
Qui ouvre la porte de l’école le matin?
?
Que fait le maitre à l’école ?
Que fait le maître à l’école ?
?
Qui cuisine les repas ?
Qui cuisine les repas ?
?
Que fait la bibliothécaire ?
Que fait la bibliothécaire ?
?
Que fait le directeur ?
Que fait le directeur ?
?
Qui explique les leçons ?
Qui explique les leçons ?
?
Qui prête les livres ?
Qui prête les livres ?
?
Que fait le gardien ? 
Que fait le gardien ?
?
Lire un texte.
Écrire des phrases.
Répondre aux questions.
Histoire du cahier magique.
2. Lecture offerte
Plan de la séance 6
Nous avons déjà vu le premier épisode de l’histoire Le cahier magique . Qui veut nous rappeler ce qu’on a vu dans cet épisode ?  En français ou dans votre langue. 
On va  regarder  le premier épisode une nouvelle fois. Après, on verra le deuxième épisode. Soyez attentifs.
Lecture de la vidéo.
Maintenant, nous allons découvrir un nouvel épisode de l’histoire  Le cahier magique . Est-ce que vous êtes prêts ? Ecoutez bien. 
Lecture de la vidéo.
Nous allons écouter l’histoire une deuxième fois. Soyez attentifs.
Lecture de la vidéo.
Quel est le titre de l’épisode 2 ? Qui veut répondre ?  
?
Le titre de l’épisode 2 est : Les métiers de l’école. 
Où est le cahier magique ? Qui veut répondre ?  
Le cahier magique est sur le bureau. 
Le cahier magique est sur le bureau
Que répond Lina à cette question ? Levez la main. 
Lina répond : Le maitre explique la leçon.
Le maitre explique la leçon.
Que répond Yasmine à cette question ? 
Yasmine répond : le maitre explique la leçon de français et de mathématiques.
Le maitre explique la leçon de français et de mathématiques.
Que répond Lina à cette question ? 
Que répond Lina à cette question ?
Lina répond : « C’est monsieur Samir, le gardien de l’école ».
C’est monsieur Samir, le gardien de l’école.
A votre avis, quelles questions posera le livre la semaine prochaine ? 
A la maison,  écrivez trois phrases que vous avez entendues dans l’histoire Le Cahier magique. 
La leçon d’aujourd’hui est terminée. À bientôt. ',NULL,'','2026-02-26 10:46:00.848900','2026-02-26 10:46:00.848928',1);
INSERT INTO "raida_lesson" VALUES(61,'FR N4 P1 SEM3 S3','français','4','1','3','3','FR_N4_P1_SEM3_S3.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes


Contenu de la semaine 

Séance 6

Séance 5

Séance 2

Séance 4
Oral – Dialogue
Lecture – Texte
Ecriture – Phrases
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 
Révision
Lecture offerte
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture - Phrases
Séance 3
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 3


Acte de parole 2 : demander et dire ce qu’on ne doit pas faire en classe.
Utiliser les mots « et » et « mais ».
Lire et comprendre des phrases.
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons revoir la scène avec les mots du vocabulaire. Soyez attentifs.  
Lecture de la vidéo.
Qui veut décrire la scène ? 
Maintenant, on va passer à l’activité de l’oral. Nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo 
Répétons ensemble les questions comme Nada et Majd. 

Qu’est ce que je ne dois pas faire en classe ?
Voici d’autres exemples. 

Qu’est ce que je ne dois pas faire à l’école ?
Qu’est ce que je ne dois pas faire dans la cour ?
  Qui veut poser une question en français  ? 

Qu’est-ce que je ne dois pas faire en classe ? 


  Qui veut poser une autre question en français  ? 
Qu’est-ce que je ne dois pas faire dans la cour ? 
Maintenant nous allons apprendre à répondre aux questions.  Soyez attentifs. 
Lecture de la vidéo 
Répétons les réponses de Nada et de Majd. 

En classe, je ne dois pas courir.
En classe, je ne dois pas me disputer avec
mes camarades.
Voici d’autres exemples. 

En classe, je ne dois pas crier.
Dans la cour, je ne dois pas me moquer de  mes camarades.

Qui veut passer au tableau pour jouer la scène ? Choisissez des personnes différentes.   
________  je ne dois pas  _______________.
Qu’est-ce que je ne dois pas faire _______ ? 
Chacun joue le dialogue avec son voisin. 
________  je ne dois pas  _______________.
Qu’est-ce que je ne dois pas faire _______ ? 
Acte de parole 2 : demander et dire ce qu’on ne doit pas faire en classe.

Lire et comprendre des phrases.
2.  Écrit : Point de langue 
Utiliser les mots «  et » et « mais ».
Plan de la séance 3
Maintenant, on va apprendre utiliser les mots «  et » et « mais ». Soyez attentifs. 
et            mais
Lecture de la vidéo.
Retenons la règle. 
Prenez vos ardoises. 
En classe, tu dois écouter ________  tu ne dois pas courir. 
Complétez avec « et » ou « mais ». 
et 
mais
Levez vos ardoises. 
Corrigez.  Qui veut expliquer sa réponse ? 
En classe, tu dois écouter mais  tu ne dois pas courir. 
et 
mais
L’élève écrit sur son cahier _____  lit les phrases.
Complétez avec « et » ou « mais ». 
et 
mais
Levez vos ardoises. 
Corrigez.  Qui veut expliquer sa réponse ? 
L’élève écrit sur son cahier et  lit les phrases.
et 
mais
3.  Lecture
Lire et comprendre des phrases.
Plan de la séance 3
Utiliser les mots « et » et « mais ».
Maintenant, nous allons lire des phrases, les comprendre et répondre à des questions. 
Regardez cette image. 
Lisez cette question en silence.  
Prenez vos ardoises.
Ecrivez le numéro de la bonne réponse sur votre ardoise (1, 2, 3 ou 4).  
Levez vos ardoises. 
La bonne réponse est : « Je dois lever le doigt ». Qui veut lire et expliquer la réponse ? 
X
Prenez vos livrets à la page 20.   Avec votre voisin, vous allez lire et répondre aux questions de l’activité 4. Je vais circuler entre les rangs pour vous aider. 

Notez les devoirs à faire à la maison. Vous allez lire et recopier le dialogue de la page 20.  Vous allez aussi faire l’activité 2 de la page 22. 


La séance d’aujourd’hui est terminée. À bientôt.  ',NULL,'','2026-02-26 10:46:01.099867','2026-02-26 10:46:01.099895',1);
INSERT INTO "raida_lesson" VALUES(62,'FR N4 P1 SEM4 S4','français','4','1','4','4','FR_N4_P1_SEM4_S4.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2
Oral – Acte de parole 1
Écrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Écriture – Phrases 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Écrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte
Écriture – Phrases
Séance 4
Texte : Fluidité.
Écrire des phrases.
1.  Dialogue
Dialogue reprenant les actes de parole enseignés.
Plan de la séance 4
Bonjour les enfants !  La leçon de français commence maintenant. 
Aujourd’hui, nous allons apprendre un dialogue en français avec Majd et Nada. Soyez attentifs.
Lecture de la vidéo : 
Nous allons écouter le dialogue une deuxième fois.
Lecture de la vidéo : 
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. 
On continue à répéter ensemble le dialogue. 
On continue à répéter ensemble le dialogue. 


On continue à répéter ensemble le dialogue. 

Maintenant, on va comprendre le sens du dialogue. Qui veut expliquer, dans sa langue, de quoi ont parlé Majd et Nada ? 
De quoi ont parlé Majd et Nada ? 
Je vais vous expliquer cette situation. Ensuite, vous allez passer au tableau pour jouer le dialogue en français. 
Situation : Le garçon et la fille se rencontrent devant un musée. Chacun pose à l’autre  les questions suivantes :

Qu’est-ce que tu apprends à l’école ?
Qu’est-ce que tu fais en [matière] ?
Que fais [ une personne] à l’école ?
Qu’est-ce que tu dois faire à [ lieu ] ?
On va où pour la prochaine sortie ?
Qu’est-ce qu’on va découvrir au musée ?
Maintenant, tout le monde participe. Jouez le dialogue avec votre voisin.
Écrire des phrases.
2.  Lecture
Texte : Fluidité. 
Plan de la séance  4 
Dialogue reprenant les actes de parole enseignés.
Maintenant, on va faire de la lecture. 
C’est le mot : devant. On va l’épeler  : d- e- v- a - n - t. 
devant
C’est le mot : avec. On va l’épeler : a - v -  e – c . 
avec
Qui veut lire ? 
devant       avec
On va lire ensemble ce texte du livret. On va le découper en 3 parties. Après, vous allez le lire tout seuls. 

Lisez la première partie du texte silencieusement. Après, je vais diffuser une lecture audio. 


Partie 1
Partie 2

Partie 3
Une sortie au musée

Demain, on va faire une sortie scolaire avec toute la classe ! On va visiter le musée Mohamed VI d’art moderne, à Rabat.
Le départ est à huit heures du matin, devant la porte de l’école.
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3
Une sortie au musée

Demain, on va faire une sortie scolaire avec toute la classe ! On va visiter le musée Mohamed VI d’art moderne, à Rabat.
Le départ est à huit heures du matin, devant la porte de l’école.
On passe à la deuxième partie du texte. Lisez en silence.


Partie 1
Partie 2

Partie 3
Nous devons avoir tous un petit sac avec une bouteille d’eau, un sandwich et une casquette. Au musée, on découvrira de belles œuvres de peinture. Nous écouterons le guide : il nous parlera des tableaux et des dessins réalisés par des artistes marocains.
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3
Nous devons avoir tous un petit sac avec une bouteille d’eau, un sandwich et une casquette. Au musée, on découvrira de belles œuvres de peinture. Nous écouterons le guide : il nous parlera des tableaux et des dessins réalisés par des artistes marocains.
Lisez la troisième partie du texte silencieusement. 


Partie 3
Partie 2

Partie 1
À midi, nous ferons un pique-nique dans le jardin, à côté du musée. J’aime beaucoup les sorties scolaires parce qu’elles sont amusantes et intéressantes.
Lecture en cours. 


Partie 3
Partie 2

Partie 1
Qui veut lire le texte ?


Partie 3
Partie 2

Partie 1
À midi, nous ferons un pique-nique dans le jardin, à côté du musée. J’aime beaucoup les sorties scolaires parce qu’elles sont amusantes et intéressantes.
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant fait lire les élèves sur l’écran (allez à la dernière page de la leçon). 
Remarque importante :

Prenez vos livrets à la page 26.

Lisez le texte à votre voisin. Je vais passer entre les rangs pour vous aider. 
Texte : Fluidité.
Dialogue reprenant les actes de parole enseignés.
Plan de la séance 4
3.  Écriture
Écrire des phrases.
Maintenant, on va faire de l’écriture. On va apprendre à écrire des phrases comme celles-ci. Qui veut les lire ?  
On va faire une sortie scolaire.
Les élèves visitent le musée. 
Qui veut lire ? 
On va  au musée.
Les élèves découvriront des tableaux. 
Prenez vos cahiers.  
Ces mots sont en désordre. Écrivez sur vos cahiers une phrase correcte à partir de ces mots. 
on
au musée
va
Qui veut lire sa phrase ? 
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Qui veut lire sa phrase ?
Ces mots sont en désordre. Écrivez sur vos cahiers une phrase correcte à partir de ces mots. 
des tableaux
découvriront
les élèves
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
La séance d’aujourd’hui est terminée. À la maison, vous allez mettre ordre ces mots pour écrire deux phrases correctes.
',NULL,'','2026-02-26 10:46:01.339307','2026-02-26 10:46:01.339334',1);
INSERT INTO "raida_lesson" VALUES(63,'FR N4 P1 SEM3 S4','français','4','1','3','4','FR_N4_P1_SEM3_S4.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte
Ecriture – Phrases
Séance 4
Texte : Fluidité.
Écrire des phrases.
1.  Dialogue
Dialogue reprenant les actes de parole « qu’est-ce que tu dois faire à l’école ? » « Qu’est-ce que je ne dois pas faire à l’école ? ». 
Plan de la séance 4
Bonjour les enfants !  La leçon de français commence maintenant. 
Aujourd’hui, nous allons apprendre un dialogue en français avec Majd et Nada. Soyez attentifs.
Lecture de la vidéo 
Nous allons écouter le dialogue une deuxième fois.
Lecture de la vidéo 
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. 
On continue à répéter ensemble le dialogue. 
Maintenant, on va comprendre le sens du dialogue. Qui veut expliquer, dans sa langue, de quoi ont parlé Majd et Nada ? 
De quoi ont parlé Majd et Nada ? 
Je vais vous expliquer cette situation. Ensuite, vous allez passer au tableau pour jouer le dialogue en français. 
Situation : Le garçon et la fille se rencontrent dans un parc. Chacun demande à l’autre  ce qu’il doit faire à l’école.

Maintenant, tout le monde participe. Jouez le dialogue avec votre voisin.
Dialogue comprenant les actes de parole « qu’est-ce que tu dois faire à l’école ? » « Qu’est-ce que je ne dois pas faire à l’école ? ». 
Écrire des phrases.
2.  Lecture
Texte : Fluidité. 
Plan de la séance  4 
Maintenant, on va faire de la lecture. 
C’est le mot : jamais. On va l’épeler  : j- a- m- a - i - s. 
jamais
C’est le mot : ensemble. On va l’épeler : e - n - s - e - m – b – l - e. 
ensemble
Qui veut lire ? 
jamais   ensemble
On va lire ensemble ce texte du livret. On va le découper en 3 parties. Après, vous allez le lire tout seuls. 

Lisez la première partie du texte silencieusement. Après je vais diffuser une lecture audio. 


Partie 1
Partie 2

Partie 3
Le règlement de l’école
À l’école, on a le droit de parler, de poser des questions et de jouer. Mais il y a des règles pour bien vivre avec les camarades et les maitres. Le matin, il faut arriver à l’heure pour commencer la journée calmement.
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3
Le règlement de l’école
À l’école, on a le droit de parler, de poser des questions et de jouer. Mais il y a des règles pour bien vivre avec les camarades et les maitres. Le matin, il faut arriver à l’heure pour commencer la journée calmement.
On passe à la deuxième partie du texte. Lisez en silence.


Partie 1
Partie 2

Partie 3
En classe, on lève toujours le doigt pour parler et on écoute attentivement la maitresse.   Quand un camarade parle, on ne doit jamais lui couper la parole. On attend son tour pour parler.
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3
En classe, on lève toujours le doigt pour parler et on écoute attentivement la maitresse.   Quand un camarade parle, on ne doit jamais lui couper la parole. On attend son tour pour parler.
Lisez la troisième partie du texte silencieusement. 


Partie 3
Partie 2

Partie 1
À la récréation, on joue ensemble et on ne pousse pas. Si un camarade tombe, on l’aide à se relever. On ne se moque jamais de ses camarades.
Lecture en cours. 


Partie 3
Partie 2

Partie 1
Qui veut lire le texte ?


Partie 3
Partie 2

Partie 1
À la récréation, on joue ensemble et on ne pousse pas. Si un camarade tombe, on l’aide à se relever. On ne se moque jamais de ses camarades.
Description de la scène. 
Bonjour - Au revoir  - Moi - Toi 
Un avion - Un ananas - Un abricot - Une banane – Une école
3.  Activités de vocabulaire  sur livret
Activités sur livret

Cette partie de la leçon nécessite l’utilisation du livret de l’élève. En cas d’indisponibilité temporaire du livret de l’élève, l’enseignant fait lire les élèves sur l’écran (allez à la dernière page de la leçon). 
Remarque importante :
Prenez vos livrets à la page 21.

Lisez le texte à votre voisin. Je vais passer entre les rangs pour vous aider. 
Texte : Fluidité.
Dialogue comprenant les actes de parole « Qu’est-ce que tu dois faire à l’école ?» « Qu’est-ce que je ne dois pas faire à l’école ? ». 
Plan de la séance 4
3.  Écriture
Écrire des phrases.
Maintenant, on va faire de l’écriture. On va apprendre à écrire des phrases comme celles-ci. Qui veut les lire ?  
Les élèves doivent lever le doigt. 
Vous ne devez pas vous disputez. 
Les élèves doivent écouter le maitre.
Tu ne dois pas crier.
Qui veut lire ? 
Les élèves doivent lever le doigt. 
Vous ne devez pas vous disputez. 
Prenez vos cahiers.  
Ces mots sont en désordre. Ecrivez sur vos cahiers une phrase correcte à partir de ces mots. 

doivent

lever le doigt

les élèves
Qui veut lire sa phrase ? 
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Les élèves doivent lever le doigt. 
Ces mots sont en désordre. Ecrivez sur vos cahiers une phrase correcte à partir de ces mots. 
devez
pas
ne
vous
vous
disputez
Qui veut lire sa phrase ?
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Vous ne devez pas vous disputez. 
La séance d’aujourd’hui est terminée. À la maison vous allez mettre ordre ces mots pour écrire une phrase correcte.
',NULL,'','2026-02-26 10:46:01.526536','2026-02-26 10:46:01.526563',1);
INSERT INTO "raida_lesson" VALUES(64,'FR N4 P1 SEM3 S5','français','4','1','3','5','FR_N4_P1_SEM3_S5.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 4

Séance 2

Séance 3
Oral – Dialogue
Lecture – texte
Ecriture – Phrases
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 
Révision
Lecture offerte
Séance 5
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Organisation de la semaine
Comprendre un texte.
Écrire des phrases.
1.  Prise de parole
Prendre la parole pour parler des règles de l’école.
Plan de la séance 5
Bonjour les enfants !  La leçon de français commence maintenant.
Aujourd’hui nous allons apprendre à parler des règles de l’école en français. Écoutez bien.
Lecture de la vidéo.
À votre tour. Qui veut parler des règles de l’école ?

À l’école, je dois__________________ .
À l’école, je ne dois pas__________________ .
En classe, je dois ___________  .
En classe, je ne dois pas _______________ . 
Maintenant, tout le monde participe. Chacun parle des règles de l’école. Je vais passer entre les rangs pour vous aider.
Prendre la parole pour parler des règles de l’école.  
Écrire des phrases.
2.  Lecture
Comprendre un texte.
Plan de la séance  5 
Prenez vos livrets à la page 21. Nous avons déjà lu ce texte. Maintenant, on va essayer de le comprendre, partie par partie. 




Pour chaque partie du texte, on va suivre les mêmes étapes. 

Etape 1
Je lis en silence et j’essaie de comprendre le texte.

Etape 2
Je repère les mots difficiles et je demande à mon enseignant(e) de me les expliquer

Etape 3
Je lis la question, puis je cherche la réponse dans le texte. 


Lisez silencieusement le texte et essayez de le comprendre. 
Etape 1
Partie 1/3

Etape 2

Etape 3
Le règlement de l’école

À l’école, on a le droit de parler, de poser des questions et de jouer. Mais il y a des règles pour bien vivre avec les camarades et les maitres. Le matin, il faut arriver à l’heure pour commencer la journée calmement.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 1/3
Etape 2

Etape 3
Le règlement de l’école

À l’école, on a le droit الحقde parler, de poserوضع  des questions et de jouer. Mais il y a des règlesقواعد  pour bien vivre يعيش avec les camarades et les maitres. Le matin, il faut arriverيصل  à l’heure الساعة  pour commencer يبدأ  la journée اليوم  calmement بهدوء
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 1 : Qu’est ce qu’on a le droit de faire à l‘école? 

Etape 1
Partie 1/3

Etape 2

Etape 3
Le règlement de l’école
À l’école, on a le droit de parler, de poser des questions et de jouer. Mais il y a des règles pour bien vivre avec les camarades et les maitres. Le matin, il faut arriver à l’heure pour commencer la journée calmement
La réponse est : on a le droit de parler, poser des questions et de jouer. 

Etape 1
Partie 1/3

Etape 2

Etape 3
Le règlement de l’école
À l’école, on a le droit de parler, de poser des questions et de jouer. Mais il y a des règles pour bien vivre avec les camarades et les maitres. Le matin, il faut arriver à l’heure pour commencer la journée calmement
Question 1 : Qu’est ce qu’on a le droit de faire à l‘école? 

On passe à la deuxième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 2/3

Etape 2

Etape 3
En classe, on lève toujours le doigt pour parler et on écoute attentivement la maitresse. 
Quand un camarade parle, on ne doit jamais lui couper la parole. On attend son tour pour parler.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 2/3
Etape 2

Etape 3
En classe, on lève toujours le doigt pour parler et on écoute attentivement la maitresse. 
Quand un camarade parle, on ne doit jamais lui couper la parole. On attend son tour pour parler.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 2 : Qu’est ce qu’on doit faire pour parler? 

Etape 1
Partie 2/3

Etape 2

Etape 3
En classe, on lève toujours le doigt pour parler et on écoute attentivement la maitresse. 
Quand un camarade parle, on ne doit jamais lui couper la parole. On attend son tour pour parler.
La réponse est : on lève toujours le doigt pour parler. .
Partie 2/3

Etape 1
Partie 2/3

Etape 2

Etape 3
Question 2 : Qu’est ce qu’on doit faire pour parler? 
En classe, on lève toujours le doigt pour parler et on écoute attentivement la maitresse. 
Quand un camarade parle, on ne doit jamais lui couper la parole. On attend son tour pour parler.

On passe à la troisième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 3/3

Etape 2

Etape 3
À la récréation, on joue ensemble et on ne pousse pas. Si un camarade tombe, on l’aide à se relever. On ne se moque jamais de ses camarades.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 3/3
Etape 2

Etape 3
À la récréation, on joue ensemble et on ne pousse pas. Si un camarade tombe, on l’aide à se relever. On ne se moque jamais de ses camarades.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  

Etape 1
Partie 3/3

Etape 2

Etape 3
Question 3 :  Qu’est ce qu’on ne doit pas faire à la récréation ? 
À la récréation, on joue ensemble et on ne pousse pas. Si un camarade tombe, on l’aide à se relever. On ne se moque jamais de ses camarades.
La réponse est : on ne pousse pas.

Etape 1
Partie 3/3

Etape 2

Etape 3
Question 3 :  Qu’est ce qu’on ne doit pas faire à la récréation ? 

À la récréation, on joue ensemble et on ne pousse pas. Si un camarade tombe, on l’aide à se relever.  On ne se moque jamais de ses camarades.
Prenez vos livrets à la page 21. Relisez le texte en silence pour le comprendre. Si vous ne comprenez pas un mot, demandez à votre voisin ou levez la main pour que je vous aide.

Comprendre un texte.
Prendre la parole pour parler des règles de l’école.
3.  Écriture  
Écrire des phrases.
Plan de la séance 5
Maintenant, nous allons faire de l’écriture.  Prenez vos cahiers.
Lisez et observez cette phrase. Vous allez l’écrire après. Tenez-vous prêts.  
Je ne dois  pas crier en classe.
Dictée en cours.
Corrigez. 
Je ne dois pas crier en classe.
Maintenant, écrivez sur vos cahiers une phrase correcte avec les deux mots suivants. 
courir   -    classe
Qui veut lire sa phrase ?
courir   -    classe
Corrigez. Une phrase correcte est : Tu ne dois pas courir en classe. 
 Tu ne dois pas courir en classe.
Lisez et observez cette phrase. Vous allez l’écrire après. Tenez-vous prêts.  
Je  dois écouter ma maitresse.
Dictée en cours.
Corrigez. 
Je dois écouter ma maitresse.
Maintenant, écrivez sur vos cahiers une phrase avec les deux mots suivants. 
faire   -    devoirs
Qui veut lire sa phrase ?
faire   -    devoirs
Corrigez. Une phrase correcte est : Je dois faire mes devoirs.
Je dois faire mes devoirs.
Prenez vos livrets à la page 22.

Vous allez faire l’activité 4. Je vais vous expliquer la consigne et passer entre les rangs pour vous aider.
Corrigez.
Tu dois écouter la maitresse.
Je ne dois pas me disputer avec mes camarades.
La séance d’aujourd’hui est terminée. À la maison vous allez relire  le texte de la page 21 et répondre aux questions.
','{"subject": "fran\u00e7ais", "level": "4", "period": "1", "week": "3", "session": "5", "objective": "Prendre la parole pour parler des r\u00e8gles de l\u2019\u00e9cole et \u00e9crire des phrases correctes.", "steps": [{"name": "Oral \u2013 Prise de parole", "duration": "20min", "icon": "\ud83d\udde3\ufe0f", "content": "Les \u00e9l\u00e8ves prennent la parole pour discuter des r\u00e8gles de l\u2019\u00e9cole. Ils \u00e9coutent attentivement et partagent leurs id\u00e9es en remplissant des phrases comme ''\u00c0 l\u2019\u00e9cole, je dois...'' et ''\u00c0 l\u2019\u00e9cole, je ne dois pas...''."}, {"name": "Ecriture \u2013 Texte", "duration": "25min", "icon": "\ud83d\udcdd", "content": "Les \u00e9l\u00e8ves \u00e9crivent des phrases en utilisant des mots donn\u00e9s. Ils pratiquent la dict\u00e9e et corrigent leurs phrases, par exemple, ''Tu ne dois pas courir en classe'' et ''Je dois faire mes devoirs''."}], "title": "FR N4 P1 SEM3 S5"}','','2026-02-26 10:46:01.815363','2026-02-26 23:16:00.505220',1);
INSERT INTO "raida_lesson" VALUES(65,'FR N4 P1 SEM4 S5','français','4','1','4','5','FR_N4_P1_SEM4_S5.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 4

Séance 2

Séance 3
Oral – Dialogue
Lecture – texte
Écriture – Phrases
Oral – Acte de parole 1
Écrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Lecture – Compréhension de texte
Écriture – Phrases 
Révision
Lecture offerte
Séance 5
Oral  - Acte de parole  2
Écrit – Point de langue 2
Lecture – Phrases
Organisation de la semaine
Comprendre un texte.
Écrire des phrases.
1.  Prise de parole
Prendre la parole pour parler des activités de l’école.
Plan de la séance 5
Bonjour les enfants !  La leçon de français commence maintenant.
Aujourd’hui, nous allons apprendre à parler d’une prochaine sortie en français. Écoutez bien.
Lecture de la vidéo.
Maintenant, on va prendre la parole pour parler des activités de l’école. On va le faire en 3 étapes. Soyez attentifs. 

Étape 1

Étape 2

Étape 3
Étape 1 : Je vais vous expliquer la situation. 
Situation : Parle des activités de l’école en disant ce que tu fais en français, ce que tu fais en maths, ce que tu dois faire à l’école et ce que tu vas faire pour la prochaine sortie scolaire. 

Étape 1

Étape 2

Étape 3
Étape 2.  Chacun réfléchit silencieusement à ce qu’il va dire dans sa prise de parole.

Étape 1

Étape 2

Étape 3
Situation : Parle des activités de l’école en disant ce que tu fais en français, ce que tu fais en maths, ce que tu dois faire à l’école et ce que tu vas faire pour la prochaine sortie scolaire. 

À l’école, j’apprends ______________ [ matière ]  .
En __________ [ matière ] , je  ________ [ activité ].
À l’école, je dois ____________________ .
Pour la prochaine sortie scolaire, on ______________ . On va découvrir _____________________________________  .
Étape 3.  Maintenant, vous allez prendre la parole. Qui veut passer au tableau ? 
Étape 1

Étape 3
Étape 2
Maintenant, tout le monde participe. Chacun parle des activités de l’école. Je vais passer entre les rangs pour vous aider.
Prendre la parole pour parler des activités de l’école.
Écrire des phrases.
2.  Lecture
Comprendre un texte.
Plan de la séance  5 
Prenez vos livrets à la page 26. Nous avons déjà lu ce texte. Maintenant, on va essayer de le comprendre, partie par partie. 




Pour chaque partie du texte, on va suivre les mêmes étapes. 

Étape 1
Je lis en silence et j’essaie de comprendre le texte.

Étape 2
Je repère les mots difficiles et je demande à mon enseignant(e) de me les expliquer

Étape 3
Je lis la question, puis je cherche la réponse dans le texte. 


Lisez silencieusement le texte et essayez de le comprendre. 
Étape 1
Partie 1/3

Étape 2

Étape 3
Une sortie au musée

Demain, on va faire une sortie scolaire avec toute la classe ! 
On va visiter le musée Mohamed VI d’art moderne, à Rabat.
Le départ est à huit heures du matin, devant la porte de l’école.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Étape 1
Partie 1/3
Étape 2

Étape 3
Une sortie au musée

Demain, on va faire une sortie scolaire avec toute la classe ! 
On va visiter le musée Mohamed VI d’art moderne, à Rabat.
Le départ est à huit heures du matin, devant la porte de l’école.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 1 : Qu’est-ce que les élèves vont visiter ? 

Étape 1
Partie 1/3

Étape 2

Étape 3
Une sortie au musée

Demain, on va faire une sortie scolaire avec toute la classe ! 
On va visiter le musée Mohamed VI d’art moderne, à Rabat.
Le départ est à huit heures du matin, devant la porte de l’école.
La réponse est : le musée Mohamed VI d’art moderne. 

Etape 1
Partie 1/3

Etape 2

Etape 3
Question 1 : Qu’est-ce que les élèves vont visiter ? 
Une sortie au musée

Demain, on va faire une sortie scolaire avec toute la classe ! 
On va visiter le musée Mohamed VI d’art moderne, à Rabat.
Le départ est à huit heures du matin, devant la porte de l’école.

On passe à la deuxième partie du texte. Lisez en silence et essayez de comprendre. 
Étape 1
Partie 2/3

Étape 2

Étape 3
Nous devons avoir tous un petit sac avec une bouteille d’eau, un sandwich et une casquette. 
Au musée, on découvrira de belles œuvres de peinture.  
Nous écouterons le guide : il nous parlera des tableaux et des dessins réalisés par des artistes marocains.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Étape 1
Partie 2/3
Étape 2

Étape 3
Nous devons avoir tous un petit sac avec une bouteille d’eau, un sandwich et une casquette. 
Au musée, on découvrira de belles œuvres de peinture.  
Nous écouterons le guide : il nous parlera des tableaux et des dessins réalisés par des artistes marocains.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 2 : Qu’est-ce que les élèves vont découvrir au musée ? 

Étape 1
Partie 2/3

Étape 2

Étape 3
Nous devons avoir tous un petit sac avec une bouteille d’eau, un sandwich et une casquette. 
Au musée, on découvrira de belles œuvres de peinture.  
Nous écouterons le guide : il nous parlera des tableaux et des dessins réalisés par des artistes marocains.
La réponse est : de belles œuvres de peinture. .
Partie 2/3

Étape 1
Partie 2/3

Étape 2

Étape 3
Question 2 : Qu’est-ce que les élèves vont découvrir au musée ? 
Nous devons avoir tous un petit sac avec une bouteille d’eau, un sandwich et une casquette. 
Au musée, on découvrira de belles œuvres de peinture.  
Nous écouterons le guide : il nous parlera des tableaux et des dessins réalisés par des artistes marocains.

On passe à la troisième partie du texte. Lisez en silence et essayez de comprendre. 
Étape 1
Partie 3/3

Étape 2

Étape 3
À midi, nous ferons un pique-nique dans le jardin, à côté du musée. J’aime beaucoup les sorties scolaires parce qu’elles sont amusantes et intéressantes.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Étape 1
Partie 3/3
Étape 2

Étape 3
À midi, nous ferons un pique-nique dans le jardin, à côté du musée. J’aime beaucoup les sorties scolaires parce qu’elles sont amusantes et intéressantes.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  

Étape 1
Partie 3/3

Étape 2

Étape 3
Question 3 :  Où est-ce que les élèves vont faire un pique-nique ? 
À midi, nous ferons un pique-nique dans le jardin, à côté du musée. J’aime beaucoup les sorties scolaires parce qu’elles sont amusantes et intéressantes.
La réponse est : dans le jardin, à côté du musée.

Etape 1
Partie 3/3

Etape 2

Etape 3
Question 3 :  Où est-ce que les élèves vont faire un pique-nique ? 
À midi, nous ferons un pique-nique dans le jardin, à côté du musée.
J’aime beaucoup les sorties scolaires parce qu’elles sont amusantes et intéressantes.
Prenez vos livrets à la page 26. Relisez le texte en silence pour le comprendre. Si vous ne comprenez pas un mot, demandez à votre voisin ou levez la main pour que je vous aide.

Comprendre un texte.
Prendre la parole pour parler des activités de l’école.
3.  Écriture  
Écrire des phrases.
Plan de la séance 5
Maintenant, nous allons faire de l’écriture.  Prenez vos cahiers.
Lisez et observez cette phrase. Vous allez l’écrire après. Tenez-vous prêts.  
Les élèves découvrent des sculptures.
Dictée en cours.
Corrigez. Une phrase correcte est : Les élèves découvriront des sculptures.  
Maintenant, écrivez sur vos cahiers une phrase correcte avec les deux mots suivants. 
élèves   -    musée
Qui veut lire sa phrase ?
élèves  -    musée
Corrigez. Une phrase correcte est : Les élèves vont visiter un musée. 
Maintenant, écrivez sur vos cahiers une phrase avec les deux mots suivants. 
regarder   -  peintures   
Qui veut lire sa phrase ?
regarder   -    peintures
Corrigez. Une phrase correcte est : Il va regarder des peintures.
Prenez vos livrets à la page 27.

Vous allez faire l’activité 4. Je vais vous expliquer la consigne et passer entre les rangs pour vous aider.
Corrigez.
Je découvrirai un atelier de peinture.
On découvrira des tableaux.
La séance d’aujourd’hui est terminée. À la maison vous allez relire  le texte de la page 26 et répondre aux questions.
',NULL,'','2026-02-26 10:46:02.072952','2026-02-26 10:46:02.072979',1);
INSERT INTO "raida_lesson" VALUES(66,'FR N4 P1 SEM3 S6','français','4','1','3','6','FR_N4_P1_SEM3_S6.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 5

Séance 4

Séance 2

Séance 3
Oral – Dialogue
Lecture – texte
Ecriture – Phrases
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Révision
Lecture offerte
Oral –  Prise de parole
Lecture – Compréhension de texte
Ecriture – Phrases 
Séance 6
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Organisation de la semaine
Vocabulaire.
Lire un texte.
Écrire des mots et des phrases.
Répondre à des questions en rafales. 
Histoire : le cahier magique.
1. Révision
Plan de la séance 6
(ة)خاص بالأستاذ 

Au terme de cette séance de révision, l’enseignant doit vérifier qu’au moins 80% des élèves sont capables de : 
Reconnaitre les mots de vocabulaire.
Lire et comprendre un texte.
Ecrire des mots et des phrases.
Répondre spontanément à des questions sur le contenu de la semaine. 
* Si ce taux n’est pas atteint, il convient de mettre en place des actions de remédiation, collectives ou individuelles. 
Bonjour les enfants. Aujourd’hui, nous allons réviser les leçons de la semaine passée. Soyez attentifs.
Répétons ensemble :  Une langue – Mesurer – Calculer – La solution – Lire – Intéressant
Une langue
Mesurer 
Lire 
Intéressant
La solution
Calculer
Répétons ensemble : Écrire – Facile – Difficile – Résoudre – Une opération – Un problème
Écrire 
Facile
Une opération
Un problème
Résoudre
Difficile 
Répétons ensemble: La directrice – Le maitre – Le gardien – La bibliothécaire – Le cuisinier – Une nouvelle leçon.
La directrice
Le maitre 
La bibliothécaire 
Une nouvelle leçon
Le cuisinier
Le gardien
Répétons ensemble : Ouvrir – Expliquer – Cuisiner – S’occuper – Accueillir – Prêter.  
Ouvrir
Expliquer 
S’occuper 
Prêter
Accueillir 
Cuisiner
Nous allons jouer au jeu des mots invisibles. 
Jeu des mots invisibles. 
Répétons ensemble :  Le règlement de la classe – Le devoir–  Lever le doigt – S’excuser – Respecter - Écouter .
Le devoir
Respecter
S’excuser
Lever le doigt
Le règlement de la classe
Écouter
Observez bien les images. Je vais masquer deux images. Qui veut expliquer la consigne en arabe ? 
Quelles sont les images qui manquent ?
?
?
Les deux images qui manquent sont : lever le doigt et s’excuser.


Nous allons jouer au jeu des mots qui bougent. 
Jeu des mots qui bougent 
Répétons ensemble :  Se moquer – Se disputer–  Courir – Crier – Polie - Impolie.
Se moquer 
Se disputer
Polie 
Impolie
Crier
Courir 
Observez bien. Je vais faire bouger 2 mots. Qui veut expliquer la consigne en arabe ? 
Quels sont les 2 mots qui ont bougé ? 
Les deux mots qui ont bougé sont : se moquer et polie. 


Maintenant, on va faire de la lecture. Qui veut lire ce paragraphe ? 
Les règles de l’école.

À l’école, je dois respecter des règles. Il faut arriver à l’heure et entrer calmement dans la classe.  Je dois écouter le maitre et la maitresse.

Qui veut expliquer ce paragraphe dans sa langue ? 
Les règles de l’école.

À l’école, je dois respecter des règles. Il faut arriver à l’heure et entrer calmement dans la classe.  Je dois écouter le maitre et la maitresse.

Qui veut lire la question et y répondre ? 
Qu’est ce que je dois respecter à l’école ? 
Les règles de l’école.

À l’école, je dois respecter le règlement. Il faut arriver à l’heure et entrer calmement dans la classe.  Je dois écouter le maitre et la maitresse.

La réponse est : Je dois respecter le règlement.
Qu’est ce que je dois respecter à l’école ? 
Les règles de l’école.

À l’école, je dois respecter le règlement. Il faut arriver à l’heure et entrer calmement dans la classe.  Je dois écouter le maitre et la maitresse.

Qui veut lire ce paragraphe ? 
En classe, je ne dois pas couper la parole à mes camarades. Je dois lever le  doigt pour parler.
Je dois faire mes exercices en classe et mes devoirs à la maison. 
Qui veut expliquer ce paragraphe dans sa langue ? 
En classe, je ne dois pas couper la parole à mes camarades. Je dois lever le  doigt pour parler.
Je dois faire mes exercices en classe et mes devoirs à la maison. 
Qui veut lire la question et y répondre ? 
Qu’est ce que je dois faire avant de parler ? 
En classe, je ne dois pas couper la parole à mes camarades. Je dois lever le  doigt pour parler.
Je dois faire mes exercices en classe et mes devoirs à la maison. 
La réponse est : Je dois lever le doigt pour parler 
En classe, je ne dois pas couper la parole à mes camarades. Je dois lever le  doigt pour parler.
Je dois faire mes exercices en classe et mes devoirs à la maison. 
Qu’est ce que je dois faire avant de parler ? 
Prenez vos cahiers.
Ces mots sont en désordre. Ecrivez sur vos cahiers une phrase correcte à partir de ces mots.

vous

la maitresse

devez

écouter
Sujet + le verbe devoir au présent + verbe d’action à l’infinitif
La négation :
Sujet + ne + le verbe devoir au présent+ pas + verbe d’action à l’infinitif
Qui veut lire sa phrase ?
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Vous devez écouter la maitresse. 
On passe à une autre phrase. Ces mots sont en désordre. Ecrivez sur vos cahiers une phrase correcte à partir de ces mots.



dois
te disputer
ne
pas

pas
tu
Qui veut lire sa phrase ?
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Tu ne dois pas te disputer.
Ecrivez sur vos cahiers une phrase correcte en utilisant ces mots. Attention, il faut ajouter d’autres mots pour obtenir une phrase correcte. 
respecter         règlement
Qui veut lire sa phrase ?
Corrigez. Une phrase correcte est : Je dois respecter le règlement. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Je dois respecter le règlement. 
Ecrivez sur vos cahiers une phrase correcte en utilisant ces mots. Attention, il faut ajouter d’autres mots pour obtenir une phrase correcte. 
crier         classe
Qui veut lire sa phrase ?
Corrigez. Une phrase correcte est : je ne dois pas crier en classe. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Je ne dois pas crier en classe.
Maintenant, c’est l’activité des questions en rafales. Je vais désigner des élèves au hasard pour répondre. Tenez-vous prêts. 
?
?
?
Que fait le directeur ?
Que fait le directeur ?
?
Qui explique les leçons ?
Qui explique les leçons ?
?
Que fait le gardien ? 
Que fait le gardien ?
?

Qu’est ce que tu dois faire à l’école ?
Qu’est ce que tu dois faire à l’école ?
?
Qu’est ce que tu ne dois pas faire en classe ?

?
Qu’est ce que tu ne dois pas faire en classe ?
Vocabulaire.
Lire un texte.
Écrire des mots et des phrases.
Répondre à des questions en rafales. 
Histoire  du cahier magique.
2. Lecture offerte
Plan de la séance 6
Nous avons déjà vu les deux premiers épisodes de l’histoire le cahier magique. Qui veut nous rappeler ce qu’on a vu ?  En français ou dans votre langue. 
On va  regarder le deuxième épisode une nouvelle fois. Après, on verra le troisième épisode. Soyez attentifs.
Lecture de la vidéo.
Maintenant, nous allons découvrir un nouvel épisode de l’histoire le cahier magique. Est-ce que vous êtes prêts ? Ecoutez bien. 
Lecture de la vidéo.
Nous allons écouter l’histoire une deuxième fois. Soyez attentifs.
Lecture de la vidéo.
Que demande le cahier magique aux enfants ?
Le cahier magique demande : qu’est-ce que je dois faire à l’école ?
Qu’est-ce que je dois faire à l’école ?
Que répond Lina à la question du cahier magique ?  
Je dois écouter la maitresse.
Je dois écouter la maitresse.
Qu’ajoute Yasmine ? Qui veut répondre ?  
Je dois lever la main avant de parler.
Je dois lever la main avant de parler.
Quelle est la deuxième question du cahier magique ? Qui veut répondre ?  
Comment je dois me comporter avec mes camarades.
Comment je dois me comporter avec mes camarades.
Que répond Amine ? Qui veut répondre ?  
Je dois être poli et respecter mes camarades.
Je dois être poli et respecter mes camarades.
Quelle est la dernière question du cahier magique ? Qui veut répondre ?  
Et qu’est-ce que je ne dois pas faire à l’école ?
Et qu’est-ce que je ne dois pas faire à l’école ?
Que répond Sara ? Qui veut répondre ?  
Je ne dois pas courir dans les couloirs.
Je ne dois pas courir dans les couloirs.
Que répond Amine ? Qui veut répondre ?  
Je ne dois pas crier.
Je ne dois pas crier.
Qu’ajoute Lina ? Qui veut répondre ?  
Ni me battre avec mes camarades.
Ni me battre avec mes camarades.
Quelle la dernière écrite sur le cahier ? Qui veut répondre ?  
À l’école, je respecte les règles pour apprendre et vivre ensemble.
À l’école, je respecte les règles pour apprendre et vivre ensemble.
On va retrouver nos amis la semaine prochaine pour un nouvel épisode. 
La séance d’aujourd’hui est terminée.  ',NULL,'','2026-02-26 10:46:02.380930','2026-02-26 10:46:02.380957',1);
INSERT INTO "raida_lesson" VALUES(67,'FR N4 P1 SEM4 S6','français','4','1','4','6','FR_N4_P1_SEM4_S6.pptx','......','




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 5

Séance 4

Séance 2

Séance 3
Oral – Dialogue
Lecture – texte
Écriture – Phrases
Oral – Acte de parole 1
Écrit – Point de langue 1
Lecture – Mots avec difficultés 
Révision
Lecture offerte
Oral –  Prise de parole
Lecture – Compréhension de texte
Écriture – Phrases 
Séance 6
Oral  - Acte de parole  2
Écrit – Point de langue 2
Lecture – Phrases
Organisation de la semaine
Vocabulaire.
Lire un texte.
Écrire des mots et des phrases.
Répondre à des questions en rafales. 
Histoire : le cahier magique.
1. Révision
Plan de la séance 6
(ة)خاص بالأستاذ 

Au terme de cette séance de révision, l’enseignant doit vérifier qu’au moins 80% des élèves sont capables de : 
Lire et comprendre un texte.
Écrire des phrases.
Répondre spontanément à des questions sur le contenu de la semaine. 
* Si ce taux n’est pas atteint, il convient de mettre en place des actions de remédiation, collectives ou individuelles. 
Bonjour les enfants. Aujourd’hui, nous allons réviser les leçons de la semaine passée. Soyez attentifs.
Répétons ensemble: La directrice – Le maitre – Le gardien – La bibliothécaire – Le cuisinier – Une nouvelle leçon.
La directrice
Le maitre 
La bibliothécaire 
Une nouvelle leçon
Le cuisinier
Le gardien
Répétons ensemble : Ouvrir – Expliquer – Cuisiner – S’occuper – Accueillir – Prêter.  
Ouvrir
Expliquer 
S’occuper 
Prêter
Accueillir 
Cuisiner
Répétons ensemble :  Le règlement de la classe – Le devoir–  Lever le doigt – S’excuser – Respecter - Écouter .
Le devoir
Respecter
S’excuser
Lever le doigt
Le règlement de la classe
Écouter
Répétons ensemble :  Se moquer – Se disputer–  Courir – Crier – Poli - Impoli.
Se moquer 
Se disputer
Poli 
Impoli
Crier
Courir 
Nous allons jouer au jeu des mots invisibles. 
Jeu des mots invisibles. 
Répétons ensemble :  Visiter – Un musée –  Un tableau – Une œuvre d’art – Une sculpture – Un atelier.
Visiter
Un musée
Une sculpture
Un atelier
Une œuvre d’art
Un tableau
Observez bien les images. Je vais masquer deux images. Qui veut expliquer la consigne en arabe ? 
Quelles sont les images qui manquent ?
?
?
Les deux images qui manquent sont : un musée et un atelier.


Nous allons jouer au jeu des mots qui bougent. 
Jeu des mots qui bougent 
Répétons ensemble : La peinture – Le peintre – Un artiste – Un guide – Une sortie – Un pique-nique.  
Le peintre
Un artiste
La peinture
Une sortie
Un guide
Un pique-nique
Observez bien. Je vais faire bouger 2 mots. Qui veut expliquer la consigne en arabe ? 
Quels sont les 2 mots qui ont bougé ? 
Les deux mots qui ont bougé sont: le guide et le peintre.
Maintenant nous allons faire de la lecture. Qui veut lire ce paragraphe ? 
La sortie scolaire.
Avec l’école, on va faire une sortie. On va visiter le musée Dar El Bacha à Marrakech. On va tous partir en bus, les élèves, les maitres, les maitresses, et même la directrice.  
Qui veut expliquer ce paragraphe dans sa langue ? 
La sortie scolaire.
Avec l’école, on va faire une sortie. On va visiter le musée Dar El Bacha à Marrakech. On va tous partir en bus, les élèves, les maitres, les maitresses, et même la directrice.  
Qui veut lire la question et y répondre ? 
Qu’ est-ce que les élèves vont visiter ? 
Avec l’école, on va faire une sortie. On va visiter le musée Dar El Bacha à Marrakech. On va tous partir en bus, les élèves, les maitres, les maitresses, et même la directrice.  
La réponse est : Le musée Dar El Bacha, à Marrakech.
Qu’ est-ce que les élèves vont visiter ? 
Avec l’école, on va faire une sortie. On va visiter le musée Dar El Bacha à Marrakech. On va tous partir en bus, les élèves, les maitres, les maitresses, et même la directrice.  
Qui veut lire ce paragraphe ? 
Au musée, on découvrira des œuvres d’art, des peintures et des sculptures. Le guide va parler des peintres et des artistes marocains. Et nous allons faire un atelier de dessin.
Qui veut expliquer ce paragraphe dans sa langue ? 
Au musée, on découvrira des œuvres d’art, des peintures et des sculptures. Le guide va parler des peintres et des artistes marocains. Et nous allons faire un atelier de dessin.
Qui veut lire la question et y répondre ? 
Qu’est ce que va faire le guide ? 
Au musée, on découvrira des œuvres d’art, des peintures et des sculptures. Le guide va parler des peintres et des artistes marocains. Et nous allons faire un atelier de dessin.
La réponse est : Le guide va parler des peintres et des artistes marocains.  
Qu’est ce que va faire le guide ? 
Au musée, on découvrira des œuvres d’art, des peintures et des sculptures. Le guide va parler des peintres et des artistes marocains. Et nous allons faire un atelier de dessin.
Prenez vos cahiers.
Ces mots sont en désordre. Écrivez sur vos cahiers une phrase correcte à partir de ces mots.

découvrirons

nous

des artistes
Qui veut lire sa phrase ?
Corrigez. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Écrivez sur vos cahiers une phrase correcte en utilisant ces mots. Attention, il faut ajouter d’autres mots pour obtenir une phrase correcte. 
visiter         musée 
Qui veut lire sa phrase ?
Corrigez. Une phrase correcte est : Les élèves vont visiter un musée. Je n’oublie pas la majuscule au début de la phrase et le point à la fin.  
Maintenant, c’est l’activité des questions en rafales. Je vais désigner des élèves au hasard pour répondre. Tenez-vous prêts. 
?
?
?

Qu’est-ce que tu apprends en français ?
Qu’est-ce que tu apprends en français ?
?
Qu’est-ce que tu fais en mathématiques ?
Qu’est-ce que tu fais en mathématiques ?
?

Qu’est-ce que fait le gardien à l’école ?
Que fait le gardien à l’école?
?

Qu’est-ce que tu veux faire pour la prochaine sortie scolaire ?
Qu’est-ce que tu veux faire pour la prochaine sortie scolaire ?
?
Qu’est-ce que tu va découvrir au musée  ?
Qu’est-ce que tu va découvrir au musée ?
?
Vocabulaire.
Lire un texte.
Écrire des mots et des phrases.
Répondre à des questions en rafales. 
Histoire  du cahier magique.
2. Lecture offerte
Plan de la séance 6
Nous avons déjà vu les trois premiers épisodes de l’histoire le cahier magique. Qui veut nous rappeler ce qu’on a vu ?  En français ou dans votre langue. 
On va  regarder le troisième épisode une nouvelle fois. Après, on verra le troisième épisode. Soyez attentifs.
Lecture de la vidéo.
Maintenant, nous allons découvrir un nouvel épisode de l’histoire le cahier magique. Est-ce que vous êtes prêts ? Ecoutez bien. 
Lecture de la vidéo.
Nous allons écouter l’histoire une deuxième fois. Soyez attentifs.
Lecture de la vidéo.
Quelle est la question qui apparaît dans le cahier magique  ? Qui veut répondre ?  
La question est : On va où pour la prochaine sortie scolaire ?
On va où pour la prochaine sortie scolaire ?
Où veut aller Amine ? Qui veut répondre ?  
Amine veut aller au musée Mohamed VI d’art moderne à Rabat.
Amine veut aller au musée Mohamed VI d’art moderne à Rabat.
Quelle est la question que Lina lit sur le cahier magique ? Qui veut répondre ?  
La question que Lina lit est : « Qu’est ce qu’on va faire au musée ? »
La question que Lina lit est : « Qu’est ce qu’on va faire au musée ? »
Qu’écrit Yasmine sur le cahier magique ? Qui veut répondre ?  
Yasmine  écrit : Au musée, on découvrira des tableaux d’arts.
Yasmine  écrit : Au musée, on découvrira des tableaux d’arts.
Comment étaient les peintures affichées au cahier ? Qui veut répondre ?  
Les peintures affichées au cahier étaient colorées et magnifiques.
Les peintures affichées au cahier étaient colorées et magnifiques.
Que veut voir Adam au musée ? Qui veut répondre ?  
Adam veut voir des tableaux d’artistes marocains.
Adam veut voir des tableaux d’artistes marocains.
Quel est le petit dessin qui apparaît sur le cahier magique ? Qui veut répondre ?  
Le petit dessin qui apparaît sur le cahier magique est celui d’un bus.
Le petit dessin qui apparaît sur le cahier magique est celui d’un bus.
De quoi rêvent les enfants à la fin de l’histoire ? Qui veut répondre ?  
A la fin de l’histoire, les enfants rêvent d’une belle visite du musée.
Cette histoire est terminée. A la semaine prochaine avec une nouvelle histoire.
A la maison,  écrivez trois phrases que vous avez entendues dans l’histoire du Cahier magique. 
',NULL,'','2026-02-26 10:46:02.612920','2026-02-26 10:46:02.612947',1);
INSERT INTO "raida_lesson" VALUES(68,'MATH N5 P2 SEM4 S1','mathématiques','5','2','4','1','MATH_N5_P2_SEM4_S1.pptx','......','
5 
الدرس 1

4
2
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
الدرس 13
مساحة متوازي الأضلاع
درس اليوم

مساحة متوازي الأضلاع
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
حساب مساحة متوازي الأضلاع
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
75 ÷ 5 = 15
كتلة التفاح في الصندوق الواحد هي 15 كيلوغراما

5  مرات
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 11.

عرض فيديو الحساب الذهني 
صححوا
7
6
39
57
3
36
5
24
54
(ة)خاص بالأستاذ 
الآن سنتعرف كيف نحسب مساحة متوازي أضلاع
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
لِحِسابِ مِساحَةِ مُتَوازي أَضْلاعٍ، أُوَظِّفُ الْقاعِدَةَ:
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا الألواح
ماذا نفعل في الخطوة الأولى؟ 
أتذكر القاعدة
1
أطبق القاعدة
2
اكتبوا قاعدة حساب مساحة متوازي الأضلاع على الألواح
أتذكر القاعدة
1
أطبق القاعدة
2
نصحح
أتذكر القاعدة
1
أطبق القاعدة
2
A = b × h
اكتبوا على الألواح قياس طول ارتفاع متوازي الأضلاع
أتذكر القاعدة
1
أطبق القاعدة
2
ارفعوا الألواح
نصحح، 
أتذكر القاعدة
1
أطبق القاعدة
2
cm
اكتبوا على الألواح قياس طول قاعدة متوازي الأضلاع
أتذكر القاعدة
1
أطبق القاعدة
2
cm
ارفعوا الألواح
نصحح
أتذكر القاعدة
1
أطبق القاعدة
2
cm
cm
ماذا نفعل في الخطوة الثانية؟ 
أتذكر القاعدة
1
أطبق القاعدة
2
cm
cm
طبقوا القاعدة واحسبوا المساحة
أتذكر القاعدة
1
أطبق القاعدة
2
cm
cm
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة
أتذكر القاعدة
1
أطبق القاعدة
2
7 × 4 = 28 cm²
cm
cm
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
على الألواح احسبوا مساحة متوازي الأضلاع
ارفعوا الألواح
نصحح، 
15 × 6 = 90 m²
6
15
cm
cm
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط 2 صفحة 94. 

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
3
8
5
18
24 cm²
90 cm²
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 95 وأنجزوا النشاط 3. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
2
3
6 cm²
3
6
18 cm²
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:02.832863','2026-02-26 10:46:02.832891',1);
INSERT INTO "raida_lesson" VALUES(69,'MATH N5 P2 SEM4 S2','mathématiques','5','2','4','2','MATH_N5_P2_SEM4_S2.pptx','......','
5 
الدرس 1

4
2
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
الدرس 14
مساحة شبه المنحرف والمثلث
درس اليوم

مساحة شبه المنحرف والمثلث
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
حساب مساحة شبه المنحرف والمثلث
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
5
48
72
40
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 11.

عرض فيديو الحساب الذهني 
صححوا
6
4
16
37
2
14
9
29
5
7
(ة)خاص بالأستاذ 
الآن سنتعرف كيف نحسب مساحة مثلث
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
لِحِسابِ مِساحَةِ مُثَلَّثٍ، أُوَظِّفُ الْقاعِدَةَ:
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا الألواح
ماذا نفعل في الخطوة الأولى؟ 
أتذكر القاعدة
1
أطبق القاعدة
2
اكتبوا قاعدة حساب مساحة المثلث على الألواح
أتذكر القاعدة
1
أطبق القاعدة
2
نصحح
أتذكر القاعدة
1
أطبق القاعدة
2
اكتبوا على الألواح قياس طول ارتفاع هذا المثلث
أتذكر القاعدة
1
أطبق القاعدة
2
ارفعوا الألواح
نصحح، 
أتذكر القاعدة
1
أطبق القاعدة
2
6 cm
اكتبوا على الألواح قياس طول قاعدة هذا المثلث
أتذكر القاعدة
1
أطبق القاعدة
2
6 cm
ارفعوا الألواح
نصحح
أتذكر القاعدة
1
أطبق القاعدة
2
6 cm
5 cm
ماذا نفعل في الخطوة الثانية؟ 
أتذكر القاعدة
1
أطبق القاعدة
2
6 cm
5 cm
طبقوا القاعدة واحسبوا المساحة
أتذكر القاعدة
1
أطبق القاعدة
2
6 cm
5 cm
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة
أتذكر القاعدة
1
أطبق القاعدة
2
6 cm
5 cm
15 cm²
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
على الألواح احسبوا مساحة المثلث 
ارفعوا الألواح
نصحح، 
8 cm²
4 cm
4 cm
(ة)خاص بالأستاذ 
الآن سنتعرف كيف نحسب مساحة شبه المنحرف
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
لِحِسابِ مِساحَةِ شبه المنحرف، أُوَظِّفُ الْقاعِدَةَ:
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا الألواح
ماذا نفعل في الخطوة الأولى؟ 
أتذكر القاعدة
1
أطبق القاعدة
2
اكتبوا قاعدة حساب مساحة شبه المنحرف على الألواح
أتذكر القاعدة
1
أطبق القاعدة
2
نصحح
أتذكر القاعدة
1
أطبق القاعدة
2
اكتبوا على الألواح قياس طول القاعدة الكبرى b1 لهذا الشبه المنحرف
أتذكر القاعدة
1
أطبق القاعدة
2
ارفعوا الألواح
نصحح، 
أتذكر القاعدة
1
أطبق القاعدة
2
12 m
اكتبوا على الألواح قياس طول القاعدة الصغرى b2 لهذا الشبه المنحرف
أتذكر القاعدة
1
أطبق القاعدة
2
12 m
ارفعوا الألواح
نصحح، 
أتذكر القاعدة
1
أطبق القاعدة
2
12 m
8 m
اكتبوا على الألواح قياس طول ارتفاع هذا الشبه المنحرف 
أتذكر القاعدة
1
أطبق القاعدة
2
12 m
8 m
ارفعوا الألواح
نصحح
أتذكر القاعدة
1
أطبق القاعدة
2
12 m
8 m
7 m
ماذا نفعل في الخطوة الثانية؟ 
أتذكر القاعدة
1
أطبق القاعدة
2
12 m
8 m
7 m
طبقوا القاعدة واحسبوا المساحة
أتذكر القاعدة
1
أطبق القاعدة
2
12 m
8 m
7 m
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة
أتذكر القاعدة
1
أطبق القاعدة
2
12 m
8 m
7 m
70 m²
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
على الألواح احسبوا مساحة شبه المنحرف 
ارفعوا الألواح
نصحح، 
26 cm²
8 cm
5 cm
4 cm
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط 3 صفحة 96

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
لِحِسابِ مِساحَةِ الْمُثَلَّثِ وَشِبْهِ المُنْحَرِفِ، أُوَظِّفُ الْقاعِدَةَ:
صححوا 
12 cm
2 cm
42 cm²
6 cm
3 cm
8 cm
12 cm²
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 97 وأنجزوا النشاط 4. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
10 cm
4 cm
35 cm²
5 cm
8 cm
9 cm
36 cm²
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:03.084967','2026-02-26 10:46:03.084995',1);
INSERT INTO "raida_lesson" VALUES(70,'MATH N5 P2 SEM4 S3','mathématiques','5','2','4','3','MATH_N5_P2_SEM4_S3.pptx','......','
5 
الدرس 1

4
2
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
الدرس 15
مساحة المعين
درس اليوم

مساحة المعين
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
حساب مساحة المعين
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
18
48
72
40
24
20
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 11.

عرض فيديو الحساب الذهني 
صححوا
4
2
3
7
3
6
3
4
3
2
(ة)خاص بالأستاذ 
الآن سنتعرف كيف نحسب مساحة معين
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
لِحِسابِ مِساحَةِ مُعَيَّنٍ، أُوَظِّفُ الْقاعِدَةَ:
D
d
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا الألواح
ماذا نفعل في الخطوة الأولى؟ 
أتذكر القاعدة
1
أطبق القاعدة
2
اكتبوا قاعدة حساب مساحة المعين على الألواح
أتذكر القاعدة
1
أطبق القاعدة
2
نصحح
أتذكر القاعدة
1
أطبق القاعدة
2
اكتبوا على الألواح قياس طول القطر الكبير لهذا المعين
أتذكر القاعدة
1
أطبق القاعدة
2
ارفعوا الألواح
نصحح، 
أتذكر القاعدة
1
أطبق القاعدة
2
7 cm
اكتبوا على الألواح قياس طول القطر الصغير للمعين
أتذكر القاعدة
1
أطبق القاعدة
2
7 cm
ارفعوا الألواح
نصحح
أتذكر القاعدة
1
أطبق القاعدة
2
7 cm
4 cm
ماذا نفعل في الخطوة الثانية؟ 
أتذكر القاعدة
1
أطبق القاعدة
2
7 cm
4 cm
طبقوا القاعدة واحسبوا المساحة
أتذكر القاعدة
1
أطبق القاعدة
2
7 cm
4 cm
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة
أتذكر القاعدة
1
أطبق القاعدة
2
7 cm
4 cm
14 cm²
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
على الألواح احسبوا مساحة المعين 
ارفعوا الألواح
نصحح، 
36 cm²
12 cm
6 cm
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط 2 صفحة 98

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
لِحِسابِ مِساحَةِ مُعَيَّنٍ، أُوَظِّفُ الْقاعِدَةَ:
D
d
صححوا 
7 cm
4 cm
14 cm²
8 cm
5 cm
20 cm²
10 cm
30 cm
15 cm²
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 99 وأنجزوا النشاط 3. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
7 cm
4 cm
14 cm²
6 cm
4 cm
12 cm²
8 cm
3 cm
12 cm²
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:03.324771','2026-02-26 10:46:03.324814',1);
INSERT INTO "raida_lesson" VALUES(71,'MATH N5 P2 SEM4 S4','mathématiques','5','2','4','4','MATH_N5_P2_SEM4_S4.pptx','......','
5 
الدرس 1

4
2
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الرابع
(ة)خاص بالأستاذ 
الدرس 16
حل المسائل
درس اليوم

حل المسائل
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أحل مسائل من خطوتين
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
120
320
90
60
160
45
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 11.

عرض فيديو الحساب الذهني 
صححوا
400
90
50
30
100
40
250
70
300
80
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نحل مسألة من خطوتين
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا الألواح
ماذا نفعل في الخطوة الأولى؟ 
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
اقرؤوا المسألة . من يستخرج لنا معطيات المسألة
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
ماذا نفعل في الخطوة الثانية؟ 
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
اكتبوا على الألواح عدد خطوات المسألة
1
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
2
3
4
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا كيف حدد طبيعة المسألة
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
1
2
3
4
على الألواح. اكتبوا الحرف المناسب للمعطى الناقص لحساب المطلوب
A
B
C
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
عَدَدُ الإناث 
عَدَدُ الذكور 
مجموع التلاميذ
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح كيف تعرف المعطى الناقص
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
A
B
C
عَدَدُ الإناث 
عَدَدُ الذكور 
مجموع التلاميذ
ماذا نفعل في الخطوة الثالثة؟ 
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
على الألواح ارسموا نموذج الأشرطة لتمثيل الخطوة الأولى وحساب عدد الذكور
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
ارفعوا الألواح
نصحح، من يشرح لنا كيف وصل إلى الجواب الصحيح؟
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
على الألواح احسبوا عدد التلاميذ الذكور باستعمال متساوية الحل
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
ارفعوا الألواح
نصحح، من يشرح لنا كيف وصل إلى الجواب الصحيح؟
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
93 + 9 = 22
على الألواح ارسموا نموذج الأشرطة لتمثيل الخطوة الثانية في المسألة
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
93 + 9 = 22
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا؟
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
93 + 9 = 22
13
؟
22
على الألواح اكتبوا متساوية الحل
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
93 + 9 = 22
13
؟
22
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا؟
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
93 + 9 = 22
22 + 13 = 35
13
؟
22
على الألواح اكتبوا عبارة الحل للمسألة
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
93 + 9 = 22
22 + 13 = 35
13
؟
22
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة؟
أفهم المسألة
1
أحل كل خطوة
3
أحدد خطوات المسألة
2
في قِسْمٍ 13 تِلْميذَةً. ما عَدَدُ تَلاميذِ الْقِسْمِ إِذا كانَ عَدَدُ التَّلاميذِ الذُّكورِ يَفوقُ عَدَدَ الْإِناثِ بِ 9 تَلاميذَ؟
عدد تلاميذ هذا القسم هو 35 تلميذا
93 + 9 = 22
13
؟
22
22 + 13 = 35
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
على الألواح قوموا بحل المسألة التالية
لَدى عِمادٍ 100 دِرْهَمٍ. اِشْتَرى 5 دَفاتِرَ بِثَمَنِ 9 دَراهِمَ لِلدَّفْتَرِ الواحِدِ.
كَمْ دِرْهَماً سيبقى لَدى عِمادٍ ؟
ارفعوا الألواح
نصحح، من يقوم ليشرح لنا الخطوات
سيبقى لدي عماد 55 درهما

5  مرات
100 – 45 = 55
لَدى عِمادٍ 100 دِرْهَمٍ. اِشْتَرى 5 دَفاتِرَ بِثَمَنِ 9 دَراهِمَ لِلدَّفْتَرِ الواحِدِ.
كَمْ دِرْهَماً سيبقى لَدى عِمادٍ ؟
الخطوة الأولى
الخطوة الثانية
5 × 9 = 45
أحسب ثمن الدفاتر
أحسب ما بقي لدى عماد
45
100
؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط 2 صفحة 100. 

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
قطع عادل 960 مترا

14 مرة
12 × 80 = 960
1120 ÷ 14 = 80
أحسب ما بقي لدى عماد

12 مرة
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 101 وأنجزوا النشاط 3. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
ثمن الخروف 900 درهما
3 × 7 500 = 22 500
أحسب ثمن الخروف الواحد

25 مرة
7500
7500
22 500 ÷ 25 = 900
أحسب ثمن بيع العجول
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:03.524362','2026-02-26 10:46:03.524390',1);
INSERT INTO "raida_lesson" VALUES(72,'FR N5 P2 SEM4 S1','français','5','2','4','1','FR_N5_P2_SEM4_S1.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Oral – Dialogue
Lecture – texte  (fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 


Séance 1

Présentation du vocabulaire 
Exploitation du vocabulaire
Activités de vocabulaire sur livret
Organisation de la semaine
Description de la scène
Travail sur livret
Plan de la séance
1.  Présentation du vocabulaire
Joyeux –Triste- Avoir peur - Avoir confiance- Etre en colère - Fatigué
Courageux  - Calme – Surpris – Fière - Avoir honte-  Dangereux.
Bonjour les enfants !  La leçon de français commence maintenant.  Soyez attentifs. 
Lecture de la vidéo.
Lecture de la vidéo.
Qui veut répéter ?
Avoir confiance  
Lecture de la vidéo.
Qui veut répéter ?
Courageux  
Lecture de la vidéo.
Qui veut répéter ?
Avoir peur
Lecture de la vidéo.
Qui veut répéter ?
Fier 
Lecture de la vidéo.
Qui veut répéter ?


Surpris 
Lecture de la vidéo 

Qui veut répéter ?
Calme 
Lecture de la vidéo.
Répétons ensemble : Avoir confiance – Courageux – Avoir peur– Fier– Surpris - Calme.
Avoir confiance  
Fier
Calme 
 
Courageux 
Surpris  
Avoir peur
Maintenant, on va apprendre d’autres mots avec Majd.
Lecture de la vidéo.
Qui veut répéter ?
Triste 
Lecture de la vidéo.
Qui veut répéter ?
Fatigué  
Lecture de la vidéo.
Qui veut répéter ?
 Dangereux   
Lecture de la vidéo.
Qui veut répéter ?
Avoir honte  
Lecture de la vidéo.
Qui veut répéter ?
Être en colère
Lecture de la vidéo.
Qui veut répéter ?
Joyeux 
Lecture de la vidéo.
Répétons ensemble : Triste– Fatigué – Fier - dangereux– Avoir honte– Être en colère -  Joyeux.
Triste
    Joyeux   
Fatigué 
Avoir honte
Être en colère
Fier 
Prenez vos ardoises. 
Ecrivez le numéro du mot « Être en colère».
Ecrivez le numéro du mot « Courageux ».
Ecrivez le numéro du mot «Calme».
Rangez vos ardoises. 
Qui veut nommer l’image ? 
Qui veut nommer l’image ? 
Qui veut nommer l’image ? 
Qui veut nommer l’image ? 
Activités  sur livret
Plan de la séance
2.  Exploitation du vocabulaire
Description de la scène. 
Joyeux –Triste- Avoir peur - Avoir confiance- Etre en colère - Fatigué
Courageux  - Calme – Surpris – Fière - Avoir honte-  Dangereux.
Observez cette scène pendant 30 secondes. 
Majd va nous montrer comment  décrire cette scène. Soyez attentifs !
Lecture de la vidéo.
Soyez attentifs. Majd va décrire la scène une deuxième fois. 
Lecture de la vidéo.
Maintenant, je vais vous poser des questions.
Qui vient vers Salim, son petit frère et sa petite sœur dans le parc du quartier?
Comment se sent le petit frère?
Pourquoi la petite sœur se cache- t -elle derrière son frère?
Qui a protégé les deux enfants de ce chien dangereux ?
C’est à vous maintenant. Qui veut passer au tableau pour décrire l’image comme Majd ? 
Exploitation du vocabulaire 
Plan de la séance
3.  Activités de vocabulaire  sur livret
Activités sur livret
Joyeux –Triste- Avoir peur - Avoir confiance- Être en colère - Fatigué
Courageux  - Calme – Surpris – Fière - Avoir honte-  Dangereux.
Ouvrez le livret à la page 49.  Vous allez faire cette activité à l’oral avec votre camarade. 

À tour de rôle : l’un montre une image, l’autre dit le mot. Je passe entre les rangs pour vous aider.

Je montre l’image

1

Je dis le mot

2

Notez les devoirs à faire à la maison, Vous allez  faire les activités 1 et 2 sur le livret.Vous devez écrire les mots que vous avez appris aujourd’hui. 

La séance d’aujourd’hui est terminée. À bientôt.',NULL,'','2026-02-26 10:46:03.827943','2026-02-26 10:46:03.827972',1);
INSERT INTO "raida_lesson" VALUES(73,'FR N5 P2 SEM4 S2','français','5','2','4','2','FR_N5_P2_SEM4_S2.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 6

Séance 3

Séance 5

Séance 4

Séance 1
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Présentation du vocabulaire 
Exploitation du vocabulaire
Travail sur livret
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral –  Prise de parole
Ecriture – Texte  

Oral – Dialogue
Lecture - Lettre a - A
Ecriture - Lettre a - A

Séance 2

Oral – Acte de parole 1
Ecriture – Point de langue 1
Lecture – Mots avec difficultés 
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 2


Le verbe « Se sentir » au présent.
Mots avec difficultés :  lire des mots avec « eu » et « ou ».
Acte de parole 1 : « Exprimer ses émotions ». 
Bonjour les enfants ! La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons corriger les activités de vocabulaire.

Corrigez sur votre livret. 
Le meilleur
Un ingénieur 
Devenir
Avoir confiance
Courageux
Avoir peur
Fier 
Surpris 
Calme
Triste 
Fatigué 
Dangereux 
Avoir honte
Être en colère
Joyeux
Répétons ensemble les mots en français.  
Le meilleur
Un ingénieur 
Devenir
Avoir confiance
Courageux
Avoir peur
Fier 
Surpris 
Calme
Triste 
Fatigué 
Dangereux 
Avoir honte
Être  en colère
Joyeux
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. Soyez attentifs. 
Lecture de la vidéo.

Maintenant, on va poser les questions comme Majd et Nada. Répétons ensemble. 
Comment ça va aujourd’hui?
Comment tu te sens aujourd’hui ? 

Voici d’autres exemples : 
Comment tu te sens ce soir ? 
Comment ça va ce matin? 
Maintenant, nous allons apprendre à répondre à  la question : Comment ça va aujourd’hui  ? 
Lecture de la vidéo.

Maintenant, on va répondre aux questions comme Majd et Nada. Répétons ensemble. 
Je  me sens triste aujourd’hui .
Je me sens heureux aujourd’hui.

Voici d’autres exemples : 
Je me sens fier aujourd’hui.
Je me sens fatigué aujourd’hui.


Comment ça va aujourd’hui?
Qui veut passer au tableau pour jouer la scène ? 
Aujourd’hui, je me sens________.


Comment ça va aujourd''hui?
Qui veut passer au tableau pour jouer la scène ? 
Je me sens ________ aujourd’hui.


Comment tu vas aujourd’hui?
Qui veut passer au tableau pour jouer la scène ? 
Je me sens _____ aujourd’hui.
Chacun joue le dialogue avec son voisin. 
Comment tu vas aujourd’hui ?
________________ .
Acte de parole 1 : « Exprimer ses émotions ». 
Mots avec difficultés :  lire des mots avec « eu » et « ou ».
Plan de la séance 2
Le verbe « Se sentir» au présent
2.  Écrit : Point de langue
Se sentir au présent 
Nous allons apprendre à conjuguer le verbe « se sentir» au présent. 
Lecture de la vidéo.
Répétons ensemble. 
Je me sens
Tu te sens
Il se sent
Elle se sent
Nous nous sentons
Vous vous sentez 
Ils se sentent
Elles se sentent
Se sentir au présent 
Prenez vos ardoises.
Sur vos ardoises, complétez la phrase avec le verbe « se sentir » au présent.
Tu _______ bien aujourd’hui?

Levez les ardoises. 
Corrigez. 
Tu te sens bien aujourd’hui?
Nous  _______ heureux.
Compétez la phrase avec le verbe « se sentir »  au présent.
Levez les ardoises. 
Corrigez.
Nous  nous sentons  heureux.

Rangez vos ardoises. 
Prenez vos livrets à la page 53.

Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe. 
les meilleurs
la meilleure
nous sentons 
me sens 
se sent 
vous sentez 
te sens
se sentent
 Acte de parole 1 : « Exprimer émotions». 

Plan de la séance 2
Le verbe «Se sentir» au présent
Mots avec difficultés : lire des mots avec « eu » et « ou »
3.  Lecture
Maintenant, nous allons faire de la lecture.
On va apprendre à lire  des mots avec les graphèmes « eu » et « ou ». Soyez attentifs.
eu            ou
Lecture de la vidéo 
Lisez en silence.
heureux        humeur      deux       cour        journée     aujourd’hui 
Qui veut lire à voix haute ?
heureux        humeur      deux       cour        journée     aujourd’hui 
Lisez ces phrases silencieusement. Après je vais diffuser une lecture audio. 
Sami rencontre Inès dans la cour.
Il demande : « Comment tu vas aujourd’hui ? ».
Les deux enfants se sentent heureux.
Ils commencent la journée de bonne humeur.
Lecture audio. 
Sami rencontre Inès dans la cour.
Il demande : « Comment tu vas aujourd’hui ? ».
Les deux enfants se sentent heureux.
Ils commencent la journée de bonne humeur.
Qui veut lire à voix haute ?
Sami rencontre Inès dans la cour.
Il demande : « Comment tu vas aujourd’hui ? ».
Les deux enfants se sentent heureux.
Ils commencent la journée de bonne humeur.
Prenez vos livrets à la page 51.

Lisez les mots et les phrases à votre voisin. Je vais passer entre les rangs pour vous aider. 

Notez les devoirs à faire à la maison. À la maison, relisez les mots et les phrases de la page 51. Vous allez aussi refaire l’activité 1 de la page 53. 


La séance d’aujourd’hui est terminée. À bientôt ! ',NULL,'','2026-02-26 10:46:04.179158','2026-02-26 10:46:04.179185',1);
INSERT INTO "raida_lesson" VALUES(74,'FR N5 P2 SEM4 S3','français','5','2','4','3','FR_N5_P2_SEM4_S3.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2

Séance 4
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Séance 3
Organisation de la semaine
Utiliser « lorsque » dans une phrase.
Lire et comprendre des phrases.
1.  Acte de parole
Acte de parole 2 : « Parler de ses émotions ». 
Plan de la séance 3
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons revoir la scène avec les mots du vocabulaire. 
Lecture de la vidéo.
Qui veut décrire l’image ? 
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. Soyez attentifs. 
Lecture de la vidéo.

Maintenant, on va poser les questions comme Majd et Nada. Répétons ensemble. 
Qu’est-ce qui te rend triste?
Qu’est-ce qui te rend heureux? 
Voici d’autres exemples : 

Qu’est-ce qui te rend fière ?
Qu’est-ce qui te rend surpris ? 
Maintenant, nous allons apprendre à répondre à la question : « Qu’est-ce qui te rend triste? » 
Lecture de la vidéo.

Maintenant, on va répondre aux questions  comme Majd et Nada. Répétons ensemble. 
Je me sens triste lorsque j’ai une mauvaise note à l’école. 
Je me sens heureux lorsque je voyage avec ma famille.
Voici d’autres exemples :  

Je me sens calme lorsque je parle avec mon frère.
Je me sens fière lorsque j’ai une bonne note à l’école.

Qui veut passer au tableau pour jouer la scène ?  


Qu’est-ce qui
te rend ________ ?
Je me sens _______lorsque _______. 

Qui veut passer au tableau pour jouer la scène ?  


Qu’est-ce qui
te rend ________ ?
Je me sens _______lorsque _______. 

Qui veut passer au tableau pour jouer la scène ?  


Qu’est-ce qui
te rend ________ ?
Je me sens _______lorsque _______. 
Chacun joue le dialogue avec son voisin. 
Qu’est ce qui  te rend __________? 
Je me sens________ lorsque _______. 
Acte de parole 2 : « Parler de ses émotions ». 
Lire et comprendre des phrases.
2.  Ecrit : Point de langue 
Utiliser « Lorsque » dans une phrase.
Plan de la séance 3
Maintenant, on va apprendre comment utiliser le mot «  lorsque » dans une phrase. Soyez attentifs.  
Lorsque 
Lecture de la vidéo.
Lisons ensemble.  
Prenez vos ardoises.
Je relie les deux phrases en utilisant lorsque.
Karima est heureuse.
Elle joue avec son amie.
 _____________________________________________ .
Levez vos ardoises.
Corrigez. 
Karima est heureuse lorsqu’elle joue avec son amie.
Je relie les deux phrases en utilisant lorsque.
Hamid est fier.
Il marque un but.
 _____________________________________________ .
Levez vos ardoises.
Corrigez. 
Hamid est fier lorsqu’il marque un but.
Prenez vos livrets à la page 53.

Vous allez faire l’activité 2.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. 
Les enfants se sentent heureux lorsqu’ils ont une bonne note.
Sara a peur lorsqu’elle voit un chien méchant.
Karim est content lorsqu’il joue avec ses amis.
Utiliser « lorsque » dans une phrase.
Acte de parole 2: « Parler de ses émotions ». 
3.  Lecture
Lire et comprendre des phrases.
Plan de la séance 3
Maintenant, nous allons faire de la lecture.
Observez cette image et lisez la question. Je vais vous proposer des réponses. 
Comment va Salma ?
Prenez vos ardoises.
Ecrivez le numéro de la bonne réponse sur votre ardoise (1, 2, 3 ou 4).  
Salma se sent triste.
Salma est avec ses amis au parc.
 Salma se sent heureuse.
 Salma joue avec ses amis.
Comment va Salma ?
Levez vos ardoises.
La bonne est réponse est : « 3, Salma se sent heureuse ». Qui veut lire et expliquer la réponse ? 
Salma se sent triste.
Salma est avec ses amis au parc.
 Salma se sent heureuse.
 Salma joue avec ses amis. 
Comment va Salma ?

Prenez vos livrets à la page 51. Avec votre voisin, vous allez lire et répondre aux questions de l’activité 4. Je vais circuler entre les rangs pour vous aider. 

Notez les devoirs à faire à la maison. Vous allez lire et recopier le dialogue de la page 51. Vous allez aussi faire l’activité 2 de la page 53.


La séance d’aujourd’hui est terminée. A bientôt.  ',NULL,'','2026-02-26 10:46:04.416916','2026-02-26 10:46:04.416945',1);
INSERT INTO "raida_lesson" VALUES(75,'FR N5 P2 SEM4 S4','français','5','2','4','4','FR_N5_P2_SEM4_S4.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 4
Texte : Fluidité et compréhension.
1.  Dialogue 
Jouer un dialogue en reprenant les actes de parole enseignés.
Plan de la séance 4
Bonjour les enfants !  La leçon de français commence maintenant. 
Aujourd’hui, nous allons apprendre un dialogue avec Majd et Nada. 
Lecture de la vidéo.
Nous allons écouter le dialogue une deuxième fois.
Lecture de la vidéo.
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. Puis, on va continuer à répéter le dialogue.
On va continuer la répétition du dialogue. Je vais lire chaque réplique et vous allez répéter après moi. 
On va continuer la répétition du dialogue. Je vais lire chaque réplique et vous allez répéter après moi. 
Maintenant, on va jouer ce dialogue. On va le faire en 3 étapes. Soyez attentifs. 


Etape 1

Etape 2

Etape 3
Etape 1. Je vais vous expliquer la situation.  
Situation : Le garçon et la fille se rencontrent dans la bibliothèque. Chacun pose à l’autre les questions suivantes: 


Etape 1

Etape 2

Etape 3
Est-ce que tu aimes les jeux vidéo ?
Quel est ton sport préféré ? 
Comment ça va aujourd’hui ?
Qu’est-ce qui te rend triste ?
Qu’est-ce qui te rend heureux ?
Etape 2.  Chacun réfléchit silencieusement à ce qu’il va dire dans le dialogue.

Etape 1

Etape 2

Etape 3

Situation : Le garçon et la fille se rencontrent dans la bibliothèque. Chacun pose à l’autre les questions suivantes: 
Est-ce que tu aimes les jeux vidéo ?
Quel est ton sport préféré ? 
Comment ça va aujourd’hui ?
Qu’est-ce qui te rend triste ?
Qu’est-ce qui te rend heureux ?
Etape 3.  Maintenant, vous allez jouer le dialogue. Qui veut passer au tableau ? 

Etape 1

Etape 2

Etape 3
Situation : Le garçon et la fille se rencontrent dans la bibliothèque. Chacun pose à l’autre les questions suivantes: 
Est-ce que tu aimes les jeux vidéo ?
Quel est ton sport préféré ? 
Comment ça va aujourd’hui ?
Qu’est-ce qui te rend triste ?
Qu’est-ce qui te rend heureux ?
Maintenant, tout le monde participe. Jouez le dialogue avec votre voisin.
Est-ce que tu aimes les jeux vidéo ?
Quel est ton sport préféré ? 
Est-ce que tu aimes les jeux vidéo ?
Comment ça va aujourd’hui ?
Qu’est-ce qui te rend triste ?
Qu’est-ce qui te rend heureux ?
Jouer un dialogue reprenant les actes de parole enseignés.
2.  Lecture
Texte : Fluidité et compréhension.
Plan de la séance 4 
Maintenant, on va faire de la lecture. On va lire des mots, puis un texte. 
On va lire ensemble ce texte du livret. On va le découper en 3 parties. Après, vous allez le lire tous seuls. 

Lisez la première partie du texte silencieusement. Après, je vais diffuser une lecture audio. 


Partie 1
Partie 2

Partie 3
Comment tu vas aujourd’hui ?

Ce matin, Sami rencontre Inès et d’autres camarades dans la cour.
- Il demande : « Comment tu vas aujourd’hui ? »
Inès répond : « Je vais très bien. Je suis très heureuse ! Hier, j’ai réussi une expérience en sciences et la maîtresse m’a félicitée. J’étais fière et joyeuse. »
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?
Partie 1


Partie 1
Partie 2

Partie 3
                                
Comment tu vas aujourd’hui ?

Ce matin, Sami rencontre Inès et d’autres camarades dans la cour.
- Il demande : « Comment tu vas aujourd’hui ? »
Inès répond : « Je vais très bien. Je suis très heureuse ! Hier, j’ai réussi une expérience en sciences et la maîtresse m’a félicitée. J’étais fière et joyeuse. »
On passe à la deuxième partie.  Lisez en silence. 
Sami dit : « Moi aussi, je suis très content. Hier soir, j’ai lu un livre d’histoire. J’ai appris que la mosquée  Al Quaraouiyyine a presque 1200 ans. Cela m’a donné envie de devenir professeur d’histoire quand je serai grand.»
Lecture audio. 
Partie 1


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?
Partie 1


Partie 1
Partie 2

Partie 3
Sami dit : « Moi aussi, je suis très content. Hier soir, j’ai lu un livre d’histoire. J’ai appris que la mosquée  Al Quaraouiyyine a presque 1200 ans. Cela m’a donné envie de devenir professeur d’histoire quand je serai grand.»
On passe à la troisième partie.  Lisez en silence. 





Partie 1


Partie 2

Partie 3
Partie 1
Inès sourit : « Alors, aujourd’hui, nous sommes heureux de commencer une bonne journée. » 
Sami répond : « Oui, c’est agréable de se sentir heureux dès le matin. »
Lecture audio. 

Partie 1


Partie 2

Partie 3
Partie 1
Qui veut lire le texte ?

Partie 1


Partie 2

Partie 3
Partie 1
Inès sourit : « Alors, aujourd’hui, nous sommes heureux de commencer une bonne journée. »
Sami répond : « Oui, c’est agréable de se sentir heureux dès le matin. »
Maintenant, on va essayer de comprendre le texte, partie par partie. Pour chaque partie du texte, on va suivre les mêmes étapes. 

Etape 1
Je lis en silence et j’essaie de comprendre le texte.

Etape 2
Je repère les mots difficiles et je demande à mon enseignant(e) de me les expliquer

Etape 3
Je lis la question, puis je cherche la réponse dans le texte. 


Lisez silencieusement le texte et essayez de le comprendre. 
Etape 1
Partie 1/3

Etape 2

Etape 3
Ce matin, Sami rencontre Inès et d’autres camarades dans la cour.
Il demande : « Comment tu vas aujourd’hui ? »
Inès répond : « Je vais très bien. Je suis très heureuse ! Hier, j’ai réussi une expérience en sciences et la maîtresse m’a félicitée. J’étais fière et joyeuse.»

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 1/3
Etape 2

Etape 3
Ce matin, Sami rencontre Inès et d’autres camarades dans la cour.
Il demande : « Comment tu vas aujourd’hui ? »
Inès répond : « Je vais très bien. Je suis très heureuse ! Hier, j’ai réussi une expérience en sciences et la maîtresse m’a félicitée. J’étais fière et joyeuse.»
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 1 : Pourquoi Inès se sent –elle heureuse aujourd’hui? 

Etape 1
Partie 1/3

Etape 2

Etape 3
Ce matin, Sami rencontre Inès et d’autres camarades dans la cour.
Il demande : « Comment tu vas aujourd’hui ? »
Inès répond : « Je vais très bien. Je suis très heureuse ! Hier, j’ai réussi une expérience en sciences et la maîtresse m’a félicitée. J’étais fière et joyeuse.»
La question est : « Pourquoi? ». Je cherche une cause dans le texte. La réponse est: Inès est très heureuse parce qu’elle a réussi une expérience en sciences. 

Etape 1
Partie 1/3

Etape 2

Etape 3
Question 1 : Pourquoi Inès se sent –elle heureuse aujourd’hui? 
Ce matin, Sami rencontre Inès et d’autres camarades dans la cour.
- Il demande : « Comment tu vas aujourd’hui ? »
Inès répond : « Je vais très bien. Je suis très heureuse ! Hier, j’ai réussi une expérience en sciences et la maîtresse m’a félicitée. J’étais fière et joyeuse. »

On passe à la deuxième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 2/3

Etape 2

Etape 3
Sami dit : « Moi aussi, je suis très content. Hier soir, j’ai lu un livre d’histoire. J’ai appris que la mosquée Al Quaraouiyyine a presque 1200 ans. Cela m’a donné envie de devenir professeur d’histoire quand je serai grand.»

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 2/3
Etape 2

Etape 3
Sami dit : « Moi aussi, je suis très content. Hier soir, j’ai lu un livre d’histoire. J’ai appris que la mosquée Al Quaraouiyyine a presque 1200 ans. Cela m’a donné envie de devenir professeur d’histoire quand je serai grand.»
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 2 : Pourquoi Sami veut- il devenir professeur d’histoire? 

Etape 1
Partie 2/3

Etape 2

Etape 3
Sami dit : « Moi aussi, je suis très content. Hier soir, j’ai lu un livre d’histoire. J’ai appris que la mosquée Al Quaraouiyyine a presque 1200 ans. Cela m’a donné envie de devenir professeur d’histoire quand je serai grand.»
La question est « Pourquoi ? ». Je cherche une cause  dans le texte. La réponse est : « Parce qu’il a lu un livre d’histoire. Il a appris que la mosquée Al Quaraouiyyine a presque 1200 ans.»

Etape 1
Partie 2/3

Etape 2

Etape 3
Question 2 : Pourquoi Sami veut- il devenir professeur d’histoire? 

Sami dit : « Moi aussi, je suis très content. Hier soir, j’ai lu un livre d’histoire. J’ai appris que la mosquée Al Quaraouiyyine a presque 1200 ans. Cela m’a donné envie de devenir professeur d’histoire quand je serai grand.»
On passe à la troisième partie du texte. Lisez en silence et essayez de comprendre.

 
Etape 1
Partie 3/3

Etape 2

Etape 3
Inès sourit : « Alors, aujourd’hui, nous sommes heureux de commencer une bonne journée. »
Sami répond : « Oui, c’est agréable de se sentir heureux dès le matin. »
Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 



Etape 1
Partie 3/3
Etape 2

Etape 3
Inès sourit : « Alors, aujourd’hui, nous sommes heureux de commencer une bonne journée. »
Sami répond : « Oui, c’est agréable de se sentir heureux dès le matin. »
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  

Question 3 : Comment Inès et Sami se sentent-ils le matin ?

Etape 1
Partie 3/3

Etape 2

Etape 3
Inès sourit : « Alors, aujourd’hui, nous sommes heureux de commencer une bonne journée. »
Sami répond : « Oui, c’est agréable de se sentir heureux dès le matin. »
La question est « Comment? ». Je cherche un adjectif (un état) dans le texte. La réponse est : Ils sont heureux de commencer une bonne journée.


Etape 1
Partie 3/3

Etape 2

Etape 3
Inès sourit : « Alors, aujourd’hui, nous sommes heureux de commencer une bonne journée. »
Sami répond : « Oui, c’est agréable de se sentir heureux dès le matin. »

Question 3 : Comment Inès et Sami se sentent-ils le matin ?
Prenez vos livrets à la page 52.
Lisez le texte à votre voisin puis changez les rôles.
Notez les devoirs à faire à la maison. Vous aller relire le texte de la page 52 et répondre aux questions.

La séance d’aujourd’hui est terminée. À bientôt.

En cas d’indisponibilité du livret : chaque élève lit le texte à son voisin. ',NULL,'','2026-02-26 10:46:04.697248','2026-02-26 10:46:04.697276',1);
INSERT INTO "raida_lesson" VALUES(76,'FR N5 P2 SEM4 S5','français','5','2','4','5','FR_N5_P2_SEM4_S5.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 4

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 5
Oral –  Prise de parole
Ecriture – Texte 
Écrire un texte.
1.  Prise de parole
Prendre la parole pour exprimer ses préférences et ses émotions.
Plan de la séance 5
Bonjour les enfants !  La leçon de français commence maintenant.
Aujourd’hui, nous allons apprendre à parler de nos émotions. 
Lecture de la vidéo. 
Maintenant, on va prendre la parole pour parler de nos préférences et de nos émotions. On va le faire en 3 étapes. Soyez attentifs. 

Etape 1

Etape 2

Etape 3
Etape 1. Je vais vous expliquer la situation. 

Etape 1

Etape 2

Etape 3
Situation : Parle de ce que tu aimes faire, de tes dessins animés préférés, de ton sport préféré et de tes émotions.

J’aime faire _______ [ activité ] parce que ــــــــ  [ cause ].
Je n’aime pas [ jeux vidéo] parce que______________[cause].
Mon dessin  préféré est ___________ [ dessin animé]. 
Mon sport préféré est _______________ [sport]. 
À mon avis [matière] _____________est la meilleure matière  parce que _____________[cause].
Je me sens [émotion] lorsque je ____________[ activité ].
Etape 2.  Chacun réfléchit silencieusement à ce qu’il va dire dans sa prise de parole.

Etape 1

Etape 2

Etape 3
Situation : Parle de ce que tu aimes faire, de tes dessins animés préférés, de ton sport préféré et de tes émotions.

J’aime faire _______ [ activité ] parce que ــــــــ  [ cause ].
Je n’aime pas [ jeux vidéo] parce que______________[cause].
Mon dessin  préféré est ___________ [ dessin animé]. 
Mon sport préféré est _______________ [sport]. 
À mon avis [matière] _____________est la meilleure matière  parce que _____________[cause].
Je me sens [émotion] lorsque je ____________[ activité ].
Etape 3. C’est à vous de prendre la parole maintenant. Qui veut passer au tableau ? 

Etape 1

Etape 2

Etape 3
Situation : Parle de ce que tu aimes faire, de tes dessins animés préférés, de ton sport préféré et de tes émotions.

J’aime faire _______ [ activité ] parce que ــــــــ  [ cause ].
Je n’aime pas [ jeux vidéo] parce que______________[cause].
Mon dessin  préféré est ___________ [ dessin animé]. 
Mon sport préféré est _______________ [sport]. 
À mon avis [matière] _____________est la meilleure matière  parce que _____________[cause].
Je me sens [émotion] lorsque je ____________[ activité ].
Maintenant, tout le monde participe. Chacun parle de ses préférences.
Prendre la parole pour exprimer ses préférences et ses émotions.
2.  Écriture 
Écrire un texte.
Plan de la séance  5 
Lisez et observez ce texte silencieusement. Après, on va faire une dictée. 
À mon avis, le français est la meilleure matière à l’école parce que j’aime lire des histoires. Je me sens heureux lorsque j’ai une bonne note en français. 
Prenez vos cahiers. Tenez-vous prêts. La dictée va commencer.
Dictée en cours. Première lecture.
Dictée en cours. Deuxième lecture. 
Je vais refaire la dictée. 

Corrigez. 
À mon avis, le français est la meilleure matière à l’école parce que j’aime lire des histoires. Je me sens heureux lorsque j’ai une bonne note en français. 
Qui veut expliquer ce paragraphe dans sa langue ? 
À mon avis, le français est la meilleure matière à l’école parce que j’aime lire des histoires. Je me sens heureux lorsque j’ai une bonne note en français. 
Maintenant, on va apprendre à écrire un paragraphe semblable.
Je commence par me poser une question:  à ton avis,  quelle est la meilleure matière à l’école ? Qui veut me donner des propositions ? Levez la main. 
À ton avis, quelle est la meilleure matière à l’école ?
Il y a plusieurs réponses possibles. Une réponse peut être : À mon avis,  la meilleure matière à l’école est le français. Mais je peux dire aussi : pour moi, la meilleure matière à l’école est l’histoire.
À mon avis,  la meilleure matière à l’école est le français.
Après, je pose une question : Pourquoi ?  Qui veut me donner des propositions ? Levez la main. 
Pourquoi ?
Il y a plusieurs réponses possibles. Une réponse peut être : parce que je voudrais devenir écrivain. Mais je peux dire aussi : parce que j’aime parler en français. 
À mon avis,  la meilleure matière à l’école est le français parce que je voudrais devenir écrivain. 
Ensuite, je me pose une autre question. Comment je me sens ? Levez la main. 
Comment je me sens ?
Une réponse peut être : Je me sens fier.  Mais je peux aussi dire : Je me sens content.
À mon avis,  la meilleure matière à l’école est le français parce que je voudrais devenir écrivain. Je me sens fier. 
Après, je me pose une autre question « Qu’est-ce qui te rend fier ?».  Qui veut me donner des propositions ? Levez la main.  
Qu’est-ce qui te rend fier ?
Une réponse peut être : Je me sens fier lorsque j’ai une bonne note. Mais je peux dire aussi : Je me sens fier lorsque je réponds correctement.
À mon avis,  la meilleure matière à l’école est le français parce que je voudrais devenir écrivain. Je me sens fier lorsque j’ai une bonne note à l’école.
Maintenant, je peux écrire mon paragraphe complet.
À mon avis,  la meilleure matière à l’école est le français parce que je voudrais devenir écrivain. Je me sens fier lorsque j’ai une bonne note à l’école.
Retenez bien. Pour écrire le paragraphe, je me suis posé les questions suivantes : 
À ton avis, quelle est la meilleure matière à l’école ?
Pourquoi ?
Comment je me sens ?
Qu’est-ce qui te rend fier ?
Prenez vos cahiers. Vous allez écrire un paragraphe en vous posant les mêmes questions.  Je vais circuler entre les rangs pour vous aider. 
À ton avis, quelle est la meilleure matière à l’école ?
Pourquoi ?
Comment je me sens ?
Qu’est-ce qui te rend fier ?
Qui veut lire son paragraphe ? 
Notez les devoirs à faire à la maison. Vous allez, écrire un autre paragraphe sur votre cahier.

La séance d’aujourd’hui est terminée. À bientôt.',NULL,'','2026-02-26 10:46:04.971909','2026-02-26 10:46:04.971952',1);
INSERT INTO "raida_lesson" VALUES(77,'FR N5 P3 SEM1 S1','français','5','3','1','1','FR_N5_P3_SEM1_S1.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Oral – Dialogue
Lecture – texte  (fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 


Séance 1

Présentation du vocabulaire 
Exploitation du vocabulaire
Activités de vocabulaire sur livret
Organisation de la semaine
Description de la scène
Travail sur livret
Plan de la séance
1.  Présentation du vocabulaire
Le spectacle - Le musicien - Le théâtre  - Un acteur -  La danseuse -  Le sculpteur
Le peintre -  L''écrivain  - Le créateur de vidéos  - Un studio -  Le chanteur –
        Les spectateurs.
Bonjour les enfants !  La leçon de français commence maintenant.  Soyez attentifs. 
Lecture de la vidéo.
Lecture de la vidéo.
Qui veut répéter ?
Le spectacle 
Lecture de la vidéo.
Qui veut répéter ?
Le musicien  
Lecture de la vidéo.
Qui veut répéter ?
Le théâtre
Lecture de la vidéo.
Qui veut répéter ?
Un acteur 
Lecture de la vidéo.
Qui veut répéter ?


La danseuse 
Lecture de la vidéo 

Qui veut répéter ?
Le sculpteur 
Lecture de la vidéo.
Répétons ensemble : Le spectacle - Le musicien - Le théâtre  - Un acteur -  La danseuse – Le sculpteur.
Le spectacle 
Un acteur 
Le   sculpteur 
 
Le musicien  
La danseuse   
Le théâtre 
Maintenant, on va apprendre d’autres mots avec Majd.
 
 
Lecture de la vidéo.
Qui veut répéter ?
Le peintre 
Lecture de la vidéo.
Qui veut répéter ?
L''écrivain  
Lecture de la vidéo.
Qui veut répéter ?
 Le créateur de vidéos   
Lecture de la vidéo.
Qui veut répéter ?
Un studio
Lecture de la vidéo.
Qui veut répéter ?
Le chanteur
Lecture de la vidéo.
Qui veut répéter ?
Les spectateurs 
Lecture de la vidéo.
Répétons ensemble : Le peintre -  L''écrivain  - Le créateur de vidéos  - Un studio -  Le chanteur - Les spectateurs.
Le peintre 
   Les spectateurs
L''écrivain 
Un studio
Le chanteur 
Le créateur de vidéos  
Prenez vos ardoises. 
Ecrivez le numéro du mot « les spectateurs ».
Ecrivez le numéro du mot « l’écrivain ».
Ecrivez le numéro du mot « le sculpteur ».
Rangez vos ardoises. 
Qui veut nommer l’image ? 
Qui veut nommer l’image ? 
Qui veut nommer l’image ? 
Qui veut nommer l’image ? 
Activités  sur livret
Plan de la séance
2.  Exploitation du vocabulaire
Description de la scène. 
Le spectacle - Le musicien - Le théâtre  - Un acteur -  La danseuse -  Le sculpteur
Le peintre -  L''écrivain  - Le créateur de vidéos  - Un studio -  Le chanteur - Les spectateurs.
Observez cette scène pendant 30 secondes. 
Majd va nous montrer comment  décrire cette scène. Soyez attentifs !
Lecture de la vidéo.
Soyez attentifs. Majd va décrire la scène une deuxième fois. 
Lecture de la vidéo.
Maintenant, je vais vous poser des questions.
Quelle est l’activité artistique de Lina ?
Sara est peintre. Que fait-elle dans la salle d’art de l’école ?
Quelle est l’activité artistique préférée de Adam ?
Yassine est sculpteur, que fait–il dans la salle d’art ? 
C’est à vous maintenant. Qui veut passer au tableau pour décrire l’image comme Majd ? 
Exploitation du vocabulaire 
Plan de la séance
3.  Activités de vocabulaire  sur livret
Activités sur livret
Le spectacle - Le musicien - Le théâtre  - Un acteur -  La danseuse -  Le sculpteur
Le peintre -  L''écrivain  - Le créateur de vidéos  - Un studio -  Le chanteur - Les spectateurs.
Ouvrez le livret à la page 60.  Vous allez faire cette activité à l’oral avec votre camarade. 

À tour de rôle : l’un montre une image, l’autre dit le mot. Je passe entre les rangs pour vous aider.

Je montre l’image

1

Je dis le mot

2

Notez les devoirs à faire à la maison. Vous allez  faire les activités 1 et 2 sur le livret.Vous devez écrire les mots que vous avez appris aujourd’hui. 

La séance d’aujourd’hui est terminée. À bientôt.',NULL,'','2026-02-26 10:46:05.272091','2026-02-26 10:46:05.272117',1);
INSERT INTO "raida_lesson" VALUES(78,'FR N5 P3 SEM1 S2','français','5','3','1','2','FR_N5_P3_SEM1_S2.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 6

Séance 3

Séance 5

Séance 4

Séance 1
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Présentation du vocabulaire 
Exploitation du vocabulaire
Travail sur livret
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral –  Prise de parole
Ecriture – Texte  

Oral – Dialogue
Lecture - Lettre a - A
Ecriture - Lettre a - A

Séance 2

Oral – Acte de parole 1
Ecriture – Point de langue 1
Lecture – Mots avec difficultés 
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 2


Conjugaison : « Les verbes au 1er groupe» au passé composé. 
Mots avec difficultés :  les différentes manières de lire la lettre « t ».
Acte de parole 1 : « Parler des métiers». 
Bonjour les enfants ! La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons corriger les activités de vocabulaire.

Corrigez sur votre livret. 
Le sculpteur
Le spectacle
Un studio
Le musicien
Le peintre
Le théâtre
Un acteur
L’écrivain
Le chanteur
Le créateur de vidéo
La danseuse
Les spectateurs
Répétons ensemble les mots en français. 
Le sculpteur
Le spectacle
Un studio
Le musicien
Le peintre
Le théâtre
Un acteur
L’écrivain
Le chanteur
Le créateur de vidéo
La danseuse
Les spectateurs
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. Soyez attentifs. 
Lecture de la vidéo.

Maintenant, on va poser la question comme Majd et Nada. Répétons ensemble. 

Qu’est-ce que vous avez fait la semaine dernière ?
Qu’est-ce que vous avez fait hier ?

Voici d’autres exemples : 
Qu’est-ce que vous avez fait l’année dernière ?
Qu’est-ce que vous avez fait lundi dernier ?
Maintenant, nous allons apprendre à répondre à  la question : Qu’est-ce que vousavez fait la semaine dernière ?
Lecture de la vidéo.

Maintenant, on va répondre aux questions comme Majd et Nada. Répétons ensemble. 
La semaine dernière, nous avons visité un studio de création vidéo.
Hier, nous avons visité un théâtre. 

Voici d’autres exemples : 
L’année dernière, nous avons visité la Koutoubia à Marrakech. 
Lundi dernier,  nous avons déjeuné chez ma grand-mère. 


Qu’est-ce que vous avez fait 
la semaine dernière ?
Qui veut passer au tableau pour jouer la scène ? 
La semaine dernière,
___________________.


Qui veut passer au tableau pour jouer la scène ? 
Hier, ________ .
Qu’est-ce que vous avez fait hier ?
Chacun joue le dialogue avec son voisin. 
Qu’est-ce que vous
avez fait _________?
____ , ____________ .
Acte de parole 1 : « Parler des métiers». 
Mots avec difficultés : les différentes manières de lire la lettre « t ».
Plan de la séance 2
Conjugaison : « Les verbes au 1er groupe» au passé composé. 
2.  Écrit : Point de langue
Les verbes du 1er groupe 
au passé composé
Nous allons apprendre à conjuguer les verbes du 1er groupe au passé composé.
Lecture de la vidéo.
Répétons ensemble. 
Répétons ensemble. 
J’ai planté
Tu as planté
Il a planté
Elle a planté
Nous   avons  planté
Vous  avez   planté 
Ils ont  planté
Elles ont planté
Prenez vos ardoises.
Sur vos ardoises, complétez la phrase avec le verbe « planter » au passé composé.
Tu ____________ un arbre.

Levez les ardoises. 
Corrigez. 
Tu as planté un arbre.
Nous  ______________ des roses.
Compétez la phrase avec le verbe « planter »  au passé composé.
Levez les ardoises. 
Corrigez.
Nous  avons planté des roses.

Rangez vos ardoises. 
Prenez vos livrets à la page 64.

Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe. 
avons regardé
a préparé
avez dessiné
ont joué
as chanté
ai visité
 Acte de parole 1 : « Parler des métiers ». 

Plan de la séance 2
Conjugaison : « Les verbes au 1er groupe» au passé composé. 
Mots avec difficultés : les différentes manières de lire la lettre « t ».
3.  Lecture
Maintenant, nous allons faire de la lecture.
Nous allons voir les différentes manières de lire la lettre « t ». Soyez attentifs.
t           
Lecture de la vidéo 
Lisez en silence.
Tête     veste      piste     acteur 
récréation     attention  opération 
Qui veut lire à voix haute ?
Tête     veste      piste     acteur 
récréation     attention  opération 
Lisez ces phrases silencieusement. Après je vais diffuser une lecture audio. 
Les créateurs inventaient des histoires .
Nous avons visité un studio de création de jeux vidéo.
Le metteur en scène donnait des instructions aux acteurs.
 Les acteurs répétaient leurs textes sur la scène.
Lecture audio. 
Les créateurs inventaient des histoires .
Nous avons visité un studio de création de jeux vidéo.
Le metteur en scène donnait des instructions aux acteurs.
Les acteurs répétaient leurs textes sur la scène.
Qui veut lire à voix haute ?
Les créateurs inventaient des histoires .
Nous avons visité un studio de création de jeux vidéo.
Le metteur en scène donnait des instructions aux acteurs.
 Les acteurs répétaient leurs textes sur la scène.
Prenez vos livrets à la page 62.

Lisez les mots et les phrases à votre voisin. Je vais passer entre les rangs pour vous aider. 

Notez les devoirs à faire à la maison. À la maison, relisez les mots et les phrases de la page 62. Vous allez aussi faire l’activité 1 de la page 64. 


La séance d’aujourd’hui est terminée. À bientôt ! ',NULL,'','2026-02-26 10:46:05.590216','2026-02-26 10:46:05.590244',1);
INSERT INTO "raida_lesson" VALUES(79,'FR N5 P3 SEM1 S3','français','5','3','1','3','FR_N5_P3_SEM1_S3.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2

Séance 4
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Séance 3
Organisation de la semaine
Les verbes du 1er groupe à l’imparfait
Lire et comprendre des phrases.
1.  Acte de parole
Acte de parole 2 : « Parler des métiers ». 
Plan de la séance 3
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons revoir la scène avec les mots du vocabulaire. 
Lecture de la vidéo.
Qui veut décrire l’image ? 
Maintenant, on va passer à l’activité de l’oral. Nous allons apprendre à poser une question avec Majd et Nada. 
Lecture de la vidéo.

Maintenant, on va poser les questions comme Majd et Nada. Répétons ensemble. 
Que faisaient les créateurs de vidéos ? 
Que faisaient les acteurs ? 
Voici d’autres exemples : 

Que faisait la danseuse ?
Que faisaient les chanteurs?
Maintenant, nous allons apprendre à répondre aux questions : « Que faisaient lescréateurs de vidéos ? » et « Que faisaient les acteurs ? ».
Lecture de la vidéo.

Maintenant, on va répondre à la question comme Majd et Nada. Répétons ensemble. 
Les créateurs de vidéos programmaient des jeux.
Les acteurs répétaient leurs textes.
Voici d’autres exemples :  

La danseuse dansait devant les spectateurs.
Les chanteurs chantaient sur scène.

Qui veut passer au tableau pour jouer la scène ?  


Que faisait  ______ ?
Il _____________ . 

Qui veut passer au tableau pour jouer la scène ?  


Que faisait ________?
Il ____________ . 

Qui veut passer au tableau pour jouer la scène ?  


Que faisait  _______ ?
Elle _______. 

Qui veut passer au tableau pour jouer la scène ?  


Que faisait  _______ ?
Il _______. 
Chacun joue le dialogue avec son voisin. 
Que faisait __________? 
Il/elle  ___________ . 
Acte de parole 2 : « Parler des métiers ». 
Lire et comprendre des phrases.
2.  Ecrit : Point de langue 
Les verbes du 1er groupe à l’imparfait.
Plan de la séance 3
Les verbes du 1er groupe 
à l’imparfait.
Maintenant, nous allons apprendre à conjuguer les verbes du 1er groupe à l’imparfait.
Lecture de la vidéo.
Répétons ensemble. 
Je dessinais
Tu dessinais
Il dessinait
Elle dessinait

Nous   dessinions
Vous  dessiniez
Ils dessinaient
Elles dessinaient
Les verbes du 1er groupe à l’imparfait.
Prenez vos ardoises.
Sur vos ardoises, complétez la phrase avec le verbe  à l’imparfait.
Tu _______ (dessiner ) un portrait.

Levez les ardoises. 
Corrigez. 
Tu dessinais un portrait. 
Nous  _______ (chanter) une jolie chanson.
Compétez la phrase avec le verbe à l’imparfait.
Levez les ardoises. 
Corrigez.
Nous chantions une jolie chanson.
Elles  _______ (jouer) de la guitare.
Compétez la phrase avec le verbe à l’imparfait.
Levez les ardoises. 
Corrigez.
Elles jouaient de la guitare.

Rangez vos ardoises. 
Prenez vos livrets à la page 64.

Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe. 
Il jouait de la guitare.
Nous  dessinions des tableaux.
Elles chantaient de belles chansons.
Tu inventais des histoires.
Utiliser « lorsque » dans une phrase.
Acte de parole 2: « Parler de ses émotions ». 
3.  Lecture
Lire et comprendre des phrases.
Plan de la séance 3
Maintenant, nous allons faire de la lecture.
Observez cette image et lisez la question. Je vais vous proposer des réponses. 
Qu’est-ce que Salma a fait hier ?
Prenez vos ardoises.
Ecrivez le numéro de la bonne réponse sur votre ardoise (1, 2, 3 ou 4).  
Salma est avec ses amies.
 Salma a visité un musée.
 Salma a pris son sac à dos.
 Salma a visité un studio de création vidéo.
Qu’est-ce que Salma a fait hier ?
Levez vos ardoises.
La bonne réponse est : « 4, Salma a visité un studio de création vidéo ». Qui veut lire et expliquer la réponse ? 
Salma est avec ses amies.
 Salma a visité un musée.
 Salma a pris son sac à dos.
 Salma a visité un studio de création vidéo.
Qu’est-ce que Salma a fait hier ?
Prenez vos livrets à la page 62. Avec votre voisin, vous allez lire et répondre aux questions de l’activité 4. Je vais circuler entre les rangs pour vous aider. 

La bonne réponse est : « Le peintre dessinait un joli tableau ». Qui veut lire et expliquer la réponse ? 
X
Notez les devoirs à faire à la maison. Vous allez lire et recopier le dialogue de la page 62. Vous allez aussi faire l’activité 2 de la page 64 .


La séance d’aujourd’hui est terminée. A bientôt.  ',NULL,'','2026-02-26 10:46:05.877483','2026-02-26 10:46:05.877509',1);
INSERT INTO "raida_lesson" VALUES(80,'FR N5 P3 SEM1 S4','français','5','3','1','4','FR_N5_P3_SEM1_S4.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 4
Texte : Fluidité et compréhension.
1.  Dialogue 
Jouer un dialogue en reprenant les actes de parole enseignés.
Plan de la séance 4
Bonjour les enfants !  La leçon de français commence maintenant. 
Aujourd’hui, nous allons apprendre un dialogue avec Majd et Nada. 
Lecture de la vidéo.
Nous allons écouter le dialogue une deuxième fois.
Lecture de la vidéo.
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. Puis, on va continuer à répéter le dialogue.
On va continuer la répétition du dialogue. Je vais lire chaque réplique et vous allez répéter après moi. 
On va continuer la répétition du dialogue. Je vais lire chaque réplique et vous allez répéter après moi. 
Maintenant, on va jouer ce dialogue. On va le faire en 3 étapes. Soyez attentifs. 


Etape 1

Etape 2

Etape 3
Etape 1. Je vais vous expliquer la situation.  
Situation : Le garçon et la fille se rencontrent dans la bibliothèque. Chacun pose à l’autre les questions suivantes: 


Etape 1

Etape 2

Etape 3
Qu’est-ce que vous avez fait la semaine
       dernière ?
Qu’est-ce que vous avez fait hier ? 
Que faisaient les créateurs de vidéos ?
Que faisaient les acteurs ?
Que faisait la danseuse sur scène ?
Que faisait le chanteur ?
Etape 2.  Chacun réfléchit silencieusement à ce qu’il va dire dans le dialogue.

Etape 1

Etape 2

Etape 3

Situation : Le garçon et la fille se rencontrent dans la bibliothèque. Chacun pose à l’autre les questions suivantes: 
Qu’est-ce que vous avez fait la semaine dernière ?
Qu’est-ce que vous avez fait hier ? 
Que faisaient les créateurs de vidéos ?
Que faisaient les acteurs ?
Que faisait la danseuse sur scène ?
Que faisait le chanteur ?
Etape 3.  Maintenant, vous allez jouer le dialogue. Qui veut passer au tableau ? 

Etape 1

Etape 2

Etape 3
Situation : Le garçon et la fille se rencontrent dans la bibliothèque. Chacun pose à l’autre les questions suivantes: 
Qu’est-ce que vous avez fait la semaine dernière ?
Qu’est-ce que vous avez fait hier ? 
Que faisaient les créateurs de vidéos ?
Que faisaient les acteurs ?
Que faisait la danseuse sur scène ?
Que faisait le chanteur ?
Maintenant, tout le monde participe. Jouez le dialogue avec votre voisin.
Qu’est-ce que vous avez fait la semaine dernière ?
Qu’est-ce que vous avez fait hier ? 
Que faisaient les créateurs de vidéos ?
Que faisaient les acteurs ?
Que faisait la danseuse sur scène ?
Que faisait le chanteur ?
Jouer un dialogue reprenant les actes de parole enseignés.
2.  Lecture
Texte : Fluidité et compréhension.
Plan de la séance 4 
Maintenant, on va faire de la lecture. On va lire des mots, puis un texte. 
On va lire ensemble ce texte du livret. On va le découper en 3 parties. Après, vous allez le lire tous seuls. 

Lisez la première partie du texte silencieusement. Après, je vais diffuser une lecture audio. 


Partie 1
Partie 2

Partie 3
Des métiers intéressants
La semaine dernière, notre classe a visité un studio de création de jeux vidéo. Les créateurs travaillaient devant de grands ordinateurs. Ils dessinaient des personnages, inventaient des histoires et programmaient les jeux. Nous avons compris que, pour créer un jeu, il faut de l’imagination, de la patience et du travail en équipe.
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3
Des métiers intéressants
La semaine dernière, notre classe a visité un studio de création de jeux vidéo. Les créateurs travaillaient devant de grands ordinateurs. Ils dessinaient des personnages, inventaient des histoires et programmaient les jeux. Nous avons compris que, pour créer un jeu, il faut de l’imagination, de la patience et du travail en équipe.
On passe à la deuxième partie.  Lisez en silence. 
Ensuite, nous avons visité le grand théâtre de Rabat.  Les acteurs répétaient leurs textes, le metteur en scène donnait des instructions et les techniciens réglaient les lumières.
Lecture audio. 
Partie 1


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?
Partie 1


Partie 1
Partie 2

Partie 3
Ensuite, nous avons visité le grand théâtre de Rabat.  Les acteurs répétaient leurs textes, le metteur en scène donnait des instructions et les techniciens réglaient les lumières.
On passe à la troisième partie.  Lisez en silence. 





Partie 1


Partie 2

Partie 3
Partie 1
Cette journée m’a beaucoup plu. Plus tard, j’aimerais devenir acteur, car c’est un métier passionnant.
Lecture audio. 

Partie 1


Partie 2

Partie 3
Partie 1
Qui veut lire le texte ?

Partie 1


Partie 2

Partie 3
Partie 1
Cette journée m’a beaucoup plu. Plus tard, j’aimerais devenir acteur, car c’est un métier passionnant.
Maintenant, on va essayer de comprendre le texte, partie par partie. Pour chaque partie du texte, on va suivre les mêmes étapes. 

Etape 1
Je lis en silence et j’essaie de comprendre le texte.

Etape 2
Je repère les mots difficiles et je demande à mon enseignant(e) de me les expliquer

Etape 3
Je lis la question, puis je cherche la réponse dans le texte. 


Lisez silencieusement le texte et essayez de le comprendre. 
Etape 1
Partie 1/3

Etape 2

Etape 3
La semaine dernière, notre classe a visité un studio de création de jeux vidéo. Les créateurs travaillaient devant de grands ordinateurs. Ils dessinaient des personnages, inventaient des histoires et programmaient les jeux. Nous avons compris que, pour créer un jeu, il faut de l’imagination, de la patience et du travail en équipe.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 1/3
Etape 2

Etape 3
La semaine dernière, notre classe a visité un studio de création de jeux vidéo. Les créateurs travaillaient devant de grands ordinateurs. Ils dessinaient des personnages, inventaient des histoires et programmaient les jeux. Nous avons compris que, pour créer un jeu, il faut de l’imagination, de la patience et du travail en équipe.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 1: Qu’est-ce qu’il faut pour créer un jeu vidéo ?

Etape 1
Partie 1/3

Etape 2

Etape 3
La semaine dernière, notre classe a visité un studio de création de jeux vidéo. Les créateurs travaillaient devant de grands ordinateurs. Ils dessinaient des personnages, inventaient des histoires et programmaient les jeux. Nous avons compris que, pour créer un jeu, il faut de l’imagination, de la patience et du travail en équipe.
La question est : « Qu’est-ce qu’il faut  ?». Je cherche des noms dans le texte. La réponse est:   il faut de l’imagination, de la patience et du travail en équipe.

Etape 1
Partie 1/3

Etape 2

Etape 3
Question 1 : Qu’est-ce qu’il faut pour créer un jeu vidéo ?
La semaine dernière, notre classe a visité un studio de création de jeux vidéo. Les créateurs travaillaient devant de grands ordinateurs. Ils dessinaient des personnages, inventaient des histoires et programmaient les jeux. Nous avons compris que, pour créer un jeu, il faut de l’imagination, de la patience et du travail en équipe.

On passe à la deuxième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 2/3

Etape 2

Etape 3
Ensuite, nous avons visité le grand théâtre de Rabat. 
Les acteurs répétaient leurs textes, le metteur en scène donnait des instructions et les techniciens réglaient les lumières.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 2/3
Etape 2

Etape 3
Ensuite, nous avons visité le grand théâtre de Rabat. 
Les acteurs répétaient leurs textes, le metteur en scène donnait des instructions et les techniciens réglaient les lumières.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 2 : Que faisaient les acteurs et le metteur en scène?

Etape 1
Partie 2/3

Etape 2

Etape 3
Ensuite, nous avons visité le grand théâtre de Rabat. 
Les acteurs répétaient leurs textes, le metteur en scène donnait des instructions et les techniciens réglaient les lumières.
La question est « Que faisaient ? ». Je cherche des actions dans le texte. La réponse est : «Les acteurs répétaient leurs textes et le metteur en scène donnait des instructions ».

Etape 1
Partie 2/3

Etape 2

Etape 3
Question 2 : Que faisaient les acteurs et le metteur en scène?
Ensuite, nous avons visité le grand théâtre de Rabat. Les acteurs répétaient leurs textes, le metteur en scène donnait des instructions et les techniciens réglaient les lumières.
On passe à la troisième partie du texte. Lisez en silence et essayez de comprendre.

 
Etape 1
Partie 3/3

Etape 2

Etape 3
Cette journée m’a beaucoup plu. Plus tard, j’aimerais devenir acteur, car c’est un métier passionnant.
Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 



Etape 1
Partie 3/3
Etape 2

Etape 3
Cette journée m’a beaucoup plu. Plus tard, j’aimerais devenir acteur, car c’est un métier passionnant.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  

Question 3 : Pourquoi le narrateur aimerait-il devenir acteur ?

Etape 1
Partie 3/3

Etape 2

Etape 3
Cette journée m’a beaucoup plu. Plus tard, j’aimerais devenir acteur, car c’est un métier passionnant.
La question est « Pourquoi ? ». Je cherche une cause dans le texte. La réponse est : car c’est un métier passionnant.


Etape 1
Partie 3/3

Etape 2

Etape 3
Cette journée m’a beaucoup plu. Plus tard, j’aimerais devenir acteur, car c’est un métier passionnant.
Question 3 : Pourquoi le narrateur aimerait-il devenir acteur ?
Prenez vos livrets à la page 63.
Lisez le texte à votre voisin puis changez les rôles.
Notez les devoirs à faire à la maison. Vous aller relire le texte de la page 63 et répondre aux questions.

La séance d’aujourd’hui est terminée. À bientôt.

En cas d’indisponibilité du livret : chaque élève lit le texte à son voisin. ',NULL,'','2026-02-26 10:46:06.146953','2026-02-26 10:46:06.146979',1);
INSERT INTO "raida_lesson" VALUES(81,'FR N5 P3 SEM1 S5','français','5','3','1','5','FR_N5_P3_SEM1_S5.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 4

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 5
Oral –  Prise de parole
Ecriture – Texte 
Écrire un texte.
1.  Prise de parole
Prendre la parole pour parler des métiers.
Plan de la séance 5
Bonjour les enfants !  La leçon de français commence maintenant.
Aujourd’hui, nous allons apprendre à parler des métiers. 
Lecture de la vidéo. 
Maintenant, on va prendre la parole pour parler des lieux qu’on a visités et des métiers qu’on a vus. On va le faire en 3 étapes. Soyez attentifs. 

Etape 1

Etape 2

Etape 3
Etape 1. Je vais vous expliquer la situation. 

Etape 1

Etape 2

Etape 3
Situation : Parle des lieux que tu as visités et des métiers que tu as vus.

La semaine dernière, nous avons visité ______ [lieu].
Il y avait _____________[métier].
Les ______________ [métier] ___________________[action].
Nous avons aussi visité ___________________ [lieu].
Il y avait _____________[métier].
Les ______________ [métier] ___________________[action].
Etape 2.  Chacun réfléchit silencieusement à ce qu’il va dire dans sa prise de parole.

Etape 1

Etape 2

Etape 3
Situation : Parle des lieux que tu as visités et des métiers que tu as vus.

La semaine dernière, nous avons visité ______ [lieu].
Il y avait _____________[métier].
Les ______________ [métier] ___________________[action].
Nous avons aussi visité  ___________________ [lieu].
Il y avait _____________[métier].
Les ______________ [métier] ___________________[action].
Etape 3. C’est à vous de prendre la parole maintenant. Qui veut passer au tableau ? 

Etape 1

Etape 2

Etape 3
Situation : Parle des lieux que tu as visités et des métiers que tu as vus.

La semaine dernière, nous avons visité ______ [lieu].
Il y avait _____________[métier].
Les ______________ [métier] ___________________[action].
Nous avons aussi visité ___________________ [lieu].
Il y avait _____________[métier].
Les ______________ [métier] ___________________[action].
Maintenant, tout le monde participe. Chacun parle des lieux qu’il a visités et des métiers qu’il a vus.
Prendre la parole pour parler des métiers.
2.  Écriture 
Écrire un texte.
Plan de la séance  5 
Lisez et observez ce texte silencieusement. Après, on va faire une dictée. 
Hier, notre classe a visité un studio de créateurs de vidéos. Les créateurs réalisaient des jeux. Nous avons aussi visité le grand théâtre de Rabat. Les acteurs répétaient leurs textes. 
Prenez vos cahiers. Tenez-vous prêts. La dictée va commencer.
Dictée en cours. Première lecture.
Dictée en cours. Deuxième lecture. 
Je vais relire le texte de la dictée. Écoutez bien . 

Corrigez. 
Hier, notre classe a visité un studio de créateurs de vidéos. Les créateurs réalisaient des jeux. Nous avons aussi visité le grand théâtre de Rabat. Les acteurs répétaient leurs textes. 
Qui veut expliquer ce paragraphe dans sa langue ? 
Hier, notre classe a visité un studio de créateurs de vidéos. Les créateurs réalisaient des jeux. Nous avons aussi visité le grand théâtre de Rabat. Les acteurs répétaient leurs textes. 
Maintenant, on va apprendre à écrire un paragraphe semblable.
Je commence par me poser une question :  Qu’est-ce que la classe a visité hier ?Qui veut me donner des propositions ? Levez la main. 
Qu’est-ce que la classe a visité hier ?
Il y a plusieurs réponses possibles. Une réponse peut être : un studio de créateurs des vidéos. Mais je peux dire aussi : le grand théâtre de Rabat.
Hier, notre classe a visité un studio de créateurs des vidéos.
Après je pose une autre question : Que  faisaient les créateurs dans le studio ? Qui veut me donner des propositions ? Levez la main. 
Que faisaient les créateurs dans le studio ?
Il y a plusieurs réponses possibles. Une réponse peut être : Les créateurs  de vidéos réalisaient des jeux. Mais je peux dire aussi : ils programment des jeux vidéo . 
Hier, notre classe a visité un studio de créateurs de vidéos. Les créateurs de vidéos réalisaient des jeux.
Ensuite, je me pose une autre question : « Qu’est-ce que nous avons aussi visité ? » Levez la main. 
Qu’est-ce que nous avons aussi visité ?
Hier, notre classe a visité un studio de créateurs de vidéos. Les créateurs de vidéos réalisaient des jeux. Nous avons aussi visité le grand théâtre de Rabat.
Il y a plusieurs réponses possibles. Une réponse peut être : Nous avons aussi visité le grand théâtre de Rabat. Mais je peux dire aussi : Nous avons aussi visité un musée. 
Après, je me pose une autre question : « Que faisaient les acteurs ? » Levez la main.  
Que faisaient les acteurs ?
Une réponse peut être : les acteurs répétaient leurs textes. Mais je peux dire aussi: les acteurs présentaient un spectacle.
Hier, notre classe a visité un studio de créateurs de vidéos. Les créateurs de vidéos réalisaient des jeux. Nous avons aussi visité le grand théâtre de Rabat. Les acteurs répétaient leurs textes.
Maintenant, je peux écrire mon paragraphe complet.
Hier, notre classe a visité un studio de créateurs de vidéos. Les créateurs de vidéos réalisaient des jeux. Nous avons aussi visité le grand théâtre de Rabat. Les acteurs répétaient leurs textes.
Retenez bien. Pour écrire le paragraphe, je me suis posé les questions suivantes : 
Qu’est-ce que la classe a visité hier ?
Que faisaient les créateurs de vidéos ?
Qu’est-ce que nous avons aussi visité ?
Que faisaient les acteurs ?
Prenez vos cahiers. Vous allez écrire un paragraphe en vous posant les mêmes questions.  Je vais circuler entre les rangs pour vous aider. 
Qu’est-ce que la classe a visité hier ?
Que faisaient les créateurs de vidéos ?
Qu’est-ce que nous avons aussi visité ?
Que faisaient les acteurs ?
Qui veut lire son paragraphe ? 
Notez les devoirs à faire à la maison. Vous allez, écrire un autre paragraphe sur votre cahier.

La séance d’aujourd’hui est terminée. À bientôt.',NULL,'','2026-02-26 10:46:06.381739','2026-02-26 10:46:06.381769',1);
INSERT INTO "raida_lesson" VALUES(82,'FR N5 P3 SEM1 S6','français','5','3','1','6','FR_N5_P3_SEM1_S6.pptx','......','
Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  (fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Organisation de la semaine
Révision 
Lecture offerte
Séance 6
Vocabulaire.
Lire un texte.
Écrire un paragraphe.
Répondre à des questions en rafales. 
Histoire : Les rêves de Meriem.
1. Révision
Plan de la séance 6
(ة)خاص بالأستاذ 

Au terme de cette séance de révision, l’enseignant doit vérifier qu’au moins 80% des élèves sont capables de : 
Reconnaitre les mots de vocabulaire.
Lire et comprendre un texte.
Ecrire un paragraphe.
Répondre spontanément à des questions sur le contenu de la semaine. 
* Si ce taux n’est pas atteint, il convient de mettre en place des actions de remédiation, collectives ou individuelles. 
Bonjour les enfants. Aujourd’hui, nous allons réviser les leçons de la semaine qui s’achève. Soyez attentifs.
Répétons ensemble : Le spectacle – Le musicien – Le théâtre  – Un acteur – La danseuse – Le sculpteur.
Le spectacle 
Le sculpteur 
Le musicien  
Un acteur  

La danseuse
Le théâtre  
Répétons ensemble : Le peintre -  L''écrivain  - Le créateur de vidéos  - Un studio -  Le chanteur - Les spectateurs.
Le peintre 
   Les spectateurs
L''écrivain 
Un studio
Le chanteur 
Le créateur de vidéos  
Nous allons jouer au jeu des mots invisibles. 
Jeu des mots invisibles. 
Observez bien les images. Je vais masquer deux images. 
Le spectacle 
Le sculpteur 
Le musicien  
Un acteur  

La danseuse
Le théâtre  
Quelles sont les images qui manquent ? 
?
?
Les deux images qui manquent sont : le musicien et un acteur. 
Nous allons jouer au jeu des mots qui bougent. 
Jeu des mots qui bougent 
Observez bien. Je vais faire bouger deux images. 
Quelles sont les deux images qui ont bougé ? 
Les deux images  qui ont bougé sont : le spectacle et le sculpteur. 
Maintenant, nous allons faire de la lecture. Qui veut lire ce paragraphe ? 
Notre classe a visité un studio de jeux vidéo puis le grand théâtre de Rabat. Les créateurs travaillaient sur des ordinateurs et réalisaient des jeux. Les acteurs répétaient leurs rôles et les techniciens réglaient les lumières. 
Qui veut expliquer ce paragraphe dans sa langue ? 
Notre classe a visité un studio de jeux vidéo puis le grand théâtre de Rabat. Les créateurs travaillaient sur des ordinateurs et réalisaient des jeux. Les acteurs répétaient leurs rôles et les techniciens réglaient les lumières. 
Qui veut lire la question et y répondre ? 
Qu’est-ce que la classe a visité lors de la sortie ?
Notre classe a visité un studio de jeux vidéo puis le grand théâtre de Rabat. Les créateurs travaillaient sur des ordinateurs et réalisaient des jeux. Les acteurs répétaient leurs rôles et les techniciens réglaient les lumières. 
La classe a visité un studio de jeux vidéo puis le grand théâtre de Rabat. 
Qu’est-ce que la classe a visité lors de la sortie ?
Notre classe a visité un studio de jeux vidéo puis le grand théâtre de Rabat. Les créateurs travaillaient sur des ordinateurs et réalisaient des jeux. Les acteurs répétaient leurs rôles et les techniciens réglaient les lumières. 
Qui veut lire la question et y répondre ? 
Où travaillaient les créateurs ?
Notre classe a visité un studio de jeux vidéo puis le grand théâtre de Rabat. Les créateurs travaillaient sur des ordinateurs et réalisaient des jeux. Les acteurs répétaient leurs rôles et les techniciens réglaient les lumières. 
Les créateurs travaillaient sur des ordinateurs et réalisaient des jeux. 
Où travaillaient les créateurs ?
Notre classe a visité un studio de jeux vidéo puis le grand théâtre de Rabat. Les créateurs travaillaient sur des ordinateurs et réalisaient des jeux. Les acteurs répétaient leurs rôles et les techniciens réglaient les lumières. 
Qui veut lire la question et y répondre ? 
Que  faisaient les techniciens ?
Notre classe a visité un studio de jeux vidéo puis le grand théâtre de Rabat. Les créateurs travaillaient sur des ordinateurs et réalisaient des jeux. Les acteurs répétaient leurs rôles et les techniciens réglaient les lumières. 
Les techniciens réglaient les lumières.
Notre classe a visité un studio de jeux vidéo puis le grand théâtre de Rabat. Les créateurs travaillaient sur des ordinateurs et réalisaient des jeux. Les acteurs répétaient leurs rôles et les techniciens réglaient les lumières. 
Que  faisaient les techniciens ?
Prenez vos cahiers. Vous allez écrire un paragraphe en vous posant les questions suivantes.  Je vais circuler entre les rangs pour vous aider. 
Qu’est-ce que la classe a visité hier ?
Que faisaient ________________[métier] ?
Qu’est-ce que nous avons aussi visité ?
Que faisaient ________________[métier] ?

Qui veut lire son paragraphe ?
Maintenant, c’est l’activité des questions en rafales. Je vais désigner des élèves au hasard pour répondre. Tenez-vous prêts. 
?
?
?

Comment ça va ? 
Comment ça va ? 
?

Qu’est-ce que vous avez fait la semaine dernière ?
Qu’est-ce que vous avez fait la semaine dernière ?
?

Qu’est-ce que vous avez fait hier ?
Qu’est-ce que vous avez fait hier? 
?

Que faisaient les créateurs de vidéos ?
Que faisaient les créateurs de vidéos ?
?
Que faisaient les acteurs ?
Que faisaient les acteurs ?
?
Que faisaient les techniciens ?
Que faisaient les techniciens ?
?
Que faisait le metteur en scène ?
Que faisait le metteur en scène ?
?
Vocabulaire.
Lire un texte.
Écrire un paragraphe.
Répondre à des questions en rafales. 
Histoire  de « Les rêves de Meriem » .
2. Lecture offerte
Plan de la séance 6
Aujourd''hui, nous allons découvrir une nouvelle histoire « les rêves de Meriem ». Est-ce que vous êtes prêts ?
Maintenant,  nous allons regarder le premier épisode de l’histoire « Les rêves de Meriem ». Soyez attentifs. Ecoutez bien.
Lecture de la vidéo.
Nous allons écouter l’histoire une deuxième fois. Soyez attentifs.
Lecture de la vidéo.
Qu’est-ce que Meriem va passer cette année ?
Elle va passer le baccalauréat.
Elle va passer le baccalauréat.
De quoi rêve-t-elle ?  
Elle rêve de plusieurs métiers.
Elle rêve de plusieurs métiers.
Est-ce qu’elle a choisi le métier qu’elle aimerait faire ?  
Non, elle n’a pas encore décidé lequel choisir.
Non, elle n’a pas encore décidé lequel choisir.
Où Meriem est-elle partie la semaine dernière avec la classe ?  
La semaine dernière, elle est partie voir un studio de créateurs de jeux vidéo.
La semaine dernière, elle est partie voir un studio de créateurs de jeux vidéo.
Est-ce que Meriem aimerait devenir créatrice de jeux vidéo ?  Pourquoi ? 
Elle n’aimerait pas devenir créatrice de jeux vidéo car elle veut être pilote d’avion. 
Elle n’aimerait pas devenir créatrice de jeux vidéo car elle veut être pilote d’avion. 
On va retrouver Meriem la semaine prochaine pour un nouvel épisode. 
À  la maison, écrivez trois phrases que vous avez retenues de cette histoire. 
La séance d’aujourd’hui est terminée. À bientôt.  ',NULL,'','2026-02-26 10:46:06.860455','2026-02-26 10:46:06.860482',1);
INSERT INTO "raida_lesson" VALUES(83,'FR N5 P3 SEM2 S1','français','5','3','2','1','FR_N5_P3_SEM2_S1.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Oral – Dialogue
Lecture – texte  (fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 


Séance 1

Présentation du vocabulaire 
Exploitation du vocabulaire
Activités de vocabulaire sur livret
Organisation de la semaine
Description de la scène.
Travail sur livret.
Plan de la séance
1.  Présentation du vocabulaire
Le train – Le port – Le conducteur de train – L’aéroport – Les moyens de transport - Les passagers 
 Le mécanicien – Le chauffeur – L’hôtesse de l’air – Le capitaine – Le pilote d’avion – L’avion
Bonjour les enfants ! La leçon de français commence maintenant. Soyez attentifs.
Lecture de la vidéo.
Il y a des noms masculins et des noms féminins. « Train » est un nom masculin. « Hôtesse de l’air » est un nom féminin. 
Le train
Une hôtesse de l’air 
Lecture de la vidéo.
Qui veut répéter ?
Le train
Lecture de la vidéo.
Qui veut répéter ?
Le port
Lecture de la vidéo.
Qui veut répéter ?
Le conducteur 
de train
Lecture de la vidéo.
Qui veut répéter ?
L’aéroport
Lecture de la vidéo.
Qui veut répéter ?
Les moyens de transport
Lecture de la vidéo.
Qui veut répéter ?
Les passagers
Lecture de la vidéo.
Répétons ensemble : Le train – Le port – Le conducteur de train – L’aéroport – Les moyens de transport – Les passagers.
Le train
Le port
Le conducteur de train
L’aéroport
Les moyens de transport
Les passagers
Maintenant, on va apprendre d’autres mots avec Majd.
Lecture de la vidéo.
Qui veut répéter ?
Le mécanicien
Le mécanicien répare la voiture.
Le mécanicien répare 
la voiture.
 
Lecture de la vidéo.
Qui veut répéter ?
 Le chauffeur
 
Lecture de la vidéo.
Qui veut répéter ?
L’hôtesse de l’air
Lecture de la vidéo.
Le capitaine 
Qui veut répéter ?
Le capitaine 
 
Lecture de la vidéo.
Qui veut répéter ?
Le pilote d’avion 
 
Lecture de la vidéo.
Qui veut répéter ?
 L’avion
L’hôtesse de l’air est dans l’avion.
L’hôtesse de l’air est dans l’avion.
Lecture de la vidéo.
Répétons ensemble : Le mécanicien – Le chauffeur – L’hôtesse de l’air – Le capitaine - Le pilote d’avion – L’avion
Le mécanicien
Le chauffeur
L’hôtesse de l’air
Le capitaine
Le pilote d’avion
 L’avion
Prenez vos ardoises.
Écrivez le numéro du mot « train ».
Écrivez le numéro du mot « port ».
Écrivez le numéro du mot « conducteur ».
Écrivez le numéro du mot « aéroport ».
Rangez vos ardoises. 
Qui veut nommer l’image ? Levez la main.  
Qui veut nommer l’image ? Levez la main.  
Qui veut nommer l’image ? Levez la main.  
Maintenant, on va faire un jeu. Qu’est-ce qu’on dit : Un train ou Une train ? Levez la main.  
Un / Une            train 
On dit un train 
Un train  
Qu’est-ce qu’on dit : Un hôtesse de l’air ou une hôtesse de l’air ?  Levez la main.  
Un / Une         hôtesse de l’air
On dit une hôtesse de l’air
Une hôtesse de l’air
Activités  sur livret
Plan de la séance
2.  Exploitation du vocabulaire
Description de la scène. 
Le train – Le port – Le conducteur de train – L’aéroport – Les moyens de transport - Les passagers 
 Le mécanicien – Le chauffeur – L’hôtesse de l’air – Le capitaine – Le pilote d’avion – L’avion
Observez cette scène pendant 30 secondes. Il y a des images déjà vues aujourd’hui. 
Majd va nous montrer comment décrire l’image. Soyez attentifs.
Lecture de la vidéo.
Lecture de la vidéo.
Soyez attentifs. Majd va décrire la scène une deuxième fois. 
Lecture de la vidéo.
Maintenant, je vais vous poser des questions.
Qu’est-ce que c’est ?

Qu’est-ce que c’est ?
Qui est-ce ?
Qu’est-ce qu’il fait ?
Qui est-ce ?
Qu’est-ce qu’elle fait ?
Maintenant, c’est à vous. Qui veut passer au tableau pour décrire la scène ?
Description de la scène. 
Plan de la séance
3.  Activités de vocabulaire  sur livret
Activités sur livret
Le train – Le port – Le conducteur de train – L’aéroport – Les moyens de transport - Les passagers 
 Le mécanicien – Le chauffeur – L’hôtesse de l’air – Le capitaine – Le pilote d’avion – L’avion
Ouvrez le livret à la page 65. Vous allez faire ces activités avec votre camarade. 

À tour de rôle : l’un montre une image, l’autre dit le mot. Je passe entre les rangs pour vous aider.

Je montre l’image

1

Je dis le mot

2

La séance d’aujourd’hui est terminée. À demain.',NULL,'','2026-02-26 10:46:07.245190','2026-02-26 10:46:07.245218',1);
INSERT INTO "raida_lesson" VALUES(84,'FR N5 P3 SEM2 S2','français','5','3','2','2','FR_N5_P3_SEM2_S2.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe
Pictogrammes
Contenu de la semaine 

Séance 6

Séance 3

Séance 5

Séance 4

Séance 1
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Révision
Lecture offerte
Présentation du vocabulaire 
Exploitation du vocabulaire
Travail sur livret
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral –  Prise de parole
Ecriture – Texte  

Oral – Dialogue
Lecture - Lettre a - A
Ecriture - Lettre a - A

Séance 2

Oral – Acte de parole 1
Ecriture – Point de langue 1
Lecture – Mots avec difficultés 
Organisation de la semaine
1.  Acte de parole
Poser la question : « Comment ça va ? » 
Plan de la séance 2


Conjugaison : Le verbe prendre au passé composé. 
Mots avec difficultés :  Mots avec  « eu » et « œu ».
Poser la question : Connais-tu la personne qui conduit ____________ ?
Répondre à la question : Connais-tu la personne qui conduit _______ ?
Bonjour les enfants ! La leçon de français commence maintenant. Soyez attentifs.
Avant de commencer, nous allons corriger les activités de vocabulaire.

Corrigez sur votre livret. 
Le conducteur de train 
L’hôtesse de l’air 
Les passagers
Le pilote de l’avion 
L’avion 
Le port 
Le mécanicien 
Le capitaine 
Les transports en commun  
L’aéroport 
Le train  
Le chauffeur   
Répétons ensemble les mots en français. 
Le conducteur de train 
L’hôtesse de l’air 
Les passagers
Le pilote de l’avion 
L’avion 
Le port 
Le mécanicien 
Le capitaine 
Les transports en commun  
L’aéroport 
Le train  
Le chauffeur   
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. Soyez attentifs. 
Lecture de la vidéo.

Maintenant, on va poser la question comme Majd et Nada. Répétons ensemble. 

Connais-tu la personne qui conduit un bateau ?
Connais-tu la personne qui conduit un train ?
Maintenant, nous allons apprendre à répondre aux questions : « Connais-tu la personne qui conduit un bateau ? » « Connais-tu la personne qui conduit un train ? ».
Lecture de la vidéo.

Maintenant, on va répondre aux questions comme Majd et Nada. Répétons ensemble. 
Oui, c’est  le capitaine qui conduit un bateau.
Oui, c’est  le chauffeur de train qui conduit un train. 

Voici d’autres exemples : 
Oui, c’est  le pilote qui conduit un avion.
Oui, c’est  le mécanicien  qui répare  la voiture. 



Connais-tu la personne qui conduit _________? 
Qui veut passer au tableau pour jouer la scène ? 
Oui, c’est ______ qui conduit _________ .



Connais-tu la personne qui conduit _________? 
Qui veut passer au tableau pour jouer la scène ? 
Oui, c’est ______ qui conduit _________ .



Connais-tu la personne qui conduit _________? 
Qui veut passer au tableau pour jouer la scène ? 
Oui c’est ______ qui conduit _________ .



Connais-tu la personne qui conduit _________? 
Qui veut passer au tableau pour jouer la scène ? 
Oui c’est ______ qui conduit _________ .
Chacun joue le dialogue avec son voisin. 
Connais-tu la personne qui conduit _________? 
Oui c’est ______ qui conduit _________ .
Poser la question : Connais-tu la personne qui conduit ____________ ?
Répondre à la question : Connais-tu la personne qui conduit _______ ?
Mots avec difficultés : Mots avec « eu » et « œu ».
Plan de la séance 2
Conjugaison : Le verbe prendre au passé composé. 
2.  Écrit : Point de langue
Le verbe prendre
au passé composé
Nous allons apprendre à conjuguer le verbe prendre au passé composé.
Lecture de la vidéo.
Répétons ensemble. 
Prenez vos ardoises.
Sur vos ardoises, complétez la phrase avec le verbe « prendre » au passé composé.
Tu ____________ ton vélo.

Levez les ardoises. 
Corrigez. 
Tu as pris ton vélo.
Nous  ______________ notre voiture.
Compétez la phrase avec le verbe « prendre »  au passé composé.
Levez les ardoises. 
Corrigez.
Nous  avons pris notre voiture.
Elle ______________ le train.
Compétez la phrase avec le verbe « prendre »  au passé composé.
Levez les ardoises. 
Corrigez.
Elle  a pris le train.

Rangez vos ardoises. 

Prenez vos livrets à la page 69.
Vous allez faire l’activité 1.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. Faites attention à l’orthographe. 
as pris
a pris
avons pris
ont pris
avez pris
ai pris
Poser la question : Connais-tu la personne qui conduit ____________ ?
Répondre à la question : Connais-tu la personne qui conduit _______ ?
Plan de la séance 2
Conjugaison : Le verbe prendre au passé composé. 
Mots avec difficultés : Mots avec « eu » et « œu ».
3.  Lecture
Maintenant, nous allons faire de la lecture.
Nous allons lire des mots avec le son « eu ». Soyez attentifs.
eu     œu            
Lecture de la vidéo 
Lisez en silence.
conducteur      chauffeur       dangereux
Sœur        cœur        
Qui veut lire à voix haute ?
conducteur      chauffeur       dangereux
Sœur        cœur        
Lisez ces phrases silencieusement. Après je vais diffuser une lecture audio. 
Le conducteur de bus transporte les passagers.
Le pilote vole très haut dans le ciel.
Le chauffeur voyage très loin.
Ma sœur a pris le train.
Lecture audio. 
Le conducteur de bus transporte les passagers.
Le pilote vole très haut dans le ciel.
Le chauffeur voyage très loin.
Ma sœur a pris le train.
Qui veut lire à voix haute ?
Le conducteur de bus transporte les passagers.
Le pilote vole très haut dans le ciel.
Le chauffeur voyage très loin.
Ma sœur a pris le train.
Prenez vos livrets à la page 67.

Lisez les mots et les phrases à votre voisin. Je vais passer entre les rangs pour vous aider. 

Notez les devoirs à faire à la maison. À la maison, relisez les mots et les phrases de la page 67. Vous allez aussi faire l’activité 1 de la page 69. 


La séance d’aujourd’hui est terminée. À bientôt ! ',NULL,'','2026-02-26 10:46:07.540991','2026-02-26 10:46:07.541049',1);
INSERT INTO "raida_lesson" VALUES(85,'FR N5 P3 SEM2 S3','français','5','3','2','3','FR_N5_P3_SEM2_S3.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2

Séance 4
Oral – Dialogue
Lecture – Texte  ( fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Séance 3
Organisation de la semaine
Exprimer la négation avec « Ne    jamais ». 
Lecture de phrases.
1.  Acte de parole
Poser la question : As-tu déjà voyagé en _______ ?
Répondre à la question : As-tu déjà voyagé en _______ ?
Plan de la séance 3
Bonjour les enfants !  La leçon de français commence maintenant. Soyez attentifs.
Aujourd’hui, nous allons apprendre à poser une question avec Majd et Nada. Soyez attentifs. 
Lecture de la vidéo. 

Maintenant, nous allons apprendre à poser les questions comme Majd et Nada. Répétons ensemble. 

As-tu déjà voyagé en bateau  ?
As-tu déjà voyagé en avion ?

Maintenant, nous allons apprendre à répondre aux questions : « As-tu déjà voyagé en bateau ? » « As-tu déjà voyagé en avion ? ».
Maintenant, nous allons apprendre à répondre comme Majd et Nada. Répétons ensemble. 



Maintenant, nous allons apprendre à répondre comme Majd et Nada. Répétons ensemble. 
Non, je n’ai jamais pris de bateau.
Non, je n’ai jamais pris d’avion.

Voici d’autres exemples :
Oui, j’ai déjà pris de bus.
Non, je n’ai jamais pris de train.

Qui veut passer au tableau pour jouer la scène ?  


As-tu déjà voyagé en _______ ?
________________ . 

Qui veut passer au tableau pour jouer la scène ?  


As-tu déjà voyagé en _______ ?
________________ . 

Qui veut passer au tableau pour jouer la scène ?  


As-tu déjà voyagé en _______ ?
________________ . 

Qui veut passer au tableau pour jouer la scène ?  


As-tu déjà voyagé en _______ ?
________________ . 
Chacun joue le dialogue avec son voisin. 
_________________ . 
As-tu déjà voyagé en _______ ?
Poser la question : As-tu déjà voyagé en _______ ?
Répondre à la question : As-tu déjà voyagé en _______ ?
Lecture de phrases.
2.  Ecrit : Point de langue 
Point de langue : Ne    jamais.
Plan de la séance 3
ne         jamais 
Maintenant, nous allons apprendre à  exprimer la négation avec l’expression « ne jamais ».
Lecture de la vidéo.
Répétons ensemble. 
Prenez vos cahiers.
Sur vos cahiers, transformez la phrase en utilisant « ne…..jamais ».

Les enfants ont pris l’avion. 
Qui veut lire sa phrase ?
Corrigez. 
Les enfants n’ont jamais pris l’avion. 
Sur vos cahiers, transformez la phrase en utilisant « ne…..jamais ».

Mon frère a pris le taxi. 
Qui veut lire sa phrase ?
Corrigez. 
Mon frère n’a jamais pris le taxi. 
Sur vos cahiers, transformez la phrase en utilisant  « ne…..jamais ».

Elle a pris le bus.
Qui veut lire sa phrase ?
Corrigez. 
Elle n’a jamais pris le bus.
Prenez vos livrets à la page 69.

Vous allez faire l’activité 2.  Je vais expliquer la consigne et passer entre les rangs pour vous aider. 
Corrigez. 
Les enfants n’ont jamais pris le bus.
Ma sœur n’a jamais pris le train.
Ils  n’ont jamais pris le bateau.
Point de langue : Ne     jamais.
Poser la question : As-tu déjà voyagé en _______ ?
Répondre à la question : As-tu déjà voyagé en _______ ?
3.  Lecture
Lecture de phrases.
Plan de la séance 3
Maintenant, nous allons faire de la lecture.
Observez cette image et lisez la question. Je vais vous proposer des réponses. 
Qui conduit le bateau ?
Prenez vos ardoises.
Ecrivez le numéro de la bonne réponse sur votre ardoise (1, 2, 3 ou 4).  
Levez vos ardoises.
La bonne réponse est : « 2, C’est le capitaine qui conduit le bateau. » Qui veut lire et expliquer la réponse ? 
X
Prenez vos livrets à la page 67.   Avec votre voisin, vous allez lire et répondre aux questions de l’activité 4. Je vais circuler entre les rangs pour vous aider. 

La bonne est réponse est : «  Jalal n’a jamais pris l’avion pour voyager.»  Qui veut lire et expliquer la réponse ? 
X
Notez les devoirs à faire à la maison. Vous allez lire et recopier le dialogue de la page 67. 

La séance d’aujourd’hui est terminée. A bientôt.  ',NULL,'','2026-02-26 10:46:07.837822','2026-02-26 10:46:07.837850',1);
INSERT INTO "raida_lesson" VALUES(86,'FR N5 P3 SEM2 S4','français','5','3','2','4','FR_N5_P3_SEM2_S4.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 5

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 4
Texte : Fluidité et compréhension.
1.  Dialogue 
Jouer un dialogue en reprenant les actes de parole enseignés.
Plan de la séance 4
Bonjour les enfants !  La leçon de français commence maintenant. 
Aujourd’hui, nous allons apprendre un dialogue avec Majd et Nada. 
Lecture de la vidéo.
Nous allons écouter le dialogue une deuxième fois.
Lecture de la vidéo.
Maintenant, on va répéter le dialogue ensemble. Je vais lire chaque réplique et vous allez répéter après moi. Puis, on va continuer à répéter le dialogue.
On va continuer la répétition du dialogue. Je vais lire chaque réplique et vous allez répéter après moi. 

On va continuer la répétition du dialogue. Je vais lire chaque réplique et vous allez répéter après moi. 
Maintenant, on va jouer ce dialogue. On va le faire en 3 étapes. Soyez attentifs. 


Etape 1

Etape 2

Etape 3
Etape 1. Je vais vous expliquer la situation.  
Situation : Le garçon et la fille se rencontrent à l’aéroport. Chacun pose à l’autre les questions suivantes: 


Etape 1

Etape 2

Etape 3
Qu’est-ce que vous avez fait la semaine dernière ?
Que faisaient les ___________________ ?
Connais-tu la personne qui conduit ________ ? 
As-tu déjà voyagé en _________?
Etape 2.  Chacun réfléchit silencieusement à ce qu’il va dire dans le dialogue.

Etape 1

Etape 2

Etape 3

Situation : Le garçon et la fille se rencontrent à l’aéroport. Chacun pose à l’autre les questions suivantes: 
Qu’est-ce que vous avez fait la semaine dernière ?
Que faisaient les ___________________ ?
Connais-tu la personne qui conduit ________ ? 
As-tu déjà voyagé en _________?
Etape 3.  Maintenant, vous allez jouer le dialogue. Qui veut passer au tableau ? 

Etape 1

Etape 2

Etape 3
Situation : Le garçon et la fille se rencontrent à l’aéroport. Chacun pose à l’autre les questions suivantes: 
Qu’est-ce que vous avez fait la semaine dernière ?
Que faisaient les ___________________ ?
Connais-tu la personne qui conduit ________ ? 
As-tu déjà voyagé en _________?
Maintenant, tout le monde participe. Jouez le dialogue avec votre voisin.
Qu’est-ce que vous avez fait la semaine dernière ?
Que faisaient les ___________________ ?
Connais-tu la personne qui conduit ________ ? 
As-tu déjà voyagé en _________?
Jouer un dialogue reprenant les actes de parole enseignés.
2.  Lecture
Texte : Fluidité et compréhension.
Plan de la séance 4 
Maintenant, on va faire de la lecture. On va lire des mots, puis un texte. 
On va lire ensemble ce texte du livret. On va le découper en 3 parties. Après, vous allez le lire tout seuls. 

Lisez la première partie du texte silencieusement. Après, je vais diffuser une lecture audio. 


Partie 1
Partie 2

Partie 3
Les métiers du transport

Hier, notre maîtresse nous a présenté une leçon sur les métiers du transport. Elle a montré des images de bus, de trains, d’avions et de bateaux. 
Lecture en cours. 


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?


Partie 1
Partie 2

Partie 3
Les métiers du transport

Hier, notre maîtresse nous a présenté une leçon sur les métiers du transport. Elle a montré des images de bus, de trains, d’avions et de bateaux. 
Partie 1


Partie 1
Partie 2

Partie 3
On passe à la deuxième partie.  Lisez en silence. 
Le conducteur de bus transporte les passagers en ville, le pilote vole dans le ciel, le conducteur de train voyage très loin et le marin navigue sur la mer. Le mécanicien répare les véhicules en panne.
Lecture en cours. 
Partie 1


Partie 1
Partie 2

Partie 3
Qui veut lire le texte ?
Partie 1


Partie 1
Partie 2

Partie 3
Le conducteur de bus transporte les passagers en ville, le pilote vole dans le ciel, le conducteur de train voyage très loin et le marin navigue sur la mer. Le mécanicien répare les véhicules en panne.
On passe à la troisième partie.  Lisez en silence. 

Partie 1


Partie 2

Partie 3
Partie 1
Les élèves ont réagi avec intérêt : Yassine pense que le métier de pilote est dangereux.
Amira préfère être conductrice de bus. Certains trouvent ces métiers fatigants, d’autres les trouvent passionnants. Tous les métiers sont importants.
Lecture en cours. 


Partie 2

Partie 3
Partie 1
Qui veut lire le texte ?

Partie 1


Partie 2

Partie 3
Partie 1
Les élèves ont réagi avec intérêt : Yassine pense que le métier de pilote est dangereux.
Amira préfère être conductrice de bus. Certains trouvent ces métiers fatigants, d’autres les trouvent passionnants. Tous les métiers sont importants.
Maintenant, on va essayer de comprendre le texte, partie par partie. Pour chaque partie du texte, on va suivre les mêmes étapes. 

Etape 1
Je lis en silence et j’essaie de comprendre le texte.

Etape 2
Je repère les mots difficiles et je demande à mon enseignant(e) de me les expliquer

Etape 3
Je lis la question, puis je cherche la réponse dans le texte. 

Lisez silencieusement le texte et essayez de le comprendre. 
Etape 1
Partie 1/3

Etape 2

Etape 3
Les métiers du transport

Hier, notre maîtresse nous a présenté une leçon sur les métiers du transport. Elle a montré des images de bus, de trains, d’avions et de bateaux. 

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 1/3
Etape 2

Etape 3
Les métiers du transport

Hier, notre maîtresse nous a présenté une leçon sur les métiers du transport. Elle a montré des images de bus, de trains, d’avions et de bateaux. 
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  

Etape 1
Partie 1/3

Etape 2

Etape 3
Question 1: Qu’est-ce que la maîtresse a montré aux élèves ??
Les métiers du transport
Hier, notre maîtresse nous a présenté une leçon sur les métiers du transport. Elle a montré des images de bus, de trains, d’avions et de bateaux. 
La question est : «qu’est-ce que ? ». Je cherche un objet dans le texte. La réponse est : Elle a montré des images de bus, de trains, d’avions et de bateaux. 

Etape 1
Partie 1/3

Etape 2

Etape 3
Question 1: Qu’est-ce que la maîtresse a montré aux élèves ?
Les métiers du transport
Hier, notre maîtresse nous a présenté une leçon sur les métiers du transport. Elle a montré des images de bus, de trains, d’avions et de bateaux. 

On passe à la deuxième partie du texte. Lisez en silence et essayez de comprendre. 
Etape 1
Partie 2/3

Etape 2

Etape 3
Le conducteur de bus transporte les passagers en ville, le pilote vole dans le ciel, le conducteur de train voyage très loin et le marin navigue sur la mer. Le mécanicien répare les véhicules en panne.

Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 

Etape 1
Partie 2/3
Etape 2

Etape 3
Le conducteur de bus transporte les passagers en ville, le pilote vole dans le ciel, le conducteur de train voyage très loin et le marin navigue sur la mer. Le mécanicien répare les véhicules en panne.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  
Question 2 : Qui répare les voitures en panne ?

Etape 1
Partie 2/3

Etape 2

Etape 3
Le conducteur de bus transporte les passagers en ville, le pilote vole dans le ciel, le conducteur de train voyage très loin et le marin navigue sur la mer. Le mécanicien répare les véhicules en panne.
La question est «Qui ?». Je cherche une personne qui répare les voitures en panne dans le texte. La réponse est : « Le mécanicien répare les véhicules en panne. »

Etape 1
Partie 2/3

Etape 2

Etape 3
Question 2 : Qui répare les voitures en panne ?
Le conducteur de bus transporte les passagers en ville, le pilote vole dans le ciel, le conducteur de train voyage très loin et le marin navigue sur la mer. Le mécanicien répare les véhicules en panne.
On passe à la troisième partie du texte. Lisez en silence et essayez de comprendre.

 
Etape 1
Partie 3/3

Etape 2

Etape 3
Les élèves ont réagi avec intérêt : Yassine pense que le métier de pilote est dangereux.
Amira préfère être conductrice de bus. Certains trouvent ces métiers fatigants, d’autres les trouvent passionnants. Tous les métiers sont importants.
Quels sont les mots difficiles dans le texte ? Levez la main. Je vais vous expliquer. 



Etape 1
Partie 3/3
Etape 2

Etape 3
Les élèves ont réagi avec intérêt : Yassine pense que le métier de pilote est dangereux.
Amira préfère être conductrice de bus. Certains trouvent ces métiers fatigants, d’autres les trouvent passionnants. Tous les métiers sont importants.
Lisez la question et cherchez la réponse dans le texte. Qui veut répondre ?  

Question 3 : Quel métier préfère Amira ? 

Etape 1
Partie 3/3

Etape 2

Etape 3
Les élèves ont réagi avec intérêt : Yassine pense que le métier de pilote est dangereux.
Amira préfère être conductrice de bus. Certains trouvent ces métiers fatigants, d’autres les trouvent passionnants. Tous les métiers sont importants.
La question est « Quel métier préfère Amira? ». Je cherche le verbe « préférer » et un métier dans le texte.  La réponse est : Amira préfère être conductrice de bus.


Etape 1
Partie 3/3

Etape 2

Etape 3
Question 3 : Quel métier préfère Amira ? 
Les élèves ont réagi avec intérêt : Yassine pense que le métier de pilote est dangereux.
Amira préfère être conductrice de bus. Certains trouvent ces métiers fatigants, d’autres les trouvent passionnants. Tous les métiers sont importants.
Prenez vos livrets à la page 68.
Lisez le texte à votre voisin puis changez les rôles.
Notez les devoirs à faire à la maison. Vous aller relire le texte de la page 68 et répondre aux questions.

La séance d’aujourd’hui est terminée. À bientôt.

En cas d’indisponibilité du livret : chaque élève lit le texte à son voisin. ','{"subject": "fran\u00e7ais", "level": "5", "period": "3", "week": "2", "session": "4", "objective": "Jouer un dialogue en utilisant les actes de parole enseign\u00e9s.", "steps": [{"name": "Oral \u2013 Dialogue", "duration": "20min", "icon": "\ud83d\udde3\ufe0f", "content": "Les \u00e9l\u00e8ves jouent un dialogue entre Majd et Nada en posant des questions sur leurs activit\u00e9s pass\u00e9es. Ils r\u00e9p\u00e8tent chaque r\u00e9plique apr\u00e8s l''enseignant et participent activement en jouant le dialogue avec leurs voisins."}, {"name": "Lecture \u2013 Texte ( fluidit\u00e9 et compr\u00e9hension)", "duration": "25min", "icon": "\ud83d\udcd6", "content": "Les \u00e9l\u00e8ves lisent un texte sur les m\u00e9tiers du transport en trois parties. Ils lisent silencieusement, identifient les mots difficiles, et r\u00e9pondent \u00e0 des questions pour v\u00e9rifier leur compr\u00e9hension du texte."}], "title": "FR N5 P3 SEM2 S4"}','','2026-02-26 10:46:08.181374','2026-02-26 23:11:35.196433',1);
INSERT INTO "raida_lesson" VALUES(87,'FR N5 P3 SEM2 S5','français','5','3','2','5','FR_N5_P3_SEM2_S5.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant  (e) parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 6

Séance 4

Séance 2
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Révision
Lecture offerte
Organisation de la semaine

Séance 3
Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  ( fluidité et compréhension)
Séance 5
Oral –  Prise de parole
Ecriture – Texte 
Écrire un texte.
1.  Prise de parole
Prendre la parole pour parler des moyens de transport et des métiers.
Plan de la séance 5
Bonjour les enfants !  La leçon de français commence maintenant.
Aujourd’hui, nous allons apprendre à parler des métiers et des moyens de transport. 
Lecture de la vidéo. 
Maintenant, on va prendre la parole pour parler des moyens de transport et des métiers qu’on a vus. On va le faire en 3 étapes. Soyez attentifs. 

Etape 1

Etape 2

Etape 3
Etape 1. Je vais vous expliquer la situation. 

Etape 1

Etape 2

Etape 3
Etape 2.  Chacun réfléchit silencieusement à ce qu’il va dire dans sa prise de parole.

Etape 1

Etape 2

Etape 3
Etape 3. C’est à vous de prendre la parole maintenant. Qui veut passer au tableau ? 

Etape 1

Etape 2

Etape 3
Maintenant, tout le monde participe. Chacun parle des lieux qu’il a visités et des métiers qu’il a vus.
Prendre la parole pour parler des moyens de transport et des métiers.
2.  Écriture 
Écrire un texte.
Plan de la séance  5 
Lisez et observez ce texte silencieusement. Après, on va faire une dictée. 
Hier, je suis allé à l’aéroport. Il y avait des pilotes, des hôtesses de l’air et des passagers. C’est le pilote qui conduit un avion. Je n’ai jamais pris d’avion pour voyager. 
Prenez vos cahiers. Tenez-vous prêts. La dictée va commencer.
Dictée en cours. Première lecture.
Dictée en cours. Deuxième lecture. 
Je vais relire le texte de la dictée. Écoutez bien et complétez votre texte. 

Corrigez. 
Hier, je suis allé à l’aéroport. Il y avait des pilotes, des hôtesses de l’air et des passagers. C’est le pilote qui conduit un avion. Je n’ai jamais pris d’avion pour voyager. 
Qui veut expliquer ce paragraphe dans sa langue ? 
Hier, je suis allé à l’aéroport. Il y avait des pilotes, des hôtesses de l’air et des passagers. C’est le pilote qui conduit un avion. Je n’ai jamais pris d’avion pour voyager. 
Maintenant, on va apprendre à écrire un paragraphe semblable.
Je commence par me poser une question :  Où  je suis allé hier ? Qui veut me donner des propositions ? Levez la main. 
Où  je suis allé hier ?
Il y a plusieurs réponses possibles. Une réponse peut être : Hier, je suis allé à l’aéroport. Mais je peux dire aussi : hier, je suis allé à la gare.
Hier, je suis allé à l’aéroport. 
Après je pose une autre question : Qu’est-ce qu’il y avait à l’aéroport ? Qui veut me donner des propositions ? Levez la main. 
Qu’est-ce qu’il y avait  à l’aéroport ?
Il y a plusieurs réponses possibles. Une réponse peut être : Il y avait des passagers, des hôtesses de l’air et des pilotes. Mais je peux dire aussi : Il y avait des mécaniciens.
Hier, je suis allé à l’aéroport. Il y avait des passagers, des hôtesses de l’air et des pilotes. 
Ensuite, je me pose une autre question : « Qui conduit un avion ? » Levez la main. 
Qui conduit un avion?
La réponse est : C’est le pilote qui conduit l’avion. Mais je peux parler d’autres métiers de transport.
Hier, je suis allé à l’aéroport. Il y avait des passagers , des hôtesses de l’air et des pilotes. C’est le pilote qui conduit un avion.
Ensuite, je me pose une autre question : « Est-ce que j’ai déjà pris l’avion pour voyager ? »  Levez la main. 
Est-ce que j’ai déjà pris l’avion pour voyager ?
Deux réponses sont possibles : Je n’ai jamais pris l’avion pour voyager. Ou bien : j’ai déjà pris l’avion pour voyager.
Hier, je suis allé à l’aéroport. Il y avait des passagers, des hôtesses de l’air et des pilotes. C’est le pilote qui conduit un avion. Je n’ai jamais pris l’avion pour voyager.
Maintenant, je peux écrire mon paragraphe complet.
Hier, je suis allé à l’aéroport. Il y avait des passagers, des hôtesses de l’air et des pilotes. C’est le pilote qui conduit un avion. Je n’ai jamais pris l’avion pour voyager.
Retenez bien. Pour écrire le paragraphe, je me suis posé les questions suivantes : 
Où  je suis allé hier ?
Qu’est-ce qu’il y avait à ____________ ?
Qui conduit ____________________ ?
Est-ce que j’ai déjà pris ___________ pour voyager ?

Prenez vos cahiers. Vous allez écrire un paragraphe en vous posant les mêmes questions.  Je vais circuler entre les rangs pour vous aider. 
Où  je suis allé hier ?
Qu’est-ce qu’il y avait à ____________ ?
Qui conduit ____________________ ?
Est-ce que j’ai déjà pris ___________ pour voyager ?

Qui veut lire son paragraphe ? 
Notez les devoirs à faire à la maison, livret page 69. Vous allez, écrire un autre paragraphe sur votre cahier.

La séance d’aujourd’hui est terminée. À bientôt.',NULL,'','2026-02-26 10:46:08.475323','2026-02-26 10:46:08.475365',1);
INSERT INTO "raida_lesson" VALUES(88,'FR N5 P3 SEM2 S6','français','5','3','2','6','FR_N5_P3_SEM2_S6.pptx','......','

Il convient de lancer le mode diaporama pour la diffusion de la leçon en classe




Pictogrammes
L’enseignant parle 
Diffusion d’un média
Expliquer, donner une consigne 
Média en cours de diffusion
Désigner un élève
Fin du média. Passer au slide suivant
Contenu de la semaine 

Séance 3

Séance 5




Oral  - Acte de parole  2
Ecrit – Point de langue 2
Lecture – Phrases
Oral – Dialogue
Lecture – texte  (fluidité et compréhension)
Oral – Acte de parole 1
Ecrit – Point de langue 1
Lecture – Mots avec difficultés 
Oral –  Prise de parole
Ecriture – Texte 
Organisation de la semaine
Révision 
Lecture offerte
Séance 6
Vocabulaire.
Lire un texte.
Écrire un paragraphe.
Répondre à des questions en rafales. 
Histoire : Les rêves de Meriem.
1. Révision
Plan de la séance 6
(ة)خاص بالأستاذ 

Au terme de cette séance de révision, l’enseignant doit vérifier qu’au moins 80% des élèves sont capables de : 
Reconnaitre les mots de vocabulaire.
Lire et comprendre un texte.
Ecrire un paragraphe.
Répondre spontanément à des questions sur le contenu de la semaine. 
* Si ce taux n’est pas atteint, il convient de mettre en place des actions de remédiation, collectives ou individuelles. 
Bonjour les enfants. Aujourd’hui, nous allons réviser les leçons de la semaine qui s’achève. Soyez attentifs.
Répétons ensemble : Avoir confiance – Courageux – Avoir peur– Fier– Surpris - Calme.
Avoir confiance  
Fier
Calme 
 
Courageux 
Surpris  
Avoir peur
Répétons ensemble : Triste– Fatigué – Fier - dangereux– Avoir honte– Être en colère -  Joyeux.
Triste
    Joyeux   
Fatigué 
Avoir honte
Être en colère
Fier 
Répétons ensemble : Le spectacle - Le musicien - Le théâtre  - Un acteur -  La danseuse – Le sculpteur.
Le spectacle 
Un acteur 
Le   sculpteur 
 
Le musicien  
La danseuse   
Le théâtre 
Répétons ensemble : Le peintre -  L''écrivain  - Le créateur de vidéos  - Un studio -  Le chanteur - Les spectateurs.
Le peintre 
   Les spectateurs
L''écrivain 
Un studio
Le chanteur 
Le créateur de vidéos  
Nous allons jouer au jeu des mots invisibles. 
Jeu des mots invisibles. 
Observez bien les images. Je vais masquer deux images. 
Le train
Le port
Le conducteur de train
L’aéroport
Les moyens de transport
Les passagers
Quelles sont les images qui manquent ? 
?
?
Les deux images qui manquent sont : le train et les moyens de transport. 
Nous allons jouer au jeu des mots qui bougent. 
Jeu des mots qui bougent 
Répétons ensemble : Le mécanicien – Le chauffeur – L’hôtesse de l’air – Le capitaine Le pilote d’avion – L’avion.
Le mécanicien
Le chauffeur
L’hôtesse de l’air
Le capitaine
Le pilote d’avion
 L’avion
Observez bien. Je vais faire bouger deux images. 
Quelles sont les deux images qui ont bougé ? 
Les deux images  qui ont bougé sont : le pilote d’avion et le mécanicien.
Maintenant, nous allons faire de la lecture. Qui veut lire ce paragraphe ? 
Aujourd’hui, notre maîtresse nous a parlé des métiers du transport. Elle nous a montré des images : Un bus avec son conducteur, qui transporte les passagers en ville. Un train, conduit par un chef de train, qui voyage très loin. Un avion, piloté par un pilote, qui vole haut dans le ciel. Un bateau, guidé par un capitaine, qui navigue sur la mer. Et enfin, le mécanicien, qui répare les véhicules quand ils ne marchent plus.
Qui veut expliquer ce paragraphe dans sa langue ? 
Aujourd’hui, notre maîtresse nous a parlé des métiers du transport. Elle nous a montré des images : Un bus avec son conducteur, qui transporte les passagers en ville. Un train, conduit par un chef de train, qui voyage très loin. Un avion, piloté par un pilote, qui vole haut dans le ciel. Un bateau, guidé par un capitaine, qui navigue sur la mer. Et enfin, le mécanicien, qui répare les véhicules quand ils ne marchent plus.
Qui veut lire la question et y répondre ? 
De quoi a parlé la maitresse aujourd’hui ?
Aujourd’hui, notre maîtresse nous a parlé des métiers du transport. Elle nous a montré des images : Un bus avec son conducteur, qui transporte les passagers en ville. Un train, conduit par un chef de train, qui voyage très loin. Un avion, piloté par un pilote, qui vole haut dans le ciel. Un bateau, guidé par un capitaine, qui navigue sur la mer. Et enfin, le mécanicien, qui répare les véhicules quand ils ne marchent plus.
La maitresse a parlé des métiers de transport.
De quoi a parlé la maitresse aujourd’hui ?
Aujourd’hui, notre maîtresse nous a parlé des métiers du transport. Elle nous a montré des images : Un bus avec son conducteur, qui transporte les passagers en ville. Un train, conduit par un chef de train, qui voyage très loin. Un avion, piloté par un pilote, qui vole haut dans le ciel. Un bateau, guidé par un capitaine, qui navigue sur la mer. Et enfin, le mécanicien, qui répare les véhicules quand ils ne marchent plus.
Qui veut lire la question et y répondre ? 
Que conduit le capitaine ?
Aujourd’hui, notre maîtresse nous a parlé des métiers du transport. Elle nous a montré des images : Un bus avec son conducteur, qui transporte les passagers en ville. Un train, conduit par un chef de train, qui voyage très loin. Un avion, piloté par un pilote, qui vole haut dans le ciel. Un bateau, guidé par un capitaine, qui navigue sur la mer. Et enfin, le mécanicien, qui répare les véhicules quand ils ne marchent plus.
Le marin conduit un bateau. 
Que conduit le capitaine ?
Aujourd’hui, notre maîtresse nous a parlé des métiers du transport. Elle nous a montré des images : Un bus avec son conducteur, qui transporte les passagers en ville. Un train, conduit par un chef de train, qui voyage très loin. Un avion, piloté par un pilote, qui vole haut dans le ciel. Un bateau, guidé par un capitaine, qui navigue sur la mer. Et enfin, le mécanicien, qui répare les véhicules quand ils ne marchent plus.
Prenez vos cahiers. Vous allez écrire un paragraphe en vous posant les questions suivantes.  Je vais circuler entre les rangs pour vous aider. 
Où  je suis allé hier ?
Qu’est-ce qu’il y avait à ____________ ?
Qui conduit ____________________ ?
Est-ce que j’ai déjà pris ___________ pour voyager ?

Qui veut lire son paragraphe ?
Maintenant, c’est l’activité des questions en rafales. Je vais désigner des élèves au hasard pour répondre. Tenez-vous prêts. 
?
?
?

Comment ça va ? 
Comment ça va ? 
?

Qu’est-ce que vous avez fait la semaine dernière ?
Qu’est-ce que vous avez fait la semaine dernière ?
?

Que faisaient les créateurs de vidéos ?
Que faisaient les créateurs de vidéos ?
?
Que faisaient les acteurs ?
Que faisaient les acteurs ?
?
Que conduit le capitaine ?
Que conduit le capitaine ?
?
Qui conduit un avion ?
Qui conduit un avion ?
?
Qui répare les voitures en panne ?
Qui répare les voitures en panne ?
?
As-tu déjà voyagé en train ?
As-tu déjà voyagé en train ?
?
As-tu déjà voyagé en avion ?
As-tu déjà voyagé en avion ?
?
As-tu déjà voyagé en bus ?
As-tu déjà voyagé en bus ?
?
Vocabulaire.
Lire un texte.
Écrire un paragraphe.
Répondre à des questions en rafales. 
Histoire  de « Les rêves de Meriem » .
2. Lecture offerte
Plan de la séance 6
Nous avons déjà vu le premier épisode de l’histoire « les rêves de Meriem ». Qui veut nous rappeler ce qu’on a vu dans cet épisode ? 
On va  regarder  le premier épisode une nouvelle fois. Après, on verra le deuxième épisode. Soyez attentifs.
Lecture de la vidéo.
Maintenant, nous allons découvrir un nouvel épisode de l’histoire « les rêves de Meriem ». Est-ce que vous êtes prêts ? Ecoutez bien. 
Lecture de la vidéo.
Nous allons écouter l’histoire une deuxième fois. Soyez attentifs.
Lecture de la vidéo.
Qu’est-ce que Meriem passe son temps à faire ?
Elle passe son temps à chercher des informations sur les transports aériens.
Elle passe son temps à chercher des informations sur les transports aériens.
Où veut-elle aller étudier ?  
Elle va aller étudier à l’Académie internationale Mohammed VI de l’Aviation Civile.
Elle va aller étudier à l’Académie internationale Mohammed VI de l’Aviation Civile.
A-t-elle déjà voyagé en avion ? 
Non, elle n’a jamais pris l’avion. 
Non, elle n’a jamais pris l’avion.
Pourquoi Meriem va –t- elle voyagé en avion ? 
Elle va voyagé en avion pour aller étudier dans un autre pays.
Elle va voyagé en avion pour aller étudier dans un autre pays.
Est-ce que Meriem aimerait devenir capitaine d’un bateau ?  Pourquoi ? 
Elle n’aimerait pas devenir capitaine d’un bateau car elle veut être pilote d’avion. 
Elle n’aimerait pas devenir capitaine d’un bateau car elle veut être pilote d’avion. 
On va retrouver Meriem la semaine prochaine pour un nouvel épisode. 
À  la maison, écrivez trois phrases que vous avez retenues de cette histoire. 
La séance d’aujourd’hui est terminée. À bientôt.  ',NULL,'','2026-02-26 10:46:08.840081','2026-02-26 10:46:08.840128',1);
INSERT INTO "raida_lesson" VALUES(89,'MATH N5 P2 SEM5 S1','mathématiques','5','2','5','1','MATH_N5_P2_SEM5_S1.pptx','......','
5 
الدرس 1

5
2
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الخامس
(ة)خاص بالأستاذ 
الدرس 17
المبيان بالأعمدة
درس اليوم

المبيان بالأعمدة
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أقرأ وأؤول وأرسم مبيانا تكراريا
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
56 ÷ 8 = 7
يمكن للشاف موحى إعداد 7 كعكات خلال 56 دقيقة

؟  مرات
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 12.

ستتدربون على حساب خارج قسمة مضبوطة دون وضع العملية؛ لاحظوا كيف سأحسب؛
على السبورة ينمذج الأستاذ العملية المحلولة. 
لديكم دقيقة واحدة لإنجاز هذه العمليات  على كراساتكم 
صححوا
150 +30 + 1 = 181
200 + 8 = 208
250 +40 + 4 = 294
100 +20 + 1 = 121
(ة)خاص بالأستاذ 
الآن سنتعرف كيف نرسم مبيانا تكراريا ثم نقرؤه ونؤوله
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
خذوا الألواح
ماذا نفعل في الخطوة الأولى؟ 
أحدد
1
أحول
2
أستخرج
3
لاحظوا المبيان. اكتبوا على الألواح عنوان المبيان
أحدد
1
أحول
2
أستخرج
3

نصحح
أحدد
1
أحول
2
أستخرج
3
اكتبوا على الألواح عنوان المحور الأفقي
أحدد
1
أحول
2
أستخرج
3
ارفعوا الألواح
نصحح، 
أحدد
1
أحول
2
أستخرج
3

اكتبوا على الألواح عنوان المحور العمودي
أحدد
1
أحول
2
أستخرج
3
ارفعوا الألواح
نصحح
أحدد
1
أحول
2
أستخرج
3

ماذا نفعل في الخطوة الثانية؟ 
أحدد
1
أحول
2
أستخرج
3
خذوا الدفاتر وارسموا المحور العمودي ثم ارسموا شريط الرياضيات للفوج 1
أحدد
1
أحول
2
أستخرج
3

نصحح، من يقوم إلى السبورة ليشرح لنا كيف رسم الشريط وكيف حدد اللون
أحدد
1
أحول
2
أستخرج
3

خذوا الدفاتر وارسموا المحور العمودي ثم ارسموا شريط اللغة العربية للفوج 1
أحدد
1
أحول
2
أستخرج
3


نصحح، من يقوم إلى السبورة ليشرح لنا كيف رسم الشريط وكيف حدد اللون
أحدد
1
أحول
2
أستخرج
3


خذوا الدفاتر وارسموا المحور العمودي ثم ارسموا شريط اللغة الفرنسية للفوج 1
أحدد
1
أحول
2
أستخرج
3



نصحح، من يقوم إلى السبورة ليشرح لنا كيف رسم الشريط وكيف حدد اللون
أحدد
1
أحول
2
أستخرج
3



خذوا الدفاتر وارسموا المحور العمودي ثم ارسموا شريط الرياضيات للفوج 2
ألاحظ
1
أحول
2
أستخرج
3




نصحح، من يقوم إلى السبورة ليشرح لنا كيف رسم الشريط وكيف حدد اللون
أحدد
1
أحول
2
أستخرج
3




خذوا الدفاتر وارسموا المحور العمودي ثم ارسموا شريط اللغة العربية للفوج 2
أحدد
1
أحول
2
أستخرج
3





نصحح، من يقوم إلى السبورة ليشرح لنا كيف رسم الشريط
أحدد
1
أحول
2
أستخرج
3





خذوا الدفاتر وارسموا المحور العمودي ثم ارسموا شريط اللغة الفرنسية للفوج 2
أحدد
1
أحول
2
أستخرج
3






نصحح، من يقوم إلى السبورة ليشرح لنا كيف رسم الشريط
أحدد
1
أحول
2
أستخرج
3
ماذا نفعل في الخطوة الثالثة؟ 
أحدد
1
أحول
2
أستخرج
3
احسبوا الفرق بين عدد مفضلي الرياضيات في الفوجين
أحدد
1
أحول
2
أستخرج
3
1- بكم يفوق من يفضلون الرياضيات في الفوج 1
مفضلي الرياضيات في الفوج 2؟
     .............................................
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا كيف وجد النتيجة
أحدد
1
أحول
2
أستخرج
3
1- بكم يفوق من يفضلون الرياضيات في الفوج 1
مفضلي الرياضيات في الفوج 2؟
     ........................4.....................
احسبوا عدد تلاميذ الفوج 2
أحدد
1
أحول
2
أستخرج
3
1- بكم يفوق من يفضلون الرياضيات في الفوج 1
مفضلي الرياضيات في الفوج 2؟
     ........................4.....................
2- ما عدد تلاميذ الفوج 2؟
............................................
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا كيف وجد النتيجة
أحدد
1
أحول
2
أستخرج
3
1- بكم يفوق من يفضلون الرياضيات في الفوج 1
مفضلي الرياضيات في الفوج 2؟
     ........................4.....................
2- ما عدد تلاميذ الفوج 2؟
............8 + 14 + 8 = 30..............
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
الآن خذوا كراساتكم الصفحة النشاط 2 صفحة 105. 

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 






8 زيارات
في شهر نونبر
في شهر أكتوبر ب 12 زيارة فقط
سجل ياسر 42 زيارة، وسجلت سلمى 30 زيارة. سلمى سجلت أقل عدد
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 105 وأنجزوا النشاط 3. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 



قرأ آدم: 12 + 10 + 12 + 16 = 50
آدم قرأ أكبر عدد من الصفحات





قرأت سارة: 10 + 8 + 12 + 14 = 44
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:09.122764','2026-02-26 10:46:09.122832',1);
INSERT INTO "raida_lesson" VALUES(90,'MATH N5 P2 SEM5 S2','mathématiques','5','2','5','2','MATH_N5_P2_SEM5_S2.pptx','......','
5 
الدرس 1

5
2
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الخامس
(ة)خاص بالأستاذ 
الدرس 18
المبيان الخطي (1)
درس اليوم

المبيان الخطي (1)
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أقرأ وأؤول وأرسم مبيانا خطيا
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة



قرأ آدم: 12 + 10 + 12 + 16 = 50
آدم قرأ أكبر عدد من الصفحات





قرأت سارة: 10 + 8 + 12 + 14 = 44
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 12.

عرض فيديو الحساب الذهني 
صححوا
400 +20 + 1 = 421
225 + 6 = 231
350 +20 + 4 = 374
175 +20 + 2 = 197
(ة)خاص بالأستاذ 
الآن سنتعرف كيف نرسم مبيانا خطيا ثم نقرؤه ونؤوله
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
خذوا الألواح
ماذا نفعل في الخطوة الأولى؟ 
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
لاحظوا المبيان. اكتبوا على الألواح عنوان المبيان
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
نصحح
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3

اكتبوا على الألواح عنوان المحور الأفقي
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ارفعوا الألواح
نصحح، 
ألاحظ
1
أحول
2
أستخرج
3

اكتبوا على الألواح عنوان المحور العمودي
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ارفعوا الألواح
نصحح
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3

ماذا نفعل في الخطوة الثانية؟ 
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
اكتبوا على الألواح عدد الأهداف المسجلة في المباراة الأولى
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليمثل العدد على المبيان بنقطة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3

اكتبوا على الألواح عدد الأهداف المسجلة في المباراة الثانية
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليمثل العدد على المبيان بنقطة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3

اكتبوا على الألواح عدد الأهداف المسجلة في المباراة الثالثة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليمثل العدد على المبيان بنقطة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3

نكمل تمثيل عدد أهداف المباريات الرابعة والخامسة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3

ماذا نفعل في الخطوة الثالثة؟ 
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
نصل النقط بخطوط مستقيمة. من يقوم إلى السبورة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
نصحح، من يشرح النقطتين الأوليتين التي سنربطها بخط مستقيم
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ماذا نفعل في الخطوة الرابعة؟ 
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
نقرأ بيانات المبيان. احسبوا الفرق بين أهداف المباراتين الأولى والخامسة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ارفعوا الألواح
نقرأ بيانات المبيان. احسبوا الفرق بين أهداف المباراتين الأولى والخامسة
35 – 25 = 10
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
على الألواح اكتبوا جواب السؤال الموالي
35 – 25 = 10
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ارفعوا الألواح
نصحح
35 – 25 = 10
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
المباراة الرابعة
على الألواح اكتبوا جواب السؤال الموالي
35 – 25 = 10
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
المباراة الرابعة
ارفعوا الألواح
نصحح
35 – 25 = 10
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
المباراة الرابعة
25+22+30+20+35 = 132
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
الآن خذوا كراساتكم الصفحة النشاط 3 صفحة 107. 

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
في شهر يونيو
23 – 20 = 3
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 107 وأنجزوا النشاط 4. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
في السن 5
100 – 70 = 30 cm
لا. لأن الخط منكسر وليس مستقيميا
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:09.592896','2026-02-26 10:46:09.592947',1);
INSERT INTO "raida_lesson" VALUES(91,'MATH N5 P2 SEM5 S3','mathématiques','5','2','5','3','MATH_N5_P2_SEM5_S3.pptx','......','
5 
الدرس 1

5
2
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الخامس
(ة)خاص بالأستاذ 
الدرس 19
المبيان الخطي (2)
درس اليوم

المبيان الخطي (2)
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أقرأ وأؤول وأرسم مبيانا بخطوط منكسرة
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
في السن 5
100 – 70 = 30 cm
لا. لأن الخط منكسر وليس مستقيميا
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 12.

عرض فيديو الحساب الذهني 
صححوا
250 +30 + 2 = 282
25 + 14 = 39
400 +15 + 1 = 416
50 +18 = 68
(ة)خاص بالأستاذ 
الآن سنتعرف كيف نرسم مبيانا بخطوط منكسرة ثم نقرؤه ونؤوله
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
خذوا الألواح
ماذا نفعل في الخطوة الأولى؟ 
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
لاحظوا المبيان. اكتبوا على الألواح عنوان المبيان
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
نصحح
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما

الكتلة بالكيلوغرام
الأشهر
اكتبوا على الألواح عنوان المحور الأفقي
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
ارفعوا الألواح
نصحح، 
ألاحظ
1
أحول
2
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

اكتبوا على الألواح عنوان المحور العمودي
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
ارفعوا الألواح
نصحح
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

ماذا نفعل في الخطوة الثانية؟ 
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
اكتبوا على الألواح كتلة عمر عند ولادته
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليمثل العدد على المبيان بنقطة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

اكتبوا على الألواح كتلة عمر في الشهر الثاني
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليمثل العدد على المبيان بنقطة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

من يقوم إلى السبورة ليمثل كتلة عمر في الشهر الرابع على المبيان
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
نصحح، من يقوم إلى السبورة ليمثل الكتلة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

من يقوم إلى السبورة ليمثل كتلة عمر في الشهر السادس على المبيان
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
نصحح، من يقوم إلى السبورة ليمثل الكتلة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

من يقوم إلى السبورة ليمثل كتلة عمر في الشهر الثامن على المبيان
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
نصحح، من يقوم إلى السبورة ليمثل الكتلة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

من يقوم إلى السبورة ليمثل كتلة عمر في الشهر العاشر على المبيان
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
نصحح، من يقوم إلى السبورة ليمثل الكتلة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

ماذا نفعل في الخطوة الثالثة؟ 
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

نصل النقط بخطوط مستقيمة. من يقوم إلى السبورة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

نصحح، من يشرح النقطتين الأوليتين التي سنربطها بخط مستقيم
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

اكتبوا على الألواح كتلة علي عند ولادته
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليمثل العدد على المبيان بنقطة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

من يقوم إلى السبورة ليمثل كتلة علي في الشهر الثاني، الرابع، السادس، الثامن والعاشر
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

ماذا نفعل في الخطوة الرابعة؟ 
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

اكتبوا على الألواح الشهر الذي أصبحت فيه كتلة علي أكبر من كتلة عمر
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر

ارفعوا الألواح
نقرأ بيانات المبيان. احسبوا الفرق بين أهداف المباراتين الأولى والخامسة
ألاحظ
1
أمثل
2
أصل
3
أستخرج
3
كتلة كل من عمر وعلى خلال الأشهر الأولى من ولادتهما
الكتلة بالكيلوغرام
الأشهر


(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
الآن خذوا كراساتكم الصفحة النشاط 3 صفحة 109. 

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
في سنة 2021
(20 +30 +30 + 40 + 50) – (30 + 20 + 30 + 30 +60) = 0 Dh

(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 109 وأنجزوا النشاط 4. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
في سنة 2018

60 + 50 + 70 + 90 = 270
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:10.080395','2026-02-26 10:46:10.080424',1);
INSERT INTO "raida_lesson" VALUES(92,'MATH N5 P2 SEM5 S4','mathématiques','5','2','5','4','MATH_N5_P2_SEM5_S4.pptx','......','
5 
الدرس 17

5
1
2
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الخامس
(ة)خاص بالأستاذ 
الدرس 20
حل المسائل
درس اليوم

حل مسائل: توليف
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
كيف تحلون مسألة باستعمال التمثيل المناسب
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
في سنة 2018

60 + 50 + 70 + 90 = 270
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 12.

عرض فيديو الحساب الذهني 
صححوا
50 + 35 + 2 = 87
175 + 4 = 179
100 + 40 + 3 = 143
125 + 6 = 131
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
نتذكر خطوات حل المسائل. من يشرح الخطوة الأولى؟ 
1- أَفْهَمُ ٱلْمَسْأَلَةَ وَأُُحَدِّدُ ما أَبْحَثُ عَنْهُ ؛

2- أُحَدِّدُ طَبيعَةَ الْوَضْعِيَّةِ؛

3- أَخْتارُ النَّموذَجَ المُناسِبَ لِحَلِّ الْمَسْأَلَةِ
خذوا الألواح
ماذا نفعل في الخطوة الأولى لحل المسائل؟ 
أفهم
1
أحدد
2
أختار النموذج
3
اقرؤوا المسألة جيدا لفهمها
أفهم
1
أحدد
2
أختار النموذج
3
اكتبوا على الألواح المعطيات العددية التي تتضمنها المسألة
أفهم
1
أحدد
2
أختار النموذج
3
ارفعوا الألواح
نصحح. من يستخرج المعطيات العددية
أفهم
1
أحدد
2
أختار النموذج
3
ماذا نفعل في الخطوة الثانية؟ 
أفهم
1
أحدد
2
أختار النموذج
3
اكتبوا على الألواح طبيعة المسألة
أفهم
1
أحدد
2
أختار النموذج
3
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليمثل العدد على المبيان بنقطة
هذه مسألة وضعية البحث عن الكل أو الجزء و الأجزاء متساوية
أفهم
1
أحدد
2
أختار النموذج
3
ماذا نفعل في الخطوة الثالثة؟ 
أفهم
1
أحدد
2
أختار النموذج
3
اكتبوا على الألواح رقم النموذج المناسب لتمثيل هذه المسألة
أفهم
1
أحدد
2
أختار النموذج
3
A
B
C
D
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا لماذا اختار هذا النموذج
أفهم
1
أحدد
2
أختار النموذج
3
A
B
C
D
على الألواح مثلوا معطيات المسألة على النموذج
أفهم
1
أحدد
2
أختار النموذج
3
ارفعوا الألواح
نصحح. من يمثل المسألة 
أفهم
1
أحدد
2
أختار النموذج
3
504
9
9
؟ مرة
على الألواح اكتبوا متساوية الحل
أفهم
1
أحدد
2
أختار النموذج
3
504
9
9
؟ مرة
ارفعوا الألواح
نصحح. من يكتب متساوية الحل ويشرح كيف استنتجها
أفهم
1
أحدد
2
أختار النموذج
3
504
9
9
؟ مرة
504 ÷ 9 = 56 
على الألواح اكتبوا عبارة الحل
أفهم
1
أحدد
2
أختار النموذج
3
504
9
9
؟ مرة
504 ÷ 9 = 56 
ارفعوا الألواح
نصحح. من يكتب عبارة الحل
أفهم
1
أحدد
2
أختار النموذج
3
504
9
9
؟ مرة
504 ÷ 9 = 56 
يمكن صنع 56 خيمة
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
الآن خذوا كراساتكم الصفحة النشاط 1 صفحة 110. 

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
1- أَفْهَمُ ٱلْمَسْأَلَةَ وَأُُحَدِّدُ ما أَبْحَثُ عَنْهُ ؛

2- أُحَدِّدُ طَبيعَةَ الْوَضْعِيَّةِ؛

3- أَخْتارُ النَّموذَجَ المُناسِبَ لِحَلِّ الْمَسْأَلَةِ
صححوا 
12
350
14 مرة
؟
96
12
مرة
1
15
70
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 111 وأنجزوا النشاط 3. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
9 مرات
؟
مرة
؟
216
216 ÷ 9 = 24
حصل كل قسم على 24 قصة
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:10.365387','2026-02-26 10:46:10.365427',1);
INSERT INTO "raida_lesson" VALUES(93,'MATH N5 P2 SEM5 S5','mathématiques','5','2','5','5','MATH_N5_P2_SEM5_S5.pptx','......','
5 
الدرس 1

5
2
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الخامس
(ة)خاص بالأستاذ 
مراجعة
مراجعة وتثبيت دروس الأسبوع
(ة)خاص بالأستاذ 
درس اليوم

مراجعة دروس الأسبوع

تدابير حصة المراجعة  الأسبوع
(ة)خاص بالأستاذ 
مراجعة كل درس تتم عبر المراحل التالية : 
رائز التحقق من الهدف الرئيسي للدرس
احتساب نسبة التحكم
أقل من 80%
أكبر من 80%
إعادة عرض شريط النمذجة 
المرور مباشرة للتدرب على الكراسة
إنجاز نشاط مراجعة الدرس على الكراسة
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أرسم وأقرأ أؤول مبيانا تكراريا
أرسم وأقرأ أؤول مبيانا خطيا منكسرا
أرسم وأقرأ أؤول مبيانا بخطين منكسرين
حل مسائل باستعمال التمثيل المناسب
(ة)خاص بالأستاذ 
صححوا، لديكم دقيقة واحدة

11 مرة

21 مرة
3 960 ÷ 11 = 360
جمع المصنع 360 لترا في اليوم الواحد
1 155 ÷ 11 = 105
في كل صف 
105 شجرة
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 12.

لديكم دقيقة واحدة لحل هذه العمليات. 
1

1
 لديكم دقيقة واحدة للتصحيح.
250 + 25 + 4 = 279
75 + 10  = 85
450 + 45 + 2 = 497
225 
(ة)خاص بالأستاذ 

أرسم وأقرأ أؤول مبيانا تكراريا
مراجعة الدرس 1
2
على الكراسات، نشاط 1 صفحة 112. مثلوا الذكور بالأعمدة على المبيان
نصحح. من يقزم إلى السبورة ليشرح لنا كيف مثل الذكور وكيف اختار اللون




فيديو نمذجة الدرس 1 
 أكملوا إنجاز النشاط 1 على الكراسات، وأجيبوا عن الأسئلة




 صححوا. 








كرة السلة والسباحة
16 – 10 = 6
12 + 14 = 26
(ة)خاص بالأستاذ 

أرسم وأقرأ أؤول مبيانا بخطين منكسرين
مراجعة الدرس 2
2
1

1
على الألواح اكتبوا رقم الرحلة التي فيها عدد الركاب أكبر 

ارفعوا الألواح
1

1
نصحح.  من يقوم ليشرح لنا كيف وجد الجواب الصحيح


أكبر عدد الركاب كان في الرحلة 3
فيديو نمذجة الدرس 2 
1

2
أكملوا النشاط 2


أكبر عدد الركاب كان في الرحلة 3

صححوا
1

1
أكبر عدد الركاب كان في الرحلة 3
40 – 25 = 15
35 + 25 + 40 + 30 = 130
(ة)خاص بالأستاذ 

أرسم وأقرأ أؤول مبيانا خطيا منكسرا
مراجعة الدرس 3
2
1

2
على الكراسات نشاط 3 ص 113، مثلوا معطيات الفترة المسائية بخط منكسر
 صححوا. من يشرح لنا كيف مثل المعطيات وكيف حدد اللون
1

1
فيديو نمذجة الدرس 3 
1

2
أكملوا إنجاز النشاط وأجيبوا عن الأسئلة
 صححوا. 
1

1
الرحلة الصباحية عرفت أقل عدد من الركاب. لأن الرحلتين 2 و3 فيها نفس العدد في الفترتين
وفي الرحلة 1 الفترة الصباحية كانت أكثر ب 5 ركاب وفي الرحلة 4 كانت الفترة الصباحية أقل ب 15 راكبا
(25 + 40) – ( 40 + 25) = 0
30 + 40 + 25 + 45 = 140
(ة)خاص بالأستاذ 

مراجعة الدرس 4
5
حل مسائل باستعمال التمثيل المناسب
1

4
على الألواح ارسموا التمثيل المناسب لحل المسألة
ارفعوا الألواح
1

2
نصحح، من يقوم ليشرح لنا كيف احتار النموذج المناسب ومثل المسألة 

؟ مرة
1

2
أكملوا إنجاز النشاط 4 وأجيبوا عن الأسئلة

؟ مرة
 صححوا. 
1

1

؟ مرة
63 ÷ 3 = 21
عدد طوابق العمارة هو 21 طابقا
(ة)خاص بالأستاذ 

اختتام الحصة
3

الواجبات المنزلية

في المنزل، أنجزوا جميع الأنشطة المتبقية الصفحتين 112 و113
إلى اللقاء. في الحصة القادمة،',NULL,'','2026-02-26 10:46:10.629719','2026-02-26 10:46:10.629757',1);
INSERT INTO "raida_lesson" VALUES(94,'MATH N5 P3 SEM1 S1','mathématiques','5','3','1','1','MATH_N5_P3_SEM1_S1.pptx','......','
5 
الدرس 1

1
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الأول
(ة)خاص بالأستاذ 
الدرس 1
التناسبية (4)
درس اليوم

التناسبية (4)
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أتعرف وأوظف معامل التناسب
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 13.

عرض فيديو الحساب الذهني 
صححوا
4
7,8
1,2
5,7
1,5
7,4
0,1
7,8
2,4
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نوظف معامل التناسب لملء جدول تناسبية
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا ألواحكم. 
ماذا نفعل في الخطوة الأولى؟ اقرؤوا المسألة 
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
اقرؤوا المسألة . من يستخرج لنا معطيات المسألة
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
ماذا نفعل في الخطوة الثانية؟ 
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
نمثل المسألة. ارسموا على الألواح الجدول المناسب
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
 ارسموا أعمدة المطلوب
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
احسبوا معامل التناسب
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
ماذا نفعل في الخطوة الثالثة؟ 
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
أكملوا ملء الجدول
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثالثة؟
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
ماذا نفعل في الخطوة الرابعة؟ 
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
اكتبوا عبارات الحل
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثالثة؟
تَسْتَهْلِكُ سَيّارَةٌ 5 لِتْراتٍ مِنَ الْبِنْزينِ كُلَّ 100 كيلومِتْرٍ.
كَمْ سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200، 300، 500، 700 وَ900 كيلومِتْرٍ؟
سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 200 كيلومِتْرٍ 10 لترات
سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 300 كيلومِتْرٍ 15 لترا
سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 500 كيلومِتْرٍ 25 لترا
سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 700 كيلومِتْرٍ 35 لترا
سَتَسْتَهْلِكُ هَذِهِ السَّيّارَةُ مِنَ الْبِنْزينِ في 900 كيلومِتْرٍ 45 لترا
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا الكراسات؛ أنجزوا النشاط 2 صفحة 10
نصحح، من يقوم ليشرح لنا الخطوات
98
المسافة بالمتر
المدة بالدقائق
1
294
3
5
7
9
10
490
686
882
980
98
294
490
686
882
980
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط3 صفحة 11

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
6
عدد الصناديق
المدة بالساعات
1
12
2
4
8
10
20
24
48
60
120
6
12
24
60
120
48
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 11 وأنجزوا النشاط 4. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
26
عدد الحلوى
المدة بالدقائق
1
104
4
7
10
12
20
182
260
312
520
26
104
182
260
312
520
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:10.917319','2026-02-26 10:46:10.917361',1);
INSERT INTO "raida_lesson" VALUES(95,'MATH N5 P3 SEM1 S2','mathématiques','5','3','1','2','MATH_N5_P3_SEM1_S2.pptx','......','
5 
الدرس 1

1
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الأول
(ة)خاص بالأستاذ 
الدرس 2
التناسبية (5)
درس اليوم

التناسبية (5)
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أتعرف وأوظف الاستراتيجية المناسبة لملء جدول تناسبية
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
26
عدد الحلوى
المدة بالدقائق
1
104
4
7
10
12
20
182
260
312
520
26
104
182
260
312
520
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 13.

عرض فيديو الحساب الذهني 
صححوا
2,1
12,7
5,2
11,6
0,2
12,8
2,3
14,6
2,4
10,2
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نختار الاستراتيجية المناسبة لحل مسائل تناسبية
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا ألواحكم. 
ماذا نفعل في الخطوة الأولى؟ اقرؤوا المسألة 
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
اقرؤوا المسألة . من يستخرج لنا معطيات المسألة
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
ماذا نفعل في الخطوة الثانية؟ 
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
نمثل المسألة. ارسموا على الألواح الجدول المناسب
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثانية؟
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
 ارسموا عمود المطلوب
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الجواب
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
اكتبوا رقم الاستراتيجية المناسبة لملء الجدول
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
اِسْتْراتيجِيَةُ الْمُضاعَفاتِ
اِسْتْراتيجِيَةُ مُعامِلِ التَّناسُبِ
اِسْتْراتيجِيَةُ الْعَوْدَةِ إِلى الْوَحْدَةِ
A
B
C
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا كيف اختار هذه الاستراتيجية
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
اِسْتْراتيجِيَةُ الْمُضاعَفاتِ
اِسْتْراتيجِيَةُ مُعامِلِ التَّناسُبِ
اِسْتْراتيجِيَةُ الْعَوْدَةِ إِلى الْوَحْدَةِ
A
B
C
ماذا نفعل في الخطوة الثالثة؟ 
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
اكتبوا على الألواح العدد المناسب مكان علامة استفهام في الجدول
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا وجد الجواب الصحيح
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
5 ×3 = 15
84 ×3 = 252
×3 
×3 
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4


ماذا نفعل في الخطوة الرابعة؟ 
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
5 ×3 = 15
84 ×3 = 252
×3 
×3 


اكتبوا عبارات الحل
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
5 ×3 = 15
84 ×3 = 252
×3 
×3 


ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا الخطوة الثالثة؟
يَلْزَمُ  الْأُمَّ مِنَ الدَّقيقِ 252 غراما
لِإِعْدادِ 5 أَرْغِفَةٍ تَحْتاجُ الْأُمُّ 84 غْراماً مِنَ الدَّقيقِ.
كَمْ يَلْزَمُها مِنَ الدَّقيقِ لِصُنْعِ 15 رَغيفاً؟ 
أفهم المسألة
1
أملأ الجدول
3
أرسم الجدول
2
أحل
4
5 ×3 = 15
84 ×3 = 252
×3 
×3 


(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا الكراسات؛ أنجزوا المسألة الثانية من النشاط 1 صفحة 12

نصحح، من يقوم ليشرح لنا الخطوات
سينتج النحل 210 كيلوغراما خلال 7 سنوات
الاستراتيجية المناسبة هي العودة إلى الوحدة
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط 2 صفحة 12

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
تحتاج 5,5 برتقالة
÷ 2
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 13 وأنجزوا النشاط 3. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

يرجى تغيير العبارة  في المسألة بالأحمر على الكراسة
صححوا على كراساتكم 
ستقطع السيارة 144 كيلومترا
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:11.139313','2026-02-26 10:46:11.139343',1);
INSERT INTO "raida_lesson" VALUES(96,'MATH N5 P3 SEM1 S3','mathématiques','5','3','1','3','MATH_N5_P3_SEM1_S3.pptx','......','
5 
الدرس 1

1
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الأول
(ة)خاص بالأستاذ 
الدرس 2
التناسبية: مراجعة وتوليف
درس اليوم

التناسبية: مراجعة وتوليف
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أتعرف وأوظف الاستراتيجية المناسبة لملء جدول تناسبية تتمة للدرس السابق
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
26
عدد الحلوى
المدة بالدقائق
1
104
4
7
10
12
20
182
260
312
520
26
104
182
260
312
520
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 13.

عرض فيديو الحساب الذهني 
صححوا
5,5
30,2
22,7
33,2
38,4
27,3
2,9
44,4
26,4
16,1
(ة)خاص بالأستاذ 
نعيد مشاهدة فيديو الدرس السابق لنتعلم كيف نختار الاستراتيجية المناسبة لحل مسائل تناسبية
إعادة عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا الكراسات؛ أنجزوا المسألة النشاط 1 صفحة 14
نصحح، من يقوم ليشرح لنا الخطوات
120
الاستراتيجية المناسبة هي العودة إلى الوحدة  ثم نكمل الجدول باستراتيجية المضاعفات
360
480
600
840
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا الكراسات؛ أنجزوا المسألة النشاط 2 صفحة 14
نصحح، من يقوم ليشرح لنا الخطوات
36
الاستراتيجية المناسبة هي استراتيجية المضاعفات
48
96
108
300
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
خذوا الكراسات؛ أنجزوا المسألة النشاط 3 صفحة 15

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
الاستراتيجية المناسبة هي استراتيجية المضاعفات
يقطع عماد عدد خطوات أكثر من ريم خلال الدقيقة الواحدة
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 15 وأنجزوا النشاط 4. 

صححوا على كراساتكم 
الاستراتيجية المناسبة هي استراتيجية معامل التناسب
المبلغ الذي سيؤديه الزبون مقابل 1 km هو 7 دراهم
المبلغ الذي سيؤديه الزبون مقابل 7 km هو 49 درهما
المبلغ الذي سيؤديه الزبون مقابل 70 km هو 490 درهما
× 7
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:11.306676','2026-02-26 10:46:11.306711',1);
INSERT INTO "raida_lesson" VALUES(97,'MATH N5 P3 SEM1 S4','mathématiques','5','3','1','4','MATH_N5_P3_SEM1_S4.pptx','......','
5 
الدرس 17

1
1
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الأول
(ة)خاص بالأستاذ 
الدرس 4
حل المسائل
درس اليوم

حل مسائل هندسية
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
حل مسألة هندسية
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
الاستراتيجية المناسبة هي استراتيجية معامل التناسب
المبلغ الذي سيؤديه الزبون مقابل 1 km هو 7 دراهم
المبلغ الذي سيؤديه الزبون مقابل 7 km هو 49 درهما
المبلغ الذي سيؤديه الزبون مقابل 70 km هو 490 درهما
× 7
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 13.

عرض فيديو الحساب الذهني 
صححوا
0,5
30,6
14,7
90,1
31,4
60,1
24,9
90,1
28,4
30,4
(ة)خاص بالأستاذ 
الآن سنتعرف كيف نحل مسألة هندسية
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
خذوا الألواح
ماذا نفعل في الخطوة الأولى؟ 
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4
اقرؤوا المسألة جيدا لفهمها وحددوا عدد التعليمات في المسألة
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4
اكتبوا على الألواح عدد المطلوب أو التعليمات التي تتضمنها المسألة
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4
ارفعوا الألواح
نصحح. من حدد هذه التعليمات الأربع
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4




4 تعليمات
ماذا نفعل في الخطوة الثانية؟ 




أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4
ارسموا دائرة (C) على الألواح باليد




أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4
ارفعوا الألواح
نصحح، 




أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4
4cm

ارسموا القطر الأفقي ويقطع الدائرة في النقطتين B وD




أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4

ارفعوا الألواح
نصحح، 
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4




4cm

ارسموا القطر العمودي على القطر الأفقي ويقطع الدائرة في النقطتين B وD




أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4
4cm

ارفعوا الألواح
نصحح،  في نظركم، ما طبيعة الرباعي المحصل عليه؟ كيف عرفت ذلك؟  




أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4
4cm

ماذا نفعل في الخطوة الثالثة؟ 
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4




4cm

على الكراسات نشاط 2 صفحة 16. ارسموا الشكل بالأدوات المناسبة
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4




4cm

نصحح؛ قارنوا بين الرسم باليد والإنشاء.  من يقوم إلى السبورة لإنشاء الشكل؟ 
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4




A
C

B
D
4cm

ماذا نفعل في الخطوة الرابعة؟
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4





A
C

B
D
اكتبوا طبيعة الشكل على الألواح
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4





A
C

B
D




ارفعوا الألواح
طبيعة الشكل هي مربع.
أفهم
1
أرسم باليد
2
أرسم بالأدوات
3
أحدد
4





A
C

B
D




(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
الآن خذوا كراساتكم الصفحة النشاط 1 صفحة 16. 

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
صححوا 
A
B
4cm
(L)
O

C
D
معين
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 17 وأنجزوا النشاط 3. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
4cm
4cm
3cm
J
4cm

4cm
3cm
I
L
K

مستطيل
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ',NULL,'','2026-02-26 10:46:11.557190','2026-02-26 10:46:11.557217',1);
INSERT INTO "raida_lesson" VALUES(98,'MATH N5 P3 SEM1 S5','mathématiques','5','3','1','5','MATH_N5_P3_SEM1_S5.pptx','......','
5 
الدرس 1

1
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الأول
(ة)خاص بالأستاذ 
مراجعة
مراجعة وتثبيت دروس الأسبوع
(ة)خاص بالأستاذ 
درس اليوم

مراجعة دروس الأسبوع

تدابير حصة المراجعة  الأسبوع
(ة)خاص بالأستاذ 
مراجعة كل درس تتم عبر المراحل التالية : 
رائز التحقق من الهدف الرئيسي للدرس
احتساب نسبة التحكم
أقل من 80%
أكبر من 80%
إعادة عرض شريط النمذجة 
المرور مباشرة للتدرب على الكراسة
إنجاز نشاط مراجعة الدرس على الكراسة
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
توظيف معامل التناسب
اختيار الاستراتيجية المناسبة لحل مسألة تناسبية
حل المسائل الهندسية
(ة)خاص بالأستاذ 
صححوا، لديكم دقيقة واحدة



(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 13.

لديكم دقيقة واحدة لحل هذه العمليات. 
1

1
 لديكم دقيقة واحدة للتصحيح.
20,5
92,02
25,7
55,25
33,4
110,74
61,9
52,23
31,4
19,12
(ة)خاص بالأستاذ 

توظيف معامل التناسبية
مراجعة الدرس 1
2
على الكراسات أنجزوا النشاط 2 صفحة 18
ارفعوا الألواح
نصحح.
×12
24
48
84
96
فيديو نمذجة الدرس 1 
أنجزوا النشاط التالي على الدفاتر
ينتج مصنع سيارات 8 سيارات كل دقيقة. كم سينتج هذا المصنع من سيارة خلال 3، 7، 10، و60 دقيقة؟
 صححوا. 
×8
ينتج مصنع سيارات 8 سيارات كل دقيقة. كم سينتج هذا المصنع من سيارة خلال 3، 7، 10، و60 دقيقة؟
سينتج هذا المصنع خلال 3 دقائق 24 سيارة
سينتج هذا المصنع خلال 7 دقائق 56 سيارة
سينتج هذا المصنع خلال 10 دقائق 80 سيارة
سينتج هذا المصنع خلال 60 دقيقة 480 سيارة
(ة)خاص بالأستاذ 

اختيار الاستراتيجية المناسبة لحل مسألة تناسبية
مراجعة الدرس 2
2
1

1
على الكراسات أنجزوا المسألة الأولى من النشاط 1

1

1
نصحح
5
100
100 كيلوغرام
فيديو نمذجة الدرس 2 
1

2
أنجزوا النشاط التالي على الدفاتر
يوفر عمر 7 دراهم يوميا. كم سيوفر خلال 6، 8، 30 يوما؟
صححوا
1

1
يوفر عمر 7 دراهم يوميا. كم سيوفر خلال 6، 8، 30 يوما؟
سيوفر خلال 6 أيام 42 درهما
سيوفر خلال 8 أيام 56 درهما
سيوفر خلال 30 يوما 210 درهما
(ة)خاص بالأستاذ 

حل المسائل الهندسية
مراجعة الدرس 3
2
1

4
على الكراسات ارسموا الرسم باستعمال الأدوات الهندسية المناسبة
1

2
 صححوا. من يقوم إلى السبورة ليشرح الجواب ويذكر بالقاعدة
100°
5 cm
D
A
E
B
C
4 cm
فيديو نمذجة الدرس 4 
1

2
على الدفاتر أنجزوا النشاط التالي
ارسم مستقيمين (D1) و(D2) متوازيين؛
ارسم نقطتين A وB على المستقيم (D1) بحيث AB = 5 cm؛
ارسم نقط, C على المستقيم (D2) بحيث BC = 4cm
ارسم نقطتين D على المستقيم (D2) بحيث AD = BC.
ما طبيعة الشكل ABCD الذي يمكن أن أحصل عليه؟
1

2
نصحح
ارسم مستقيمين (D1) و(D2) متوازيين؛
ارسم نقطتين A وB على المستقيم (D1) بحيث AB = 5 cm؛
ارسم نقط, C على المستقيم (D2) بحيث BC = 4cm
ارسم نقطتين D على المستقيم (D2) بحيث AD = BC.
ما طبيعة الشكل ABCD الذي يمكن أن أحصل عليه؟
A
B
5cm
D
C
A
B
5cm
D
C
متوازي أضلاع
شبه منحرف متساوي الساقين
(ة)خاص بالأستاذ 

اختتام الحصة
3

الواجبات المنزلية

في المنزل، أنجزوا جميع الأنشطة المتبقية الصفحتين 18 و19
إلى اللقاء. في الحصة القادمة،',NULL,'','2026-02-26 10:46:11.743233','2026-02-26 10:46:11.743260',1);
INSERT INTO "raida_lesson" VALUES(99,'MATH N5 P3 SEM2 S1','mathématiques','5','3','2','1','MATH_N5_P3_SEM2_S1.pptx','......','
5 
الدرس 1

2
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
الدرس 5
جداء عدد عشري في عدد عشري
درس اليوم

جداء عدد عشري في عدد عشري
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أتعرف وأوظف الاستراتيجية المناسبة لملء جدول تناسبية
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
1- أحسب كمية العصير اللازمة ل 42 شخصا.
1- أحسب كتلة الليمون اللازمة لإعداد العصير ل 42 شخصا.
كمية العصير اللازمة ل 42 شخصا. هي 7l
كتلة الليمون اللازمة لإعداد العصير ل 42 شخصا. هي  17,5kg
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 14.

عرض فيديو الحساب الذهني 
صححوا
7
3
93
2,16
62
3,71
64
3,22
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نحسب جداء عدد عشري في عدد عشري
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
1- أَضَعُ وَأُنْجِزُ الْعَمَلِيَّةَ بِدونِ فاصِلَةٍ؛
2- أَعُدُّ الأَرْقامَ يَمينَ الفاصِلَةِ في كِلا الْعَدَدَيْنِ؛
3- أَضَعُ الفاصِلَةَ في جُداءِ الْعَدَدَيْنِ بِحَيْثُ يَكونُ عَدَدُ الْأَرْقامِ بِنَفْسِ عَدَدِ الْأَرْقامِ يَمينَ الفاصِلَةِ في كِلا الْعَدَدَيْنِ
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا ألواحكم. 
ماذا نفعل في الخطوة الأولى؟ 
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
ضعوا العملية على الألواح
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
ارفعوا الألواح
نصحح
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
أنجزوا ضرب الرقم 5 في الحد الأول
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
ارفعوا الألواح
نصحح
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
4 1 5
1
أنجزوا ضرب الرقم 4 في الحد الأول، لا تنسوا وضع نقطة الضرب في العشرات
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
4 1 5
1
ارفعوا الألواح
نصحح
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
3 3 2 .
4 1 5
1
1
احسبوا مجموع الجداءين
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
3 3 2 .
4 1 5
1
1
ارفعوا الألواح
نصحح
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
4 1 5
3 3 2 .
3 7 3 5
+
1
1
ماذا نفعل في الخطوة الثانية؟ 
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
4 1 5
3 3 2 .
3 7 3 5
+
1
1
على الألواح، اكتبوا عدد الأرقام يمين الفاصلة في الحدين
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
4 1 5
3 3 2 .
3 7 3 5
+
1
1
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا كيف عد الأرقام يمين الفاصلة
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
4 1 5
3 3 2 .
3 7 3 5
+
رقمان يمين الفصلة
1
1
ماذا نفعل في الخطوة الثالثة؟ 
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
4 1 5
3 3 2 .
3 7 3 5
+
1
1
على الألواح، ضعوا الفاصلة في جداء العددين 
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5
    8, 3
× 4, 5    
4 1 5
3 3 2 .
3 7 3 5
+
1
1
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا وجد الجواب الصحيح
أضع وأنجز
1
أضع الفاصلة
3
أعد الأرقام
2
8,3 × 4,5 = 37,35
    8, 3
× 4, 5    
4 1 5
3 3 2 .
3 7, 3 5
+
1
1
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
على الألواح ضعوا وأنجزوا العملية التالية
5,27 × 6,9
نصحح، من يقوم ليشرح لنا الخطوات
5,27 × 6,9
    5, 2 7
× 6, 9    
4 7 4 3
3 1 6 2 .
3 6, 3 6 3
+
6
2
4
1
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط 4 صفحة 21

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
1- أَضَعُ وَأُنْجِزُ الْعَمَلِيَّةَ بِدونِ فاصِلَةٍ؛
2- أَعُدُّ الأَرْقامَ يَمينَ الفاصِلَةِ في كِلا الْعَدَدَيْنِ؛
3- أَضَعُ الفاصِلَةَ في جُداءِ الْعَدَدَيْنِ بِحَيْثُ يَكونُ عَدَدُ الْأَرْقامِ بِنَفْسِ عَدَدِ الْأَرْقامِ يَمينَ الفاصِلَةِ في كِلا الْعَدَدَيْنِ
صححوا 
    1 3, 7
×   5, 8    
1 0 9 6
6 8 5  .
7 9, 4 6
+
1
5
5
3
    6, 4 1
×   5, 7    
4 4 8 7
3 2 0 5  .
3 6, 5 3 7
+
2
2
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 21 وأنجزوا النشاط 5. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
    7, 4 2
×   0, 8    
5 9 3 6
0 0 0  .
5, 9 3 6
+
2
    9, 9 3 
×   2, 3    
2 9 7 9
1 9 8 6 .
2 2, 8 3 9
+
1
2
1
6  7
×   1, 5
3 3 5
6 7 .
1 0, 0 5
+
3
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ','{"subject": "math\u00e9matiques", "level": "5", "period": "3", "week": "2", "session": "1", "objective": "\u064a\u062a\u0639\u0631\u0641 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0648\u064a\u0633\u062a\u062e\u062f\u0645\u0648\u0646 \u0627\u0644\u0627\u0633\u062a\u0631\u0627\u062a\u064a\u062c\u064a\u0629 \u0627\u0644\u0645\u0646\u0627\u0633\u0628\u0629 \u0644\u0645\u0644\u0621 \u062c\u062f\u0648\u0644 \u062a\u0646\u0627\u0633\u0628\u064a\u0629 \u0627\u0644\u0623\u0639\u062f\u0627\u062f \u0627\u0644\u0639\u0634\u0631\u064a\u0629.", "steps": [{"name": "\u0627\u0644\u0627\u0641\u062a\u062a\u0627\u062d", "duration": "10min", "icon": "\ud83d\udcdd", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u062a\u0635\u062d\u064a\u062d \u0627\u0644\u0648\u0627\u062c\u0628\u0627\u062a \u0627\u0644\u0645\u0646\u0632\u0644\u064a\u0629\u060c \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0633\u0627\u0628 \u0643\u0645\u064a\u0629 \u0627\u0644\u0639\u0635\u064a\u0631 \u0627\u0644\u0644\u0627\u0632\u0645\u0629 \u064442 \u0634\u062e\u0635\u0627\u064b \u0648\u0643\u062a\u0644\u0629 \u0627\u0644\u0644\u064a\u0645\u0648\u0646 \u0627\u0644\u0645\u0637\u0644\u0648\u0628\u0629\u060c \u062b\u0645 \u064a\u062a\u0627\u0628\u0639\u0648\u0646 \u0628\u062d\u0633\u0627\u0628 \u0630\u0647\u0646\u064a \u0633\u0631\u064a\u0639 \u0628\u0627\u0633\u062a\u062e\u062f\u0627\u0645 \u0643\u0631\u0627\u0633\u0627\u062a\u0647\u0645."}, {"name": "\u0627\u0644\u0646\u0645\u0630\u062c\u0629", "duration": "15min", "icon": "\ud83d\udcca", "content": "\u064a\u0646\u062a\u0628\u0647 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0644\u0644\u0634\u0631\u062d \u062d\u0648\u0644 \u0643\u064a\u0641\u064a\u0629 \u062d\u0633\u0627\u0628 \u062c\u062f\u0627\u0621 \u0639\u062f\u062f \u0639\u0634\u0631\u064a \u0641\u064a \u0639\u062f\u062f \u0639\u0634\u0631\u064a\u060c \u062d\u064a\u062b \u064a\u0648\u0636\u062d \u0627\u0644\u0645\u0639\u0644\u0645 \u0627\u0644\u062e\u0637\u0648\u0627\u062a \u0627\u0644\u0644\u0627\u0632\u0645\u0629 \u0648\u064a\u0639\u0631\u0636 \u0641\u064a\u062f\u064a\u0648 \u064a\u0634\u0631\u062d \u0627\u0644\u0639\u0645\u0644\u064a\u0629."}, {"name": "\u0627\u0644\u0645\u0645\u0627\u0631\u0633\u0629 \u0627\u0644\u0645\u0648\u062c\u0647\u0629", "duration": "20min", "icon": "\u270f\ufe0f", "content": "\u064a\u0634\u0627\u0631\u0643 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0641\u064a \u0645\u0645\u0627\u0631\u0633\u0629 \u0645\u0648\u062c\u0647\u0629 \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0644 \u0645\u0633\u0627\u0626\u0644 \u0639\u0644\u0649 \u0627\u0644\u0623\u0644\u0648\u0627\u062d\u060c \u0648\u064a\u0637\u0628\u0642\u0648\u0646 \u0627\u0644\u062e\u0637\u0648\u0627\u062a \u0627\u0644\u062b\u0644\u0627\u062b \u0644\u062d\u0633\u0627\u0628 \u062c\u062f\u0627\u0621 \u0627\u0644\u0623\u0639\u062f\u0627\u062f \u0627\u0644\u0639\u0634\u0631\u064a\u0629\u060c \u0645\u0639 \u062a\u0635\u062d\u064a\u062d \u062c\u0645\u0627\u0639\u064a \u0644\u0644\u0646\u062a\u0627\u0626\u062c."}, {"name": "\u0627\u0644\u0645\u0645\u0627\u0631\u0633\u0629 \u0627\u0644\u0645\u0633\u062a\u0642\u0644\u0629", "duration": "15min", "icon": "\ud83d\udcdd", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0641\u064a \u0627\u0644\u0639\u0645\u0644 \u0628\u0634\u0643\u0644 \u0645\u0633\u062a\u0642\u0644 \u0639\u0644\u0649 \u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0641\u064a \u0643\u0631\u0627\u0633\u0627\u062a\u0647\u0645\u060c \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0644 \u0645\u0633\u0627\u0626\u0644 \u062a\u062a\u0639\u0644\u0642 \u0628\u062c\u062f\u0627\u0621 \u0627\u0644\u0623\u0639\u062f\u0627\u062f \u0627\u0644\u0639\u0634\u0631\u064a\u0629\u060c \u0645\u0639 \u0645\u0631\u0648\u0631 \u0627\u0644\u0645\u0639\u0644\u0645 \u0628\u064a\u0646 \u0627\u0644\u0635\u0641\u0648\u0641 \u0644\u062a\u0642\u062f\u064a\u0645 \u0627\u0644\u0645\u0633\u0627\u0639\u062f\u0629."}, {"name": "\u0627\u062e\u062a\u062a\u0627\u0645 \u0627\u0644\u062d\u0635\u0629", "duration": "5min", "icon": "\ud83d\udd1a", "content": "\u064a\u062e\u062a\u062a\u0645 \u0627\u0644\u0645\u0639\u0644\u0645 \u0627\u0644\u062d\u0635\u0629 \u0628\u062a\u0630\u0643\u064a\u0631 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u0625\u0646\u062c\u0627\u0632 \u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0627\u0644\u0645\u062a\u0628\u0642\u064a\u0629 \u0641\u064a \u0627\u0644\u0645\u0646\u0632\u0644\u060c \u0648\u064a\u0634\u062c\u0639\u0647\u0645 \u0639\u0644\u0649 \u0645\u0631\u0627\u062c\u0639\u0629 \u0645\u0627 \u062a\u0639\u0644\u0645\u0648\u0647 \u0627\u0633\u062a\u0639\u062f\u0627\u062f\u0627\u064b \u0644\u0644\u062d\u0635\u0629 \u0627\u0644\u0642\u0627\u062f\u0645\u0629."}], "title": "MATH N5 P3 SEM2 S1"}','','2026-02-26 10:46:11.927999','2026-02-26 10:49:07.499634',1);
INSERT INTO "raida_lesson" VALUES(100,'MATH N5 P3 SEM2 S2','mathématiques','5','3','2','2','MATH_N5_P3_SEM2_S2.pptx','......','
5 
الدرس 1

2
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
الدرس 6
قسمة عدد عشري على عدد صحيح طبيعي
درس اليوم

قسمة عدد عشري على عدد صحيح
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أتعرف وأوظف الاستراتيجية المناسبة لملء جدول تناسبية
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
ستستهلك الآلة 132 لترا من الماء خلال أسبوع
2 4
×   5, 5
1 2 0
1 2 0 .
1 3 2, 0
+
2
2
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 14.

عرض فيديو الحساب الذهني 
صححوا
70
0,128
840
0,194
630
0,782
940
0,659
370
1,73
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نضع وننجز قسمة عدد عشري على عدد صحيح
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
1: أَبْدَأُ بِقِسْمَةِ أَكْبَرِ مَنْزِلَةٍ وَأَحْسُبُ الباقي.
2 : أُنْزِلُ بِرَقْمِ المَنْزِلَةِ المُوالِيَةِ وَأُواصِلُ الْقِسْمَةَ وَلا أَنْسَى أَنْ أُنْزِلَ الْفاصِلَةَ عِنْدَمَا أُنْزِلُ الْأَعْشارَ.
3: أُكْمِلُ الْعَمَلِيَّةَ؛ 

(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا ألواحكم. 
ماذا نفعل في الخطوة الأولى؟ 
أبدا بقسمة
1
أكمل
3
أنزل
2
36,45 ÷ 5
ضعوا العملية على الألواح
أبدا بقسمة
1
أكمل
3
أنزل
2
36,45 ÷ 5
ارفعوا الألواح
نصحح
أبدا بقسمة
1
أكمل
3
أنزل
2
36,45 ÷ 5
3 6, 4 5
5
أنجزوا قسمة المنزلة الكبرى واحسبوا الباقي
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
ارفعوا الألواح
نصحح. من يشرح لنا كيف وصل إلى الجواب الصحيح
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
5
3 
-
0  
ماذا نفعل في الخطوة الثانية؟ 
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
5
3 
-
0  
على الألواح، أنزلوا الوحدات وأنجزوا القسمة واحسبوا الباقي من الوحدات
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
5
3 
-
0  
ارفعوا الألواح
نصحح، من يشرح لنا كيف وصل إلى الجواب الصحيح
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
5
3 6
-
 3 5
0 1 
-
0 7 
على الألواح، أنزلوا الأعشار وأنجزوا القسمة واحسبوا الباقي ولا تنسوا وضع الفاصلة
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
5
3 6
-
 3 5
0 1 
-
0 7 
ارفعوا الألواح
نصحح، من يشرح لنا كيف وصل إلى الجواب الصحيح
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
0 7, 2 
5
3 6
-
 3 5
0 1  4
-
1  0
0  4 
-
ماذا نفعل في الخطوة الثالثة؟ 
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
5
3 6
-
 3 5
0 1  4
-
1  0
0  4 
-
على الألواح، أكملوا العملية
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
5
3 6
-
 3 5
0 1  4
-
1  0
0  4 
-
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا وجد الجواب الصحيح
أبدا بقسمة
1
أكمل
3
أنزل
2
3 6, 4 5
5
0 7, 2 9
5
3 6
-
 3 5
0 1  4
-
1  0
0  4 5
4 5
0 0
-
-
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
على الألواح ضعوا وأنجزوا العملية التالية
15,27 ÷ 6
نصحح، من يقوم ليشرح لنا الخطوات
15,27 ÷ 6
1 5, 2 7
6
0 2, 5 4
0
1 5
-
1 2
0 3  2
-
2  0
0  2 7
2 4
0 3
-
-
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط 3 صفحة 22

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
1: أَبْدَأُ بِقِسْمَةِ أَكْبَرِ مَنْزِلَةٍ وَأَحْسُبُ الباقي.
2 : أُنْزِلُ بِرَقْمِ المَنْزِلَةِ المُوالِيَةِ وَأُواصِلُ الْقِسْمَةَ وَلا أَنْسَى أَنْ أُنْزِلَ الْفاصِلَةَ عِنْدَمَا أُنْزِلُ الْأَعْشارَ.
3: أُكْمِلُ الْعَمَلِيَّةَ؛ 

صححوا 
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 23 وأنجزوا النشاط 4. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ','{"subject": "\u0627\u0644\u0631\u064a\u0627\u0636\u064a\u0627\u062a", "level": "5", "period": "3", "week": "2", "session": "2", "objective": "\u064a\u062a\u0639\u0631\u0641 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0648\u064a\u0633\u062a\u062e\u062f\u0645\u0648\u0646 \u0627\u0644\u0627\u0633\u062a\u0631\u0627\u062a\u064a\u062c\u064a\u0629 \u0627\u0644\u0645\u0646\u0627\u0633\u0628\u0629 \u0644\u0645\u0644\u0621 \u062c\u062f\u0648\u0644 \u062a\u0646\u0627\u0633\u0628\u064a\u0629.", "steps": [{"name": "\u0627\u0644\u0627\u0641\u062a\u062a\u0627\u062d", "duration": "10min", "icon": "\ud83d\udcdd", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u062a\u0635\u062d\u064a\u062d \u0627\u0644\u0648\u0627\u062c\u0628\u0627\u062a \u0627\u0644\u0645\u0646\u0632\u0644\u064a\u0629\u060c \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0633\u0627\u0628 \u0630\u0647\u0646\u064a \u0633\u0631\u064a\u0639 \u0628\u0627\u0633\u062a\u062e\u062f\u0627\u0645 \u0643\u0631\u0627\u0633\u0627\u062a\u0647\u0645\u060c \u062b\u0645 \u064a\u062a\u0628\u0627\u062f\u0644\u0648\u0646 \u0627\u0644\u0646\u062a\u0627\u0626\u062c \u0645\u0639 \u0632\u0645\u0644\u0627\u0626\u0647\u0645."}, {"name": "\u0627\u0644\u0646\u0645\u0630\u062c\u0629", "duration": "15min", "icon": "\ud83d\udcca", "content": "\u064a\u0646\u062a\u0628\u0647 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0644\u0644\u0634\u0631\u062d \u0627\u0644\u0630\u064a \u064a\u0642\u062f\u0645\u0647 \u0627\u0644\u0645\u0639\u0644\u0645 \u062d\u0648\u0644 \u0643\u064a\u0641\u064a\u0629 \u0642\u0633\u0645\u0629 \u0639\u062f\u062f \u0639\u0634\u0631\u064a \u0639\u0644\u0649 \u0639\u062f\u062f \u0635\u062d\u064a\u062d\u060c \u062d\u064a\u062b \u064a\u0633\u062a\u0639\u0631\u0636 \u0627\u0644\u0645\u0639\u0644\u0645 \u062e\u0637\u0648\u0627\u062a \u0627\u0644\u0639\u0645\u0644\u064a\u0629 \u0648\u064a\u0639\u0631\u0636 \u0641\u064a\u062f\u064a\u0648 \u062a\u0648\u0636\u064a\u062d\u064a."}, {"name": "\u0627\u0644\u0645\u0645\u0627\u0631\u0633\u0629 \u0627\u0644\u0645\u0648\u062c\u0647\u0629", "duration": "20min", "icon": "\u270f\ufe0f", "content": "\u064a\u0634\u0627\u0631\u0643 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0641\u064a \u0646\u0634\u0627\u0637 \u0645\u0648\u062c\u0647 \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0644 \u0645\u0633\u0627\u0626\u0644 \u0642\u0633\u0645\u0629 \u0639\u062f\u062f \u0639\u0634\u0631\u064a \u0639\u0644\u0649 \u0639\u062f\u062f \u0635\u062d\u064a\u062d \u0628\u0627\u0633\u062a\u062e\u062f\u0627\u0645 \u0627\u0644\u0623\u0644\u0648\u0627\u062d\u060c \u0648\u064a\u062a\u0628\u0627\u062f\u0644\u0648\u0646 \u0627\u0644\u0646\u062a\u0627\u0626\u062c \u0645\u0639 \u0627\u0644\u0645\u0639\u0644\u0645 \u0648\u0632\u0645\u0644\u0627\u0626\u0647\u0645."}, {"name": "\u0627\u0644\u0645\u0645\u0627\u0631\u0633\u0629 \u0627\u0644\u0645\u0633\u062a\u0642\u0644\u0629", "duration": "15min", "icon": "\ud83d\udcd6", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u0627\u0644\u0639\u0645\u0644 \u0628\u0634\u0643\u0644 \u0645\u0633\u062a\u0642\u0644 \u0639\u0644\u0649 \u0643\u0631\u0627\u0633\u0627\u062a\u0647\u0645\u060c \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0644 \u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0627\u0644\u0645\u062e\u0635\u0635\u0629\u060c \u0648\u064a\u062a\u0623\u0643\u062f\u0648\u0646 \u0645\u0646 \u0627\u062a\u0628\u0627\u0639 \u0627\u0644\u062e\u0637\u0648\u0627\u062a \u0627\u0644\u0635\u062d\u064a\u062d\u0629\u060c \u0645\u0639 \u0625\u0645\u0643\u0627\u0646\u064a\u0629 \u0627\u0644\u062d\u0635\u0648\u0644 \u0639\u0644\u0649 \u0645\u0633\u0627\u0639\u062f\u0629 \u0645\u0646 \u0627\u0644\u0645\u0639\u0644\u0645."}, {"name": "\u0627\u062e\u062a\u062a\u0627\u0645 \u0627\u0644\u062d\u0635\u0629", "duration": "10min", "icon": "\ud83d\udd1a", "content": "\u064a\u062e\u062a\u062a\u0645 \u0627\u0644\u0645\u0639\u0644\u0645 \u0627\u0644\u062d\u0635\u0629 \u0628\u062a\u0630\u0643\u064a\u0631 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0627\u0644\u062a\u064a \u064a\u062c\u0628 \u0625\u0646\u062c\u0627\u0632\u0647\u0627 \u0641\u064a \u0627\u0644\u0645\u0646\u0632\u0644\u060c \u0648\u064a\u0634\u062c\u0639\u0647\u0645 \u0639\u0644\u0649 \u0645\u0631\u0627\u062c\u0639\u0629 \u0645\u0627 \u062a\u0639\u0644\u0645\u0648\u0647\u060c \u0648\u064a\u062d\u062f\u062f \u0645\u0648\u0639\u062f \u062a\u0635\u062d\u064a\u062d \u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0641\u064a \u0627\u0644\u062d\u0635\u0629 \u0627\u0644\u0642\u0627\u062f\u0645\u0629."}], "title": "MATH N5 P3 SEM2 S2"}','','2026-02-26 10:46:12.110974','2026-02-26 10:51:20.721389',1);
INSERT INTO "raida_lesson" VALUES(101,'MATH N5 P3 SEM2 S3','mathématiques','5','3','2','3','MATH_N5_P3_SEM2_S3.pptx','......','
5 
الدرس 1

2
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
الدرس 7
قسمة عدد صحيح على عدد صحيح  والخارج عشر
درس اليوم

قسمة عدد صحيح على عدد صحيح  والخارج عشر
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أجد الخارج العشري لقسمة عدد صحيح على عدد صحيح
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
سيحتاج إلى 26 قنينة.
25 قنينة ستكون مملوءة عن آخرها
والقنينة الأخيرة سيمتلئ جزء منها فقط
7
15,
2   4
8
6
0    2
0    1
128,5 ÷ 5 = 25,7
128,5
5
25,7
0
-
12
10
028
25
035
35
00
-
-
-
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 14.

عرض فيديو الحساب الذهني 
صححوا
35,5
0,992
98,5
0,205
61,2
0,805
80,4
0,4519
73,2
0,415
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نضع وننجز قسمة عدد صحيح على عدد صحيح والخارج عشري
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
1: أَبْدَأُ بِقِسْمَةِ الْجُزْءِ الصَّحيحِ وَأَحْسُبُ الباقي.
2 : إِذا كَانَتِ الْقِسْمَةُ غَيْرَ مَضْبوطَةٍ، أُواصِلُ الْقِسْمَةَ وَأُنْزِلُ بِالْأَصْفارِ في مَنْزِلاتِ الْجُزْءِ الْعَشَرِيِّ لِلْمَقْسومْ.
3: أُكْمِلُ الْعَمَلِيَّةَ؛ 

(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا ألواحكم. 
ماذا نفعل في الخطوة الأولى؟ 
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
36,45 ÷ 5
ضعوا العملية على الألواح
397 ÷ 4
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
ارفعوا الألواح
نصحح
3 9 7
4
397 ÷ 4
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
على الألواح، أنجزوا القسمة
3 9 7
4
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
ارفعوا الألواح
نصحح. من يشرح لنا كيف وصل إلى الجواب الصحيح
0
3 9 7
4
099
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
3 9
3 6
0 3 7
3 6
0 1
-
-
-
ماذا نفعل في الخطوة الثانية؟ 
0
3 9 7
4
099
3 9
3 6
0 3 7
3 6
0 1
-
-
-
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
على الألواح، أنزلوا صفر الأعشار ثم أنجزوا قسمة الأعشار
0
3 9 7
4
099
3 9
3 6
0 3 7
3 6
0 1
-
-
-
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
ارفعوا الألواح
نصحح، من يشرح لنا كيف وصل إلى الجواب الصحيح
0
3 9 7, 0
4
099,2
3 9
3 6
0 3 7
3 6
0 1 0
-
-
-
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
0 8
0 8
-
0 2
ماذا نفعل في الخطوة الثالثة؟ 
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
0
3 9 7, 0
4
099,2
3 9
3 6
0 3 7
3 6
0 1 0
-
-
-
0 8
0 8
-
0 2
على الألواح، أنزلوا صفر أجزاء المئة وأكملوا العملية
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
0
3 9 7, 0
4
099,2
3 9
3 6
0 3 7
3 6
0 1 0
-
-
-
0 8
-
0 2
ارفعوا الألواح
نصحح، من يقوم إلى السبورة ليشرح لنا وجد الجواب الصحيح
أبدا بقسمة
1
أكمل
3
أواصل القسمة
2
0
3 9 7, 0 0
4
099,25
3 9
3 6
0 3 7
3 6
0 1 0
-
-
-
0 8 
0 2 0
2 0
-
0 0
-
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
على الألواح ضعوا وأنجزوا العملية التالية
242 ÷ 8
نصحح، من يقوم ليشرح لنا الخطوات
2 4 2, 0 0
8
0 3 0, 2 5
0
2 4
-
2 4
0 0  2
-
0  0
0  2 0
1 6
0 4 0
-
-
242 ÷ 8
 4 0
 0 0
-
-
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط 4 صفحة 25

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
1: أَبْدَأُ بِقِسْمَةِ الْجُزْءِ الصَّحيحِ وَأَحْسُبُ الباقي.
2 : إِذا كَانَتِ الْقِسْمَةُ غَيْرَ مَضْبوطَةٍ، أُواصِلُ الْقِسْمَةَ وَأُنْزِلُ بِالْأَصْفارِ في مَنْزِلاتِ الْجُزْءِ الْعَشَرِيِّ لِلْمَقْسومْ.
3: أُكْمِلُ الْعَمَلِيَّةَ؛ 

صححوا 
3 2 4, 0 0
5
0
6 4 2, 0 0
8
064,8
080,25
3 2
3 0
0 2 4
2 0
0 4 0
4 0
0 0
-
-
-
-
0
6 4
0 0 2
0 0
0 2 0
1 6
0 4 0
4 0
0 0
-
-
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 25 وأنجزوا النشاط 5. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
3 8 7, 0 0
4
0
8 2 1, 0 0
5
096,75
164,2
3 8
3 6
0 2 7
0 3 0
0 2 0
-
-
-
-
5
3 2
3 0
0 2 1
0 1 0
1 0
0 0
-
-
7 5 9, 0 
6
6
126,5
1 5
1 2
0 3 9
3 6
0 3  0
0 0
-
-
-
-
3 0
2 4
2 8
2 0
0 0
2 0
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ','{"subject": "\u0627\u0644\u0631\u064a\u0627\u0636\u064a\u0627\u062a", "level": "5", "period": "3", "week": "2", "session": "3", "objective": "\u0623\u062c\u062f \u0627\u0644\u062e\u0627\u0631\u062c \u0627\u0644\u0639\u0634\u0631\u064a \u0644\u0642\u0633\u0645\u0629 \u0639\u062f\u062f \u0635\u062d\u064a\u062d \u0639\u0644\u0649 \u0639\u062f\u062f \u0635\u062d\u064a\u062d", "steps": [{"name": "\u0627\u0644\u0627\u0641\u062a\u062a\u0627\u062d", "duration": "10min", "icon": "\ud83d\udcdd", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u062a\u0635\u062d\u064a\u062d \u0627\u0644\u0648\u0627\u062c\u0628\u0627\u062a \u0627\u0644\u0645\u0646\u0632\u0644\u064a\u0629\u060c \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0633\u0627\u0628 \u0630\u0647\u0646\u064a \u0633\u0631\u064a\u0639 \u0648\u064a\u0643\u062a\u0628\u0648\u0646 \u0627\u0644\u0646\u062a\u0627\u0626\u062c \u0639\u0644\u0649 \u0623\u0644\u0648\u0627\u062d\u0647\u0645 \u062b\u0645 \u064a\u0635\u062d\u062d\u0648\u0646 \u0628\u0634\u0643\u0644 \u062c\u0645\u0627\u0639\u064a."}, {"name": "\u0627\u0644\u0646\u0645\u0630\u062c\u0629", "duration": "15min", "icon": "\ud83d\udcca", "content": "\u064a\u0646\u062a\u0628\u0647\u0648\u0646 \u0644\u0644\u0634\u0631\u062d \u062d\u0648\u0644 \u0643\u064a\u0641\u064a\u0629 \u0625\u062c\u0631\u0627\u0621 \u0642\u0633\u0645\u0629 \u0639\u062f\u062f \u0635\u062d\u064a\u062d \u0639\u0644\u0649 \u0639\u062f\u062f \u0635\u062d\u064a\u062d \u0648\u0627\u0644\u062e\u0627\u0631\u062c \u0639\u0634\u0631\u064a\u060c \u062d\u064a\u062b \u064a\u0633\u062a\u0645\u0639\u0648\u0646 \u0625\u0644\u0649 \u062e\u0637\u0648\u0627\u062a \u0627\u0644\u0639\u0645\u0644\u064a\u0629 \u0627\u0644\u062a\u064a \u064a\u0648\u0636\u062d\u0647\u0627 \u0627\u0644\u0645\u0639\u0644\u0645."}, {"name": "\u0627\u0644\u0645\u0645\u0627\u0631\u0633\u0629 \u0627\u0644\u0645\u0648\u062c\u0647\u0629", "duration": "20min", "icon": "\u270f\ufe0f", "content": "\u064a\u0634\u0627\u0631\u0643 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0641\u064a \u0645\u0645\u0627\u0631\u0633\u0629 \u0645\u0648\u062c\u0647\u0629 \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0644 \u0645\u0633\u0627\u0626\u0644 \u0642\u0633\u0645\u0629 \u0639\u0644\u0649 \u0623\u0644\u0648\u0627\u062d\u0647\u0645\u060c \u0648\u064a\u0642\u0648\u0645 \u0627\u0644\u0645\u0639\u0644\u0645 \u0628\u062a\u0648\u062c\u064a\u0647\u0647\u0645 \u062e\u0644\u0627\u0644 \u0627\u0644\u062e\u0637\u0648\u0627\u062a \u0648\u064a\u0635\u062d\u062d \u0645\u0639\u0647\u0645 \u0627\u0644\u0646\u062a\u0627\u0626\u062c."}, {"name": "\u0627\u0644\u0645\u0645\u0627\u0631\u0633\u0629 \u0627\u0644\u0645\u0633\u062a\u0642\u0644\u0629", "duration": "15min", "icon": "\ud83d\udcdd", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u0627\u0644\u0639\u0645\u0644 \u0628\u0634\u0643\u0644 \u0645\u0633\u062a\u0642\u0644 \u0639\u0644\u0649 \u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0641\u064a \u0643\u0631\u0627\u0633\u0627\u062a\u0647\u0645\u060c \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0644 \u0645\u0633\u0627\u0626\u0644 \u0642\u0633\u0645\u0629 \u0648\u064a\u0642\u0627\u0631\u0646\u0648\u0646 \u0625\u0646\u062c\u0627\u0632\u0627\u062a\u0647\u0645 \u0645\u0639 \u0632\u0645\u0644\u0627\u0626\u0647\u0645."}, {"name": "\u0627\u062e\u062a\u062a\u0627\u0645 \u0627\u0644\u062d\u0635\u0629", "duration": "5min", "icon": "\ud83d\udd1a", "content": "\u064a\u0634\u0627\u0631\u0643 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0641\u064a \u0627\u062e\u062a\u062a\u0627\u0645 \u0627\u0644\u062d\u0635\u0629 \u062d\u064a\u062b \u064a\u0633\u062a\u0639\u0631\u0636 \u0627\u0644\u0645\u0639\u0644\u0645 \u0645\u0627 \u062a\u0645 \u062a\u0639\u0644\u0645\u0647\u060c \u0648\u064a\u0630\u0643\u0631\u0647\u0645 \u0628\u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0627\u0644\u062a\u064a \u064a\u062c\u0628 \u0625\u0646\u062c\u0627\u0632\u0647\u0627 \u0641\u064a \u0627\u0644\u0645\u0646\u0632\u0644."}], "title": "MATH N5 P3 SEM2 S3"}','','2026-02-26 10:46:12.302051','2026-02-26 10:51:29.099631',1);
INSERT INTO "raida_lesson" VALUES(102,'MATH N5 P3 SEM2 S4','mathématiques','5','3','2','4','MATH_N5_P3_SEM2_S4.pptx','......','
5 
الدرس 1

2
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
الدرس 8
حل المسائل
درس اليوم

حل مسائل وضعية مقارنة ضربية
(ة)خاص بالأستاذ 
(ة)خاص بالأستاذ 
مراحل الدرس
            اختتام الدرس
          افتتاح الدرس
           نمذجة
           ممارسة موجهة
           ممارسة مستقلة
1
2
3
4
5
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
أحل مسائل وضعية مقارنة ضربية
مرحباً سنتابع درسا جديدا
(ة)خاص بالأستاذ 
صححوا. لديكم دقيقة واحدة
مبلغ التوفير الشهري هو 45,5 درهما
546,0
12
45,5
48
-
60
60
00
-
-
060
066
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 14.

عرض فيديو الحساب الذهني 
صححوا
895
0,878
997
0,902
232
0,745
831
0,482
886
0,72
(ة)خاص بالأستاذ 
الآن سنتعلم كيف نحل مسألة وضعية مقارنة ضربية
عرض فيديو النمذجة 
من يذكرنا بما تعلمناه؟
1- أَفْهَمُ ٱلْمَسْأَلَةَ وَأُُحَدِّدُ ما أَبْحَثُ عَنْهُ ؛
2- أُمَثِّلُ مُعْطَياتِ ٱلْمَسْأَلَةِ بِاسْتِعْمالِ النَّموذَجِ الخاصِّ بِوَضْعِياتِ مُقارَنَةِ الضَّرْبِيَّةِ؛
3- أَسْتَنْتِجُ مُتَساويَةَ ٱلْحَلِّ ؛
4- أَكْتُبُ عِبارَةَ ٱلْحَلِّ.
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة 
3
النشاط 2
النشاط 3
خذوا ألواحكم. 
 ماذا نفعل في الخطوة الأولى؟ 
أقرأ المسألة
1
أستنتج
3
أمثل
2
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
أكتب
4
 اقرؤوا المسألة واكتبوا اسم صاحب القيمة الصغرى على الألواح
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
حُسامٌ
فَرِيدٌ
من يقول لنا كيف حدد القيمة الصغرى؟
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
حُسامٌ
فَرِيدٌ

ماذا نفعل في الخطوة الثانية؟ 
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
مثلوا على الألواح ما يملكه حسام وفريد باستعمال نموذج الأشرطة
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح كيف مثل المسألة
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
؟
؟
؟
حسام
فريد
مثلوا على الألواح مَجْموعَ الْقيمَتَيْنِ 
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
؟
؟
؟
حسام
فريد
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليشرح كيف مثل المجموع
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
؟
؟
؟
حسام
فريد

72
ماذا نفعل في الخطوة الثالثة؟ 
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
؟
؟
؟
حسام
فريد

72
على الألواح، اكتبوا المتساوية لحساب قيمة حسام
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
؟
؟
؟
حسام
فريد

72
ارفعوا الألواح
نصحح. من يشرح كيف استنتج المتساوية
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
72 ÷ 3 = 24
؟
؟
؟
حسام
فريد

72
على الألواح، اكتبوا المتساوية لحساب قيمة فريد
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
72 ÷ 3 = 24
؟
؟
؟
حسام
فريد

72
ارفعوا الألواح
نصحح. من يشرح كيف استنتج المتساوية
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
72 ÷ 3 = 24
؟
؟
؟
حسام
فريد

72
24 × 2 = 48
ماذا نفعل في الخطوة الرابعة؟ 
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
72 ÷ 3 = 24
؟
؟
؟
حسام
فريد

72
24 × 2 = 48
على الألواح، اكتبوا عبارتي الحل
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
72 ÷ 3 = 24
؟
؟
؟
حسام
فريد

72
24 × 2 = 48
ارفعوا الألواح
نصحح. من يقوم إلى السبورة ليمثل الخطوة الثانية ويحل المسألة؟
أقرأ المسألة
1
أستنتج
3
أمثل
2
أكتب
4
يَمْلِكُ فَرِيدٌ ضِعْفَ ما يَمْلِكُهُ حُسامٌ مِنَ الْكُتُبِ. وَضَعَ حُسامٌ وَفَرِيدٌ كُتُبَهُما عَلَى رَفٍّ، فَبَلَغَ عَدَدُها 72 كِتابًا.كَمْ عَدَدُ كُتُبِ حُسامٍ؟ وَكَمْ عَدَدُ كُتُبِ فَرِيدٍ؟
72 ÷ 3 = 24
لدى حسام 24 كتابا
؟
؟
؟
حسام
فريد

72
24 × 2 = 48
لدى فريد 48 كتابا
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
على الكراسات أنجزوا النشاط رقم 2 صفحة 26
نصحح، من يقوم ليشرح لنا الخطوات
؟
؟
؟
ياسر
إسراء

36
؟
36 ÷ 4 = 9
قطع ياسر 9 كيلومترات
9 × 3 = 27
قطعت إسراء 27 كيلومترا
(ة)خاص بالأستاذ 

 الممارسة الموجهة 1
3
النشاط 1
3
 ممارسة موجهة
3
النشاط 2
النشاط 3
الآن خذوا كراساتكم الصفحة النشاط 1 صفحة 26

لديكم دقيقتان  للإنجاز؛ سأمر بين الصفوف لمساعدتكم؛
كل واحد يقارن إنجازه مع إنجاز زميله. تأكدوا أنكم اتبعتم الخطوات بشكل سليم. 
الآن؛ ستشتغلون في ثنائيات 
1- أَفْهَمُ ٱلْمَسْأَلَةَ وَأُُحَدِّدُ ما أَبْحَثُ عَنْهُ ؛
2- أُمَثِّلُ مُعْطَياتِ ٱلْمَسْأَلَةِ بِاسْتِعْمالِ النَّموذَجِ الخاصِّ بِوَضْعِياتِ مُقارَنَةِ الضَّرْبِيَّةِ؛
3- أَسْتَنْتِجُ مُتَساويَةَ ٱلْحَلِّ ؛
4- أَكْتُبُ عِبارَةَ ٱلْحَلِّ.
صححوا 
72 ÷ 3 = 24
لدى حسام 24 كلة
72
24 × 2 = 48
لدى فريد 48 كلة
(ة)خاص بالأستاذ 
خذوا الكراسات صفحة 27 وأنجزوا النشاط 3. لديكم 5 دقائق
سأمر بين الصفوف لأقدم  المساعدة إليكم وأدون ملاحظاتي في كراساتكم

صححوا على كراساتكم 
؟
؟
؟
دعاء
رضى

180
؟
180 ÷ 4 = 45
أدت دعاء 45 درهما
45 × 3 = 135
أدى رضى 135 درهما
انتبهوا جيدا!  في المنزل، ستنجزون الأنشطة المتبقية على كراساتكم :
 في الحصة القادمة سأختار أحدكم لتصحيح  النشاط. 
إلى اللقاء. في الحصة القادمة، سنقوم بتصحيح الأنشطة المنجزة في المنزل. 
بناء على إنجازات المتعلمين خلال الممارسة المستقلة ','{"subject": "math\u00e9matiques", "level": "5", "period": "3", "week": "2", "session": "4", "objective": "\u062d\u0644 \u0645\u0633\u0627\u0626\u0644 \u0648\u0636\u0639\u064a\u0629 \u0645\u0642\u0627\u0631\u0646\u0629 \u0636\u0631\u0628\u064a\u0629", "steps": [{"name": "\u0627\u0644\u0627\u0641\u062a\u062a\u0627\u062d", "duration": "10min", "icon": "\ud83d\udcdd", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u062a\u0635\u062d\u064a\u062d \u0627\u0644\u0648\u0627\u062c\u0628\u0627\u062a \u0627\u0644\u0645\u0646\u0632\u0644\u064a\u0629\u060c \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0633\u0627\u0628 \u0630\u0647\u0646\u064a \u0633\u0631\u064a\u0639 \u0628\u0627\u0633\u062a\u062e\u062f\u0627\u0645 \u0643\u0631\u0627\u0633\u0627\u062a\u0647\u0645. \u0628\u0639\u062f \u0630\u0644\u0643\u060c \u064a\u0631\u0627\u062c\u0639\u0648\u0646 \u0645\u0639 \u0627\u0644\u0645\u0639\u0644\u0645 \u0627\u0644\u0646\u062a\u0627\u0626\u062c \u0648\u064a\u0635\u062d\u062d\u0648\u0646 \u0627\u0644\u0623\u062e\u0637\u0627\u0621 \u0628\u0634\u0643\u0644 \u062c\u0645\u0627\u0639\u064a."}, {"name": "\u0627\u0644\u0646\u0645\u0630\u062c\u0629", "duration": "15min", "icon": "\ud83d\udcca", "content": "\u064a\u0646\u062a\u0628\u0647 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0644\u0644\u0634\u0631\u062d \u0627\u0644\u0630\u064a \u064a\u0642\u062f\u0645\u0647 \u0627\u0644\u0645\u0639\u0644\u0645 \u062d\u0648\u0644 \u0643\u064a\u0641\u064a\u0629 \u062d\u0644 \u0645\u0633\u0627\u0626\u0644 \u0648\u0636\u0639\u064a\u0629 \u0645\u0642\u0627\u0631\u0646\u0629 \u0636\u0631\u0628\u064a\u0629. \u064a\u0633\u062a\u0639\u0631\u0636 \u0627\u0644\u0645\u0639\u0644\u0645 \u062e\u0637\u0648\u0627\u062a \u0627\u0644\u062d\u0644 \u0648\u064a\u0639\u0631\u0636 \u0641\u064a\u062f\u064a\u0648 \u064a\u0648\u0636\u062d \u0627\u0644\u0646\u0645\u0630\u062c\u0629 \u0627\u0644\u0645\u0637\u0644\u0648\u0628\u0629."}, {"name": "\u0627\u0644\u0645\u0645\u0627\u0631\u0633\u0629 \u0627\u0644\u0645\u0648\u062c\u0647\u0629", "duration": "20min", "icon": "\u270f\ufe0f", "content": "\u064a\u0634\u0627\u0631\u0643 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0641\u064a \u0646\u0634\u0627\u0637 \u0645\u0648\u062c\u0647 \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u0642\u0631\u0627\u0621\u0629 \u0627\u0644\u0645\u0633\u0623\u0644\u0629\u060c \u062b\u0645 \u064a\u0633\u062a\u0646\u062a\u062c\u0648\u0646 \u0648\u064a\u0643\u062a\u0628\u0648\u0646 \u0627\u0644\u062d\u0644\u0648\u0644 \u0639\u0644\u0649 \u0627\u0644\u0623\u0644\u0648\u0627\u062d. \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062a\u0645\u062b\u064a\u0644 \u0627\u0644\u0645\u0639\u0637\u064a\u0627\u062a \u0628\u0627\u0633\u062a\u062e\u062f\u0627\u0645 \u0646\u0645\u0648\u0630\u062c \u0627\u0644\u0623\u0634\u0631\u0637\u0629\u060c \u0648\u064a\u0634\u0631\u062d\u0648\u0646 \u0643\u064a\u0641\u064a\u0629 \u0627\u0644\u0648\u0635\u0648\u0644 \u0625\u0644\u0649 \u0627\u0644\u062d\u0644."}, {"name": "\u0627\u0644\u0645\u0645\u0627\u0631\u0633\u0629 \u0627\u0644\u0645\u0633\u062a\u0642\u0644\u0629", "duration": "15min", "icon": "\ud83d\udd8d\ufe0f", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0641\u064a \u0625\u0646\u062c\u0627\u0632 \u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0627\u0644\u0645\u0633\u062a\u0642\u0644\u0629 \u0639\u0644\u0649 \u0643\u0631\u0627\u0633\u0627\u062a\u0647\u0645\u060c \u062d\u064a\u062b \u064a\u0639\u0645\u0644\u0648\u0646 \u0641\u064a \u062b\u0646\u0627\u0626\u064a\u0627\u062a \u0644\u0645\u0642\u0627\u0631\u0646\u0629 \u0625\u0646\u062c\u0627\u0632\u0627\u062a\u0647\u0645. \u064a\u0642\u0648\u0645 \u0627\u0644\u0645\u0639\u0644\u0645 \u0628\u0627\u0644\u0645\u0631\u0648\u0631 \u0628\u064a\u0646 \u0627\u0644\u0635\u0641\u0648\u0641 \u0644\u062a\u0642\u062f\u064a\u0645 \u0627\u0644\u0645\u0633\u0627\u0639\u062f\u0629 \u0648\u062a\u062f\u0648\u064a\u0646 \u0627\u0644\u0645\u0644\u0627\u062d\u0638\u0627\u062a."}, {"name": "\u0627\u062e\u062a\u062a\u0627\u0645 \u0627\u0644\u062d\u0635\u0629", "duration": "5min", "icon": "\ud83d\udcc5", "content": "\u064a\u062e\u062a\u062a\u0645 \u0627\u0644\u0645\u0639\u0644\u0645 \u0627\u0644\u062d\u0635\u0629 \u0628\u062a\u0630\u0643\u064a\u0631 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u0625\u0646\u062c\u0627\u0632 \u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0627\u0644\u0645\u062a\u0628\u0642\u064a\u0629 \u0641\u064a \u0627\u0644\u0645\u0646\u0632\u0644\u060c \u0648\u064a\u0634\u062c\u0639\u0647\u0645 \u0639\u0644\u0649 \u0645\u0631\u0627\u062c\u0639\u0629 \u0645\u0627 \u062a\u0639\u0644\u0645\u0648\u0647. \u064a\u0648\u0636\u062d \u0644\u0647\u0645 \u0623\u0646\u0647 \u0633\u064a\u062a\u0645 \u062a\u0635\u062d\u064a\u062d \u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0641\u064a \u0627\u0644\u062d\u0635\u0629 \u0627\u0644\u0642\u0627\u062f\u0645\u0629."}], "title": "MATH N5 P3 SEM2 S4"}','','2026-02-26 10:46:12.487303','2026-02-26 10:52:26.435574',1);
INSERT INTO "raida_lesson" VALUES(103,'MATH N5 P3 SEM2 S5','mathématiques','5','3','2','5','MATH_N5_P3_SEM2_S5.pptx','......','
5 
الدرس 1

2
3
أيقونات توجيهية
توجيهات الأستاذ(ة)
عرض فيديو 
تعيين تلميذ للإجابة 
المرور للشريحة الموالية بعد عرض الفيديو
العمل في ثنائيات 
المرور بين   الصفوف
برمجة الأسبوع الثاني
(ة)خاص بالأستاذ 
مراجعة
مراجعة وتثبيت دروس الأسبوع
(ة)خاص بالأستاذ 
درس اليوم

مراجعة دروس الأسبوع

تدابير حصة المراجعة  الأسبوع
(ة)خاص بالأستاذ 
مراجعة كل درس تتم عبر المراحل التالية : 
رائز التحقق من الهدف الرئيسي للدرس
احتساب نسبة التحكم
أقل من 80%
أكبر من 80%
إعادة عرض شريط النمذجة 
المرور مباشرة للتدرب على الكراسة
إنجاز نشاط مراجعة الدرس على الكراسة
(ة)خاص بالأستاذ 
مراحل الدرس
1
(ة)خاص بالأستاذ 
على الأقل 80% من المتعلمين سيكونون قادرين على: 
عند نهاية الدرس
حساب جداء عددين عشريين 
وضع وإنجاز قسمة عدد عشري على عدد صحيح
وضع وإنجاز قسمة عدد صحيح على عدد صحيح والخارج عشري
حل مسائل وضعيات مقارنة ضربية
(ة)خاص بالأستاذ 
صححوا، لديكم دقيقة واحدة
(ة)خاص بالأستاذ 
سنبدأ بالحساب الذهني. خذوا كراسات الحساب الذهني صفحة 13.

لديكم دقيقة واحدة لحل هذه العمليات. 
1

1
 لديكم دقيقة واحدة للتصحيح.
897 500
0,98712
4 375
58 650
0,00912
0,035
(ة)خاص بالأستاذ 

حساب جداء عددين عشريين 
مراجعة الدرس 1
2
على الألواح أنجزوا  العملية من النشاط 1 صفحة 18

ارفعوا الألواح
نصحح.
6 5, 2
×   6, 7
4 5 6 4
3 9 1 2 .
4 3 6, 8 4
+
3
3
1
1
يعيد الأستاذ النمذجة على السبورة حسب الحاجة
أنجزوا العملية الموالية على الألواح
6 5, 2
×   6, 7
4 5 6 4
3 9 1 2 .
4 3 6, 8 4
+

3
3
1
1
ارفعوا الألواح
 صححوا. 
6 5, 2
×   6, 7
4 5 6 4
3 9 1 2 .
4 3 6, 8 4
+
3
3
1
1
8, 6
×  7, 1 4
3 4 4
8 6  .
6 1, 4 0 4
+
2
4
6 0 2 .  .
+
(ة)خاص بالأستاذ 

وضع وإنجاز قسمة عدد عشري على 
عدد صحيح
مراجعة الدرس 2
2
1

1
على الألواح أنجزوا  العملية من النشاط 2 صفحة 18

ارفعوا الألواح
1

1
نصحح
2 9 4,4
8
036,8
0
-
2 4
0 5 4
0 6 4
6 4
0 0
-
-
-
2 9
4 8 
يعيد الأستاذ النمذجة على السبورة 
1

2
أنجزوا العملية التالية من النشاط 2
2 9 4,4
8
036,8
0
-
2 4
0 5 4
0 6 4
6 4
0 0
-
-
-
2 9
4 8 

ارفعوا الألواح
صححوا
1

1
2 9 4,4
8
036,8
0
-
2 4
0 5 4
0 6 4
6 4
0 0
-
-
-
2 9
4 8 
2 5 9, 8
6
043,3
0
-
2 4
0 1 9
0 1 8
0 0
-
-
-
2 5
1 8
1 8
(ة)خاص بالأستاذ 

وضع وإنجاز قسمة عدد صحيح على 
عدد صحيح والخارج عشري
مراجعة الدرس 3
2
1

4
على الألواح أنجزوا  العملية من النشاط 3 صفحة 18

ارفعوا الألواح
1

2
 صححوا. من يقوم إلى السبورة ليشرح الجواب ويذكر بالقاعدة
4 7 8, 0 0
8
0
059,75
4 7
4 0
0 7 8
0 6  0
0 4 0
-
-
-
-
7 2
5 6
4 0
0 0
يعيد الأستاذ النمذجة على السبورة 
1

2
على الألواح أنجزوا  العملية من النشاط 3 صفحة 18

4 7 8, 0 0
8
0
059,75
4 7
4 0
0 7 8
0 6  0
0 4 0
-
-
-
-
7 2
5 6
4 0
0 0
ارفعوا الألواح
1

2
نصحح
4 7 8, 0 0
8
0
059,75
4 7
4 0
0 7 8
0 6  0
0 4 0
-
-
-
-
7 2
5 6
4 0
0 0
2 6 1, 0
6
0
043,5
2 6
2 4
0 2 1
0 3 0
-
-
-
-
3 0
1 8
0 0
(ة)خاص بالأستاذ 

حل مسائل وضعيات مقارنة ضربية
مراجعة الدرس 4
2
1

4
على الألواح ارسموا التمثيل المناسب لحل المسألة
ثمن قميص وسروال هو 360 درهما. ثمن السروال يساوي ضعف ثمن القميص.
ما ثمن القميص؟ 
ما ثمن السروال؟
ارفعوا الألواح
1

2
 صححوا. من يقوم إلى السبورة ليشرح لنا كيف مثل المسألة
؟
؟
؟
القميص
السروال

360
ثمن قميص وسروال هو 360 درهما. ثمن السروال يساوي ضعف ثمن القميص.
ما ثمن القميص؟ 
ما ثمن السروال؟
1

4
على الألواح احسبوا ثمن القميص
ثمن قميص وسروال هو 360 درهما. ثمن السروال يساوي ضعف ثمن القميص.
ما ثمن القميص؟ 
ما ثمن السروال؟
؟
؟
؟
القميص
السروال

360
1- ثمن القميص هو : 
ارفعوا الألواح
1

2
 صححوا. من يقوم إلى السبورة ليشرح لنا كيف وجد النتيجة
ثمن قميص وسروال هو 360 درهما. ثمن السروال يساوي ضعف ثمن القميص.
ما ثمن القميص؟ 
ما ثمن السروال؟
؟
؟
؟
القميص
السروال

360
1- ثمن القميص هو : 120 درهما 
360 ÷ 3 = 120
1

4
على الألواح احسبوا ثمن السروال
ثمن قميص وسروال هو 360 درهما. ثمن السروال يساوي ضعف ثمن القميص.
ما ثمن القميص؟ 
ما ثمن السروال؟
؟
؟
؟
القميص
السروال

360
1- ثمن القميص هو : 120 درهما 
360 ÷ 3 = 120
2- ثمن السروال هو :
ارفعوا الألواح
1

2
 صححوا. من يقوم إلى السبورة ليشرح لنا كيف وجد النتيجة
ثمن قميص وسروال هو 360 درهما. ثمن السروال يساوي ضعف ثمن القميص.
ما ثمن القميص؟ 
ما ثمن السروال؟
؟
؟
؟
القميص
السروال

360
1- ثمن القميص هو : 120 درهما 
360 ÷ 3 = 120
2- ثمن السروال هو : 240 درهما 
120 × 2 = 240
من يقوم إلى السبورة لعيد حل المسألة 
(ة)خاص بالأستاذ 

اختتام الحصة
3

الواجبات المنزلية

في المنزل، أنجزوا جميع الأنشطة المتبقية الصفحتين  28 و29
إلى اللقاء. في الحصة القادمة،','{"subject": "math\u00e9matiques", "level": "5", "period": "3", "week": "2", "session": "5", "objective": "\u062d\u0633\u0627\u0628 \u062c\u062f\u0627\u0621 \u0639\u062f\u062f\u064a\u0646 \u0639\u0634\u0631\u064a\u064a\u0646 \u0648\u0648\u0636\u0639 \u0648\u0625\u0646\u062c\u0627\u0632 \u0642\u0633\u0645\u0629 \u0639\u062f\u062f \u0639\u0634\u0631\u064a \u0639\u0644\u0649 \u0639\u062f\u062f \u0635\u062d\u064a\u062d", "steps": [{"name": "\u0627\u0641\u062a\u062a\u0627\u062d \u0627\u0644\u062f\u0631\u0633", "duration": "10min", "icon": "\ud83d\udcdd", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u062a\u0635\u062d\u064a\u062d \u0627\u0644\u0648\u0627\u062c\u0628\u0627\u062a \u0627\u0644\u0645\u0646\u0632\u0644\u064a\u0629\u060c \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0644 \u0627\u0644\u0639\u0645\u0644\u064a\u0627\u062a \u0627\u0644\u062d\u0633\u0627\u0628\u064a\u0629 \u0627\u0644\u0630\u0647\u0646\u064a\u0629 \u0645\u0646 \u0635\u0641\u062d\u0629 13 \u0641\u064a \u0643\u0631\u0627\u0633\u0627\u062a\u0647\u0645. \u0628\u0639\u062f \u062f\u0642\u064a\u0642\u0629 \u0645\u0646 \u0627\u0644\u062d\u0644\u060c \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062a\u0635\u062d\u064a\u062d \u0627\u0644\u0646\u062a\u0627\u0626\u062c \u0628\u0634\u0643\u0644 \u062c\u0645\u0627\u0639\u064a."}, {"name": "\u0645\u0631\u0627\u062c\u0639\u0629 \u0627\u0644\u062f\u0631\u0633 1", "duration": "15min", "icon": "\ud83d\udcda", "content": "\u064a\u0634\u0627\u0631\u0643 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0641\u064a \u0645\u0631\u0627\u062c\u0639\u0629 \u0627\u0644\u062f\u0631\u0633 \u0627\u0644\u0623\u0648\u0644 \u0645\u0646 \u062e\u0644\u0627\u0644 \u0625\u0646\u062c\u0627\u0632 \u0627\u0644\u0639\u0645\u0644\u064a\u0627\u062a \u0639\u0644\u0649 \u0627\u0644\u0623\u0644\u0648\u0627\u062d. \u064a\u0631\u0641\u0639\u0648\u0646 \u0627\u0644\u0623\u0644\u0648\u0627\u062d \u0628\u0639\u062f \u0643\u0644 \u0639\u0645\u0644\u064a\u0629 \u0644\u062a\u0635\u062d\u064a\u062d\u0647\u0627 \u0645\u0639 \u0627\u0644\u0623\u0633\u062a\u0627\u0630\u060c \u0627\u0644\u0630\u064a \u064a\u0639\u064a\u062f \u0627\u0644\u0646\u0645\u0630\u062c\u0629 \u062d\u0633\u0628 \u0627\u0644\u062d\u0627\u062c\u0629."}, {"name": "\u0645\u0631\u0627\u062c\u0639\u0629 \u0627\u0644\u062f\u0631\u0633 2", "duration": "15min", "icon": "\ud83d\udcd6", "content": "\u064a\u0642\u0648\u0645 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u0645\u0631\u0627\u062c\u0639\u0629 \u0627\u0644\u062f\u0631\u0633 \u0627\u0644\u062b\u0627\u0646\u064a\u060c \u062d\u064a\u062b \u064a\u0646\u062c\u0632\u0648\u0646 \u0627\u0644\u0639\u0645\u0644\u064a\u0627\u062a \u0645\u0646 \u0627\u0644\u0646\u0634\u0627\u0637 2 \u0639\u0644\u0649 \u0627\u0644\u0623\u0644\u0648\u0627\u062d. \u0628\u0639\u062f \u0627\u0644\u0627\u0646\u062a\u0647\u0627\u0621\u060c \u064a\u0631\u0641\u0639\u0648\u0646 \u0627\u0644\u0623\u0644\u0648\u0627\u062d \u0644\u062a\u0635\u062d\u064a\u062d \u0627\u0644\u0646\u062a\u0627\u0626\u062c \u0645\u0639 \u0627\u0644\u0623\u0633\u062a\u0627\u0630 \u0627\u0644\u0630\u064a \u064a\u0639\u064a\u062f \u0627\u0644\u0646\u0645\u0630\u062c\u0629 \u0625\u0630\u0627 \u0644\u0632\u0645 \u0627\u0644\u0623\u0645\u0631."}, {"name": "\u0645\u0631\u0627\u062c\u0639\u0629 \u0627\u0644\u062f\u0631\u0633 3", "duration": "15min", "icon": "\ud83d\udcdd", "content": "\u064a\u0628\u062f\u0623 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u0645\u0631\u0627\u062c\u0639\u0629 \u0627\u0644\u062f\u0631\u0633 \u0627\u0644\u062b\u0627\u0644\u062b\u060c \u062d\u064a\u062b \u064a\u0642\u0648\u0645\u0648\u0646 \u0628\u062d\u0644 \u0627\u0644\u0639\u0645\u0644\u064a\u0627\u062a \u0645\u0646 \u0627\u0644\u0646\u0634\u0627\u0637 3 \u0639\u0644\u0649 \u0627\u0644\u0623\u0644\u0648\u0627\u062d. \u0628\u0639\u062f \u0627\u0644\u062a\u0635\u062d\u064a\u062d\u060c \u064a\u0642\u0648\u0645 \u0623\u062d\u062f \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0628\u0634\u0631\u062d \u0627\u0644\u062c\u0648\u0627\u0628 \u0639\u0644\u0649 \u0627\u0644\u0633\u0628\u0648\u0631\u0629."}, {"name": "\u0645\u0631\u0627\u062c\u0639\u0629 \u0627\u0644\u062f\u0631\u0633 4", "duration": "15min", "icon": "\ud83d\udcca", "content": "\u064a\u0634\u0627\u0631\u0643 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0641\u064a \u0645\u0631\u0627\u062c\u0639\u0629 \u0627\u0644\u062f\u0631\u0633 \u0627\u0644\u0631\u0627\u0628\u0639 \u0645\u0646 \u062e\u0644\u0627\u0644 \u0631\u0633\u0645 \u0627\u0644\u062a\u0645\u062b\u064a\u0644 \u0627\u0644\u0645\u0646\u0627\u0633\u0628 \u0644\u062d\u0644 \u0627\u0644\u0645\u0633\u0623\u0644\u0629 \u0627\u0644\u0645\u0639\u0637\u0627\u0629. \u0628\u0639\u062f \u0630\u0644\u0643\u060c \u064a\u0631\u0641\u0639\u0648\u0646 \u0627\u0644\u0623\u0644\u0648\u0627\u062d \u0644\u062a\u0635\u062d\u064a\u062d \u0627\u0644\u062d\u0644\u0648\u0644 \u0645\u0639 \u0627\u0644\u0623\u0633\u062a\u0627\u0630."}, {"name": "\u0627\u062e\u062a\u062a\u0627\u0645 \u0627\u0644\u062d\u0635\u0629", "duration": "5min", "icon": "\ud83d\udcc5", "content": "\u064a\u062e\u062a\u062a\u0645 \u0627\u0644\u0623\u0633\u062a\u0627\u0630 \u0627\u0644\u062d\u0635\u0629 \u0628\u062a\u0648\u062c\u064a\u0647 \u0627\u0644\u062a\u0644\u0627\u0645\u064a\u0630 \u0644\u0625\u0646\u062c\u0627\u0632 \u0627\u0644\u0623\u0646\u0634\u0637\u0629 \u0627\u0644\u0645\u062a\u0628\u0642\u064a\u0629 \u0641\u064a \u0627\u0644\u0645\u0646\u0632\u0644 \u0645\u0646 \u0627\u0644\u0635\u0641\u062d\u062a\u064a\u0646 28 \u064829\u060c \u0648\u064a\u0648\u062f\u0639\u0647\u0645 \u062d\u062a\u0649 \u0627\u0644\u062d\u0635\u0629 \u0627\u0644\u0642\u0627\u062f\u0645\u0629."}], "title": "MATH N5 P3 SEM2 S5"}','','2026-02-26 10:46:12.693940','2026-02-26 10:52:34.508956',1);
CREATE TABLE "raida_teacherinfo" ("user_id" integer NOT NULL PRIMARY KEY REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "updated_at" datetime NOT NULL, "annee_scolaire" varchar(20) NOT NULL, "etablissement" varchar(255) NOT NULL, "etablissement_ar" varchar(255) NOT NULL, "niveau" varchar(100) NOT NULL, "niveau_ar" varchar(100) NOT NULL, "nom" varchar(255) NOT NULL, "nom_ar" varchar(255) NOT NULL, "ppr" varchar(50) NOT NULL);
INSERT INTO "raida_teacherinfo" VALUES(1,'2026-02-25 18:08:26.086263','','','','','','Mohamed','','');
INSERT INTO "raida_teacherinfo" VALUES(2,'2026-02-25 18:06:58.351034','','EC Oued','','','','Khqlid','','2265660');
INSERT INTO "raida_teacherinfo" VALUES(7,'2026-02-25 19:21:12.625090','','','','','','Adil','','11111');
INSERT INTO "raida_teacherinfo" VALUES(8,'2026-02-25 20:33:26.535231','','','','','','','','');
INSERT INTO "raida_teacherinfo" VALUES(9,'2026-02-26 23:15:42.541651','','Abdo l3aziz','','2772','','Khalid','','');
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "raida_lesson_user_id_8c645547" ON "raida_lesson" ("user_id");
CREATE INDEX "raida_generatedpdf_user_id_bbe15216" ON "raida_generatedpdf" ("user_id");
CREATE INDEX "raida_generatedpdf_lesson_id_38134e66" ON "raida_generatedpdf" ("lesson_id");
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('django_migrations',25);
INSERT INTO "sqlite_sequence" VALUES('django_admin_log',8);
INSERT INTO "sqlite_sequence" VALUES('django_content_type',9);
INSERT INTO "sqlite_sequence" VALUES('auth_permission',36);
INSERT INTO "sqlite_sequence" VALUES('auth_group',0);
INSERT INTO "sqlite_sequence" VALUES('auth_user',9);
INSERT INTO "sqlite_sequence" VALUES('raida_lesson',103);
COMMIT;
