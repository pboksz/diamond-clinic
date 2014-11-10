class Class
  def translation_accessor(*attributes)
    attributes.each do |attribute|
      self.class_eval <<-eos
        def #{attribute}(options = {})
          locale = options[:locale] || :pl
          self.send("#{attribute}_\#{locale}") if self.respond_to?("#{attribute}_\#{locale}")
        end
      eos
    end
  end
end
