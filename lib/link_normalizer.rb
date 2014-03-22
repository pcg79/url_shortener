class LinkNormalizer
  attr_reader :link

  def initialize(link)
    @link = link
  end

  def normalize!
    if link.url && link.url =~ /$http:\/\//
      link.url = link.url[7..-1]
    end

    link
  end
end
