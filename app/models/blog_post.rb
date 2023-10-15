class BlogPost < ApplicationRecord
    validates :title, presence: :true    
    validates :body, presence: :true
    
    scope :sorted,-> { order(published_at: :desc, updated_at: :desc)}    
    scope :draft,-> { where(published_at: nill)}    
    scope :published,-> { where("published_at: <= ?", Time.current)}    
    scope :scheduled,-> {whrer("published_at: > ?", Time.current)}

    def draft?
        published_at.nil?
      end
      
    def published?
        published_at? && published_at <= Time.current
    end
    def schedule?
        published_at? && published_at > Time.current
    end

end
 #  2       #BlogPost.all
            # BlogPost.draft
            # BlogPost.published
            # BlogPost.scheduled

            # `published_at` datetime field
            # - nil
            # - 1.year.alongside
            # - 1.year.from_now

#   1         # `Status` string field
#             # - draft 
#             # - published
#             # - scheduled