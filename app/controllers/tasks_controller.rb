class TasksController < ApplicationController
  before_filter :require_logged_in, :only => [:new, :create, :edit]
  before_filter :require_current_user, :only => :edit

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    render action: "new" and return if !@task.save

    remote_task = current_user.api_session.tasks.new({
      :name => @task.name,
      :named_price =>  @task.named_price, 
      :city_id =>  @task.city_id,
      :description =>  @task.description,
      :private_description =>  @task.private_description,
      :cost_in_cents =>  @task.cost_in_cents,
      :virtual =>  @task.virtual,
      :assignment_type =>  @task.assignment_type
    })

    # @TODO: better error handling
    if remote_task.save and remote_task.id
      @task.remote_id   = remote_task.id
      @task.remote_path = remote_task.links["get"]
      @task.state       = remote_task.state
      @task.save
    else
      flash[:error] = remote_task.error || "Error posting to TaskRabbit."
    end

    redirect_to @task
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def require_logged_in
    if current_user.nil?
      redirect_to :root
    end
  end

  def require_current_user #@TODO add user id
    current_user.id == user_id
  end
end
