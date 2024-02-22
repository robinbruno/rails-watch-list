class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end


# A movie must have a unique title and an overview.
# You can’t delete a movie if it is referenced in at least one bookmark.
