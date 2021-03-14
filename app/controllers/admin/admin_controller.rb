# frozen_string_literal: true

class Admin::AdminController < ApplicationController
  layout "admin-page"

  before_action :logged_in_user
  before_action :require_admin

  private

  def require_admin
    check_admin
  end
end
