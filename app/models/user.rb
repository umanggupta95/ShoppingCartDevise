class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :async,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :omniauthable, :omniauth_providers => [:facebook]

  has_one  :cart
  has_many :orders
  has_one :picture, as: :imageable

  validates :email, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  # validates :contact_number, presence: true, uniqueness: true, length: { is: 10 }
  # validate  :validate_date_of_birth

  accepts_nested_attributes_for :picture

  def is_admin?
    user_type == 'admin'
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.uid = auth.uid
      user.last_name = auth.info.name.split(' ')[1]
      user.first_name = auth.info.name.split(' ')[0]
    end
  end

  private

  def validate_date_of_birth
    errors.add(:date_of_birth, 'must be a valid date') if date_of_birth.present? && date_of_birth > Time.zone.today
  end

end
