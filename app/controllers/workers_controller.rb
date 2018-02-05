class WorkersController < ApplicationController
    before_action :find_worker, only: [ :edit, :update ]

    def index
        @workers = Worker.all
    end

    def new
        @worker = Worker.new
    end

    def edit
    end

    def create
        worker = Worker.create(worker_params)
        redirect_to worker_path(worker)
    end

    def update
        @worker.update(worker_params)
        redirect_to workers_path
    end

    private

    def worker_params
        params.require(:worker).permit(:first_name, :last_name, :status)
    end

    def find_worker
        @worker = Worker.find(params[:id])
    end

end
