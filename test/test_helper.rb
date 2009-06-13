$:.unshift(File.dirname(__FILE__) + '/../lib')

RAILS_ENV = 'test'
require File.expand_path(File.join(File.dirname(__FILE__), '../../../../config/environment.rb'))
require 'mocha'
require 'test/unit'

load(File.dirname(__FILE__) + "/schema.rb")

require File.join(File.dirname(__FILE__), 'models/article')
require File.join(File.dirname(__FILE__), 'models/book')
require File.join(File.dirname(__FILE__), 'models/comment')
require File.join(File.dirname(__FILE__), 'models/post')
require File.join(File.dirname(__FILE__), 'models/tag')