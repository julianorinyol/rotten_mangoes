class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user,
        presence: true

  validates :movie,
    presence: true

  validates :text,
    presence: true

  validates :rating_out_of_ten,
    numericality: { only_integer: true }
  validates :rating_out_of_ten,
    numericality: { greater_than_or_equal_to: 1 }
  validates :rating_out_of_ten,
    numericality: { less_than_or_equal_to: 10 }
  
  def return_users_full_name
    return nil unless user

    user.full_name
  end

end
