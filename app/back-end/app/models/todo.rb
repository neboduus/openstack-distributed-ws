class Todo < ApplicationRecord
 # relation
 has_many :items, dependent: :destroy
 # validation
 validates :title, presence: true
 validates :title, length: { minimum: 3 }
end
