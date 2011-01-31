
Factory.define :post do |u|
  u.title       'Title'
  u.content     '<p>My large ammount of content</p>'
  u.open        true
  u.posted_at   { Time.now }
  u.author      'David Henner'
  u.markdown    '<p>My large ammount of content</p>'
  u.commentable true
end
