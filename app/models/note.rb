class Note < ActiveRecord::Base
  validates :text, :presence => true
  validates :subject, :presence => true
end
