class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index

    @title = "Список проектов"
    @user = current_user()
    @searh_value_return = 0
    # если не выбрали тип поиска и искомое значение
    if params[:select_search] == nil or params[:value_select] == nil  or params[:value_select][:searh_value] == ""
      @projects = Project.paginate(:page => params[:page])
    else
      case 
      # ищем по пользователю
      when params[:select_search].to_i == 1
           @projects = Project.paginate(:page => params[:page]).where("autor = ?", params[:value_select][:searh_value])
       # ищем по № проекта
      when params[:select_search].to_i == 2
           @projects = Project.paginate(:page => params[:page]).where("id = ?", params[:value_select][:searh_value])
      # ищем по названию проекта
      when params[:select_search].to_i == 3
           @projects = Project.paginate(:page => params[:page]).where("name = ?", params[:value_select][:searh_value])   
      end 
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @title = "Содержание брифа"

    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @title = "Новый бриф"
    @project = Project.new
    @project.name = "Новый бриф"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @title = "Редактирование брифа"
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @title = "Создание брифа"
    @users = current_user()
    @project = @users.projects.create()
    @project.user_id = @users.id
    @project.autor = @users.name
    @project.name = params[:project][:name]
	if params[:grave] == "1"
		@project.grave = true
	else
		@project.grave = false
	end
    respond_to do |format|
      if @project.save
        format.html { redirect_to action: "index" }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @title = "Обновление проекта"
    @project = Project.find(params[:id])
	if params[:grave] == "1"
		@project.grave = 1
	else
		@project.grave = 0
	end
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to action: "index"}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @title = "Уничтожение проекта"
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
