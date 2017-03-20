class RequestsController < ApplicationController
  def form
    @request = Request.new()
  end

  def edit_transactions
    @request = Request.find(params[:id])
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
      redirect_to "/requests/form"
    end
  end
#saen controller idto? si view? idto nagdisiplay kan mga bago reminder... mayo man to dgdi sa controller...pigrender ko lang ito
  def generate_cert
    @request = Request.find(params[:id_cert])
    @request.update({:place_issue => params[:place_issue], :citizenship => params[:citizenship], :height => params[:height], :weight => params[:weight], :basic_tax => params[:basic_tax], :additional_tax => params[:additional_tax], :reminder => params[:reminder]})
    if session[:request_type] == "Cedula" then
      redirect_to "/requests/#{@request.id}/cedula_view/"
    elsif session[:request_type] == "Good moral"
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
        params.require(:request).permit(:request, :first_name, :middle_name, :last_name, :nickname, :residence_type, :transient_since, :bhouse_owner, :address, :contact_no, :gender, :status, :height, :weight, :occupation, :monthly_income, :purpose, :emergency_contact_person, :relationship, :contact_no_2, :birthday, :reminder )
    end
end
