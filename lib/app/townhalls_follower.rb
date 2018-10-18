require 'csv'
require 'dotenv'
require 'pry'
require 'twitter'

# Ici on appel le fichier .env grâce à la gem dotenv
Dotenv.load

class Follower

    def initialize
        # enregistrement des clés d'APIs
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV["twitter_api_key"]
            config.consumer_secret     = ENV["twitter_api_secret"]
            config.access_token        = ENV["twitter_user_token"]
            config.access_token_secret = ENV["twitter_user_token_secret"]
        end
    end

        # méthode qui follow les handles des mairies
    def follow_each_townhall
        CSV.foreach("./db/townhalls.csv") do |row|
                @client.follow("#{row[3]}")
        end
    end

end