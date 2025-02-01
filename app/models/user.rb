class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  enum role: { empleado: 0, gerente: 1, administrador: 2 }

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true

  before_create :set_joined_at

  def deactivate!
    update(active: false, encrypted_password: Devise.friendly_token)
  end

  private

  def set_joined_at
    self.joined_at ||= Date.today
  end
end