class RegistrationsController <  Devise::RegistrationsController 
  def build_resource(*args)
    super
    @user.uid = session[:uid]
    @user.valid?
  end

  def after_update_path_for(resource)
    questions_path
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      flash[:notice] = "Updated Successfully!"
      redirect_to after_update_path_for(@user)
    else
      flash[:notice] = "Unable to update your profile"
      render "edit"
    end
  end
end
