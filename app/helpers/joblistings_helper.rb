module JoblistingsHelper

  def checked(area)
    @joblisting.issue.nil? ? false : @joblisting.issue.match(area)
    @joblisting.fixture.nil? ? false : @joblisting.fixture.match(area)
    @joblisting.housing.nil? ? false : @joblisting.housing.match(area)
    @joblisting.date.nil? ? false : @joblisting.date.match(area)
  end

end
