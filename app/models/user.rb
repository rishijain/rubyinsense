class User
  include Mongoid::Document
  include Mongo::Voter
  
  devise :database_authenticatable, :registerable, :validatable
  field :email,               :type => String, :default => ''
  field :encrypted_password,  :type => String, :default => ''
  field :provider,            :type => String, :default => 'Twitter'
  field :uid,                 :type => Integer
  field :fname,               :type => String
  field :lname,               :type => String
  field :twitter_handle,      :type => String
  field :image_url,           :type => String, :default => ''
  field :twitter_url,         :type => String, :default => ''

  has_many :questions
  has_many :answers
  has_many :comments

  validates :uid, :email, presence: true
  
  after_create :set_twitter_handle
  after_create :add_image_url
  after_create :add_twitter_url

  def password_required?
    false
  end

  def set_twitter_handle
    handle = Twitter.user(self.uid)[:screen_name] 
    self.set(:twitter_handle, handle)
  end

  def add_image_url
    image  = Twitter.user(self.uid)[:profile_image_url] 
    self.set(:image_url, image)
  end

  def add_twitter_url
    self.set(:twitter_url, "http://twitter.com/#{self.twitter_handle}")
  end
end

