class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) # мы используем метод find в модели User для извлечения пользователя из БД
    # Когда мы делаем соответствующий запрос к контроллеру Users, params[:id] получит значение 1.
    # Технически params[:id] - это строка "1"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
