mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bibliotheque       |
| bibliotheque1      |
| gestclass          |
| information_schema |
| mysql              |
| performance_schema |
| recrut             |
| restorcrut         |
| sys                |
+--------------------+
9 rows in set (0.00 sec)

mysql> create database gestbiblio;
Query OK, 1 row affected (0.01 sec)

mysql> use gestbiblio;
Database changed
mysql> create table etudiant (
    -> id_etudiant INT AUTO_INCREMENT PRIMARY KEY,
    -> Nom VARCHAR(30) NOT NULL,
    -> Prenom VARCHAR(30) NOT NULL,
    -> EMail VARCHAR(30) UNIQUE,
    -> Telephone VARCHAR(30) NOT NULL,
    -> adresse VARCHAR(50) NOT NULL,
    -> Age INT CHECK(age>=18)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table livre (
    -> id_livre INT AUTO_INCREMENT PRIMARY KEY,
    -> date_publication VARCHAR(20) NOT NULL,
    -> Auteur VARCHAR(30) NOT NULL
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table categorie (
    -> id_categorie INT AUTO_INCREMENT PRIMARY KEY,
    -> Nom VARCHAR(20) NOT NULL,
    -> Libelle VARCHAR(30),
    -> Description VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table bibliothecaire (
    -> id_bibliothecaire INT AUTO_INCREMENT PRIMARY KEY,
    -> Nom VARCHAR(30) NOT NULL,
    -> Prenom VARCHAR(30) NOT NULL,
    -> Datenaiss DATE CHECK(Datenaiss <= '2008-12-31')
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table emprunt (
    -> id_emprunt INT AUTO_INCREMENT PRIMARY KEY,
    -> Date_emprunt DATE NOT NULL,
    -> Date_retour DATE NOT NULL,
    -> id_livre INT,
    -> id_etudiant INT,
    -> id_bibliothecaire INT,
    -> FOREIGN KEY (id_livre) REFERENCES livre(id_livre),
    -> FOREIGN KEY (id_etudiant) REFERENCES etudiant(id_etudiant),
    -> FOREIGN KEY (id_bibliothecaire) REFERENCES bibliothecaire(id_bibliothecaire)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table retour (
    -> id_retour INT AUTO_INCREMENT PRIMARY KEY,
    -> Date_retour DATE NOT NULL,
    -> id_emprunt INT,
    -> id_bibliothecaire INT,
    -> FOREIGN KEY (id_emprunt) REFERENCES emprunt(id_emprunt),
    -> FOREIGN KEY (id_bibliothecaire) REFERENCES bibliothecaire(id_bibliothecaire)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table penalite (
    -> id_penalite INT AUTO_INCREMENT PRIMARY KEY,
    -> montant VARCHAR(255),
    -> Motif TEXT NOT NULL,
    -> id_emprunt INT,
    -> FOREIGN KEY (id_emprunt) REFERENCES emprunt(id_emprunt)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> show tables;
+----------------------+
| Tables_in_gestbiblio |
+----------------------+
| bibliothecaire       |
| categorie            |
| emprunt              |
| etudiant             |
| livre                |
| penalite             |
| retour               |
+----------------------+
7 rows in set (0.00 sec)
mysql> use gestbiblio;
Database changed
mysql> show tables;
+----------------------+
| Tables_in_gestbiblio |
+----------------------+
| bibliothecaire       |
| categorie            |
| emprunt              |
| etudiant             |
| livre                |
| penalite             |
| retour               |
+----------------------+
7 rows in set (0.00 sec)
//requetes simples
mysql> select * from livre;
+----------+------------------+--------------------------+--------------------------------+--------------+
| id_livre | date_publication | Auteur                   | Nom                            | id_categorie |
+----------+------------------+--------------------------+--------------------------------+--------------+
|        1 | 1532             | Nicolas Machiavel        | Le Prince                      |            1 |
|        2 | 1782             | Choderlos de Laclos      | Les liaisons dangereuses       |         NULL |
|        3 | 1830             | Stendhal                 | Le rouge et le noir            |         NULL |
|        4 | 1835             | Honore de Balzac         | Le Pere Goriot                 |         NULL |
|        5 | 1844             | Alexandre Dumas          | Mousquetaires                  |         NULL |
|        6 | 1862             | Victor Hugo              | Les Miserables                 |         NULL |
|        7 | 1869             | Jules Verne              | Vingt mille lieues sous les me |         NULL |
|        8 | 1867             | Emile Zola               | Therese Raquin                 |         NULL |
|        9 | 1913             | Marcel  Proust           | A la recherche du temps perdu  |         NULL |
|       10 | 1932             | Aldous Huxley            | Le Meilleur des mondes         |         NULL |
|       11 | 1943             | Antoine de Saint Exupery | Le Petit Prince                |         NULL |
|       12 | 1947             | Albert Camus             | La Peste                       |         NULL |
|       13 | 1949             | George Orwell            | 1984                           |         NULL |
|       14 | 1942             | Albert Camus             | l'etranger                     |         NULL |
|       15 | 1952             | Ernest Hemingway         | Le Vieil Homme et la Mer       |         NULL |
|       16 | 1955             | Vladimir Nabokov         | Lolita                         |         NULL |
|       17 | 1967             | Gabriel Garcia Marquez   | Cent ans de solitude           |         NULL |
|       18 | 1958             | Elie Wiesel              | La Nuit                        |         NULL |
|       19 | 1997             | J.K.Rowling              | Harry Potter a l'ecole des sor |         NULL |
|       20 | 1984             | Marguerite Duras         | l'Amant                        |         NULL |
+----------+------------------+--------------------------+--------------------------------+--------------+
20 rows in set (0.00 sec)

mysql> select * from etudiant;
+-------------+-----------+----------+-------------------+---------------+------------------+------+
| id_etudiant | Nom       | Prenom   | EMail             | Telephone     | adresse          | Age  |
+-------------+-----------+----------+-------------------+---------------+------------------+------+
|           1 | Keita     | Aissatou | Aicha@gmail.com   | +221776544308 | Medina           |   20 |
|           2 | Nomokho   | Aissatou | Nomokho@gmail.com | +221764358909 | HLM              |   22 |
|           3 | Sarr      | Aicha    | Aichas@gmail.com  | +221764453280 | Fass             |   19 |
|           4 | Ndiaye    | Fallou   | Fall@gmail.com    | +221764536823 | GRAND DAKAR      |   22 |
|           5 | Diop      | Assane   | Diop@gmail.com    | +221768542345 | Keur Massar      |   23 |
|           6 | Chidid    | Fatou    | Fat@gmail.com     | +221785462345 | Point E          |   20 |
|           7 | Diouf     | Fallou   | Diouf@gmail.com   | +221769873421 | Dial Diop        |   19 |
|           8 | Rodriguez | Nafi     | Nafi@gmail.com    | +221763452312 | Parcelle         |   22 |
|           9 | Diallo    | Alpha    | Alpha@gmail.com   | +221784321234 | Ouakam           |   23 |
|          10 | Diagne    | Malick   | diagne@gmail.com  | +221776540987 | HLM FASS         |   19 |
|          11 | Ndoye     | Bineta   | Ndoye@gmail.com   | +221765439812 | Ouakam           |   20 |
|          12 | Sarr      | Marianne | Sarr@gmail.com    | +221709876543 | Ouakam           |   22 |
|          13 | Attale    | Manuelle | Attale@gmail.com  | +221780987654 | Medina           |   22 |
|          14 | Ba        | Alpha    | BA@gmail.com      | +221770987654 | HLM GRAND MEDINE |   22 |
|          15 | Seck      | Arva     | Arva@gmail.com    | +221763452312 | Medina           |   22 |
+-------------+-----------+----------+-------------------+---------------+------------------+------+
15 rows in set (0.00 sec)

mysql> select * from livre order by nom asc;
+----------+------------------+--------------------------+--------------------------------+--------------+
| id_livre | date_publication | Auteur                   | Nom                            | id_categorie |
+----------+------------------+--------------------------+--------------------------------+--------------+
|       13 | 1949             | George Orwell            | 1984                           |         NULL |
|        9 | 1913             | Marcel  Proust           | A la recherche du temps perdu  |         NULL |
|       17 | 1967             | Gabriel Garcia Marquez   | Cent ans de solitude           |         NULL |
|       19 | 1997             | J.K.Rowling              | Harry Potter a l'ecole des sor |         NULL |
|       20 | 1984             | Marguerite Duras         | l'Amant                        |         NULL |
|       14 | 1942             | Albert Camus             | l'etranger                     |         NULL |
|       18 | 1958             | Elie Wiesel              | La Nuit                        |         NULL |
|       12 | 1947             | Albert Camus             | La Peste                       |         NULL |
|       10 | 1932             | Aldous Huxley            | Le Meilleur des mondes         |         NULL |
|        4 | 1835             | Honore de Balzac         | Le Pere Goriot                 |         NULL |
|       11 | 1943             | Antoine de Saint Exupery | Le Petit Prince                |         NULL |
|        1 | 1532             | Nicolas Machiavel        | Le Prince                      |            1 |
|        3 | 1830             | Stendhal                 | Le rouge et le noir            |         NULL |
|       15 | 1952             | Ernest Hemingway         | Le Vieil Homme et la Mer       |         NULL |
|        2 | 1782             | Choderlos de Laclos      | Les liaisons dangereuses       |         NULL |
|        6 | 1862             | Victor Hugo              | Les Miserables                 |         NULL |
|       16 | 1955             | Vladimir Nabokov         | Lolita                         |         NULL |
|        5 | 1844             | Alexandre Dumas          | Mousquetaires                  |         NULL |
|        8 | 1867             | Emile Zola               | Therese Raquin                 |         NULL |
|        7 | 1869             | Jules Verne              | Vingt mille lieues sous les me |         NULL |
+----------+------------------+--------------------------+--------------------------------+--------------+
20 rows in set (0.00 sec)

mysql> Select nom, auteur from livre where auteur = 'Jules Verne';
+--------------------------------+-------------+
| nom                            | auteur      |
+--------------------------------+-------------+
| Vingt mille lieues sous les me | Jules Verne |
+--------------------------------+-------------+
1 row in set (0.00 sec)
//requete de jointure
mysql> Select e.id_emprunt, et.nom, et.prenom, e.date_emprunt from emprunt e join etudiant et on e.id_etudiant = et.id_etudiant;
+------------+-----------+----------+--------------+
| id_emprunt | nom       | prenom   | date_emprunt |
+------------+-----------+----------+--------------+
|          1 | Nomokho   | Aissatou | 2025-04-12   |
|          2 | Sarr      | Aicha    | 2026-02-01   |
|          3 | Chidid    | Fatou    | 2024-03-03   |
|          4 | Keita     | Aissatou | 2020-05-10   |
|          5 | Ndiaye    | Fallou   | 2026-05-08   |
|          6 | Diop      | Assane   | 2021-04-04   |
|          7 | Diouf     | Fallou   | 2026-04-03   |
|          8 | Diallo    | Alpha    | 2023-02-02   |
|          9 | Rodriguez | Nafi     | 2024-04-04   |
|         10 | Seck      | Arva     | 2021-01-02   |
+------------+-----------+----------+--------------+
10 rows in set (0.01 sec)

mysql> select l.id_livre, l.nom from livre l join emprunt e on l.id_livre = e.id_livre;
+----------+-------------------------------+
| id_livre | nom                           |
+----------+-------------------------------+
|        1 | Le Prince                     |
|        2 | Les liaisons dangereuses      |
|        3 | Le rouge et le noir           |
|        4 | Le Pere Goriot                |
|        5 | Mousquetaires                 |
|        6 | Les Miserables                |
|        9 | A la recherche du temps perdu |
|       10 | Le Meilleur des mondes        |
|       12 | La Peste                      |
|       15 | Le Vieil Homme et la Mer      |
+----------+-------------------------------+
10 rows in set (0.00 sec)

mysql> Select l.* from livre l LEFT JOIN emprunt e ON l.id_livre = e.id_livre WHERE e.id_livre IS NULL;
+----------+------------------+--------------------------+--------------------------------+--------------+
| id_livre | date_publication | Auteur                   | Nom                            | id_categorie |
+----------+------------------+--------------------------+--------------------------------+--------------+
|        7 | 1869             | Jules Verne              | Vingt mille lieues sous les me |         NULL |
|        8 | 1867             | Emile Zola               | Therese Raquin                 |         NULL |
|       11 | 1943             | Antoine de Saint Exupery | Le Petit Prince                |         NULL |
|       13 | 1949             | George Orwell            | 1984                           |         NULL |
|       14 | 1942             | Albert Camus             | l'etranger                     |         NULL |
|       16 | 1955             | Vladimir Nabokov         | Lolita                         |         NULL |
|       17 | 1967             | Gabriel Garcia Marquez   | Cent ans de solitude           |         NULL |
|       18 | 1958             | Elie Wiesel              | La Nuit                        |         NULL |
|       19 | 1997             | J.K.Rowling              | Harry Potter a l'ecole des sor |         NULL |
|       20 | 1984             | Marguerite Duras         | l'Amant                        |         NULL |
+----------+------------------+--------------------------+--------------------------------+--------------+
10 rows in set (0.00 sec)
//requete d'agregation
mysql> select count(*) AS nombre_total_livres from livre;
+---------------------+
| nombre_total_livres |
+---------------------+
|                  20 |
+---------------------+
1 row in set (0.00 sec)

mysql> select et.id_etudiant, et.nom, et.prenom, COUNT(e.id_emprunt) AS nombre_emprunts FROM etudiant et JOIN emprunt e ON et.id_etudiant = e.id_etudiant GROUP BY et.id_etudiant, et.nom, et.prenom;
+-------------+-----------+----------+-----------------+
| id_etudiant | nom       | prenom   | nombre_emprunts |
+-------------+-----------+----------+-----------------+
|           2 | Nomokho   | Aissatou |               1 |
|           3 | Sarr      | Aicha    |               1 |
|           6 | Chidid    | Fatou    |               1 |
|           1 | Keita     | Aissatou |               1 |
|           4 | Ndiaye    | Fallou   |               1 |
|           5 | Diop      | Assane   |               1 |
|           7 | Diouf     | Fallou   |               1 |
|           9 | Diallo    | Alpha    |               1 |
|           8 | Rodriguez | Nafi     |               1 |
|          15 | Seck      | Arva     |               1 |
+-------------+-----------+----------+-----------------+
10 rows in set (0.01 sec)

mysql> select cat.libelle, COUNT(*) AS nombre_emprunts FROM emprunt e JOIN livre l ON e.id_livre = l.id_livre JOIN categorie cat ON l.id_categorie = cat.id_categorie GROUP BY cat.libelle ORDER BY nombre_emprunts DESC limit 1;
+------------------+-----------------+
| libelle          | nombre_emprunts |
+------------------+-----------------+
| Traite Politique |               1 |
+------------------+-----------------+
1 row in set (0.01 sec)
//requete avancee
mysql> select et.nom, et.prenom, l.nom, e.date_emprunt, e.date_retour FROM emprunt e JOIN etudiant et ON e.id_etudiant = et.id_etudiant JOIN livre l ON e.id_livre = l.id_livre WHERE DATEDIFF(e.date_retour, e.date_emprunt) > 30;
+-----------+----------+--------------------------+--------------+-------------+
| nom       | prenom   | nom                      | date_emprunt | date_retour |
+-----------+----------+--------------------------+--------------+-------------+
| Chidid    | Fatou    | Les Miserables           | 2024-03-03   | 2024-05-02  |
| Keita     | Aissatou | Le Prince                | 2020-05-10   | 2020-11-01  |
| Diop      | Assane   | Le Meilleur des mondes   | 2021-04-04   | 2021-05-05  |
| Diouf     | Fallou   | La Peste                 | 2026-04-03   | 2026-05-30  |
| Rodriguez | Nafi     | Mousquetaires            | 2024-04-04   | 2024-05-05  |
| Seck      | Arva     | Le Vieil Homme et la Mer | 2021-01-02   | 2021-02-02  |
+-----------+----------+--------------------------+--------------+-------------+
6 rows in set (0.01 sec)

mysql> select l.nom, COUNT(*) AS nombre_emprunts FROM emprunt e JOIN livre l ON e.id_livre = l.id_livre GROUP BY l.id_livre, l.nom ORDER BY nombre_emprunts DESC LIMIT 1;
+-----------+-----------------+
| nom       | nombre_emprunts |
+-----------+-----------------+
| Le Prince |               1 |
+-----------+-----------------+
1 row in set (0.00 sec)

mysql> select et.id_etudiant, et.nom, et.prenom FROM etudiant et LEFT JOIN emprunt e ON et.id_etudiant =e.id_etudiant WHERE e.id_etudiant IS null;
+-------------+--------+----------+
| id_etudiant | nom    | prenom   |
+-------------+--------+----------+
|          10 | Diagne | Malick   |
|          11 | Ndoye  | Bineta   |
|          12 | Sarr   | Marianne |
|          13 | Attale | Manuelle |
|          14 | Ba     | Alpha    |
+-------------+--------+----------+
5 rows in set (0.00 sec)
//structure des tables
mysql> desc etudiant;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id_etudiant | int         | NO   | PRI | NULL    | auto_increment |
| Nom         | varchar(30) | NO   |     | NULL    |                |
| Prenom      | varchar(30) | NO   |     | NULL    |                |
| EMail       | varchar(30) | NO   |     | NULL    |                |
| Telephone   | varchar(30) | NO   |     | NULL    |                |
| adresse     | varchar(50) | NO   |     | NULL    |                |
| Age         | int         | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
7 rows in set (0.01 sec)

mysql> desc livre;
+------------------+-------------+------+-----+---------+----------------+
| Field            | Type        | Null | Key | Default | Extra          |
+------------------+-------------+------+-----+---------+----------------+
| id_livre         | int         | NO   | PRI | NULL    | auto_increment |
| date_publication | varchar(20) | NO   |     | NULL    |                |
| Auteur           | varchar(30) | NO   |     | NULL    |                |
| Nom              | varchar(30) | NO   |     | NULL    |                |
| id_categorie     | int         | YES  | MUL | NULL    |                |
+------------------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> desc emprunt;
+-------------------+------+------+-----+---------+----------------+
| Field             | Type | Null | Key | Default | Extra          |
+-------------------+------+------+-----+---------+----------------+
| id_emprunt        | int  | NO   | PRI | NULL    | auto_increment |
| Date_emprunt      | date | NO   |     | NULL    |                |
| Date_retour       | date | NO   |     | NULL    |                |
| id_livre          | int  | YES  | MUL | NULL    |                |
| id_etudiant       | int  | YES  | MUL | NULL    |                |
| id_bibliothecaire | int  | YES  | MUL | NULL    |                |
+-------------------+------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> desc categorie;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id_categorie | int          | NO   | PRI | NULL    | auto_increment |
| Nom          | varchar(20)  | NO   |     | NULL    |                |
| Libelle      | varchar(30)  | YES  |     | NULL    |                |
| Description  | varchar(255) | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> desc bibliothecaire;
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id_bibliothecaire | int         | NO   | PRI | NULL    | auto_increment |
| Nom               | varchar(30) | NO   |     | NULL    |                |
| Prenom            | varchar(30) | NO   |     | NULL    |                |
| Datenaiss         | date        | YES  |     | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> desc retour;
+-------------------+------+------+-----+---------+----------------+
| Field             | Type | Null | Key | Default | Extra          |
+-------------------+------+------+-----+---------+----------------+
| id_retour         | int  | NO   | PRI | NULL    | auto_increment |
| Date_retour       | date | NO   |     | NULL    |                |
| id_emprunt        | int  | YES  | MUL | NULL    |                |
| id_bibliothecaire | int  | YES  | MUL | NULL    |                |
+-------------------+------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> desc penalite;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id_penalite | int          | NO   | PRI | NULL    | auto_increment |
| montant     | varchar(255) | YES  |     | NULL    |                |
| Motif       | text         | NO   |     | NULL    |                |
| id_emprunt  | int          | YES  | MUL | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)