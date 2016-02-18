Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'session/new'
  root 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  get 'signup' => 'users#new'

  # Admin routes
  get 'administrator' => 'administrator#index'
  get 'administrator/new' => 'administrator#new'
  post 'administrator/create' => 'administrator#create'
  get 'administrator/delete/:id' => 'administrator#delete'
  # Admin Course routes
  get 'administrator/courselist' =>'administrator#courselist'
  get 'administrator/newcourse' =>'administrator#newcourse'
  post 'administrator/createcourse' =>'administrator#createcourse'
  get 'administrator/editcourse/:id' =>'administrator#editcourse'
  get 'administrator/deletecourse/:id' =>'administrator#deletecourse'
  post 'administrator/updatecourse' =>'administrator#updatecourse'
  # Admin Instructor Student
  get 'administrator/courseinstructor/:id' =>'administrator#courseinstructor'
  post 'administrator/courseinstructor/:id' =>'administrator#courseinstructoradd'
  get 'administrator/courseinstructordelete/:courseid/:instructorid' =>'administrator#courseinstructordelete'
  # Admins Course Student
  get 'administrator/coursestudent/:id' =>'administrator#coursestudent'
  post 'administrator/coursestudent/:id' =>'administrator#coursestudentadd'
  get 'administrator/coursestudentdelete/:courseid/:studentid' =>'administrator#coursestudentdelete'
  # Admin instructor
  get 'administrator/instructorlist' =>'administrator#instructorlist'
  get 'administrator/newinstructor' =>'administrator#newinstructor'
  post 'administrator/createinstructor' => 'administrator#createinstructor'
  get 'administrator/deleteinstructor/:id' => 'administrator#deleteinstructor'

  # Admin student
  get 'administrator/studentlist' =>'administrator#studentlist'
  get 'administrator/newstudent' =>'administrator#newstudent'
  post 'administrator/createstudent' => 'administrator#createstudent'
  get 'administrator/deletestudent/:id' => 'administrator#deletestudent'

  # Course Page
  get 'course/coursepage/:id' => 'course#coursepage'
  post 'course/coursepage/:id' => 'course#coursenotificationadd'

  #Instructor routes
  get 'instructor' => 'instructor#index'

  #course routes
  get 'course' => 'course#index'
  get 'mycourses' => 'course#mycourse'
  get 'course/studentcoursedrop/:id' => 'course#studentcoursedrop'

  #enrollments
  get 'requests' => 'instructor#requests'
  get 'instructor/enroll/:user_id/:course_id'=> 'instructor#enroll'


  # Messages
  get 'message' => 'message#index'
  get 'message/chatwindow/:id' => 'message#chatwindow'
  post 'message/chatwindow/:id' => 'message#chatwindowsend'

  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
