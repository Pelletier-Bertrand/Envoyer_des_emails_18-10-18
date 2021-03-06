require 'csv'
require 'dotenv'
Dotenv.load
require 'twitter'
require 'pry'
require_relative 'townhalls_scrapper'


class Handles
	attr_accessor :townhalls_handles

	def initialize
		@townhalls_handles = []	
		
# enregistrement des clés d'APIs
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV["twitter_api_key"]
			config.consumer_secret     = ENV["twitter_api_secret"]
			config.access_token        = ENV["twitter_user_token"]
			config.access_token_secret = ENV["twitter_user_token_secret"]
			end

	end
	
# Recherche des handles twitter
	def search_handles

		CSV.foreach("../../db/townhalls.csv") do |row|
		#lit le fichier CSV ligne par ligne et pour chaque fait :
			begin
				@client.search("mairie #{row[0]}").take(1).collect do |tweet|
				# rechercher les tweets contenant mairie de XX 
			  		@townhalls_handles << tweet.user.screen_name
					  # ajouter les handles au tableau
					 
				end
		return @townhalls_handles 
	end

	def add_handle_to_csv
	# ajoute les handles dans le tableau contenant les villes et emails
		i = 0
		while i < @townhalls_handles.size
			@array.collect do |k, v|
				k['handle'] = @townhalls_handles[i]
				i += 1
			end 
		end
    
		CSV.open("../../db/townhalls.csv", "wb") do |csv_file|
		# réécrit sur le fichier .csv
			csv_file << @array.first.keys
			@array.each do |the_hash|
				csv_file << the_hash.values
			end
	end
		
	end

	def perform
		search_handles
		add_handle_to_csv
	end
	
