class AppIdeasController < ApplicationController

  load_and_authorize_resource

  before_filter :authenticate_user!, only: [:update]

  before_action :set_app_idea, only: [:show, :edit, :update, :destroy]

  # GET /app_ideas
  # GET /app_ideas.json
  def index
    @app_ideas = AppIdea.all
    @app_ideas = @app_ideas.where("created_at >= ?", 2.week.ago.utc).sort_by(&:upvote_count).reverse
  end

  # GET /app_ideas/1
  # GET /app_ideas/1.json
  def show
  end

  # GET /app_ideas/new
  def new
    @app_idea = AppIdea.new
  end

  # GET /app_ideas/1/edit
  def edit
  end

  # POST /app_ideas
  # POST /app_ideas.json
  def create
    @app_idea = AppIdea.new(app_idea_params)

    respond_to do |format|
      if @app_idea.save
        format.html { redirect_to @app_idea, notice: 'App idea was successfully created.' }
        format.json { render :show, status: :created, location: @app_idea }
      else
        format.html { render :new }
        format.json { render json: @app_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_ideas/1
  # PATCH/PUT /app_ideas/1.json
  def update
    respond_to do |format|
      if @app_idea.update(app_idea_params)
        format.html { redirect_to @app_idea, notice: 'App idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_idea }
      else
        format.html { render :edit }
        format.json { render json: @app_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_ideas/1
  # DELETE /app_ideas/1.json
  def destroy
    @app_idea.destroy
    respond_to do |format|
      format.html { redirect_to app_ideas_url, notice: 'App idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_idea
      @app_idea = AppIdea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_idea_params
      params.require(:app_idea).permit(:tweet, :details)
    end
end
