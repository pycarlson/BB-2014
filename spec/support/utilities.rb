def full_title(page_title)
  base_title = "Brighter Beginnings Adopt-a-Family Program"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end