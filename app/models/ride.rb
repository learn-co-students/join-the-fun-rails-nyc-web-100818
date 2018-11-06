class Ride < ActiveRecord::Base # JOIN TABLE, THE THROUGH
  belongs_to :taxi
  belongs_to :passenger
end
