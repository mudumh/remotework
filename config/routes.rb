Rails.application.routes.draw do
  root "job_postings#index"
  resources :job_postings
  resources :charges
  get '/jobs' => 'job_postings#index'
  get '/newjob' => "temp_job_posts#new"
  post '/newjob' => 'temp_job_posts#create'
  get '/newjob/:id/preview' => 'job_postings#showpreview', as: :jobpreview
  get '/payment' => 'charges#new'
end
