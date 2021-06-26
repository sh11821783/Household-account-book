class HouseholdAccountBooksController < ApplicationController
  before_action :set_user, only: [:update_one_month, :edit_one_month, :edit_one_month_1, :update_one_month_1, :edit_one_month_2, :update_one_month_2]
  before_action :logged_in_user, only: [:update, :edit_one_month, :edit_one_month_1, :edit_one_month_2]
  before_action :set_one_month, only: [:edit_one_month, :edit_one_month_1, :edit_one_month_2]

  UPDATE_ERROR_MSG = "編集に失敗しました。やり直してください。"

  def update
    @user = User.find(params[:user_id])
    @household_account_book = HouseholdAccountBook.find(params[:id])
    if @user.update(household_account_books_params)
      flash[:success] = "Your account was updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  # 固定費の編集画面
  def edit_one_month
    @household_accounnt_book = @user.household_account_books.find_by(worked_on: @first_day)
  end

  # 固定費の更新
  def update_one_month
    ActiveRecord::Base.transaction do
      household_account_books_params.each do |id, item|
        household_account_book = HouseholdAccountBook.find(id)
        household_account_book.update_attributes!(item)
      end
      flash[:success] = "1ヶ月分の固定費を書き込みました。"
      redirect_to user_url(date: params[:date])
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です
    flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
    redirect_to household_account_books_edit_one_month_user_url(date: params[:date])
    end
  end

  # 変動費の編集画面
  def edit_one_month_1
    @household_accounnt_book = @user.household_account_books.find_by(worked_on: @first_day)
  end

  # 変動費の更新
  def update_one_month_1
    ActiveRecord::Base.transaction do
      household_account_books_1_params.each do |id, item|
        household_account_book = HouseholdAccountBook.find(id)
        household_account_book.update_attributes!(item)
      end
      flash[:success] = "1ヶ月分の変動費を書き込みました。"
      redirect_to show_1_user_url(date: params[:date])
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です
    flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
    redirect_to household_account_books_edit_one_month_1_user_url(date: params[:date])
    end
  end

  # 収入の編集画面
  def edit_one_month_2
    @household_accounnt_book = @user.household_account_books.find_by(worked_on: @first_day)
  end

  # 収入の更新
  def update_one_month_2
    ActiveRecord::Base.transaction do
      household_account_books_2_params.each do |id, item|
        household_account_book = HouseholdAccountBook.find(id)
        household_account_book.update_attributes!(item)
      end
      flash[:success] = "1ヶ月分の収入を書き込みました。"
      redirect_to show_2_user_url(date: params[:date])
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です
    flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
    redirect_to household_account_books_edit_one_month_2_user_url(date: params[:date])
    end
  end

  private
  # 1ヶ月分のを扱います。
  def household_account_books_params
    params.require(:user).permit(household_account_books: [:fixed_cost, :fixed_cost_1, :fixed_cost_2, :fixed_cost_3, :fixed_cost_4, :fixed_cost_5, :fixed_cost_6, :fixed_cost_7, :fixed_cost_8, :fixed_cost_9, :fixed_cost_10, :fixed_cost_11, :fixed_cost_12, :fixed_cost_13, :fixed_cost_14, :fixed_cost_15,
                                                           :fixed_n, :fixed_n_1, :fixed_n_2, :fixed_n_3, :fixed_n_4, :fixed_n_5, :fixed_n_6, :fixed_n_7, :fixed_n_8, :fixed_n_9, :fixed_n_10, :fixed_n_11, :fixed_n_12, :fixed_n_13, :fixed_n_14, :fixed_n_15, :note])[:household_account_books]
  end

  def household_account_books_1_params
    params.require(:user).permit(household_account_books: [:variable_cost, :variable_cost_1, :variable_cost_2, :variable_cost_3, :variable_cost_4, :variable_cost_5, :variable_cost_6, :variable_cost_7, :variable_cost_8, :variable_cost_9, :variable_cost_10, :variable_cost_11, :variable_cost_12, :variable_cost_13, :variable_cost_14, :variable_cost_15,
                                                           :variable_n, :variable_n_1, :variable_n_2, :variable_n_3, :variable_n_4, :variable_n_5, :variable_n_6, :variable_n_7, :variable_n_8, :variable_n_9, :variable_n_10, :variable_n_11, :variable_n_12, :variable_n_13, :variable_n_14, :variable_n_15, :variable_note])[:household_account_books]
  end

  def household_account_books_2_params
    params.require(:user).permit(household_account_books: [:income, :income_1, :income_2, :income_3, :income_4, :income_5, 
                                                            :income_n, :income_n_1, :income_n_2, :income_n_3, :income_n_4, :income_n_5, :income_note])[:household_account_books]
  end                
end
