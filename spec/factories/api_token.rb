FactoryGirl.define do
  factory :api_token do
    user
    user_agent 'test'
  end
end
