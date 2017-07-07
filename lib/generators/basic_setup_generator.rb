class BasicSetupGenerator < Rails::Generators::Base
  def create_initializer_file
    rake "db:create"
    generate "devise:install"
    generate "devise User"
    generate "migration AddColumnToUsers firstname:string lastname:string tel_num:string user_address:text is_admin:boolean"
    generate "devise:views"
    # generate "rspec:install"
    # generate "mailer mailername"
    # generate "migration AddOmniauthToUsers provider:string uid:string"
  end
end