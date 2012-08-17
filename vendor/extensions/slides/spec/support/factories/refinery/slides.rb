
FactoryGirl.define do
  factory :slide, :class => Refinery::Slides::Slide do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

