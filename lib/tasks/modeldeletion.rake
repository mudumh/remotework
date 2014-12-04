namespace :modeldeletion do 
  desc "delete postings more than 30 days old"
  task remove_expired_posts: :environment do
      @jobpostings = JobPosting.where("created_at < ?", 31.days.ago).destroy_all
      
    end
  

end