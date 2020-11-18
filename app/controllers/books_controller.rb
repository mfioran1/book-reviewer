class BooksController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def new
        @book = Book.new
    end

    def create 
        @book = Book.new(book_params)
        if @book.save
            flash[:message] = "Book successfuly created!"
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def show

    end

    def index
        @books = Book.all
    end

    def edit
    end
    
    def update 
        @book.update(book_params)
        if @book.save
            flash[:message] = "#{@book.title} has been updated"
            redirect_to book_path(@book)
        else
            render :edit
        end
    end

    def destroy
        if @book.destroy
            flash[:message] = "#{@book.title} was successfully deleted"
            redirect_to books_path
        else
            flash[:message] = "#{@book.title} was not able to be deleted" 
            redirect_to book_path(@book)
        end
    end

    def highest_ranked
        @books = Book.highest_ranked
      end
    



    private

    def book_params
        params.require(:book).permit(:title, :author, :description, :year_published)
    end

    def set_book
        @book = Book.find(params[:id])
    end


end
