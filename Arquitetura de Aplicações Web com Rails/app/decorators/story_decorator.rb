class StoryDecorator < SimpleDelegator
  def preview
    body.truncate(20)
  end

  def status
    published? ? "Publicado" : "Rascunho"
  end
end
