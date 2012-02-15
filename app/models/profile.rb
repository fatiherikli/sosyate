class Profile < ActiveRecord::Base
  def to_param
    username
  end

  # get keywords as array
  def get_keywords
      keywords.nil?? [] : keywords.split(",")
  end

  # twitter url
  def get_twitter_url
      "http://twitter.com/#{username}"
  end

  # update keywords and profile
  def update_profile
      user = Twitter.user(username)
      timeline = Twitter.user_timeline(:count=>100, :user=>username)
      words = timeline.map{|item| item.text.split}.flatten
      words.select!{|item|
          !item.include? '@' and
          item.parameterize.length > 3
      }
      keywords = {}
      words.each{|word| keywords[word] = (keywords[word] or 0) + 1}
      self.keywords = keywords.sort_by{|keyword, count| -count}.map{|item| item[0]}.join(",")
      self.description = user.description
      self.picture = user.profile_image_url
  end
end
