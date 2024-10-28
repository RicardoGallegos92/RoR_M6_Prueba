class PublicationController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: %i[ new create edit update destroy ]
  def index
  end

  def show
  end

  def update
  end

  def create
  end

  def authorize_admin
    redirect_to root_path, alert: 'No tienes permiso para realizar esta acción' unless current_user.admin?
  end
end
