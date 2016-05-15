json.array! @posts do |post|
  json.id    post.id
  json.title post.title.capitalize
  if post.user
    json.author post.user.full_name
  else
    json.author ""
  end
  if post.category
    json.category post.category.title
  end
  json.tags  post.tags do |tag|
    json.tag tag.name
  end
  json.url   post_url(post)
  json.comments post.comments do |comment|
    json.id comment.id
    json.body   comment.body
    if comment.user
      json.author comment.user.full_name
    else
      json.author ""
    end
  end
end
