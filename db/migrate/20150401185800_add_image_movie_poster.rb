class AddImageMoviePoster < ActiveRecord::Migration
  def change
    add_column :movies, :image, :string

  end
end