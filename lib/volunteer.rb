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
    # get_id = DB.exec("SELECT id from volunteers WHERE name = ('#{@name}');")
    # if get_id.first === nil
    #   @project_id
    # else
    #   @project_id = DB.exec("SELECT id from volunteers WHERE name = ('#{@name}');").first.fetch('id').to_i
    # end
  end


end
