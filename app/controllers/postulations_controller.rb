class PostulationsController < ApplicationController
  before_action :authorize_admin, only: %i[ edit ]
  before_action :set_postulation, only: %i[ edit show ]
  def index
    @postulations = Postulation.all.order(id: :asc)
  end

  def edit
    # before_action
  end

  def show
    # before_action
  end

  def create
    # Postulation.create!(user_id: current_user.id, publication_id: @publication.id)
    @postulation = Postulation.new(postulation_params)
    @postulation.user_id = current_user.id
    respond_to do |format|
      if @postulation.save
        format.html { redirect_to @postulation, notice: "postulation was successfully created." }
        format.json { render :show, status: :created, location: @postulation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  def postulation_params
    params.require(:postulation).permit(:user_id, :publication_id)
  end

  def set_postulation
    @postulation = Postulation.new
  end

  # si no está loggeado se va al Home_index
  def authorize_admin
    if current_user == nil
      redirect_to root_path
    else
      redirect_to root_path, alert: "No tienes permiso para realizar esta acción" unless current_user.admin?
    end
  end
end
