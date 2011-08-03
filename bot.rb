# -*- coding: utf-8 -*-
require 'twitter'
require 'yaml'

class Bot

  def initialize
    config = YAML.load_file('config.yaml')
    Twitter.configure do |configure| 
      configure.consumer_key = config[:consumer_key]
      configure.consumer_secret = config[:consumer_sercret]
      configure.oauth_token = config[:oauth_token]
      configure.oauth_token_secret = config[:oauth_token_sercret] 
    end
  end

  def date
    wdays = ["日","月","火","水","木","金","土"]
    day = Time.now
    Twitter.update("今日は#{day.year}年#{day.month}月#{day.day}日#{wdays[day.wday]}曜日です。")
  end

  def test
    Twitter.update("テストです。" + Time.now.to_s)
  end

end
