class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new 
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    @user_ids = params[:group][:user_ids]
    @user_ids.shift
    if @group.save 
      @user_ids.each do |user_id|
        user = User.find(user_id.to_i)
        @group.users << user
      end
      redirect_to root_path, notice: 'グループを作成しました'
    else
      redirect_to new_group_path
    end
  end

  def show
    @belong_group = current_user.groups
    p @belong_group
    @group = Group.find(params[:id])
    user = @group.user_ids
    @step_logs = StepLog.where(user_id: user)
    @q = @step_logs.ransack(params[:q])
    @q_step_logs = @q.result(distinct: true).order(day: "ASC")
  end

  def edit
    @group = Group.find(params[:id])
    @group_users = @group.users
    @other_users = User.where.not(id: @group_users.ids)

  end

  def update
    @group = Group.find(params[:id])
    user = User.find(params[:group][:user_id])
    @group.users << user
    redirect_to groups_path

  end

  def destroy
    @group = Group.find(params[:id])
    @group.users.delete(current_user)
    redirect_to groups_path
  end
  private 
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
