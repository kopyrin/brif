# encoding: UTF-8
  class MattersController < ApplicationController
    # GET /matters
    def index
        @current_information   = params[:category]
        @projects = Project.find(params[:project_id])
        if @current_information == nil  or  @current_information == ""
            @matters = Matter.paginate(:page => params[:page], :order => 'ordercategory ASC').where("project_id = ?", params[:project_id])
        else
            @matters = Matter.paginate(:page => params[:page], :order => 'ordercategory ASC').where("project_id = ? and category = ?", params[:project_id], @current_information)
        end
        
    end
    
    def toprn
        @projects = Project.find(params[:project_id])
        @matters = Matter.where("project_id = ?", params[:project_id]).order('ordercategory ASC')
    end
    
  # GET /matters/1
    def show
        @matter = Matter.find(params[:id])
    end

    # GET /matters/new
    def new
        @information = Information.find(params[:information_id])
        @matter = Matter.new
        @matter.demand = @information.demand
        @matter.answer = @information.answer
        @matter.category = @information.category
        @matter.sybcategory = @information.subcategory
        @matter.ordercategory = @information.OrderCategory
    end

    # GET /matters/1/edit
    def edit
        @matter = Matter.find(params[:id])
    end

    # POST /matters
    def create
        @matter = Matter.new(params[:matter])
        @matter.project_id = params[:project_id]
        @temp_path =  params[:project_id]
        if @matter.save
          redirect_to :action => 'index', :project_id => params[:project_id]
        else
          render :action, '"new"'
        end
    end

    # PUT /matters/1
    def update
        @matter = Matter.find(params[:id])

        if @matter.update_attributes(params[:matter])
           redirect_to :action => 'index', :project_id => params[:project_id]
        else
          render :action, '"edit"'
        end
    end

    # DELETE /matters/1
    def destroy
        @matter = Matter.find(params[:id])
        @matter.destroy

        redirect_to :action => 'index', :project_id => params[:project_id]
    end
end