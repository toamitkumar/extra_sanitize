module ExtraSanitize
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def extra_sanitize(options = {})
      before_validation :extra_sanitize_fields

      write_inheritable_attribute(:extra_sanitize_options, {
        :except => (options[:except] || []),
        :columns => ([options[:columns]]).flatten,
        :reg_exp => options[:reg_exp] || /[~*<>\"‘“’”?¿%\/]/
      })

      class_inheritable_reader :extra_sanitize_options

      include ExtraSanitize::InstanceMethods
    end
  end

  module InstanceMethods
    def extra_sanitize_fields
      return if extra_sanitize_options.nil?
      extra_sanitize_options[:columns] = self.class.columns.map { |column| column.name.to_sym } if(extra_sanitize_options[:columns] == [:all])

      self.class.columns.each do |column|
        next unless (column.type == :string || column.type == :text)

        field = column.name.to_sym
        value = self[field]

        next if value.nil?

        if extra_sanitize_options[:except].include?(field)
          next
        elsif(extra_sanitize_options[:columns].include?(field))
          self[field] = sanitize_value(value)
        end
      end
    end

    def sanitize_value(val)
      val.gsub(extra_sanitize_options[:reg_exp], "")
    end
  end
end