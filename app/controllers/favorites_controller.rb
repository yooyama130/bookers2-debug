class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = Favorite.new(book_id: book.id, user_id: current_user.id)
    favorite.save
    # redirect_to books_path
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = Favorite.find_by(book_id: book.id, user_id: current_user.id)
    favorite.destroy
    # redirect_to books_path
    redirect_back(fallback_location: root_path)
  end

end





