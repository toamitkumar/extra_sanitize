require File.dirname(__FILE__) + '/lib/extra_sanitize'

ActiveRecord::Base.send(:include, ExtraSanitize)