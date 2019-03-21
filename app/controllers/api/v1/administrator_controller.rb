class Api::V1::AdministratorController < ApplicationController
  before_action :token_authorised
  skip_before_action :token_authorised, only: [:authenticate]

  def authenticate
    if params[:password] === admin_password
      render json: { token: issue_token({ admin: true }) }
    else
      render json: { error: "Wrong Password" }
    end
  end

end
