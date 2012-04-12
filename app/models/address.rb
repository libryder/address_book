class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :belongs_to, :city, :state, :street, :zip
  
  validates_presence_of :street, :city, :zip
  validate :state, :if => :is_state?
  validates_numericality_of :zip
  validates_presence_of :user

  def is_state?
    valid_states =[
    "AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU",
    "HI","IA","ID", "IL","IN","KS","KY","LA","MA","MD","ME","MH","MI",
    "MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH",
    "OK", "OR","PA","PR","PW","RI","SC","SD","TN","TX","UT","VA","VI",
    "VT","WA","WI","WV","WY"
    ]
    
    unless valid_states.include? self.state
      errors.add(:state, 'State must be a valid US state in the form of two characters.')
    end
  end

end
