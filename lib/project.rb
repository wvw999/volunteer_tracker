require('pry')

class Project

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def title()
    @title
  end

  def id()
    DB.exec("SELECT id from projects WHERE title = ('#{@title}');")
  end

  def save()
    DB.exec("INSERT INTO projects (title) VALUES ('#{@title}');")
  end

end
