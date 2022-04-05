require 'uri'
require 'net/http'

class HomeController < ApplicationController
  def index
    @img_url = "https://media2.giphy.com/media/TIGP3k4gNAqvza2KJK/giphy.gif?cid=790b7611f6a62917b2e42724a59437b30e0f2ee02a53b2d4&rid=giphy.gif&ct=g"
    
    uri = URI("https://api.giphy.com/v1/gifs/random?api_key=#{ENV["GIPHY_KEY"]}&tag=shrek&rating=pg")
    res = Net::HTTP.get_response(uri)
    
    if res.is_a?(Net::HTTPSuccess)
      res_json = JSON.parse res.body
      @img_url = res_json['data']['images']['original']['url']
    end
  end
end
