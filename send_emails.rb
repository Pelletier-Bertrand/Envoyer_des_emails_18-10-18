require 'gmail'
require 'pry'
require 'json'
require 'CSV'
require 'google_drive'
require 'dotenv'
require 'google-api-client'
require 'NOMDUFICHIER'
Dotenv.load

class SendEmails

	#On récupère le fichier CSV/JSON
	def read_json
  file = File.read('XXXX.json').parse
  @data = JSON.parse(file)
  return @data
	end

	#On récupère les noms et les adresses mails des mairies du fichier
	def read_hash(gmail, hash)

  @hash = hash
  @gmail = gmail

  @hash.each do |name, mail|
    unless mail == "" && EmailAddress.valid?(mail)
      content = body_content(name)
      structure_email(@gmail, content, mail)
    end
  	end
	end

	#on élabore la structure du mail (objet, destinataire...)
	def structure_email (gmail, content, mail)
  content = content
  mail = mail
  gmail = gmail

  gmail.deliver do
    to mail
    subject "The Hacking Project - Formation de developpement web gratuite"
    html_part do
    content_type 'text/html; charset=UTF-8'
    mail_content
  	end

	end
	end

	#on écrit le contenu du mail en html
	def mail_content
		return "
  <p>Bonjour,</p>
  <p>Je m'appelle Georgia Pasteur et je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous. </p>
	<p>Déjà 500 personnes sont passées par The Hacking Project. Est-ce que votre mairie veut changer le monde avec nous ? </p>
  <p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions (tel : 06.95.46.60.80 ou email : charles@thehackingproject.org </p>
  <p>Bien cordialement,</p> </br>

  <p>Georgia Pasteur</p>"
	end

	#on envoie l'email en se connectant à Gmail
  def sending_by_gmail (gmail)

    username = ENV['gmail_client_id']
    password = ENV['gmail_secret']
    Gmail.connect(username,password)
    read_hash(gmail, @data)

  end
  

end