
FactoryGirl.define do
  factory :teammate, :class => Refinery::Teammates::Teammate do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

