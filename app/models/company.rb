class Company < ActiveRecord::Base
  
  has_many :job_postings
  mount_uploader :image, ImageUploader
end
