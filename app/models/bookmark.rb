class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, presence: true
  validates :list_id, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: "has already been bookmarked in this list" }
  validates :comment, length: { minimum: 6 }

# A bookmark must be linked to a movie and a list, and the [movie, list]
# pairings should be unique.
# The comment of a bookmark cannot be shorter than 6 characters.

end
