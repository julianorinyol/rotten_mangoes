class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  # validates :poster_image_url, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_future

  has_many :reviews
  
  mount_uploader :image, ImageUploader

  scope :look_for, ->(query) { where("title like ('%' || ? || '%')", query ) }

  # scope :by_director, ->(name) { where(director: name) }

  def review_average
    if self.reviews.any?

      reviews.sum(:rating_out_of_ten)/reviews.size
    else
      nil
    end
  end

  def self.search(search)
  if search
    Movie.where("title like  ? ", "%#{search}%" ) 
        # Movie.all
    # find_by(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    Movie.all
  end
end

  protected
  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end
end
