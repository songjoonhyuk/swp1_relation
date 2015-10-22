class TimelineController < ApplicationController
    before_action :authenticate_user!, except: :index
    
    def index
        @blogs=Blog.all.reverse
    end
       
    def write
        Blog.create(user_id: current_user.id, content:params[:text])
        redirect_to :root
    end
    def comment
        Comment.create(user_id: current_user.id, blog_id:params[:blog_id], msg:params[:comment])
        redirect_to :root
    end
    
    def destroy
        blogd = Blog.find(params[:id])
        blogd.destroy
        redirect_to :root
    end
    
    def modify
        @blog=Blog.find(params[:id])
    end
    
    def modifydo
        @blog=Blog.find(params[:id])
        @blog.content=params[:text]
        @blog.save
        redirect_to:root
    end
     
    def mypage
        @myblog=Blog.where(user_id: current_user.id)
        
    end
    
end
