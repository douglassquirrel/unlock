class User < ActiveRecord::Base
  validates_format_of :passcode, :with => /\d{10}/,  :message => "must be exactly ten digits"
  validates_presence_of :first_name, :last_name, :passcode
  validates_uniqueness_of :passcode
end
