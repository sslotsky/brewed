FactoryGirl.define do
  factory :recipe_fermentable do
    fermentable
    recipe
    use :mash
    amount 10
  end
end
