class LetterSerializer < ActiveModel::Serializer
  attributes :current_date, :letter_count

  require 'open-uri'

  def current_date
    date = Time.now.strftime("%Y-%m-%d")
  end

  def letter_count
    html = Nokogiri::HTML(open 'https://www.espn.com/')
    html.css('script').remove
    text = html.at('body').inner_text
    text.delete!("\n")
  else
      "pass a  single letter"
  end
end