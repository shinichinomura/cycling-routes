module ApplicationHelper
  def normalize_og_image(path)
    if path[0..1] == '//'
      "#{request.protocol}#{path.sub(%r(^//), '')}"
    elsif path[0] == '/'
      "#{request.protocol}#{request.domain}#{path}"
    end
  end
end
