class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    @image = resource.image || Image.new
    super
  end

  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :city, :email, :password, :password_confirmation)
  end
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :city, :email, :password, :password_confirmation, :current_password, image_attributes: [:id, :image, :_destroy])
  end
end
