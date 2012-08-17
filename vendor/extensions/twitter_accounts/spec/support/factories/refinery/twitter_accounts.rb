
FactoryGirl.define do
  factory :twitter_account, :class => Refinery::TwitterAccounts::TwitterAccount do
    sequence(:username) { |n| "refinery#{n}" }
  end
end

