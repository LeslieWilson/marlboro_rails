class Meetup < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true
    validates :body, presence: true
    validates :uid, presence: true

end
