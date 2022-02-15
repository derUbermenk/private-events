<p>
  This is an implementation of the <a href="https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/private-events#project-private-events">Private Events </a>
  project in the ruby pathway of the odin project. The task was to build a site that allows users to create and join events, a bonus being allowing the creation of private events and making invites
  for these type of events.

  See the project in action <a href="https://private-events-ch.herokuapp.com/">here</a>
</p>

<p>You can use the following credential to log in</p>
email: constant@email.com <br>
password: constant@email.com

<p>
A brief explanation of the data model:

**Events** are owned by **Users** as *organizers*. They are able to create these events which appear in the root page provided that they are public. In this case, other users are able to attend events. Attending events creates an **Attendance** record, that references both the *attendee*(user) and the event their attending. Cancelling an attendance to an events deletes this record. 

In cases wherein an event is private, an organizer may choose to invite users. Inviting creates an
**Invitation** record which reverences the event, the organizer the user being invited as an invitee. Accepting and rejecting an invite deletes a record. Attendances records are however created upon accepting an invite.
</p>
