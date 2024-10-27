class UsersController < ApplicationController
  # ユーザ一覧を表示
  def index
    @users = User.all
    render json: @users
  end

  # 特定のユーザを表示
  def show
    user = User.find(params[:id])
    render json: user
  end

  # 新規ユーザ登録フォーム
  def new
  end

  # ユーザ情報編集フォーム
  def edit
  end

  # サインアップ（新規登録と自動ログイン）
  def signup
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: { message: 'Signup successful', user: user }, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # 新規ユーザ作成（ログインを伴わない作成のみ）
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # ログイン
  def login
    user = User.find_by(id: params[:id], name: params[:name], email: params[:email])
    if user
      session[:user_id] = user.id
      render json: { message: 'Login successful', user: user }, status: :ok
    else
      render json: { error: 'Invalid ID, name, or email' }, status: :unauthorized
    end
  end

  # ユーザ情報の更新
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # ユーザ削除
  def destroy
  end

  private

  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
