class Activity < ActiveRecord::Base
  has_many :tickets
  has_many :exhibits

  attr_accessor :qrcode

end
