module ApplicationHelper
  def render_events
    # get the 2 closest future events
    @events = Refinery::Events::Event.find(:all, :conditions => ['date > ?', Time.now ], :order => 'date ASC' )
    render file: 'refinery/events/events/_custom_list_markup' 
  end

  def render_social_networks
    @social_networks = Refinery::SocialNetworks::SocialNetwork.all(:order => 'position ASC')
    render file: 'refinery/social_networks/social_networks/_list' 
  end

  def render_teammates
    @teammates = Refinery::Teammates::Teammate.all(:order => 'position ASC')
    render file: 'refinery/teammates/teammates/_custom_list_markup'
  end
end
