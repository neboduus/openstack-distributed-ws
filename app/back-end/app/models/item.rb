class Item < ApplicationRecord
  attr_accessor :ip
 # relations
 belongs_to :todos
 # validations
 validates :text, presence: true validates :text, length: { minimum: 3 }
 #set default value for done
 before_save :default_values
 def default_values
  self.done ||= false
 end
end
