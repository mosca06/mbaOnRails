class HtmlBuilder
  def initialize(&block)
    @html = ""
    instance_eval(&block) if block_given?
  end

  def tag(name, content = nil, &block)
    @html << "<#{name}>#{HtmlBuilder.new(&block).result}</#{name}>\n" if block_given?
    @html << "<#{name}>#{content}</#{name}>\n" if content
  end

  def div(content = nil, &block)
    tag('div', content, &block)
  end

  def span(content = nil, &block)
    tag('span', content, &block)
  end
  def result
    @html 
  end
end


builder = HtmlBuilder.new do
  div do
    div "Conteúdo em div"
    span "Nota em div"
  end
  span "Nota de rodapé"
end

puts builder.result