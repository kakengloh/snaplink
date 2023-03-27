Rails.application.routes.draw do
  draw(:v1)
  draw(:internal)

  get ':slug', to: 'root#visit'
end
