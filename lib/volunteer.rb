require('pry')

class Volunteer

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def save()
    DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}','#{@project_id}')")
  end

  def id()
    get_id = DB.exec("SELECT id from volunteers WHERE name = ('#{@name}');")
    if get_id.first === nil
      @id
    else
      @id = DB.exec("SELECT id from volunteers WHERE name = ('#{@name}');").first.fetch('id').to_i
    end
  end

  def name()
    @name
  end

  def project_id()
    get_id = DB.exec("SELECT id from volunteers WHERE name = ('#{@name}');")
    if get_id.first === nil
      @project_id
    else
      @project_id = DB.exec("SELECT id from volunteers WHERE name = ('#{@name}');").first.fetch('id').to_i
    end
  end

  def ==(thing_two)
     self.id().==(thing_two.id()).&(self.name().==(thing_two.name()))
  end

  def self.all()
    volunteers = []
    volunteers_query = DB.exec("SELECT * FROM volunteers;")
    volunteers_query.each do |volunteer|
      volunteers.push volunteer.fetch('name')
      volunteers.push volunteer.fetch('project_id')
    end
    volunteers
  end

  def self.more()
    volunteers = []
    volunteers_query = DB.exec("SELECT * FROM volunteers;")
    volunteers_query.each do |volunteer|
      volunteers_each = []
      volunteers_each.push volunteer.fetch('name')
      volunteers_each.push volunteer.fetch('project_id')
      volunteers_each.push volunteer.fetch('id')
      volunteers.push volunteers_each
    end
    volunteers
  end

  def self.find(id)
    volunteers = []
    volunteers_query = DB.exec("SELECT name, project_id FROM volunteers WHERE id = #{id};")
    volunteers_query.each do |volunteer|
      volunteers.push volunteer.fetch('name')
      volunteers.push volunteer.fetch('project_id')
    end
    volunteers
  end

  def update(attributes)
    @name = attributes.fetch(:title)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = '#{@id}';")
  end

  def self.update_id(attributes)
    @name = attributes.fetch(:title)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
    DB.exec("UPDATE volunteers SET project_id = '#{@project_id}' WHERE id = '#{@id}';")
  end

  def self.update_name(attributes)
    @name = attributes.fetch(:title)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = '#{@id}';")
  end

end
