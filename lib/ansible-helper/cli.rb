require 'ansible-helper'

class AnsibleHelper::CLI < Thor

  desc :role, "Creates a new role in the current project"
  option  :dirs, :aliases => '-d',
          :desc => "Comma-separated list of the role's subdirectories",
          :default => 'files,handlers,tasks,templates,vars'
  option  :gitkeep, :aliases => '-k',
          :desc => "Create a .gitkeep file in each subdirectory?",
          :type => :boolean, :default => false, :banner => 'BOOLEAN'
  def role(name)
    role_dir = "roles/#{name}"
    dir_glob = "#{role_dir}/{#{options[:dirs]}}"

    `mkdir -p #{dir_glob}`
    `touch #{dir_glob}/.gitkeep` if options[:gitkeep]

    if Dir["#{role_dir}/tasks"].any?
      File.write("#{role_dir}/tasks/main.yml", "---\n")
    end

    puts Dir["#{role_dir}/**/*"]
  end
end
