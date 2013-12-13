ActiveModel::Errors.class_eval do
  # Remove complicated logic
  def full_messages
    full_messages = []

    each do |attribute, messages|
      messages = Array.wrap(messages)
      next if messages.empty?

      if attribute == :base
        messages.each {|m| full_messages << m }
      else
        attr_name = attribute.to_s.gsub('.', '_').humanize
        attr_name = @base.class.human_attribute_name(
          attribute,
          :default => '' # attr_name
        )

        options = { :default => "%{message}", :attribute => attr_name }

        messages.each do |m|
          full_messages << I18n.t(:"errors.format", options.merge(:message => m))
        end
      end
    end
    full_messages
  end
end 
