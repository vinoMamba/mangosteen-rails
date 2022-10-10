class ValidationCode < ApplicationRecord
  validates :email, presence: true
  before_create :generate_code
  after_create :send_validation_code
  enum kind: { sign_in: 0, sign_up: 1 }

  def generate_code
    self.code = SecureRandom.random_number.to_s[2..7]
  end
  def send_validation_code
    UserMailer.welcome_email(self.email).deliver_now
  end
end
