module JoblistingsHelper

  def checked_i(area)
    @joblisting.issue.nil? ? false : @joblisting.issue.match(area)
  end

  def checked_f(area)
    @joblisting.fixture.nil? ? false : @joblisting.fixture.match(area)
  end

end
