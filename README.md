# On This Day

## About

*On This Day* is an API built with [Sinatra](https://github.com/sinatra/sinatra) that returns events, births and deaths that occurred in a specific day. This information has been retrieved from Wikipedia by using a scraper.

Currently available at https://onthisday.salatart.com

## Usage

### Episodes

Returns an array of json historical episodes, filtered by day, month and episode type (event, birth or death).

- **URL:**

  `/episodes?day=<day>&month=<month>&type=<type>`

- **Method:**

  `GET`

- **URL Params**

  - **Required:**

    `day=[integer]`, any number between 1 and 31

    `month=[integer]`, any number between 1 and 12

  - **Optional:**

    `type=[string]`, can be 'event', 'birth' or 'death'

- **Data Params**

  None

- **Success Response:**

  - **Code:** 200
  - **Example content:**
  ```javascript
    {
      episodes: [
        {
          id: 73050,
          day: 14,
          month: 7,
          year: 756,
          bce: false,
          episode_type: "event",
          text: "An Lushan Rebellion: Emperor Xuanzong flees the capital Chang'an as An Lushan's forces advance toward the city."
        }, {
          id: 73051,
          day: 14,
          month: 7,
          year: 1223,
          bce: false,
          episode_type: "event",
          text: "Louis VIII becomes King of France upon the death of his father, Philip II."
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
    url: "/episodes?day=14&month=7",
    dataType: "json",
    type : "GET",
    success : function(response) {
      console.log(response);
    }
  });
  ```

## Setup

##### Development

1. Clone and cd into this repository
2. Run `bundle install`
3. Turn on Postgres
4. Run `bundle exec rake db:reset`
5. Run `ruby app.rb`

##### Docker

```sh
# Run database
$ docker run -d --name=postgres_db postgres:9.6.1

# Run API
$ docker run -d --name=onthisday -p 80:9292 --link=postgres_db:postgres_db sasalatart/onthisday

# Setup the database
$ docker exec onthisday /bin/sh -c 'rake db:reset'
```

The server's machine should now be redirecting its port 80 to the container's port 9292.
