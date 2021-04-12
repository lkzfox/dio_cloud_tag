class ContentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contents = current_user.contents
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.user = current_user

    if @content.save
      redirect_to contents_path, notice: 'Success!'
    else
      render :new
    end
  end

  def edit
    @content = Content.find(params.require(:id))
  end

  def update
    @content = Content.find(params[:id])

    if @content.update(content_params)
      redirect_to contents_path, notice: 'Success!'
    else
      render :new
    end
  end

  def show
    @content = Content.find(params.require(:id))
  end

  private 

  def content_params
    params.require(:content).permit(:title, :description)
  end
end
