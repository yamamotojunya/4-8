class PostsController < ApplicationController
  def new
  	@post = Post.new
  	@posts = Post.all
  end

  def create
  	post = Post.new(post_params)
  	if post.save
  		flash[:notice] = "Book was successfully created."
  		redirect_to post_path(post.id)
  	else 
  		redirect_to "/posts"
	end
  end

	def add_error_sample
		if title.empty?
			errors.add(:title," can't be blank")
		end
	end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
    if post.update(post_params)
  		flash[:update] = "Book was successfully update."
  		redirect_to post_path(post.id), update:"Book was successfully update."
  	else
  		redirect_to "/posts"
  	end
  end

  def destroy
  	post = Post.find(params[:id])
    if post.destroy
  		flash[:destroy] = "Book was successfully destroyed."
  		redirect_to "/posts"
  	end
  end


  private
	
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
