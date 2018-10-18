# Envoyer_des_emails_18-10-18


## Authors

*   Team Caen
*   Maxime Beaufils, Bertrand Pelletier, Iliès El Ouartassi, Camille Deblois, Charlotte Vaudour , Rebecca Bossé, Rauana Roupsard.


## Installation :

* Bundle install


## Pour lancer l'application $Ruby app.rb 


## Presentation of the project


Le projet du jour consiste à contacter toutes les mairies de France pour que ces dernières parlent de THP !
Pour cela nous avons d'abord commencé par :  

  - Scrapper des emails et les stockers dans un fichier CSV
  - Mailer, nous avons récupérer les emails stockés dans le fichier CSV pour ensuite les envoyer aux différentes mairies
  - Scrapper les handles Twitter des mairies, les stockers dans un fichier CSV, like les comptes Twitter des mairies concernées (mairie concernées 170; mails envoyés 163)
  - View, fichier qui rappelle tous les programmes des différents fichiers et assure leurs bon fonctionnement les uns avec les autres 
  
  
## Arborescence of the files 


- .gitignore     (Permet de cacher le ENV qui contient les Key API)

- .env           (Contient les différentes Key API)

- README.md      (Manuel d'utilisation du programme) 

- Gemfile        (fichier qui contient tous les gems permettant de faire fonctionner les différents programmes)

- Gemfile.lock   (fichier indépendant qui apparait après la création de notre fichier Gemfile et notre Bundle Install, à ne pas "toucher")

- app.rb         (Fichier à lancer pour exécuter le programme principal)

- db             (Dossier qui contient notre fichier CSV)

   - townhalls.csv (fichier CSV ou sont stocker les emails scrapé)
   
- lib         (Dossier qui contient les fichiers app et views)

    - app
      - townhalls_scrapper.rb 
      - townhalls_mailer.rb
      - townhalls_adder_to_db.rb
      - townhalls_follower.rb
      
    - views
        - done.rb
        - index.rb



### Prerequisites
* gem 'pry'
* gem 'colorize'
* gem 'json'
* gem 'google_drive'
* gem 'dotenv'
* gem 'google-api-client'
* gem 'twitter'
* gem 'nokogiri'
* gem 'csv'


## Acknowledgments

* Project for The hacking Project
* https://www.thehackingproject.org/

