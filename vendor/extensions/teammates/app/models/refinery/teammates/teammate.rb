module Refinery
  module Teammates
    class Teammate < Refinery::Core::BaseModel
      self.table_name = 'refinery_teammates'

      attr_accessible :title, :name, :email, :picture_id, :bio, :position

      acts_as_indexed :fields => [:title, :name, :email, :bio]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end
