class Movie < ActiveRecord::Base
  ALL_RATINGS = ['G','PG','PG-13','R']
  attr_accessible :title, :rating, :description, :release_date, :director
  def self.all_ratings
  	['G','PG','PG-13','R']
  end


end
