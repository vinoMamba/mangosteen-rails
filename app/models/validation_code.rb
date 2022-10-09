class ValidationCode < ApplicationRecord
  validates :email, presence: true
  after_initialize :generate_code
  after_create :send_validation_code

  def generate_code
    self.code = SecureRandom.random_number.to_s[2..7]
  end
  def send_validation_code
    UserMailer.welcome_email(self.code).deliver_now
  end
end
