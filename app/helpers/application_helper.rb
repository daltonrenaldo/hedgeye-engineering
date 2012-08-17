module ApplicationHelper
  def fetch_slides
    @slides = Refinery::Slides::Slide.all(:order => 'position ASC')
  end

  def has_slides?
    if Refinery::Slides::Slide.count == 0
      false
    else
      true
    end
  end
  def render_events
    # get the 2 closest future events
    @events = Refinery::Events::Event.find(:all, :conditions => ['date > ?', Time.now ], :order => 'date ASC' )
    render file: 'refinery/events/events/_custom_list_markup' 
  end

  def render_perks
    @perks = Refinery::Perks::Perk.paginate(:page => params[:page], :per_page => 4, :order => 'position ASC')
    render file: 'refinery/perks/perks/_custom_list_markup'
  end

  def render_social_networks
    @social_networks = Refinery::SocialNetworks::SocialNetwork.all(:order => 'position ASC')
    render template: 'refinery/social_networks/social_networks/_list' 
  end

  def render_teammates
    @teammates = Refinery::Teammates::Teammate.paginate(:page => params[:page], :per_page => 4, :order => 'position ASC')
    render template: 'refinery/teammates/teammates/_teammate_list_markup'
  end

  def render_tweets
    twitter_account = Refinery::TwitterAccounts::TwitterAccount.first
    screen_name = twitter_account.username
    begin
      twitter_url = "http://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=#{screen_name}&count=2"
      @json_tweets = JSON.parse(open(twitter_url).read())
      render template: 'refinery/twitter_accounts/twitter_accounts/_tweets_template'
    rescue Exception => e
      Rails.logger.error("Failed to retreive tweets from Twitter")
      # TODO: probably good to load some default tweets here
      nil
    end
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
