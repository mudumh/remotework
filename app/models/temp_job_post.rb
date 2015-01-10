class TempJobPost < ActiveRecord::Base
  belongs_to :company
  validates :job_title, presence: true
  validates :job_desc, presence: true
  validates :application_instructions, presence: true

end
