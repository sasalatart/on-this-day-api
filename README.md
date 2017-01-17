# On This Day

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](sasalatart/on-this-day)
[![](https://images.microbadger.com/badges/version/sasalatart/on-this-day.svg)](https://microbadger.com/images/sasalatart/on-this-day)
[![](https://images.microbadger.com/badges/image/sasalatart/on-this-day.svg)](https://microbadger.com/images/sasalatart/on-this-day)
[![Code Climate](https://codeclimate.com/github/sasalatart/on-this-day/badges/gpa.svg)](https://codeclimate.com/github/sasalatart/on-this-day)

## About

*On This Day* is an application built with [Sinatra](https://github.com/sinatra/sinatra) and [React](https://facebook.github.io/react/) that returns events, births and deaths that occurred in a specific day. This information has been retrieved from Wikipedia by using a scraper.

Currently available at https://onthisday.salatart.com

## API Usage

#### Events

Returns an array of JSON historical events, filtered by day and month.

- **URL:**

  `/events?day=<day>&month=<month>`

- **Method:**

  `GET`

- **URL Params**

  `day=[integer]`, any number between 1 and 31

  `month=[integer]`, any number between 1 and 12

- **Data Params**

  None

- **Success Response:**

  - **Code:** 200
  - **Example content:**
  ```javascript
    {
      id: 359,
      day: 25,
      month: 12,
      description: "December 25 is the 359th day of the year (360th in leap years) in the Gregorian calendar. There are six days remaining until the end of the year. This date is slightly more likely to fall on a Tuesday, Friday or Sunday (58 in 400 years each) than on Wednesday or Thursday (57), and slightly less likely to occur on a Monday or Saturday (56).",
      events: [
        {
          id: 122616,
          year: 2015,
          bce: false,
          episode_type: "event",
          text: "Mohammed Zahran Alloush, commander of Jaysh al-Islam (Army of Islam), one of the Syrian opposition factions, is killed by an airstrike.",
          day_month_id: 359
        }, {
          id: 122615,
          year: 2012,
          bce: false,
          episode_type: "event",
          text: "An Antonov An-72 plane crashes close to the city of Shymkent, killing 27 people.",
          day_month_id: 359
        }, {
          ...
        }
      ]
    }
  ```

- **Error Response:**

  - **Code:** 400
  - **Content:**
  ```javascript
    { error: "Not a valid request." }
  ```

- **Sample Call:**

  ```javascript
  $.ajax({
    url: "/events?day=25&month=12",
    dataType: "json",
    type : "GET",
    success : function(response) {
      console.log(response);
    }
  });
  ```

#### Births And Deaths

The API is the same for births and deaths, but instead of making a call to `/events`, it should be done to either `/births` or `/deaths`.

## Setup

#### Development

1. Clone and cd into this repository
2. cd into `client` and run `npm run build && npm start`
3. cd back into the root dir of this repository
4. cd into `server` and run `bundle install`
5. Run `rake db:reset`
6. Run `shotgun config.ru`

#### Docker

```sh
# Pull and run the application and PostgreSQL
$ docker run -d --name=postgres_db postgres:9.6.1

$ docker run -d --name=onthisday -p 80:9292 --link=postgres_db:postgres_db sasalatart/onthisday

# Setup the database
$ docker exec onthisday /bin/sh -c 'rake db:reset'
```

The server's machine should now be redirecting its port 80 to the container's port 9292.
