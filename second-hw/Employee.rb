class Employee
  attr_accessor :full_name
  attr_accessor :id

  def initialize(full_name, id)
    @full_name = full_name
    @id = id
  end

  def name
    @full_name.split(' ', 2).first
  end

  def surname
    @full_name.split(' ', 2).last
  end

  def to_s
    "#{full_name} #{id}"
  end
end

class Programmer < Employee
  attr_accessor :languages

  def initialize(full_name, id, languages)
    super(full_name, id)
    @languages = languages
  end

  def to_s
    "#{super} #{languages}"
  end
end

class OfficeManager < Employee
  attr_accessor :office

  def initialize(full_name, id, office)
    super(full_name, id)
    @office = office
  end

  def to_s
    "#{super} (#{office})"
  end
end