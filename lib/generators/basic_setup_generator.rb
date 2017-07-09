class BasicSetupGenerator < Rails::Generators::Base

  def create_initializer_file
    rake 'db:create'
    generate 'devise:install'

    generate 'devise User'
    generate 'migration AddColumnToUsers firstname:string lastname:string tel_num:string user_address:text is_admin:boolean'
    generate 'devise:views users'
    generate 'devise:controllers users'

    generate 'devise Provider'
    generate 'migration AddColumnToProviders firstname:string lastname:string tel_num:string license_num:string description:text experience:string avatar:string'
    generate 'devise:views providers'
    generate 'devise:controllers providers'

    # generate "rspec:install"
    # generate "mailer mailername"
    # generate "migration AddOmniauthToUsers provider:string uid:string"
  end

end
