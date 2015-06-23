class Ticket < ActiveRecord::Base
  belongs_to :activity
  attr_accessor :qrcode
end
