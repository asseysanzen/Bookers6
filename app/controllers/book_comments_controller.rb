class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book)
	end

	def destroy
		@book = Book.find(params[:book_id])
		@comment = BookComment.find(params[:id])
		@comment.destroy
  		redirect_to book_path(@book.id), notice: "successfully delete book!"
	end

	def show
		@comment = BookComment.find(params[:id])
	end

	private
	def book_params
  		params.require(:book).permit(:title, :body)
  	end
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
