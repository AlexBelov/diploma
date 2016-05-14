module SocialAnalytics
  class GithubScraper
    def initialize
      @users = []
    end

    def search_user(name)
      logins = Octokit.search_users(name).items.map(&:login).first(2)
      @users = logins.map{|login| Octokit.user(login)}
      save_user
    end

    def save_user
      return if @users.empty?
      @users.each do |user|
        GithubData.create(
          login: user.login,
          name: user.name,
          email: user.email,
          num_repos: user.public_repos,
          num_gists: user.public_gists,
          num_followers: user.followers,
          num_following: user.following,
          blog: user.blog
        )
        save_repositories(user.login)
      end
    end

    def save_repositories(login)
      repositories = Octokit.repositories(login).map(&:id)
      repositories.each do |repo_id|
        repo = Octokit.repository(repo_id)
        repository = Repository.create(
          github_data_id: GithubData.find_by_login(login),
          primary_language_id: Language.where(name: repo.language).first_or_create.id,
          full_name: repo.full_name,
          repo_id: repo_id,
          forks: repo.forks,
          issues: repo.issues,
          watchers: repo.watchers,
          subscribers: repo.subscribers,
          stargazers: repo.stargazers,
          fork: repo.fork
        )
        save_languages(repository)
      end
    end

    def save_languages(repository)
      languages = Octokit.languages(repository.repo_id)
      languages.each do |lang, loc|
        language = Language.where(name: lang).first_or_create
        repository.languages << language
        lang_repo = LanguagesRepositories.where(language_id: language.id, repository_id: repository.id).first
        lang_repo.update_attributes(loc: loc)
      end
    end
  end
end
