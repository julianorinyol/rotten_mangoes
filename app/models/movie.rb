class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :image, presence: true
  validates :release_date, presence: true
 

  has_many :reviews
  
  mount_uploader :image, ImageUploader

  scope :movie_by_title, ->(query) { where("title like ('%' || ? || '%')", query ) }
  # scope :movie_by_director, ->(query) { where("title like ('%' || ? || '%')", query ) }
  # scope :movie_by_runtime, ->(query) { where("title like ('%' || ? || '%')", query ) }

  # scope :by_director, ->(name) { where(director: name) }

  def review_average
    if self.reviews.any?

      reviews.sum(:rating_out_of_ten)/reviews.size
    else
      nil
    end
  end

  def self.search(title = "", director = "", runtime_in_minutes = "")
    # movie_by_title(title).movie_by_director(director)
    

    case runtime_in_minutes 
      when 2
        start = 0 
        finish = 89
      when 3
        start = 90
        finish = 119
      when 4
        start = 120
        finish = 1000
      when 1
        start = 0
        finish = 10000
    end

    Movie.where("lower(title) like ? or lower(director) like ?", "%#{title}%", "%#{title}%")
    # Movie.where("title like ? AND director like ? AND  runtime_in_minutes > ? AND runtime_in_minutes < ? ", "%#{title}%", "%#{director}%", start, finish)


    # if runtime_in_minutes == "Under 90 minutes"
    #   start = 0
    #   finish = 89
    # elsif runtime_in_minutes == "Between 90 and 120 minutes"
    #   start = 90
    #   finish = 119
    # elsif runtime_in_minutes == "Over 120 minutes"
    #   start = 120
    #   finish = 1000                  
    # else
    #   start = 0
    #   finish = 1000
    # end   

  # if title
  #   movie_by_title(title).movie_by_director(director)

  #   # Movie.where("title like  ? ", "%#{title}%" ) 
  # elsif director 

  # elsif runtime_in_minutes

  # else
  #   Movie.all
  # end
end

  protected
  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end
end
