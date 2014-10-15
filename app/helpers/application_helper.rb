module ApplicationHelper

  def inline_svg(path)
    File.open("app/assets/fonts/#{path}", "rb") do |file|
      raw file.read
    end
  end

end
