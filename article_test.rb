# test/models/article_test.rb
require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  test "valid article saves successfully" do
    article = Article.new(title: "Test Article", body: "This is a test body with enough content.", category: "Technology")
    assert article.valid?, "Expected article to be valid: #{article.errors.full_messages}"
  end

  test "title must be present" do
    article = Article.new(title: "", body: "Some body text here.", category: "Finance")
    assert_not article.valid?
    assert_includes article.errors[:title], "can't be blank"
  end

  test "title must be at least 3 characters" do
    article = Article.new(title: "Hi", body: "Some body text here.", category: "Finance")
    assert_not article.valid?
  end

  test "body must be present" do
    article = Article.new(title: "Valid Title", body: "", category: "Technology")
    assert_not article.valid?
  end

  test "category must be in allowed list" do
    article = Article.new(title: "Valid Title", body: "Valid body content here.", category: "InvalidCategory")
    assert_not article.valid?
    assert_includes article.errors[:category], "must be a valid category"
  end

  test "all valid categories are accepted" do
    Article::CATEGORIES.each do |cat|
      article = Article.new(title: "Valid Title", body: "Valid body content here.", category: cat)
      assert article.valid?, "Category '#{cat}' should be valid"
    end
  end

  test "article can have many comments" do
    article = Article.create!(title: "Test Article", body: "Valid body content here.", category: "Technology")
    article.comments.create!(commenter: "Alice", body: "Great post!")
    article.comments.create!(commenter: "Bob", body: "Interesting read.")
    assert_equal 2, article.comments.count
  end

  test "destroying article destroys associated comments" do
    article = Article.create!(title: "Test Article", body: "Valid body content here.", category: "Technology")
    article.comments.create!(commenter: "Alice", body: "Great post!")
    assert_difference "Comment.count", -1 do
      article.destroy
    end
  end

  test "recent scope returns articles newest first" do
    old_article = Article.create!(title: "Old Article", body: "Valid body content.", category: "Other", created_at: 1.week.ago)
    new_article = Article.create!(title: "New Article", body: "Valid body content.", category: "Other")
    assert_equal new_article, Article.recent.first
  end

  test "by_category scope filters correctly" do
    Article.create!(title: "Tech Article", body: "Valid body content.", category: "Technology")
    Article.create!(title: "Finance Article", body: "Valid body content.", category: "Finance")
    assert_equal 1, Article.by_category("Technology").count
    assert_equal 2, Article.by_category(nil).count  # nil returns all
  end
end
