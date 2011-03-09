require 'cucumber/ast/features'
require 'cucumber/feature_file'
require 'cucumber/platform'
require 'cucumber/configuration'
require 'cucumber'

class TestFormatter

#  def step_name(keyword, step_match, status, source_indent, background)
#    puts "Keyword: #{keyword}, Step match: #{step_match}"
#    #name_to_report = format_step(keyword, step_match, status, source_indent)
#    #puts name_to_report.indent(@scenario_indent + 2))
#    #print_announcements
#  end

#  def feature_element_name(keyword, name)
#    puts("#{keyword}: #{name}")
#  end

#  def step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background)
#    puts keyword
#  end

#  def step_name(keyword, step_match, status, source_indent, background)
#    puts keyword
#  end

  def tag_name(tag_name)
    puts tag_name
  end

  def before_feature(feature)
    puts "Before #{feature.short_name}"
  end

  def feature_name(keyword, name)
    puts("#{keyword}: #{name}")
  end

  def scenario_name(keyword, name, file_colon_line, source_indent)
    puts("#{keyword}: #{name}")
  end

  def comment_line(comment_line)
    puts comment_line
  end

  def after_features(features)
    puts "sorted guv'nor"
  end

  def before_step(step)
    puts "fuck!"
  end

  def step_name(keyword, step_match, status, source_indent, background)
    #return if @hide_this_step
    #source_indent = nil unless @options[:source]
#    name_to_report = format_step(keyword, step_match, status, source_indent)
#    @io.puts(name_to_report.indent(@scenario_indent + 2))
#    puts name_to_report #.indent(@scenario_indent + 2))
    #print_announcements
    puts "fuck"
  end





end

class Something
  attr_reader :features

  def initialize
    @feature_files = ["features/test.feature"]
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

  def walk_it
    #tree_walker = @configuration.build_tree_walker(self)
    tree_walker = Cucumber::Ast::TreeWalker.new(self, [TestFormatter.new])
    #self.visitor = tree_walker # Ugly circular dependency, but needed to support World#announce

    tree_walker.visit_features(@features)
  end

  # TODO: guessing my way thru this stuff...

  def with_hooks(scenario, skip_hooks=false)
    yield scenario
  end

  def step_match(step_name, name_to_report=nil) #:nodoc:
    #@support_code.step_match(step_name, name_to_report)
    []
  end


end

s = Something.new
s.load
s.walk_it
