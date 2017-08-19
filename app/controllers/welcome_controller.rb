class WelcomeController < ApplicationController

  def new
  	@products = Product.all
  	  ActionCable.server.broadcast "carts",
     html: render_to_string('welcome/new', layout: false)
  end

end
