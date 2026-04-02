class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :set_flash_messages

  private

  def authenticate_admin_user!
    return if current_admin_user.present?

    redirect_to new_admin_user_session_path, alert: t("devise.failure.unauthenticated")
  end

  def set_flash_messages
    flash.now[:notice] = flash[:notice] if flash[:notice].present?
    flash.now[:alert] = flash[:alert] if flash[:alert].present?
  end
end
