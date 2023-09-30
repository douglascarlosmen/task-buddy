class TasksController < ApplicationController

    before_action :authenticate_user!
    layout "application"

    def index        
        @tasks = Task.order(created_at: order_filter)
        @order = params[:order]
    end

    def show
        @task = Task.find(params[:id])
    end    
    
    def new    
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to tasks_path
        else
            render :new, status: :unprocessable_entity            
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        
        if @task.update(task_params)
            redirect_to @task
        else
            render :edit, status: :unprocessable_entity            
        end
    end

    def destroy
        @task = Task.find(params[:id])

        if @task.destroy
            redirect_to tasks_path, status: :see_other
        else
            render :show, status: :unprocessable_entity
        end
    end

    private
        def task_params
            params.require(:task).permit(:title, :body, :status)
        end

        def filter_params
            params.permit(:order)
        end

        def order_filter
            if params[:order] == "ASC"
                :asc
            else
                :desc
            end
        end
end
