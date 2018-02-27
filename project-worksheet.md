# Project Overview

Important: I started my entire app over at one point. My first few days of work can be seen in this repo: (https://git.generalassemb.ly/emilymarro/hopeful)

## Project Schedule

This schedule will be used to keep track of your progress throughout the week and align with our expectations.  

You are **responsible** for scheduling time with your squad to seek approval for each deliverable by the end of the corresponding day, excluding `Saturday` and `Sunday`.

### Rails App Project

|  Day | Deliverable | 
|---|---| 
|Day 1: Fri 2/9 | Wireframes, Priority Matrix, Schedule, Time Estimates |
|Day 2: Mon  2/12 | Lectures: (AM) Rails As An API  (PM) React on Rails |
|Day 3: Tue 2/13 | Full Day Working on Rails Project  |
|Day 4: Wed 2/14 | Project Presentations |

### Personal Final Project 

|  Day | Deliverable | 
|---|---|
|Day 1: Fri 2/16 | Wireframes, Priority Matrix, Schedule, Time Estimates |
|Day 2: Tue 2/20 | Pseudocode\Actual code|
|Day 3: Wed 2/21 | Work on project  |
|Day 4: Thur 2/22 | Work on project  |
|Day 5: Fri 2/23 | Work on project  |
|Day 6: Mon 2/26 | Working Prototype with full commit to master |
|Day 7: Tue 2/2 | Final edits...branching first |
|Day 8: Wed 2/26 | Project Presentations |

## Project Description

This app is intended for people who suffer with any level of depression. Sometimes it can be hard to get motivated to do ANYTHING to feel better when you're depressed. This app allows users to log all of the little wins they have throughout the day - whether it's going to therapy, calling a friend, exercising, or even just getting into the shower. Each activity gets points, so you can track how you were feeling from day to day and use this as a resource to discuss your week with your therapist.

## Wireframes

Navbar: (http://res.cloudinary.com/emilymarro/image/upload/v1519677951/navbar_isdriy.jpg)
Landing page: (http://res.cloudinary.com/emilymarro/image/upload/v1519677950/landingpage_ubmk6i.jpg)
Activity ideas: (http://res.cloudinary.com/emilymarro/image/upload/v1519677950/ideas_ekwmey.jpg)
Daily Recap: (http://res.cloudinary.com/emilymarro/image/upload/v1519677950/dailyrecap_onyllq.jpg)
Add activity: (http://res.cloudinary.com/emilymarro/image/upload/v1519677950/add_edit_zmtg1m.jpg)
Alternate: (http://res.cloudinary.com/emilymarro/image/upload/v1519677951/activities_kkrkij.jpg)
Revised tables: (http://res.cloudinary.com/emilymarro/image/upload/v1519677951/revised_tables_assa2o.jpg)


## Priority Matrix

(http://res.cloudinary.com/emilymarro/image/upload/v1519677952/timepriority_fnvbsa.jpg)

## MVP 

CRUD Activities and accompanying points
User Authentication
Daily Roundup page to see a day's points, activities, and journal.
Helpful Links 

## POST MVP

Incorporate an API to find mental health professionals
Incorporate an API to search for local events


## Functional Components



| Component | Priority | Estimated Time | Time Invested | Actual Time |

| Component 1 | H | 10hrs| 12hrs | 12hrs |

| CRUD | H | 10hrs | 20hrs | 20hrs |
| Styling | M | 10hrs | 6 hrs | 6hrs |
| Auth | H | 5 hrs | 10 hrs| 10hrs|
| Links | L | 2hrs |  |  |
| Readme/wrkst | 1hr | 1.5hrs | 1.5hrs |
| Deploy | 2hrs | | |

Total estimated:
Actual total: 




## Additional Libraries
Devise - for authorization
Bootstrap - for styling


## Code Snippet



## Change Log
I was following this tutorial for a while to make a blog: 
(https://scotch.io/tutorials/build-a-blog-with-ruby-on-rails-part-1) but it didn't accomplish what I wanted it to - the main purpose of the app is to be an activity tracker, not a full-fledged blog. I got it running but then couldn't incorporate my activities table, and at that point I had run a million migrations so I just started from scratch with a much simpler table structure.

## Issues and Resolutions

issue: 'Key is duplicated and overwritten'
solution: there are two keys with the same name! redo migration with new keys

issue: screwed up migrations
solution: need to put most amount of time into planning the tables, migrations, etc.

issue: creating points in seed file with faker
solution: points: Faker::Number.between(5, 30),

issue: 'No template found for ActivitiesController#create, rendering head :no_content'
solution: add to view '<%= f.hidden_field :user_id, value: 1 %>'

issue: posting a journal entry wouldn't work
solution: add to form: <%= hidden_field_tag :authenticity_token, form_authenticity_token %>

issue: couldn't save tasks or days to individual users
solution: 
(In ApplicationController: )  
    def require_user
        redirect_to new_user_session_path unless current_user
    end
(In other controllers:)
    @days = Day.where(user_id: current_user.id)

issue: once I deployed to heroku, the logout would lead to a "page doesn't exist" error
solution: 
(In routes:)
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end

issue: change format of date from YEAR/DY/MO
solution: (in views) add strftime("%d %B %Y")

issue: sort days index by date
solution: (in controller)
@days = Day.where(user_id: current_user.id).order("date ASC").all
