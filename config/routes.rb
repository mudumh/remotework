Rails.application.routes.draw do
  root "job_postings#index"
  resources :job_postings
  get '/jobs' => 'job_postings#index'
  get '/newjob' => 'job_postings#new'
end
