class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show] #when you have authenticate user method in device file bcuz you delete that
    before_action :set_blog_post,except: [:index, :new, :create] #only [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    def index
        # @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published_at
        @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.order(published_at: :desc)

    end

    def show
        # @blog_posts = BlogPost.published.find(params)
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
            redirect_to @blog_post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
     #
    end

    def update
        #
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
       #
        @blog_post.destroy
        redirect_to root_path
    end

    private

    def blog_post_params
        params.require(:blog_post).permit(:title,:body, :published_at)
    end

    def set_blog_post
        # Use a ternary operator to conditionally find the BlogPost based on whether the user is signed in.
        @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
        
        # If the record is not found, rescue the ActiveRecord::RecordNotFound exception and redirect to the root path.
        rescue ActiveRecord::RecordNotFound
        redirect_to root_path
      end
      
end
    # when we added devices gem its alredy had several method just like below one to save time  this methods knows as helper methods
    # def authenticate_user!
    #     redirect_to new_user_session_path, alert: "You must sign in or sign up to continue." unless user_signed_in?
    # end


# note{
#     we added the device gem for security perpouse or many thing
#     even we need to access data by login account 
#     bt in incognimode of chrome we seen data without login just simple past url in incognito tab
#     like local_host:3000/1/edit so edit data without sign_in

#      so to overcome this thing we need to use index 1st line of code so we lock
# }