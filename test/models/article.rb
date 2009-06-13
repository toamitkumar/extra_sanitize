class Article < ActiveRecord::Base
  extra_sanitize :columns => [:title, :body], :except => [:body]
end
