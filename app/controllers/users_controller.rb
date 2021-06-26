class UsersController < ApplicationController
  before_action :set_user, only: [:show, :show_1, :show_2, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: [:show, :show_1, :show_2]

  def index
    @users = User.paginate(page: params[:page]).search(params[:search])
  end
  # 固定費画面
  def show
    if params["select_year(1i)"].present? && params["select_month(2i)"].present? #&& params["select_month(3i)"].present?
      # パラメーターで2020(1i)-06(2i)-01(3i)というスタイルで表示されていたので、コードもそれに合わせてやる。
      select_day = params["select_year(1i)"] + "-" + 
        # パラメーター上では、月日は「6」や「１」というふうに出ていたので上記のスタイルに合わせて比較させるので以下のよいうにフォーマットを合わせている。
        format("%02d", params["select_month(2i)"]) + "-" + 
        format("%02d", params["select_month(3i)"])
      # @first_day = select_day.to_date.beginning_of_month
      # @last_day = @first_day.end_of_month
      # @household_account_books = @user.household_account_books.where(worked_on: @first_day..@last_day).order(:worked_on)
      params[:date] = select_day.to_date.beginning_of_month
      set_one_month
    end
    @household_account_book = @user.household_account_books.find_by(worked_on: @first_day)
    #@cost_1 = @user.household_account_books.pluck(:fixed_cost, :fixed_cost_1, :fixed_cost_2, :fixed_cost_3, :fixed_cost_4, :fixed_cost_5, :fixed_cost_6, :fixed_cost_7, :fixed_cost_8, :fixed_cost_9, :fixed_cost_10, :fixed_cost_11, :fixed_cost_12, :fixed_cost_13, :fixed_cost_14, :fixed_cost_15)
  end
  # 変動費画面
  def show_1
    if params["select_year(1i)"].present? && params["select_month(2i)"].present? #&& params["select_month(3i)"].present?
      # パラメーターで2020(1i)-06(2i)-01(3i)というスタイルで表示されていたので、コードもそれに合わせてやる。
      select_day = params["select_year(1i)"] + "-" + 
        # パラメーター上では、月日は「6」や「１」というふうに出ていたので上記のスタイルに合わせて比較させるので以下のよいうにフォーマットを合わせている。
        format("%02d", params["select_month(2i)"]) + "-" + 
        format("%02d", params["select_month(3i)"])
      # @first_day = select_day.to_date.beginning_of_month
      # @last_day = @first_day.end_of_month
      # @household_account_books = @user.household_account_books.where(worked_on: @first_day..@last_day).order(:worked_on)
      params[:date] = select_day.to_date.beginning_of_month
      set_one_month
    end
    @household_account_book = @user.household_account_books.find_by(worked_on: @first_day)
  end
  # 収入画面
  def show_2
    if params["select_year(1i)"].present? && params["select_month(2i)"].present? #&& params["select_month(3i)"].present?
      # パラメーターで2020(1i)-06(2i)-01(3i)というスタイルで表示されていたので、コードもそれに合わせてやる。
      select_day = params["select_year(1i)"] + "-" + 
        # パラメーター上では、月日は「6」や「１」というふうに出ていたので上記のスタイルに合わせて比較させるので以下のよいうにフォーマットを合わせている。
        format("%02d", params["select_month(2i)"]) + "-" + 
        format("%02d", params["select_month(3i)"])
      # @first_day = select_day.to_date.beginning_of_month
      # @last_day = @first_day.end_of_month
      # @household_account_books = @user.household_account_books.where(worked_on: @first_day..@last_day).order(:worked_on)
      params[:date] = select_day.to_date.beginning_of_month
      set_one_month
    end
    @household_account_book = @user.household_account_books.find_by(worked_on: @first_day)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end

    def basic_info_params
      params.require(:user).permit(:email, :phone_number, :password, :password_confirmation)
    end

    # beforフィルター

    # paramsハッシュからユーザーを取得します。
    def set_user
      @user = User.find(params[:id])
    end

    # ログイン済みのユーザーか確認します。
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end

    # アクセスしたユーザーが現在ログインしているユーザーか確認します。
    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end

    # システム管理権限所有かどうか判定します。
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end