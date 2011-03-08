require 'cucumber/ast/features'
require 'cucumber/feature_file'
require 'cucumber/platform'

class Something
  attr_reader :features

  def initialize
    @feature_files = ["test.feature"]
    @filters = []
  end

  def load
    features = Cucumber::Ast::Features.new

    tag_counts = {}
    # don't care start = Time.new
    # don't care log.debug("Features:\n")
    @feature_files.each do |f|
      feature_file = Cucumber::FeatureFile.new(f)
      feature = feature_file.parse(@filters, tag_counts)
      if feature
        features.add_feature(feature)
        # don't care log.debug("  * #{f}\n")
      end
    end

    # don't care duration = Time.now - start
    # don't care log.debug("Parsing feature files took #{format_duration(duration)}\n\n")

    # don't care check_tag_limits(tag_counts)

    @features = features
  end
end

s = Something.new
s.load
s.features.each do |feature|
  puts feature.name
  # TODO: visitor..?!?
  # puts feature.accept visitor
end
