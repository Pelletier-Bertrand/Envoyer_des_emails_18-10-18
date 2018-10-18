class View

 def first_action 
   puts"-"*50
   puts "       Bienvenue sur notre application"
   puts"-"*50
   puts " "
   puts "Voulez-vous exécuter le script pour récupérer les adresses mails ? [Y/N]"
   user_input = gets.chomp
   if user_input == "Y"
     require '../app/townhalls_scrapper' #exécute le script scrapper (situé dans un dossier externe) si l'utilisateur choisis Y[]]
     second_action
   else
     puts "Fermeture de l'application"
   end
 end
 def second_action
   puts " "
   puts "Voulez-vous envoyer un email aux différentes mairies ? [Y/N]"
   user_input = gets.chomp
   if user_input == "Y"
     puts "Contenu du mail:"
     puts " "
     puts "Bonjour,
     Je m'appelle Georgia Pasteur, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

     Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de [NOM_COMMUNE] veut changer le monde avec nous ?


     Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
     puts " "
     puts "Voulez-vous continuer ? [Y/N]"
     user_input = gets.chomp
     if user_input == "Y"
       require '../app/townhalls_mailer'
       third_action
     else
       puts "Fermeture de l'application"
     end
   else
     puts "Fermeture de l'application"
   end
 end
 def third_action
   puts " "
   puts "Voulez-vous rechercher les adresses twitter des mairies ? [Y/N]"
   user_input = gets.chomp
   if user_input == "Y"
     require '../app/townhalls_adder_to_db'
     fourth_action
   else
     puts "Fermeture de l'application"
   end
 end

 def fourth_action
   puts " "
   puts "Voulez-vous follow les mairies ? [Y/N]"
   if user_input == "Y"
     require '../app/townhalls_follower'
   else
     puts "Fermeture de l'application"
   end
 end
end