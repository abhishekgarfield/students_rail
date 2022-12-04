class StudentInformation < ApplicationRecord
  belongs_to :country
  belongs_to :city
end
