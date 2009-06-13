class Tag < ActiveRecord::Base
  extra_sanitize :columns => :all, :reg_exp => /[~?¿]/
end
