class User < ActiveRecord::Base
  has_many :books

  def notify_admin
    AdminMailer.new_user(self).deliver_now
  end

end
