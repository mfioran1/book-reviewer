class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:update, :destroy]


    def new
        if params[:book_id] && !Book.exists?(params[:book_id])
            flash[:message] = "Book not found"
            redirect_to books_path
        else
            @review = Review.new(book_id: params[:book_id])
            @book = Book.find(params[:book_id])
        end

    end

    def create
        @book = Book.find(params[:review][:book_id])
        @review = current_user.reviews.new(review_params)
        if @review.save
            redirect_to book_reviews_path(@book)
        else
            render :new
        end
    end

    def index 
        if params[:book_id]
            @book = Book.find(params[:book_id])
            @reviews = @book.reviews
        else
            @user = User.find(params[:user_id])
            @reviews = @user.reviews
        end
    end

    def edit
        book = Book.find_by(id: params[:book_id])
        @review = book.reviews.find_by(id: params[:id])
        if @review.nil?
            redirect_to book_reviews_path(book)
        else
            @book = @review.book
        end
    end

    def update
        @review.update(review_params)
        if @review.save 
            redirect_to book_reviews_path(@review)
        else
            render :edit
        end
    end

    def destroy
        if @review
            @review.destroy
            flash[:message] = "The Review has been successfully deleted."
            redirect_to book_reviews_path
        end
    end









    private

    def set_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:book_id, :rating, :content)
    end

end
