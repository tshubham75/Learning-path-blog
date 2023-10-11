Rails.application.routes.draw do
  devise_for :users
  root "blog_posts#index"


  # get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  # get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
  # patch "blog_posts/:id/", to: "blog_posts#update"
  # note{
  # # in patch we no asssign the variable so that the rails is smart enough to understand the meaning shared by show variable 
  # }
  # delete "blog_posts/:id/", to: "blog_posts#destroy"

  # get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post
  # post "/blog_posts", to: "blog_posts#create", as: :blog_posts
  # note{
  # # blog_post_path -> "/blog_posts/1"  (current path or adderss)
  # # blog_post_url  -> "http://localhost:3000/blog_posts/1" (entire domain or full address)
  # }
  resources :blog_posts

end
