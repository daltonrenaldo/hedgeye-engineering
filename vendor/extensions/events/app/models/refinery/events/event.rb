module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :date, :address, :city, :state, :zip, :photo_id, :description, :teaser, :position

      acts_as_indexed :fields => [:title, :address, :city, :state, :description, :teaser]

      validates_presence_of :description

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      def full_address
        [self.address, self.city, self.state, self.zip].reject(&:blank?).join(' ')
      end
    end
  end
end
