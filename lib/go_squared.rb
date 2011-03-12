require 'net/http'
require 'active_support/core_ext/hash/conversions'

require 'go_squared/core_extensions'
require 'go_squared/trends'

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class GoSquared
  
  def initialize api_key, site_id
    @api_key = api_key
    @site_id = site_id
  end
  
  def trends
    GoSquared::Trends.new(@api_key, @site_id)
  end
  
end