class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authorize
  before_action :set_i18n_locale_from_params
  protect_from_forgery with: :exception


  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
    def default_url_options
      { locale: I18n.locale }
    end

    def authorize
        return if User.count.zero?
        if request.format == Mime[:html]
          user = User.find_by(id: session[:user_id])
        else
          user = authenticate_or_request_with_http_basic do |u, p|
            User.find_by_name(u).try(:authenticate, p)
          end
        end
        redirect_to login_url, notice: "Please log in" unless user
    end
end
