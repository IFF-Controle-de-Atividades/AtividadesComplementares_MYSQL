namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "touch #{current_path}/tmp/restart.txt"
   end
   task :database, :roles => :app do
     run "cp #{deploy_to}/#{shared_dir}/database.yml #{release_path}/config/"
   end
   task :permission, :roles => [:web, :db, :app] do
     run "chmod 755 #{release_path}/public -R"
   end
end

namespace :assets do
    task :symlink, :roles => :app do
      assets.create_dir
        run <<-CMD
         rm -rf  #{release_path}/public/images/upload &&
         ln -nfs #{shared_path}/upload #{release_path}/public/images/upload
       CMD
    end
      task :create_dir, :roles => :app do
        run "mkdir -p #{shared_path}/upload"
      end
end

after "deploy:assets:symlink", 'deploy:database'
after "deploy:update_code", 'deploy:permission'