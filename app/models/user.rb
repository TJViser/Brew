class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter,:facebook, :google_oauth2]

  validates :first_name, :last_name, presence: true
  #validates :beer_brand, uniqueness: true

  has_many :wishlists
  has_many :beers

  def self.find_for_twitter_oauth(auth)
    user_params = auth.slice(:provider, :uid).to_h
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:first_name] = auth.info.name.split(" ")[0]
    user_params[:last_name] = auth.info.name.split(" ")[1]

    if auth.credentials.expires_at
      user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    end

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.email = Devise.friendly_token[0,20] + "@gmail.com"
      user.save
    end

    return user
  end


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid).to_h
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    if auth.credentials.expires_at
      user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    end

    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def self.find_for_google_oauth(auth)
    user_params = auth.slice(:provider, :uid).to_h
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save!
    end

    return user
  end
end

