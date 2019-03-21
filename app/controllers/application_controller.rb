class ApplicationController < ActionController::API

  def token
    request.headers['Authorisation']
  end

  def issue_token(payload)
    JWT.encode(payload, secret)
  end

  def token_authorised
    decoded_token[0]['admin']
  end

  def decoded_token
    if token
      begin
        JWT.decode(token, secret)
      rescue JWT::DecodeError
        return [{}]
      end
    else
      [{}]
    end
  end

  def admin_password
    ENV['ADMIN_AUTH_KEY']
  end

  def secret
    ENV['JWT_ENCRYPTION_SECRET']
  end
end
