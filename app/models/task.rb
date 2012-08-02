class Task < ActiveRecord::Base
  attr_accessible :assign_by_time, :assignment_type, :city_id, :complete_by_time, :cost_in_cents, :description, :name, :named_price, :number_runners_to_fill, :private_description, :virtual
end
