class Post < ActiveRecord::Base
  extra_sanitize :columns => :all
end
