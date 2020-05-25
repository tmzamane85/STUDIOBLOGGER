class ArticlesController < ApplicationController
    
    
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end


    def home

    end


    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article created successfully"
            redirect_to article_path(@article)
        else
         render :new
        end
    end 

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
        flash[:success]= "Article updated successfully"
        redirect_to edit_article_path
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:danger]= "Article was successfully deleted"
        redirect_to articles_path
    end
end
    private 
    def article_params
        params.require(:article).permit(:title, :description)
    end    
    

