# config/deploy.rb
require 'mina/bundler' 
require 'mina/rails' 
require 'mina/git' 
require 'mina/rvm'


Dir['lib/mina/servers/*.rb'].each { |f| load f }

set  :domain,  '10.11.10.10'
set  :user,  'root'
set :port, 60000

set :app, 'Atividades Complementares'
set :keep_releases, 10


set :deploy_to, '/var/www/atividades.complementares' 
set :repository, 'https://github.com/IFF-Controle-de-Atividades/AtividadesComplementares_MYSQL.git'
set :branch, 'master'

set :shared_paths, ['config/database.yml', 'log']


task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:db_seed'
    invoke :'rails:assets_precompile'

    to :launch do
      invoke :'unicorn:restart'
    end
  end
end