require "rubygems"
require "bundler/setup"

desc "Set up _deploy folder and deploy branch for Github Pages deployment"
task :setup_github_pages, :repo do |t, args|
  if args.repo
    repo_url = args.repo
  else
    puts "Enter the read/write url for your repository"
    puts "(For example, 'git@github.com:your_username/your_username.github.io)"
    puts "           or 'https://github.com/your_username/your_username.github.io')"
    repo_url = get_stdin("Repository url: ")
  end
  protocol = repo_url.match(/^https:/).nil? ? 'git' : 'https'
  if protocol == 'https'
    user = repo_url.match(/github\.com\/([^\/]+)/)[1]
  else
    user = repo_url.match(/:([^\/]+)/)[1]
  end

  unless (`git remote -v` =~ /origin.+?makersquare(?:\.git)?/).nil?
    # If octopress is still the origin remote (from cloning) rename it to upstream
    system "git remote rename origin upstream"
    # If this is a user/organization pages repository, add the correct origin remote
    # and checkout the source branch for committing changes to the blog source.
    system "git remote add origin #{repo_url}"
    puts "Added remote #{repo_url} as origin"
    system "git config branch.master.remote origin"
    puts "Set origin as default remote"
    system "git branch -m master source"
    puts "Master branch renamed to 'source' for committing your source files"
  end
  url = "http://#{user}.github.io"

 
  puts "\n---\n## Now you can deploy to #{url} with `middleman deploy` ##"
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end
