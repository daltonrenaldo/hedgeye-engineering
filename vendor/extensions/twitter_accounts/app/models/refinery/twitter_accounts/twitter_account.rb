module Refinery
  module TwitterAccounts
    class TwitterAccount < Refinery::Core::BaseModel
      self.table_name = 'refinery_twitter_accounts'

      attr_accessible :username, :tweet_count, :position

      acts_as_indexed :fields => [:username]

      validates :username, :presence => true, :uniqueness => true
    end
  end
end
