class AddFeaturesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :featured, :boolean, default: false
    add_column :movies, :approved, :boolean, default: false
  end
end
