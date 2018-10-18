

# On appelle les gems dont on a besoin
require 'gmail'
require 'google_drive'
require 'pry'
require 'dotenv'
require 'csv'
require 'google-api-client'
Dotenv.load

class SendEmails
  attr_accessor : mail, mail_count
  #on se connecte à gmail grâce aux clés
    def connection
 #nous avons déclarer deux variables d'instance pour pouvoir les réutiliser.
      @@mail_count =   Gmail.connect(ENV['gmail_client_id'],ENV['gmail_secret'])
      @@mail = mail

    end

    def send_message(name, mail)

      @@mail_count

      @@mail.deliver do

      from "The Hacking Project <thpslacker@gmail.com>"

      to "#{mail}" #mail contient les emails que l'on récupère dans la méthode get_mail_from_csv

      subject "The Hacking Project - Formation de developpement web gratuite"

      html_part do
      content_type 'text/html; charset=UTF-8'

      body  "<p>Bonjour,</p>
      <p>Je m'appelle Georgia Pasteur et je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous. </p>
      <p>Déjà 500 personnes sont passées par The Hacking Project. Est-ce que votre mairie veut changer le monde avec nous ? </p>
      <p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions (tel : 06.95.46.60.80 ou email : charles@thehackingproject.org </p>
      <p>Bien cordialement,</p> </br>

      <p>Georgia Pasteur</p>"
                  end
                  end
      puts "Mail bien envoyé "

    end

    def get_mail_from_csv
      CSV.foreach('./db/townhalls.csv') do |row|
      send_message(row[0], row[1]) #remplace les paramètres de la méthode send_message name et mail par les éléments de la première colonne et de la deuxième colonne du fichier csv
                  end

end
#cette méthode permet de lancer tout le programme.

def perform
#nous avons créé un objet app pour lancer la class SendEmails
  app=SendEmails.new
  app.connection
  app.get_mail_from_csv
end
perform
