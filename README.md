<b><font size=6>Wolf Portal</text></b>
By Preetham MS(pmahish)
Krunal Gala(kgala) 
Aneesh Gupta(agupta27)
Pooja Asher(pmasher)<br>

 - Ruby Version: 2.3 
 - Database Used: PostgresSQL

Deploy using Server URL: 

<b>Preconfigured Admin and users:</b>
<table  border =2>
<th>Role</th>       			 <th> Email ID       </th><th>         Password</th>
<tr><td>Admin     			<td>  admin@gmail.com <td>    admin123</td></tr>
<tr><td>Student    <td>  gala@gmail.com <td>    s1234567</td></tr><tr>
<td>Instructor<td>  efg@gmail.com  <td> i1234567</tr></table>

<b>Relevant Tabs are given in the header for all users.</b>

 - Student:Search, Mycourses,Profile, Messages  
 -  Admin: Manage Admins, Manage Instructors, Manage Students,   Manage Courses,Messages
 - Instructor: Enrollment requests,Courses,Messages

<b>Major Features</b>

 - **Students** can Search using name, title and description, and send enrollment to enrol in the course.
 - They can view their courses, drop, or check enrollment status in My courses. 
 - They can also send private messages to students and instructors
 - **Admins** can add and manage other admins. Special privileges are given to the predefined admin.
 - They can view all students and instructors, edit or delete them.
 - They can view all courses, add new courses and add and delete instructors and students to each course. They can also post notifications and grades on behalf of the course instructors.
 -  **Instructor** can view and edit his profile, 
 - They can view their courses and accept/decline enrollment requests
 - They can additionally message instructors and students.

<b> Testing </b>

-Test Cases added to test Course Model - test/models/course_test.rb

-Ran various Test cases for the controllers


 Testing of Course Model
 ==========================

$ bundle exec rake test:models
Running:

.........

Finished in 0.288275s, 31.2202 runs/s, 31.2202 assertions/s.

9 runs, 9 assertions, 0 failures, 0 errors, 0 skips
 

 Testing of controllers (static/users/course)
 ==========================

 $ bundle exec rake test:controllers

Running:

......

Finished in 0.719469s, 8.3395 runs/s, 11.1193 assertions/s.

6 runs, 8 assertions, 0 failures, 0 errors, 0 skips
