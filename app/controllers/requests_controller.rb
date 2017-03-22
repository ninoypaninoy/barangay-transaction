class RequestsController < ApplicationController
  def form
    @request = Request.new()
  end

  def edit_transactions
    @requests = Request.find(params[:id])

  end

  def update_record
    @request = Request.find(params[:id])
    session[:test] = params[:id]
    if @request.update_attributes(:first_name => params[:first_name]) &&
    @request.update_attributes(:request => params[:request]) &&
    @request.update_attributes(:middle_name => params[:middle_name]) &&
    @request.update_attributes(:last_name => params[:last_name]) &&
    @request.update_attributes(:status => params[:status]) &&
    @request.update_attributes(:birthday => params[:birthday]) &&
    @request.update_attributes(:birth_place => params[:birth_place]) &&
    @request.update_attributes(:occupation => params[:occupation]) &&
    @request.update_attributes(:monthly_income => params[:monthly_income]) &&
    @request.update_attributes(:relationship => params[:relationship]) &&
    @request.update_attributes(:contact_no_2 => params[:contact_no_2]) then
    #@request.update({:request => params[:request], :first_name => params[:first_name], :middle_name => params[:middle_name], :last_name => params[:last_name], :nickname => params[:nickname], :address => params[:address], :contact_no => params[:contact_no], :gender => params[:gender],
    #       :status => params[:status], :birthday => params[:birthday], :birth_place => params[:birth_place], :occupation => params[:occupation], :monthly_income => params[:monthly_income], :purpose => params[:purpose], :emergency_contact_person => params[:emergency_contact_person],
    #       :relationship => params[:relationship], :contact_no_2 => params[:contact_no_2], })
      redirect_to "/requests/#{@request.id}/transaction_view"
    else
      redirect_to "/requests/#{@request.id}/edit_transactions"
    end
  end
  def view
      @requests = Request.all
  end

  def index
    @request = Request.new
    @reminders = Reminder.all
    @reminder = Reminder.new
    @request = Request.all
    @user = session[:username]
  end

  def transactions
    @request = Request.all
  end

  def cedula_view
    @requests = Request.find(params[:id])
  end

  def good_moral_view
    @request = Request.find(params[:id])
    @official = Official.where(official_position: "Barangay Captain")
  end

  def transaction_view
    @requests = Request.all
    @request = Request.find(session[:test])
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
    @request.birthday = params[:request][:birthday]
    @request.birth_place = params[:request][:birth_place]
    @request.occupation = params[:request][:occupation]
    @request.monthly_income = params[:request][:monthly_income]
    @request.purpose = params[:request][:purpose]
    @request.emergency_contact_person = params[:request][:emergency_contact_person]
    @request.relationship = params[:request][:relationship]
    @request.contact_no_2 = params[:request][:contact_no_2]
    if @request.save
      redirect_to "/requests/#{@request.id}/transaction_view/"
    else
      render "form"
    end
  end

  def generate_cert
    @request = Request.find(params[:id_cert])
    @request.update({:place_issue => params[:place_issue], :province => params[:province], :city_or_municipality => params[:city_or_municipality], :barangay => params[:barangay], :citizenship => params[:citizenship], :height => params[:height], :weight => params[:weight], :basic_tax => params[:basic_tax], :additional_tax => params[:additional_tax]})
    if session[:request_type] == "Cedula" then
      redirect_to "/requests/#{@request.id}/cedula_view/"
    elsif session[:request_type] == "Good moral" || session[:request_type] == "Indigency"
      redirect_to "/requests/#{@request.id}/good_moral_view/"
    end
  end

  def reminder_def
    @reminder = Reminder.new
    @reminder.reminder_title = params[:reminder][:reminder_title]
    @reminder.reminder_content = params[:reminder][:reminder_content]
    @reminder.reminder_due = params[:reminder][:reminder_due]
    if @reminder.save then
      redirect_to "/requests"
    end
  end

  def delete_reminder
    @reminders = Reminder.find(params[:id])
    if @reminders.destroy then
      redirect_to "/requests"
    else
      redirect_to "/requests/officials"
    end
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

    def reminder_params
      params.require(:request).permit(:reminder)
    end

    def request_params
        params.require(:request).permit(:request, :first_name, :middle_name, :last_name, :nickname, :residence_type, :transient_since, :bhouse_owner, :address, :contact_no, :gender, :status, :height, :weight, :occupation, :monthly_income, :purpose, :emergency_contact_person, :relationship, :contact_no_2, :birthday )
    end
end
