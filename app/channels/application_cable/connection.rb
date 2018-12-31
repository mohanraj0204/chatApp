module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = current_user
    end

    def disconnect

    end

    protected

    def find_current_user
      if current_user = User.find(id: cookies.signed[:user_id])
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
