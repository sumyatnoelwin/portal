class Students::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:student_name, :reg_no, :profile, :gender, :dob, :nrc, :address, :email, :phone, :section_id, :guardian, :relation, :password, :password_confirmation)
  end
end