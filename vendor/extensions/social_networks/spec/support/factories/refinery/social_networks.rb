
FactoryGirl.define do
  factory :social_network, :class => Refinery::SocialNetworks::SocialNetwork do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

