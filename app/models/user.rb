class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {:case_sensitivity => false}
  validates :password, length: { minimum: 5 }

  # Return user that corresponds to email and password
  def self.authenticate_with_credentials(email, password)
    @currentUser = User.find_by_email(email);
    if @currentUser && @currentUser.authenticate(password)
      @currentUser
    else 
      nil
    end
  end
end
