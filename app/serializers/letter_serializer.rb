class LetterSerializer < ActiveModel::Serializer
  attributes :current_date, :letter_count, :wiki_info

  require 'open-uri'

  def current_date
    date = Time.now.strftime("%Y-%m-%d")
  end
  
  given_letter = @instant_options[:queryy]

  def letter_count
    if given_letter.length==1
      html = Nokogiri::HTML(open 'https://www.espn.com/')
      html.css('script').remove
      text = html.at('body').inner_text
      text.delete!("\n")

      text.count(@instant_options[:queryy])
    else
      "pass a  single letter"
    end
  end

  def wiki_info
    if given_letter.length==1
      page = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{given_letter}"))
      page.css('script').remove
      page.css('p').first.text
    else
      "No Data here"
    end
  end
end
