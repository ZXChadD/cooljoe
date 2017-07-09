module JoblistingsHelper

  def checked(area)
    @joblisting.type.nil? ? false : @joblisting.type.match(area)
  end
end
