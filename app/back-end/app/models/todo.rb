class Todo < ApplicationRecord
 attr_accessor :ip
 # relation
 has_many :items, dependent: :destroy
 # validation
 validates :title, presence: true
 validates :title, length: { minimum: 3 }
end
