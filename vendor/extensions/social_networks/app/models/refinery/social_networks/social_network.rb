module Refinery
  module SocialNetworks
    class SocialNetwork < Refinery::Core::BaseModel
      self.table_name = 'refinery_social_networks'

      attr_accessible :name, :profile_url, :icon_id, :position

      acts_as_indexed :fields => [:name, :profile_url]

      validates_presence_of :name, :profile_url, :icon_id

      validates :name, :uniqueness => true

      belongs_to :icon, :class_name => '::Refinery::Image'
    end
  end
end
