class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update, :toggle_status]}, site_admin: :all
  layout "blog"
    def index
      if logged_in?(:site_admin)
        @blog
       params[:tag] ? @blogs = Blog.tagged_with(params[:tag]).page(params[:page]).per(5) : @blogs = Blog.page(params[:page]).per(5)
      else
        @blog
       params[:tag] ? @blogs = Blog.tagged_with(params[:tag]).published.page(params[:page]).per(5) : @blogs = Blog.published.page(params[:page]).per(5)
      end
    end

    def show
        
    end
   
    def new
      @blog = Blog.new
    end
    def update
      respond_to do |format|
        if @blog.update(blog_params)
          format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
          
        else
          format.html { render :edit }
          
        end
      end
    end
  
def create
    @blog = Blog.new(blog_params)
   
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end
  def edit
      
  end 

  

  def update
    @blog
   
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
    end
  end
  def toggle_status
    
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
  end
  redirect_to blogs_url, notice: 'Post status updated'
end
    private
    def blog_params
        params.require(:blog).permit(:title, :body,:tag_list,:status)
    end
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end
end
