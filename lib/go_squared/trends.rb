class GoSquared
  class Trends
    METRICS = %w(pageviews topcontent ppv browsers platforms referrers locations languages screens capabilities queries keywords nvr sources toplanding topexit)
    
    def initialize api_key, site_id
      @api_key  = api_key
      @site_id  = site_id
      
      @start    = 1.month.ago.to_i
      @end      = Time.now.to_i
      @metric   = :pageviews
      @group    = :day
    end
    
    METRICS.each do |metric|
      define_method metric do
        self.on(metric)
      end
    end
    
    def on metric
      @metric = metric.to_sym
      self
    end
    
    def from time
      @start = time.to_i
      self
    end
    
    def to time
      @end = time.to_i
      self
    end
    
    def timezone value
      @timezone = value
      self
    end
    
    def group_by group
      @group = group.to_sym
      self
    end
    
    def limit value
      @limit = value
      self
    end
    
    def period value
      @period = value
      self
    end
    
    def xml
      fetch
    end
    
    def from_xml
      hash = Hash.from_xml(xml)
      
      hash.recursive_symbolize_keys!
      
      hash[:data][@group].blank? ? hash[:data] : hash[:data][@group]
    end
    
    private
      
      def fetch
        res = Net::HTTP.start('api.gosquared.com') do |http|
          params = []
          params << "api_key=#{ @api_key }"
          params << "sid=#{ @site_id }"
          params << "metric=#{ @metric }"
          params << "start=#{ @start }"
          params << "end=#{ @end }"
          params << "grouping=#{ @group }"    if @group
          params << "limit=#{ @limit }"       if @limit
          params << "period=#{ @period }"     if @period
          params << "timezone=#{ @timezone }" if @timezone
          
          http.get("/trends.xml?#{ params.join('&') }")
        end
        
        res.body
      rescue e
        "<data><error>#{ e }</error></data>"
      end
    
  end
end