class BubblesController < ApplicationController
  def index
    @type = "bubbles/skills_data"
  end

  def countries
    @type = "countries_data"
    render :index
  end

  def languages
    @type = "languages_data"
    render :index
  end

  def skills_data
    respond_to do |format|
      format.csv { render text: Skill.bubble_csv  }
    end
  end

  def countries_data
    respond_to do |format|
      format.csv { render text: Country.bubble_csv  }
    end
  end

  def languages_data
    respond_to do |format|
      format.csv { render text: Language.bubble_csv  }
    end
  end
end
