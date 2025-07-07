class StoryPublisher
  def initialize(story)
    @story = story
  end

  def self.call(story)
    new(story).call
  end

  def call
    run
  end

  private

  def run
    @story.update(published: true)
  end
end
