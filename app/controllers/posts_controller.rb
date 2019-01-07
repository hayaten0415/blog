class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new
        if @post.save(post_params)
            flash[:notice] = "投稿に成功しました"
            redirect_to post_path(@post)
        else
            flash[:alert] = "投稿に失敗しました"
            render :new
        end
    end

    def edit
    end


    def update
        if @post.update_attributes(post_params)
            flash[:notice] = "投稿を更新しました"
            redirect_to post_path(@posts)
        else
            flash[:alert] = "更新に失敗しました"
            render :edit
        end
    end

    def show
    end

    def destroy
        if @post.destroy
            flash[:notice] = "投稿の削除に成功しました"
            redirect_to posts_path
        else
            flash[:alert] = "Error updating post!"
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end
