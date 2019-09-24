class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  # validates :name, confirmation: true

  validates :email, presence: true, uniqueness: true
  # validates :email, uniqueness: true

  validates :password_digest, presence: true
  validates :password_digest, confirmation: true
  validates :password, length: { minimum: 5 }

  def self.authenticate_with_credentials(email_inp, pw_inp)
    email_adj = email_inp.strip.downcase
    check = User.find_by(email: email_adj)

    if (check && check.authenticate(pw_inp))
      check
    else
      nil  
    end
  end

end
