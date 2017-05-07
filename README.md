# On This Day

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](sasalatart/on-this-day)
[![](https://images.microbadger.com/badges/version/sasalatart/on-this-day-sinatra.svg)](https://microbadger.com/images/sasalatart/on-this-day-sinatra)
[![](https://images.microbadger.com/badges/image/sasalatart/on-this-day-sinatra.svg)](https://microbadger.com/images/sasalatart/on-this-day-sinatra)
[![Code Climate](https://codeclimate.com/github/sasalatart/on-this-day-sinatra/badges/gpa.svg)](https://codeclimate.com/github/sasalatart/on-this-day-sinatra)

## About

Application built with [Sinatra](https://github.com/sinatra/sinatra) and [React](https://facebook.github.io/react/) that returns events, births and deaths that occurred during a specific day of history. This information has been retrieved from Wikipedia using a scraper.

## API Usage

#### Events

Returns an array of JSON historical events, filtered by day and month.

- **URL:** `/events?day=<day>&month=<month>`

- **Method:** `GET`

- **URL Params**
  - `day=[integer]`, any number between 1 and 31
  - `month=[integer]`, any number between 1 and 12

- **Success Response:**
  - **Code:** 200
  - **Example content:**
  ```javascript
    {
      day_month: {
        id: 32,
        day: 1,
        month: 2,
        description: "February 1 is the 32nd day of the year in the Gregorian calendar. There are 333 days remaining until the end of the year (334 in leap years). This date is slightly more likely to fall on a Monday, Wednesday or Friday (58 in 400 years each) than on Saturday or Sunday (57), and slightly less likely to occur on a Tuesday or Thursday (56).",
        episodes: [
          {
            id: 10659,
            year: 2013,
            bce: false,
            episode_type: "event",
            text: "The Shard, the tallest building in the European Union, is opened to the public.",
            day_month_id: 32,
            keywords: [
              {
                id: 21624,
                episode_id: 10659,
                title: "List of tallest buildings in the European Union",
                href: "/wiki/List_of_tallest_buildings_in_the_European_Union"
              }, {
                id: 21623,
                episode_id: 10659,
                title: "The Shard",
                href: "/wiki/The_Shard"
              }, {
                id: 21622,
                episode_id: 10659,
                title: "2013",
                href: "/wiki/2013"
              }
            ]
          }, {
            ...
          }
        ]
      }
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

1. cd into `client` and:
  - run `npm install`
  - run `npm start`
2. open a new shell instance, cd into `server` and:
  - run `bundle install`
  - run `rake db:reset`
  - run `shotgun config.ru`

#### Docker

```sh
# Pull and run the application and PostgreSQL
$ docker run -d --name=postgres_db postgres:9.6.1
$ docker run -d --name=onthisday -p 80:9292 --link=postgres_db:postgres_db sasalatart/on-this-day-sinatra

# Setup the database
$ docker exec onthisday rake db:reset
```

The server's machine should now be redirecting its port 80 to the container's port 9292.
