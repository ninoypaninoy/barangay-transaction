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
    @request.birthday = params[:request][:birthday]
    @request.place_issue = ""
    @request.cci2010 = ""
    @request.citizenship = ""
    @request.height = ""
    @request.weight = ""
    @request.basic_tax = ""
    @request.additional_tax = ""
    @request.salary = ""
    @request.interest = ""
    @request.total_amount = ""
    @request.position = ""
    @request.reminder = ""
    @request.birthday = ""
    @request.save
    redirect_to "/requests/#{@request.id}/transaction_view/"
  end

  def generate_cert
    @request = Request.find(params[:id])
    @request.place_issue = params[:request][:place_issue]
    @request.cci2010 = params[:request][:cci2010]
    @request.citizenship = params[:request][:citizenship]
    @request.height = params[:request][:height]
    @request.weight = params[:request][:weight]
    @request.basic_tax = params[:request][:basic_tax]
    @request.additional_tax = params[:request][:additional_tax]
    @request.salary = params[:request][:salary]
    @request.interest = params[:request][:interest]
    @request.total_amount = params[:request][:total_amount]
    @request.position = params[:request][:position]
    @request.reminder = params[:request][:reminder]
    @request.birthday = params[:request][:birthday]
    @request.update_attributes(params[:id])
    redirect_to "/requests/#{@request.id}/cedula_view/"
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
