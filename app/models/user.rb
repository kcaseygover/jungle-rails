class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  validates :email, :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }


  def self.authenticate_with_credentials(email, password)
    email_lowercase = email.downcase.strip
    @user = User.find_by_email(email_lowercase)
    if @user && @user.authenticate(password)
      @user
   else
      nil
    end
  end
end
