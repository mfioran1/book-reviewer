class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :get_review, only: [:update]


    def new
        if params[:book_id] && !Book.exists?(params[:book_id])
            flash[:message] = "Book not found"
            redirect_to books_path
        else
            @review = Review.new(book_id: params[:book_id])
            @book = Book.find(params[:book_id])
        end

    end










    private

    def get_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:book_id, :rating, :content)
    end

end
