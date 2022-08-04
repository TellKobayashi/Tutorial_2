Rails.application.routes.draw do
  resources :microposts
  resources :marimos
  resources :users#ここの書き方は、Ruby特有のシンボルと呼ばれる書き方。8080/usersと言うことrails 
  root 'application#hello'
end
