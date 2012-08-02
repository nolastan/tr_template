class TasksController < ApplicationController
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

    if remote_task.save 
      @task.remote_id = remote_task.id
      debugger
      @task.remote_path = remote_task.links["get"]
      @task.state = remote_task.state
      @task.save
    else
      flash[:error] = remote_task.error
    end
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
end
