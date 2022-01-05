class UsersController < ApplicationController
  # before_action :set_holiday, only: [:show, :update,]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @r = @user.remaining_holiday  
    @holidays = @user.holidays
    @groups = Group.all
  end

  def holiday
    @users = User.all
    @holidays = Holiday.all
  end

  def week_holiday_change
    @users = User.all
    @changes = WeekHolidayChange.all
  end


  def create 
    @notification = Notification.new
    @group = Group.find(params[:group_id]) 
    @user = User.find(params[:user_id]) 
    @notification.user_id = @user
    @notification.group_id = @group
    if @group.save
         redirect_to group_user_path(group_id: @group.id, id: @group.id)
         # 将来的には、JavaScriptで非同期通信にしたい
    else
         render :new
    end
  end

  private
  # ストロングパラメータ
  def set_holiday
    
  end
end
