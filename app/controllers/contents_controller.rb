class ContentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contents = current_user.contents
    
    tags = params[:tags]
    if tags.present?
      @contents = @contents.joins(:tags).where(tags: { name: tags }).distinct
    end
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.user = current_user

    if @content.save
      associate_tags
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
    associate_tags

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

  def content_tags
    params.require(:content).permit(tags: [])[:tags].filter {|i| !i.blank? }
  end

  def associate_tags
    tags = content_tags.map do |t|
      current_user.tags.where(name: t).first_or_initialize
    end

    @content.tags = tags
  end
end
