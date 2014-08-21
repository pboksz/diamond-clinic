class Admin
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :rememberable, :recoverable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String
end