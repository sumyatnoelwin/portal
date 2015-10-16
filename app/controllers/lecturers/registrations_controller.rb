class Lecturers::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:lecturer_name, :gender, :dob, :nrc, :email, :address, :phone, :password, :password_confirmation)
  end
end