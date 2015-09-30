As a prospective user
I want to create an account
So that I can post journal entries and view other entries
Acceptance Criteria:
- I must specify a valid email address, password, and password confirmation
- If I don't specify the required information,I am presented with an error message

As an unauthenticated user
I want to sign in
So that I can post journal entries and view older entries
Acceptance Criteria:
  -  If not signed in, user has the option to sign in
  -  User will be notified of successful sign in
  -  User will be notified of errors if sign in is unsuccessful

As an authenticated user
I want to sign out
So that my identity is forgotten about on the machine I'm using
Acceptance Criteria
- If I'm signed in, I have an option to sign out
- When I opt to sign out, I get a confirmation that my identity has been forgotten on the machine I'm using

As an existing user
I want to update my account
So that I can reflect up-to-date information
Acceptance Criteria:
- I must be signed in.
- I must provide information in the form and use submit button.
- I must provide unique information.
- I must be notified if my update was successful or unsuccessful.

As an authenticated user
I want to delete my account
So that my information is no longer retained by the app
Acceptance Criteria:
- I must be signed in.
- I must be logged out when I click delete account
- My information must be deleted from the database
- I must be notified if my update was successful or unsuccessful.

As an authenticated user
I want to post a journal entry
So that I can create a log of all of my sessions
Acceptance Criteria:
- I must be logged in
- I must provide a title, body, location, and date.
- I can optionally pull a real-time swell model from MSW API to attach to the entry
- I can optionally provide a number of photos to the entry
- I must be notified if my post was successful or unsuccessful

As an authenticated user
I want to view a list of journal entries
So that I can pick ones to view
Acceptance Criteria:
- I must see a list of journal entries

As an authenticated user
I want to view a specific entry's details
So that I can review it in more detail
Acceptance Criteria:
- I must be able to navigate from the journal entries index
- I must see the entry's title, body, location, and date

As an authenticated user
I want to update an entry
To give it more accurate information
Acceptance Criteria:
- I must be logged in
- I must only be able to update my own entries
- I must recieve an error message if I submit an invalid update
- I must receive a success message and be brought to the updated entry page on success

As an authenticated user
I want to delete an entry
So that it is no longer displayed or saved in the database
Acceptance Criteria:
- I must be logged in
- I must only be able to delete my own entries
- I must receive a success message and be brought to the entries index page on success
