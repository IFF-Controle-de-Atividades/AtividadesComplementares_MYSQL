######################### INFORMAÇÕES DA APP ##################################
set :application, "AtividadesComplementares" # O nome do projeto
set :keep_releases, 5               # Isso guardar os 5 últimos deploys
set :rails_env,   "production"    # O ambiente em que o Rails irá atuar

set :scm, 'git'
set :repository,  "https://github.com/IFF-Controle-de-Atividades/atividadescomplementares.git"
set :branch, 'master'
set :deploy_via, :remote_cache
####################### END OF INFORMAÇÕES DA APP ##############################

######################### INFORMAÇÕES DO SERVIDOR #############################
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :user, "root"
set :use_sudo, false
server "10.11.10.10:60000", :web, :app, :db, :primary => true
set :deploy_to, "/u/apps/#{ application }"

############################# END OF SERVIDOR #################################

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "10.11.10.10:60000"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end