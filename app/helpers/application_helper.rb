module ApplicationHelper
  def render_events
    # get the 2 closest future events
    @events = Refinery::Events::Event.find(:all, :conditions => ['date > ?', Time.now ], :order => 'date ASC' )
    render file: 'refinery/events/events/_custom_list_markup' 
  end

  def render_perks
    @perks = Refinery::Perks::Perk.all(:order => 'position ASC')
    render file: 'refinery/perks/perks/_custom_list_markup'
  end

  def render_social_networks
    @social_networks = Refinery::SocialNetworks::SocialNetwork.all(:order => 'position ASC')
    render file: 'refinery/social_networks/social_networks/_list' 
  end

  def render_teammates
    @teammates = Refinery::Teammates::Teammate.all(:order => 'position ASC')
    render file: 'refinery/teammates/teammates/_custom_list_markup'
  end

  # TODO: this probably should be somewhere in vendor/extensions/teammates
  def fetch_teammate_thumbnail (teammate)
    if teammate.picture
      image_fu teammate.picture, '70x70#c', {:class => 'column'}
    else
      image_tag image_path('default-profile-picture.png'), :size => '70x70', :class => 'column'
    end
  end

  # TODO: this probably should be somewhere in vendor/extensions/teammates
  def fetch_teammate_picture (teammate)
    if teammate.picture
      image_fu teammate.picture, '180x220#c', {:class => 'column'}
    else
      image_tag image_path('default-profile-picture.png'), :class => 'column'
    end
  end
end
