ActiveRecord::Base.transaction do
  bill = User.create!(
    :username => 'BillGates',
    :email => 'bgates@example.com',
    :password => 'windows'
  )
  steve = User.create!(
    :username => 'SteveJobs',
    :email => 'sjobs@example.com',
    :password => 'apple'
  )
  ned = User.create!(
    :username => 'Ned',
    :email => 'ned@example.com',
    :password => 'cider'
  )
  mark = User.create!(
    :username => 'MarkZ',
    :email => 'mark@example.com',
    :password => 'foobar'
  )
  kush = User.create!(
    :username => 'Kush',
    :email => 'kush@example.com',
    :password => 'app'
  )

  a1 = steve.articles.create!(
    :title => 'steve article',
    :body => 'The interface in heaven is great!',
    :url => 'www.apple.com'
  )

  c1 = bill.comments.create!(
    :article_id => 1,
    :body => "How's the air up there?"
  )

  c2 = steve.comments.create!(
    :article_id => 1,
    :parent_comment_id => 1,
    :body => "Better than the surface."
  )

  c3 = bill.comments.create!(
    :article_id => 1,
    :parent_comment_id => 2,
    :body => "Must be pricey."
  )

  a2 = steve.articles.create!(
    :title => 'bootcamps',
    :body => 'Devbootcamp is the best.',
    :url => 'www.devbootcamp.com'
  )

  d1 = ned.comments.create!(
    :article_id => 2,
    :body => "Nope."
  )

  d2 = bill.comments.create!(
    :article_id => 2,
    :parent_comment_id => 4,
    :body => "I agree with Ned."
  )

  d3 = ned.comments.create!(
    :article_id => 2,
    :parent_comment_id => 5,
    :body => "What a bro."
  )

  d4 = steve.comments.create!(
    :article_id => 2,
    :parent_comment_id => 5,
    :body => "What do you know, BILL!?"
  )
end