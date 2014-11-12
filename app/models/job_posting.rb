class JobPosting < ActiveRecord::Base
  belongs_to :company
  include PgSearch
  pg_search_scope :search, :against => [:job_title,:job_desc],
  using: {tsearch: {dictionary: "english"}},
  associated_against: {company: :name}
  
  
  def self.text_search(query)
      search(query)
  end

end
