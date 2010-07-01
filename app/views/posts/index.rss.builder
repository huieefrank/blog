xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Huieeblog post"
    xml.description "All posts in Huieeblog ."
    xml.link comments_url(:format => 'rss')
    
    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.content
        xml.author post.user.name
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.url post_url(post)        
      end
    end
  end
end