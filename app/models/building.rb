class Building < ApplicationRecord
    belongs_to :user
    has_many_attached :image 
    has_many :rooms, dependent: :destroy
    def self.search(search)
        # Title is for the above case, the OP incorrectly had 'name'
       # where("ime LIKE ?", "%#{search}%")
       where("ime ILIKE ? OR kraj ILIKE ? OR tip ILIKE ? OR CAST(zvezdice AS varchar) ILIKE ?", "%#{search}%" , "%#{search}%" , "%#{search}%", "%#{search}%" ) 
      end
end
