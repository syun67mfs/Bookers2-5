class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    # 1pattern
    @favorite = @book.favorites.new(user_id: current_user.id)
    # 2pattern
    # @favorite = Favorite.new(book_id: @book.id, user_id: current_use.id)
    @favorite.save
    redirect_back(fallback_location: root_path)
  end
  def destroy
    @book = Book.find(params[:book_id])
    @favorite = @book.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
