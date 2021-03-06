# -*- encoding : utf-8 -*-
class Admin::CommentsController < Admin::AdminController
 
  before_filter :authenticate_user!

  def index
    @comments = Comment.where("published = 't'").order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
    @spams = Comment.where("published != 't' OR published IS NULL").order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new 
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.create(params[:comment])
    if @comment.save
      @comment.generate_slug!
      flash[:success] = "Comment cadastrada com sucesso."
      redirect_to admin_comments_path
    else
      render 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      flash[:success] = "Comment editada com sucesso."
      redirect_to admin_comments_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
		@comment.destroy
		flash[:success] = "Comment excluída com sucesso."
		redirect_to admin_comments_path
  end

  def destroy_all_spam
    @spams = Comment.where("published != 't' OR published IS NULL")
    unless @spams.empty?
      @spams.each do |spam|
        spam.destroy
      end
    end
    flash[:success] = "Spams excluídos com sucesso."
    redirect_to admin_comments_path
  end

end
