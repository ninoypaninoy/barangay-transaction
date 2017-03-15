class RequestsController < ApplicationController
  def form
    @request = Request.new()
  end

  def view
      @requests = Request.all
  end

  def index
    @request = Request.new
    @request = Request.all
    @user = session[:username]
  end

  def transactions
    @request = Request.all
  end

  def cedula_view
    @requests = Request.find(params[:id])
  end

  def transaction_view
    @requests = Request.all
    @request = Request.find(params[:id])
  end


  def add_transaction
    @request = Request.new()
    @request.request = params[:request][:request]
    @request.first_name = params[:request][:first_name]
    @request.middle_name = params[:request][:middle_name]
    @request.last_name = params[:request][:last_name]
    @request.nickname = params[:request][:nickname]
    @request.residence_type = params[:request][:residence_type]
    @request.bhouse_owner = params[:request][:bhouse_owner]
    @request.address = params[:request][:address]
    @request.contact_no = params[:request][:contact_no]
    @request.gender = params[:request][:gender]
    @request.status = params[:request][:status]
    @request.birth_place = params[:request][:birth_place]
    @request.occupation = params[:request][:occupation]
    @request.monthly_income = params[:request][:monthly_income]
    @request.purpose = params[:request][:purpose]
    @request.emergency_contact_person = params[:request][:emergency_contact_person]
    @request.relationship = params[:request][:relationship]
    @request.contact_no_2 = params[:request][:contact_no_2]
    @request.save

    redirect_to "/requests/#{@request.id}/transaction_view/"
  end

  def delete
    @requests = Request.find(params[:id])
    @requests.destroy
    redirect_to "/requests/transactions/"
  end

  private
    def set_transactions
      @request = Request.find(params[:id])
    end

    def request_params
        params.require(:request).permit(:request, :first_name, :middle_name, :last_name, :nickname)
    end
end
