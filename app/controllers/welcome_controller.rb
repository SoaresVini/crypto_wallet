class WelcomeController < ApplicationController
  def index
    @nome = params[:nome] || 'Usuario'
    @curso =  params[:curso] || "Rails"
  end
end
