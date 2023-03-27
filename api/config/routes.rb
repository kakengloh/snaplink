Rails.application.routes.draw do
  draw(:v1)
  draw(:internal)

  scope controller: 'root' do
    get '' => :ping
    get ':slug' => :visit
  end
end
