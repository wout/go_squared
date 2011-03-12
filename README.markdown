# go_squared gem

## What is it?
A Ruby gem wrapping the gosquared.com API.

## Who should use it?
Any Ruby on Rails developer who wants/needs to load trends from GoSquared Statistics.

## Usage

### Installation

    gem install go_squared

### Usage

Initialize the connection for a given site:

    @gs = GoSquared.new('Your API Key', 'GSN-123456-A')

To fetch the pageviews metric simply do:

    @pageviews = @gs.trends.pageviews

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

Up till now no data data been fetched.
To get the raw XML data:

    @xml = @pageviews.xml

To get a ruby Hash with symbolized keys:

    @stats = @pageviews.from_xml

















