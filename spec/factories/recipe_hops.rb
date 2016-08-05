FactoryGirl.define do
  factory :recipe_hop do
    recipe
    hop
    amount 1
    time 60
    use :boil
    form :pellet
  end
end
