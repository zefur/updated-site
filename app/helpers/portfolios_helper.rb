module PortfoliosHelper
    def language_links(languages)
        languages.split(",").map { |t| link_to t, language_path(t) }.join(', ')
  end

  def language_cloud(language, classes)
        max = languages.sort_by(&:count).last
        languages.each do |language|
          index = language.count.to_f / max.count * (classes.size-1)
          yield(language, classes[index.round])
      end
  end

end
