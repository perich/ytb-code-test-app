class User < ActiveRecord::Base
  has_many :books

  def notify_admin
    AdminMailer.new_user(self).deliver_later
  end

end
