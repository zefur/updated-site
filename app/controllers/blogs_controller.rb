class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update, :toggle_status]}, site_admin: :all
  layout "blog"
    def index
        @blog
       params[:tag] ? @blogs = Blog.tagged_with(params[:tag]).page(params[:page]).per(5) : @blogs = Blog.page(params[:page]).per(5)
       
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

    private
    def blog_params
        params.require(:blog).permit(:title, :body,:tag_list,)
    end
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end
end
