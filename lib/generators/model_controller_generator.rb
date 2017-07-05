class ModelControllerGenerator < Rails::Generators::Base
  def create_initializer_file
    # generate "model", "topic title:string description:text user:references"
    # generate "controller", "topics index show"
    # route "resources :topics only: [:index]"
    # rake "db:migrate"
  end
end