class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable, :confirmable, :token_authenticatable

  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
