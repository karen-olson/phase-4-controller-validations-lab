class PostsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  def fiction 
    posts = Post.fiction_posts
    render json: posts
  end

  def non_fiction 
    posts = Post.non_fiction_posts
    render json: posts
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end

end

# Create a route posts/fiction that when I go to that route I can see all of the posts that have a category of fiction
# Add a custom route in routes.rb
# Create a fiction action in controller that returns the fiction posts
# Call a custom method (defined in the Post model) to get the fiction posts
# In the Post model, create a class method to get all the fiction posts
# Use an ActiveRecord query method (ex. where) to get them from the DB