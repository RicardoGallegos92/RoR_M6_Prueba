class HomeController < ApplicationController
  before_action :is_logged
  def index
  end

  # si está loggeado se va a las publicaciones
  def is_logged
    if user_signed_in?
      redirect_to publications_index_path
    end
  end
end
