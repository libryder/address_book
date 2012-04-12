FactoryGirl.define do 
  factory :address do 
    zip "41075"
    street "125 Main st"
    city "Fort Thomas"
    state "KY"
  end
  factory :user do
    first_name "frank"
    last_name "sinatra"
  end
  
end