class Company < ActiveRecord::Base
  
  has_many :job_postings
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :headquarters, presence: true

end
