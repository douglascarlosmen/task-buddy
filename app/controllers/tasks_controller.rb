class TasksController < ApplicationController
    def index
    end
    
    def new    
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to @task
        else
            render :new, status: :unprocessable_entity            
        end
    end

    private
        def task_params
            params.require(:task).permit(:title, :body, :status)
        end
end
