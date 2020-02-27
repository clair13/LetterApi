class LetterSerializer < ActiveModel::Serializer
  attributes :current_date, :letter_count, :query

  require 'open-uri'

  def current_date
    date = Time.now.strftime("%Y-%m-%d")
  end

  def letter_count
    if (@instant_options[:queryy]).length==1
      html = Nokogiri::HTML(open 'https://www.espn.com/')
      html.css('script').remove
      text = html.at('body').inner_text
      text.delete!("\n")

      text.count(@instant_options[:queryy])
    else
      "pass a  single letter"
    end
  end

  def query
    if (@instant_options[:queryy]).length==1
      given_letter = @instant_options[:queryy]
      page = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{given_letter}"))
      page.css('script').remove
      page.css('p').first.text
    else
      "No Data here"
    end
  end
end
