class PapersController < ApplicationController
  def index
    @papers = Paper.all
    render json: @papers
  end

  def show
    @paper = Paper.find(params[:id])
    render json: @paper
  end

  def recommend
    @recommended_papers = Paper.recommended_today
    render json: @recommended_papers
  end
  
  # 論文データの手動作成
  def create
    @paper = Paper.new(paper_params)
    if @paper.save
      render json: @paper, status: :created
    else
      render json: @paper.errors, status: :unprocessable_entity
    end
  end

  private

  def paper_params
    params.require(:paper).permit(:title, :author, :abstract, :url, :keywords, :published_at)
  end
end
