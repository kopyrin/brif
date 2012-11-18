# encoding: UTF-8
class InformationController < ApplicationController
    before_filter :authenticate_user!
    # GET /information
    def index
        @title = "Список информации"
        @current_information   = params[:category]

        if @current_information == nil  or  @current_information == ""
          @information = Information.paginate :page => params[:page], :order => 'OrderCategory ASC'
        else
          @information = Information.paginate(:page => params[:page], :order => 'OrderCategory ASC').where("category = ?", @current_information)
        end
    end

    def select_information
        @title = "Список для выбора информации"
        @current_information   = params[:category]

        if @current_information == nil  or  @current_information == ""
          @information = Information.paginate :page => params[:page], :order => 'OrderCategory ASC'
        else
          @information = Information.paginate(:page => params[:page], :order => 'OrderCategory ASC').where("category = ?", @current_information)
        end
    end

    # GET /information/1
    def show
        @information = Information.find(params[:id])
    end

    # GET /information/new
    def new
      @information = Information.new
    end

    # GET /information/1/edit
    def edit
      @information = Information.find(params[:id])
    end

    # POST /information
    def create
      @information = Information.new(params[:information])

    if @information.save
    redirect_to({:action => 'index'}, {:notice => 'Information добавлен'})
    else
      render :action, '"new"'
    end
  end

  # PUT /information/1
  def update
    @information = Information.find(params[:id])

    if @information.update_attributes(params[:information])
        redirect_to(@information, :notice => 'Изменения внесены')
    else
      render :action, '"edit"'
    end
  end

  # DELETE /information/1
  def destroy
  @information = Information.find(params[:id])
    @information.destroy

    redirect_to (information_index_url)
  end
end