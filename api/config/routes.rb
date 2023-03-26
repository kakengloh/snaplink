Rails.application.routes.draw do
  get ':slug', to: 'root#visit'

  draw(:v1)
end
