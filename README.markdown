# go_squared gem

## What is it?
A Ruby gem wrapping the gosquared.com API.

## Who should use it?
Any Ruby on Rails developer who wants/needs to load trends from GoSquared Statistics.

## Usage

### Installation

    gem install go_squared


### Initialization

Initialize the connection for a given site:

    @gs = GoSquared.new('Your API Key', 'GSN-123456-A')


### Metrics

To fetch the pageviews metric simply do:

    @pageviews = @gs.trends.pageviews

All available metrics are:

- pageviews _(Total number of pageviews and uniques per unit time)_
- topcontent _(Top performing content)_
- ppv _(Pages per view per unit time)_
- browsers _(Browsers)_
- platforms _(Platforms)_
- referrers _(Referrers)_
- locations _(Locations)_
- languages _(Languages)_
- screens _(Screen sizes)_
- capabilities _(Flash & Java availability)_
- queries _(Search queries)_
- keywords _(Search keywords)_
- nvr _(New vs Returning visitors per unit time)_
- sources _(Organic - search engine - sources)_
- toplanding _(Top landing pages)_
- topexit _(Top exit pages)_


### Method chain

By default trends form one month ago until now are fetched.
To get a custom timeframe:

    @pageviews = @gs.trends.pageviews.from(14.days.ago).to(7.days.ago)

All chainable methods are:

- from _(defaults to 1.month.ago)_
- to _(defaults to Time.now)_
- period _(last specified period of time - overrides from/to - options are 'day', 'week', 'month' and 'year' - defaults to 'week')_
- timezone _(defaults to 'UTC')_
- group_by _(options are 'day', 'week', 'month' and 'year' - defaults to 'day')_
- limit _(must be an integer - defaults to 30)_


### Fetch data

Up till now no data has been fetched.
To get the raw XML:

    @xml = @pageviews.xml

To get an array of ruby Hashes with symbolized keys:

    @stats = @pageviews.from_xml

The latter will return something like:
    
    {:hits=>"41", :uniques=>"28", :stat_start=>"1298736000", :time_grouping=>"2011057", :display_time=>"Sat, 26 Feb 11"}
    {:hits=>"126", :uniques=>"77", :stat_start=>"1298764800", :time_grouping=>"2011058", :display_time=>"Sun, 27 Feb 11"}
    {:hits=>"105", :uniques=>"56", :stat_start=>"1298851200", :time_grouping=>"2011059", :display_time=>"Mon, 28 Feb 11"}
    ...


## Important

This gem is written for Rails 3.
Rails 2 might work but it's not tested.

Note that this gem is still under development.
It only covers the trends section of the gosquared.com API.


## Contributing to go_squared
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Wout Fierens. See LICENSE.txt for
further details.












