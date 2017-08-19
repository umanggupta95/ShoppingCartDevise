class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def show

  end
  # POST /resource
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  # GET /resource/edit
  def edit

  end

  # PUT /resource
  def update
    if current_user.update_attributes(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :last_name, :first_name, :date_of_birth, :contact_number)
  end

end
