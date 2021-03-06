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

  def self.all()
    projects = []
    projects_query = DB.exec("SELECT * FROM projects;")
    projects_query.each do |project|
      projects.push project.fetch('title')
    end
    projects
  end

  def self.more()
    projects = []
    projects_query = DB.exec("SELECT * FROM projects;")
    projects_query.each do |project|
      projects_each = []
      projects_each.push project.fetch('title')
      projects_each.push project.fetch('id')
      projects.push projects_each
    end
    projects
  end

  def self.find(id)
    id_query = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    id_query.first.fetch('title')
  end

  def volunteers(id)
    volunteers_query = DB.exec("SELECT * FROM volunteers WHERE project_id = '#{id}';")
    volunteers_list = []
    volunteers_query.each do |volunteer|
      volunteers_list.push volunteer.fetch('name')
    end
    volunteers_list
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = '#{@id}';")
  end

  def self.update_title(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = '#{@id}';")
  end

  def delete()
    DB.exec("DELETE FROM projects WHERE id = '#{self.id}';")
  end

  def self.delete_title(attributes)
    @id = attributes.fetch(:id)
    DB.exec("DELETE FROM projects WHERE id = '#{@id}';")
  end

end
