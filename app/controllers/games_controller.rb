require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.shuffle[0..9].join
  end

  def score

    @word = params[:word].chars
    @letters = params[:letters]
    @result =  @word.all? { |letter| @word.count(letter) == @letters.count(letter) }
    if @result == true
      @message = "congrats"
    else
      @message = "looser"
    end
  end

  def english?
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
  end
end

# requete api pour voir si le mot est valide
# stocker le resultat dans une variable true ou false
# mettre a jour les conditions pour afficher le bon message
