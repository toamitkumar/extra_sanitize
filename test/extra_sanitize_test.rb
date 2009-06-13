require File.join(File.dirname(__FILE__), "/test_helper")

class ExtraSanitizeTest < Test::Unit::TestCase
  
  def test_should_sanitize_only_specified_columns
    article = Article.new(:title => "~*<some title>\"‘“’”?¿", :body => "some body~~~~")
    article.valid?
    assert_equal article.title, "some title"
  end

  def test_should_sanitize_column_name_with_percentage_in_it
    article = Article.new(:title => "%%%some %%%title%%%", :body => "some body~~~~")
    article.valid?
    assert_equal article.title, "some title"
  end

  def test_should_sanitize_column_name_with_forward_slash_in_it
    article = Article.new(:title => "some ///title///", :body => "some body~~~~")
    article.valid?
    assert_equal article.title, "some title"
  end

  def test_should_not_sanitize_excluded_columns
    article = Article.new(:title => "~*<some title>\"‘“’”?¿", :body => "some body~~~~")
    article.valid?
    assert_equal article.body, "some body~~~~"
  end

  def test_should_not_sanitize_if_not_included
    comment = Comment.new(:title => "some title~*<>\"‘“’”?¿", :description => "some body~~~~")

    comment.valid?
    assert_equal comment.title, "some title~*<>\"‘“’”?¿"
    assert_equal comment.description, "some body~~~~"
  end

  def test_should_sanitize_all_string_text_columns
    post = Post.new(:title => "<some title>\"‘“’”?¿", :description => "“some~~~~ ‘body’~~~~”")
    post.valid?
    assert_equal post.title, "some title"
    assert_equal post.description, "some body"
  end

  def test_should_replace_default_reg_exp_to_sanitize
    tag = Tag.new(:name => "<some ~title>\"‘“’”?¿")
    tag.valid?

    assert_equal(tag.name, "<some title>\"‘“’”")
  end
end