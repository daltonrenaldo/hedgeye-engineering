
FactoryGirl.define do
  factory :perk, :class => Refinery::Perks::Perk do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

