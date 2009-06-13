class Book < ActiveRecord::Base
  extra_sanitize :columns => :title
end
