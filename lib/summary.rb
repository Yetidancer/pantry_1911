class Summary

  attr_reader :name, :details
  def initialize(name, details)
    @name = name
    @details = {details}
  end

end
