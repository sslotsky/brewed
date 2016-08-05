FactoryGirl.define do
  factory :recipe_extra do
    recipe
    extra
    amount 1
    amount_unit 'ea'
    time 10
    time_unit 'min'
    use 'mash'
  end
end
