module SpreeVolumePricing
  VERSION = '3.3.3'.freeze

  module_function

  # Returns the version of the currently loaded SpreeVolumePricing as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new VERSION
  end
end
