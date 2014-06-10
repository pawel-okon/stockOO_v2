class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    respond_to do |f|
      f.html { redirect_to root_url }
      f.json {
        render :status => 200,
               :json => { :success => true,
                          :info => "Logged in",
                          :data => { :auth_token => current_user.authentication_token } }
      }
    end
  end

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_user.update_column(:authentication_token, nil)
    respond_to do |f|
      f.html { redirect_to root_url, notice: "Log out!" }
      f.json {
        render :status => 200,
               :json => { :success => true,
                          :info => "Logged out",
                          :data => {} }
      }
    end
  end

  def failure
    respond_to do |f|
      f.html { redirect_to root_url, alert: "Something went wrong." }
      f.json {
        render :status => 401,
               :json => { :success => false,
                          :info => "Login Failed",
                          :data => {} }
      }
    end
  end
end
