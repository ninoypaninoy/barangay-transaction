class RequestsController < ApplicationController
  def form
    @request = Request.new
  end

  def view
      @requests = Request.all
  end

  def index
    @request = Request.all
    @user = session[:username]
  end

  def edit_officials
    @requests = Request.find(params[:id])
  end

  def officials
    @request = Request.all
  end

  def officials_view
    @requests = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update_attributes(request_params)
    redirect_to "/requests/officials_view/#{@request.id}"
  end

  def new_official
    @request = Request.new()
  end

  def add_official
    @request = Request.new()
    @request.first_name = params[:request][:first_name]
    @request.middle_name = params[:request][:middle_name]
    @request.last_name = params[:request][:last_name]
    @request.position = params[:request][:position]
    @request.save
    redirect_to "/requests/officials_view/#{@request.id}"
  end

  def form
    @request = Request.new()
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

    redirect_to "/requests/transactions/#{@request.id}"
  end

  def delete
    @requests = Request.find(params[:id])
    @requests.destroy
    redirect_to '/requests/officials/'
  end

  private
    def request_params
        params.require(:request).permit(:first_name, :middle_name, :last_name, :position)
    end
end
