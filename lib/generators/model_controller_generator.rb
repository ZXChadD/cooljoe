class ModelControllerGenerator < Rails::Generators::Base
  def create_initializer_file
    # generate "model", "provider firstname:string lastname:string tel_num:string email:string license_num:string description:text experience:string avatar:string"
    # generate "controller", "providers index show new create edit update destroy --skip-routes"
    # route "resources :providers"

    # generate "model", "like user:references provider:references"
    # generate "controller", "likes create destroy --skip-routes"
    # route "resources :likes"

    # generate "model", "provider_attach image:string title:string provider:references"

    # generate "model", "job type:string description:text fixture:string num_fixture:integer housing:string job_address:text user:references provider:references status:integer date:string time:string"
    # generate "controller", "jobs index show new create edit update destroy --skip-routes"
    # route "resources :jobs"

    # generate "model", "job_attach image:string title:string job:references"

    # generate "model", "schedule date:string time:string provider:references"

    # generate "model", "invoice provider:references job:references invoice_ref:string price:decimal"
    # generate "controller", "invoices index show new create edit update destroy --skip-routes"
    # route "resources :invoice"

    # route "resources :??, only: [:index, :show]"
    # rake "db:migrate"
  end
end