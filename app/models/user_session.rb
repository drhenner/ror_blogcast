class UserSession < Authlogic::Session::Base
  # configuration here, see documentation for sub modules of Authlogic::Session
  find_by_login_method :find_by_login_or_email
end