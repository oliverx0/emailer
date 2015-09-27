class Message < ActiveRecord::Base
  validates :email, :presence => true, allow_blank: false
  validates :title, :presence => true, allow_blank: false
  validates :content, :presence => true, allow_blank: false
end
