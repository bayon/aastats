# AA Stats App

### Description

The AA Stats App will be a 'page-based' application similar to the Weather application that ships with iOS. The number of pages corresponds to the properties the user has access to. These properties will be returned during the login request.

Each page will be a single view for the property and will show stats for the property.

The application must have a settings view where the user can update their saved credentials.

### Design Assets

The following design assets will be provided by the UI/UX department:

* Mockups of some of the screens for guidance
* Background imagery files
* Indatus Logo file
* Font files and / or font specifications for usage
* Color guide with RGB and or HEX values for each color used.
* Component dimensions etc.  

If the design assets have not been provided by UI/UX make due with what you have and replace later when UI/UX provides the assets.


### Development Requirements

#### Code Requirements

- The application will be written for the most current version of iOS
- The application will be written using [Objective-C 2.0](http://deimos3.apple.com/WebObjects/Core.woa/FeedEnclosure/utah.edu.1668842900.01668842919.1679650489/enclosure.pdf) syntax where possible (Array literals, dictionary literals, number literals, etc.).
- When compiled the application will not have any warnings
- Must have 100% unit test coverage of all major functionality
- All functions and classes must be fully documented and also have good in-line documentation
- Code must follow [Indatus iOS coding standards](http://gitlab.indatus.com/training/learning-modules/blob/mobile-development/iOS%20Coding%20Standards.md)
- Use good naming conventions for code components (classes, variables, methods, etc); they should be descriptive but not longer than necessary
- Synchronous URL Connections should not be used
- Ensure that the UI is always kept responsive and that any long running tasks are executed on a background thread
- Demonstrate the ability to use auto-layout constraints, the application should be usable on devices with both 3.5" and 4" screens
- Demonstrate the ability to use blocks/Grand Central Dispatch
- Code should be concise and logical
- There should not be any duplicated code in the application
- Custom view components should be used where possible
- Application code should be organized logically inside of X-Code

#### Process Requirements

- Each user story will be completed on its own branch and a merge request should be submitted for each story to simulate the standard development process.
- Code should need minimal revisions when a merge requests is sent.
- The application should be provisioned to run on all devices for the Mocura Enterprise Account.
- The ad-hoc build of the application should be deployed on TestFlight to all allowed users from the provisioning profile.

## User Stories

### Login

Provide subdomain, email and password to login. Upon successful login the user will be sent to the stats view for the first company returned in the list of companies for that user.

After logging in, the user should be placed on the "daily" view.  If there is only 1 property returned from the API the stats view should be expanded initially.  If there are multiple companies the list should be collapsed into the summary view.

#### API

Url: http://hive.indatus.com/authenticate

Method: POST

Parameters (for testing only, actual input should be used):

Parameter | Value
--- | ---
subdomain | bwebb-gemini
email | bwebb@indatus.com
password | telecom1

The response may be similar to the following JSON:

```
{
    "id": "31",
    "first_name": "Brian",
    "last_name": "Webb",
    "mobile_phone_number": "5552987961",
    "alt_phone_number": "",
    "alt_phone_type_id": null,
    "email": "bwebb@indatus.com",
    "created_at": "2014-02-21 23:04:56",
    "updated_at": "2014-02-21 23:04:56",
    "deleted_at": null,
    "companies": [
        {
            "id": "31",
            "subdomain": "bwebb-gemini",
            "name": "Schinner, Kulas and Upton",
            "parent_company_id": null,
            "company_status_id": "7",
            "company_type_id": "3",
            "website_url": "http://cummings.biz/",
            "physical_address": "031 Mariana Plaza",
            "physical_city": "Jewesstown",
            "physical_state": "NM",
            "physical_postal_code": "38194",
            "office_phone": "549-281-9392",
            "office_fax": "038.925.3423",
            "unit_count": "213",
            "corporate_contact_name": "Rosemary Howe",
            "corporate_contact_title": "Quis iusto est.",
            "primary_contact_name": "Elza Fadel",
            "primary_contact_title": "Soluta officiis eum.",
            "primary_contact_phone": "01683501476",
            "primary_contact_email": "vicenta.langworth@example.com",
            "sales_rep_id": "3",
            "billing_id_number": "6b3ca340-02b8-3592-a8b7-3b3454b50078",
            "billing_address": "62246 Berry Port Apt. 530",
            "billing_city": "South Maxie",
            "billing_state": "FL",
            "billing_postal_code": "77127-2997",
            "billing_contact_name": "Chadrick Kshlerin",
            "billing_contact_title": "Cum officiis praesentium",
            "billing_contact_phone": "073-164-9809",
            "billing_contact_email": "zpollich@example.org",
            "property_software_type_id": "1",
            "created_at": "2014-02-21 23:04:56",
            "updated_at": "2014-02-21 23:04:56",
            "deleted_at": null,
            "pivot": {
                "user_id": "31",
                "company_id": "31"
            },
            "companies": [],
            "preference_settings": [],
            "parent_company": null
        }
    ],
    "roles": [
        {
            "id": "61",
            "company_id": "31",
            "name": "Account Owner",
            "description": "Highest privilege role for account",
            "role_type_id": "2",
            "created_at": "2014-02-21 23:04:56",
            "updated_at": "2014-02-21 23:04:56",
            "deleted_at": null,
            "pivot": {
                "user_id": "31",
                "role_id": "61",
                "company_id": "31"
            },
            "permissions": [
                {
                    "id": "1",
                    "product_id": "1",
                    "name": "Manage Account",
                    "description": "Manage company account information",
                    "created_at": "2014-02-21 23:04:55",
                    "updated_at": "2014-02-21 23:04:55",
                    "pivot": {
                        "role_id": "61",
                        "permission_id": "1"
                    }
                },
                {
                    "id": "2",
                    "product_id": "1",
                    "name": "Manage Users",
                    "description": "Create, edit and delete user accounts",
                    "created_at": "2014-02-21 23:04:55",
                    "updated_at": "2014-02-21 23:04:55",
                    "pivot": {
                        "role_id": "61",
                        "permission_id": "2"
                    }
                },
                {
                    "id": "3",
                    "product_id": "1",
                    "name": "Manage Mobile Users",
                    "description": "Create, edit and delete mobile user accounts",
                    "created_at": "2014-02-21 23:04:55",
                    "updated_at": "2014-02-21 23:04:55",
                    "pivot": {
                        "role_id": "61",
                        "permission_id": "3"
                    }
                }
            ]
        }
    ],
    "user_statuses": [],
    "preference_settings": []
}
```

### View Stats

The stats UI will show data returned from the precompiled reports API request.  When interacting with stats stat for a date interval selected, the available gestures will be L+R swipe, U+D Swipe and Pinch.

#### API

Url: http://hive.indatus.com/precompiled_reports/{interval}/{company_id}

Method: GET

The request will require HTTPBasic authentication which can be the same email and password used for the login.

The possible values for the _interval_ segment of the URL are:

* today
* yesterday
* this_week
* last_week
* this_month
* last_month
* this_year
* last_year

The timezone for the interval (yesterday, today etc) will be relative to the timezone setting the user has selected inside their web application account.  The mobile device won't need to be concerned with timezone modification or date conversion.

A separate API request will be necessary for each different date interval.


The response may be similar to the following JSON:

```
[
    {
        "company_id": "31",
        "property_msg_count_emergency": "4",
        "property_msg_count_leasing": "0",
        "property_msg_count_general": "0",
        "property_msg_count_courtesy": "0",
        "property_avg_emergency_response_time": "34",
        "property_avg_onsite_response_time": "0",
        "property_avg_total_work_time": "0",
        "property_avg_total_resolution_time": "0",
        "portfolio_avg_emergency_response_time": "34",
        "portfolio_avg_onsite_response_time": "0",
        "portfolio_avg_total_work_time": "0",
        "portfolio_avg_total_resolution_time": "0",
        "industry_avg_emergency_response_time": "1733",
        "industry_avg_onsite_response_time": "0",
        "industry_avg_total_work_time": "0",
        "industry_avg_total_resolution_time": "0"
    }
]
```


#### Date based views

The application will have buttons at the top for `Daily`, `Weekly` and `Monthly`.  These will correspond to the interval in the API request as `today`, `this_week`, and `this_month`.

From view to view (daily, weekly, monthly) the date range indicator will change as well as the total message count and summary number data.

**A new API request for the selected date interval will need to be made for each company shown in the list collection.  The list should be populated asynchronously as API requests return data.**

When the user selects a different date interval, a modal should block the UI and show an activity indicator while new data is requested from the API.

#### Report data interaction (swipe left and right)

When swiping the metrics area left and right the pager at the bottom will change and the right side number column will change to a different comparison number set (i.e. industry, portfolio, management company).  The remainder of the screen will remain unchanged. 

**Interaction**: As the user swipes Left and Right, the right side column will move.  As this happens it should fade out in or out.  UI/UX department should be consulted for further details on the transition animation details.


#### Changing companies (swipe up and down)

When swiping the screen up and down the property will change to the next property that is available and the background color of the stats area will be different for that company. 

**Interaction**: The property name + date indication + message count cell should remain anchored at the top of the view until the next property reaches the bottom of that cell and pushes it out of the way as the user is scrolling. 

(See instagram app) 

**Companies should be listed in alphabetical order**


#### Quickly switching companies (pinch)

When the user pinches the main screen area the view will collapse down into a summary view only showing the property name + date indication + message count.  This will allow a user to quickly scroll through all the available companies if there are many.  

When collapsed if a user touches a property the name / summary cell will be anchored at the top of the screen and the stats view will open.

(This pinch for summary view can be seen in the built in iOS weather app)


