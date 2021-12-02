class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
    # グラフに送信するためのデータ生成
    gon.data =[]
    n = 6
    while n >= 0 do
     gon.data << @books.where(created_at: Date.today.days_ago(n).all_day).count
     n -= 1
    end
  end

  def index
    @users = User.all
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def search
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
    if params[:created_at] == ""
      @search_book = "日付を選択してください"#①
    else
      create_at = params[:created_at]
      @search_book = @books.where(['created_at LIKE ? ', "#{create_at}%"]).count#②
    end
  end

  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @followings = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @followers = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
