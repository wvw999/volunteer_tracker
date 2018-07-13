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
    get_id = DB.exec("SELECT id from projects WHERE title = ('#{@title}');")
    if get_id.first === nil
      @id
    else
      @id = DB.exec("SELECT id from projects WHERE title = ('#{@title}');").first.fetch('id').to_i
    end
  end

  def save()
    DB.exec("INSERT INTO projects (title) VALUES ('#{@title}');")
  end

  def ==(thing_two)
     self.id().==(thing_two.id()).&(self.title().==(thing_two.title()))
  end

end
