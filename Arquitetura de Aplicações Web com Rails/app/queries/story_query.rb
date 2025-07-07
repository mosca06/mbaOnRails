class StoryQuery
  def initialize(params = {})
    @title = params[:search]
    @published = params[:published]
  end

  def self.call(params)
    new(params).call
  end

  def call
    run
  end

  private

  def run
    stories = Story.all

    if @title.present?
      stories = stories.search_by_title(@title)
    end

    if @published == "true"
       stories = stories.where(published: true)
    elsif @published == "false"
       stories = stories.where(published: false)
    end

    stories
  end
end
