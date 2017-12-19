class ChordsController < ApplicationController
  def index
    @type = "chords/languages_data"
  end

  def languages_data
    respond_to do |format|
      format.csv { render text: Language.chord_csv  }
    end
  end
end
