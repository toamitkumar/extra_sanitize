ActiveRecord::Schema.define(:version => 0) do
  create_table :articles, :force => true do |t|
    t.column :title, :string
    t.column :body, :text
  end
  
  create_table :books, :force => true do |t|
    t.column :title, :string
  end

  create_table :comments, :force => true do |t|
    t.column :title, :string
    t.column :description, :text
  end

  create_table :posts, :force => true do |t|
    t.column :title, :string
    t.column :description, :text
  end
  
  create_table :tags, :force => true do |t|
    t.column :name, :string
  end
end
