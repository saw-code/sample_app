Rails.application.routes.draw do
  root 'static_pages#home'
  get  'users/new' #нужен ли???
  # Этот новый шаблон направляет запрос GET для URL/help к методу help в контроллере StaticPages. Как и в случае с правилом для корневого маршрута, это создает два именованных маршрута, help_path и help_url:
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
end
