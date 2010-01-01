# Blog Posts
class Post < Article
  # TODO Handle periodic cleaning of old un-approved comments
  set_table_name 'article'
  has_many :comments

  def self.find(*args)
    with_scope(:find=> { :conditions=> "article_type = 'post'" } ) do
      super(*args)
    end
  end

  def sortable?
    false
  end

end

