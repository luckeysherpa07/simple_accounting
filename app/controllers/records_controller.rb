class RecordsController < ApplicationController
    def index
        @records = Record.all.order("created_at DESC")
        @blnc = Record.balance
        @amt = Record.amount
        @deb = Record.debt
    end
    
    def new
    end
    
    def create
        @record = Record.create(record_params)
        if @record.valid?
            flash[:success] = "Record is added successfully!"
            redirect_to root_path
        else
            flash[:alert] = "Looks like there is an error."
            redirect_to new_record_path
        end
    end
    
    def edit
        @record = Record.find(params[:id])
    end
    
    def destroy
        @record = Record.find(params[:id])
        @record.destroy
        flash[:success]="Record is deleted successfully!"
        redirect_to root_path
    end

    
    def update
        @record = Record.find(params[:id])
        if @record.update(record_params)
            redirect_to root_path
            flash[:success]="Record is edited successfully"
        else
            redirect_to edit_record_path(params[:id])
            flash[:alert] = "Error seems."
        end
    end
    
    def show
        
    end
    
    private
    
    def record_params
        params.require(:record).permit(:title,:amount,:date)
    end
end
