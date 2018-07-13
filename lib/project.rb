require('pry')

class Project

  def initialize(attributes)
    @title = attributes.fetch(:title)
  end

  def title()
    @title
  end

end
