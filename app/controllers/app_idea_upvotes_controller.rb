class AppIdeaUpvotesController < ApplicationController

  before_filter :authenticate_user!, only: [:new]
  respond_to :html, :json

  def create
    if app_idea_upvote_params[:app_idea_id]

      @app_idea = AppIdea.find(app_idea_upvote_params[:app_idea_id]) 
      @app_idea_upvote = current_user.app_idea_upvotes.new(app_idea: @app_idea)

      @app_idea_upvote.save

      respond_to do |format|
        format.html do
          redirect_to app_ideas_path
        end
        format.json { render json: @app_idea_upvote.to_json }
      end

    else
      flash[:error] = "Error"
      redirect_to root_path
    end
  end

  def edit
    @app_idea_upvote = current_user.app_idea_upvotes.find(params[:id])
  end

  def destroy
    @app_idea_upvote = current_user.app_idea_upvotes.find(params[:id])
    @app_idea_upvote.destroy

      respond_to do |format|
        format.html do
          redirect_to app_ideas_path
        end
        format.json { }
      end
  end

  private
    def app_idea_upvote_params
      params.require(:app_idea_upvote).permit(:user, :app_idea, :user_id, :app_idea_id, :id)
    end
end
