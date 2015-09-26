class Message < ActiveRecord::Base
  validates :email, :presence => true
  validates :title, :presence => true
  validates :content, :presence => true
end
