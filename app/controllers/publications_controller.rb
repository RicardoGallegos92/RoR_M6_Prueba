class PublicationsController < ApplicationController
  before_action :authorize_admin
  #  before_action :authenticate_user!
  before_action :set_publication, only: %i[ show edit ]
  def index
    @publications = Publication.all.order(id: :desc)
  end

  def show
    # before_action
  end

  def edit
    # before_action
  end

  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.user = current_user

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @publication.destroy!
    respond_to do |format|
      format.html { redirect_to publications_path, status: :see_other, notice: "Publcacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def publication_params
    params.require(:publication).permit(:title, :content, :id_user)
  end

  def set_publication
    @publication = Publication.find(params[:id])
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
