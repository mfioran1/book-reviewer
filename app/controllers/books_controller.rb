class BooksController < ApplicationController

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
        @book = Book.find_by(id: params[:id])

    end

    def index
        @books = Book.all
    end

    def edit
        @book = Book.find_by_id(params[:id])
    end
    
    def update 
        @book = Book.find_by_id(params[:id])
        @book.update(book_params)
        if @book.save
            flash[:message] = "#{@book.title} has been updated"
            redirect_to book_path(@book)
        else
            render :edit
        end
    end



    private

    def book_params
        params.require(:book).permit(:title, :author, :description, :year_published)
    end


end
