class StoryForm
  include ActiveModel::Model

  attr_accessor :title, :body

  validates :title, presence: true
  validates :body, length: { minimum: 20 }

  def save
    return false unless valid?
    Story.create(title: title, body: body, published: false)
  end
end
