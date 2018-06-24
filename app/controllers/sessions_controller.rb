class SessionsController < ApplicationController
  def refresh
    redirect_to root_url(host: Rails.application.config.host)
  end
  def show
    raise RestfulError::Unauthorized unless current_user
    last_access = Time.at(session[:now].to_i)
    raise RestfulError::Unauthorized if last_access < 1.day.ago
  end

  def auth
    omni_hash = request.env['omniauth.auth']
    unless omni_hash && omni_hash[:uid] == '417109'
      honey.push notice: "ログインは kuboon 専用です"
      return redirect_to root_path
    end
    Rails.cache.write(:auth_token, omni_hash['credentials']['token'])
    honey.push notice: 'ログインしました'
    stamp_session
    redirect_to admin_session_url
  end

  def user
    auth_id = session.delete("auth_id")
    @user = User.new(params.require(:user).permit(:name).merge(password: SecureRandom.base64(12)))
    if @user.save
      Auth.find(auth_id).update_columns(user_id: @user.id) if auth_id
      sign_in @user
      stamp_session
      redirect_to @user
    else
      hoge
      render 'new'
    end
  end

  def destroy
    sign_out
    honey.push notice: 'ログアウトしました'
    redirect_to root_url
  end

  private

  def stamp_session
    session[:now] = Time.now.to_i
  end
end
