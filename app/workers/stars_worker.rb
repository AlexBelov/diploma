class StarsWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
    ids = GithubData.joins(:stars).group('github_data.id').pluck(:id)
    GithubData.where.not(id: ids).each do |user|
      puts "=".blue*80
      puts "#{user.login}".blue
      puts "=".blue*80
      begin
        Octokit.starred(user.login).each do |star|
          puts "#{star.full_name}".green
          Star.create(github_data_id: user.id, repo: star.full_name)
        end
      rescue
        puts "Can't find user #{user.login}".red
      end
    end
  end
end
