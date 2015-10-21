![Build Status](https://codeship.com/projects/550d4800-4dda-0133-3ceb-524cf6105349/status?branch=master)![Code Climate](https://codeclimate.com/github/EricJZell/swell_journal.png) ![Coverage Status](https://coveralls.io/repos/EricJZell/swell_journal/badge.png)

== README

## SWELL JOURNAL

Swell Journal is a travel journal specifically for surfing. It differs from a typical travel journal in that it pulls in real-time weather data and real-time oceanographic date from a 3rd party API to create a snap-shot of the conditions at the time of the journal entry.
![Conditions Snapshot](http://i.imgur.com/EoO3S4v.png)
Swell Journal also uses Google Maps to record the user's exact location.
![Actual Locaiton](http://i.imgur.com/lFUF8yE.png)
The app is very convenient to use: All it takes is one click for a user to create a journal entry that automatically documents their location, the date and time, weather conditions, and swell conditions. Some other features include:

* A 'Friends' model that allows users to share their journal entry with friends

* Highcharts for a graphical display of user activity

* Photos can be added using the Carrier Wave gem, and are stored on AWS S3


* A photo-flip feature built in JavaScript with the Owl-Carousel gem
  ![Photo Carousel](http://i.imgur.com/wLLDzwo.png)
  
* Devise for user authentication



<tt>rake doc:app</tt>.
