class Settings
  def initialize 
    @configs = {}
  end

  def add(attr, value)
    @configs[attr] = value

    define_singleton_method(attr) do
      @configs[attr]
    end
  end

  def method_missing(method_name, *args)
    if @configs.include?(method_name)
      super
    else
      "Configuração '#{method_name}' não existe."
    end
  end

  def respond_to_missing?(method_name,  include_private = false)
    @configs.include?(method_name) || super
  end
end

settings = Settings.new
# Definindo configurações dinamicamente
settings.add(:timeout, 30)
settings.add(:mode, "production")
# Acessando configurações via método
puts settings.timeout
puts settings.mode 
puts settings.retry

puts settings.respond_to?(:timeout)
puts settings.respond_to?(:retry) 