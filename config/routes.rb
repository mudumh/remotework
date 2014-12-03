Rails.application.routes.draw do
  root "job_postings#index"
  resources :job_postings

  resources :temp_job_posts,only: [:update]
  resources :charges
  resources :account_activations, only: [:edit]
  post 'subscriber/' => "subscribers#create"
  resources :subscribers, only: [:index]
  resources :subscribers, only: [:show]

  mount StripeEvent::Engine => '/stripe/events' # provide a custom path
  get '/jobs' => 'job_postings#index'
  get '/newjob' => "temp_job_posts#new"
  post '/newjob' => 'temp_job_posts#create'
  get '/newjob/:id/preview' => 'temp_job_posts#show', as: :jobpreview
  get '/payment' => 'charges#new'
  get '/new_job/:id/edit' => 'temp_job_posts#edit', as: :jobpreview_edit
  get  'job_notifier' =>"job_notifiers#new"
  post  'job_notifier' =>"job_notifiers#create"
end
