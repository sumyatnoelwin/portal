Rails.application.routes.draw do
  devise_for :staffs, :controllers => { :registrations => "staffs/registrations" }
  devise_for :students, :controllers => { :registrations => "students/registrations" }
  devise_for :lecturers, :controllers => { :registrations => "lecturers/registrations" }
  resources :timetables

  resources :ebooks

  get 'ebooks/download_file'

  resources :forums do
    resources :comments
  end 

  resources :results

  resources :exam_lists

  resources :student_registers

  get 'top/index'

  resources :subjects

  resources :sections

  resources :teaching_schedules

  resources :courses

  resources :lecturers

  resources :staffs

  resources :students

  resources :rooms

  resources :categories

  post 'dynamic_subject/:id' => "exam_lists#dynamic_subject"

  post 'dynamic_student/:id' => "results#dynamic_student"

  post 'dynamic_exam/:id' => "results#dynamic_exam"

  # get 'exam_list/update_subjects', as: 'update_subjects'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'top#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
