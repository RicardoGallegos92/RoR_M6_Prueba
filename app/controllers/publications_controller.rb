class PublicationsController < ApplicationController
  before_action :authorize_admin
  before_action :authenticate_user!
  def index
  end

  def show
  end

  def update
  end

  def create
  end

  def authorize_admin
    if current_user == nil
      redirect_to root_path
    else
      redirect_to root_path, alert: "No tienes permiso para realizar esta acción" unless current_user.admin?
    end
  end
end
