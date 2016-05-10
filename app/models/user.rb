class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :chatrooms, through: :messages
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => "default_avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :username, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
