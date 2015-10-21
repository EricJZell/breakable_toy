![Build Status](https://codeship.com/projects/550d4800-4dda-0133-3ceb-524cf6105349/status?branch=master)![Code Climate](https://codeclimate.com/github/EricJZell/swell_journal.png) ![Coverage Status](https://coveralls.io/repos/EricJZell/swell_journal/badge.png)

== README

## SWELL JOURNAL

[Visit Swell Journal](https://morning-peak-3297.herokuapp.com/)

Swell Journal is a travel journal specifically for surfing. It differs from a typical travel journal in that it pulls in real-time weather data and real-time oceanographic date from a 3rd party API to create a snap-shot of the conditions
at the time of the journal entry.

![Conditions Snapshot](http://i.imgur.com/EoO3S4v.png)

Swell Journal also uses Google Maps to record the user's exact location.

![Actual Locaiton](http://i.imgur.com/lFUF8yE.png)

The app is very convenient to use: All it takes is one click for a user to create a journal entry that automatically documents their location, the date and time, weather conditions, and swell conditions. Some other features include:

* A 'Friends' model that allows users to share their journal entry with friends

* Highcharts for a graphical display of user activity

  ![Highcharts](http://i.imgur.com/Q7qeucd.png)

* Photos can be added using the Carrier Wave gem, and are stored on AWS S3

* A photo-flip feature built in JavaScript with the Owl-Carousel gem

  ![Photo Carousel](http://i.imgur.com/wLLDzwo.png)

## Development

Swell Journal was built with Ruby on Rails following Test Driven Development practices. RSpec test suite was used with Capybara. It uses PostgreSQL as the database management system . The app is deployed on Heroku. JavaScript features include Google Maps, Highcharts, a photo-carousel, and dynamic drop-down lists with AJAX.
The markup language is HTML, and the styling is CSS with Zurb Foundation.  The following ER Diagram was followed for development:

![ER Diagram](http://i.imgur.com/CFCUkr7.png)

The weather and swell data is imported in JSON format from the Magicseaweed API:

![Powered By Magicseaweed](http://im-1-uk.msw.ms/msw_powered_by.png)   



<tt>rake doc:app</tt>.
