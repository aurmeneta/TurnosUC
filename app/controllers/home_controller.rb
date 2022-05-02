class HomeController < ApplicationController
  skip_before_action :authenticate_usuario!, :only => [:index]

  def index
    puts 'index'
  end
end
