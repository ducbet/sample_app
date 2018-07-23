class User < ApplicationRecord
  before_save{downcase_email}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: Settings.name_max_length}
  validates :email, presence: true,
                    length: {maximum: Settings.email_max_length},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
                        length: {minimum: Settings.pass_min_length}
  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
