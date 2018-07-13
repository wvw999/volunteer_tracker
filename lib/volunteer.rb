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

end
