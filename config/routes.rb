Rails.application.routes.draw do
  root "job_postings#index"
  resources :job_postings
  get '/jobs' => 'job_postings#index'
  get '/newjob' => 'job_postings#new'
  get '/newjob/:id/preview' => 'job_postings#showpreview', as: :jobpreview
  get '/payment' => 'job_postings#payment'
end
