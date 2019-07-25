

# Group Users
Users group

## Users [api/v1/users/registration]


### Create a new user [POST /api/v1/users/registration]


+ Request renders created user
**POST**&nbsp;&nbsp;`/api/v1/users/registration`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            email=jovita%40hettinger.info&password=%211password&password_confirmation=%211password

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "5d394fd08d36695ae8821bb6",
                "type": "users",
                "attributes": {
                  "email": "jovita@hettinger.info"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

### Create a new user session [POST /api/v1/users/session]


+ Request renders auth tokens
**POST**&nbsp;&nbsp;`/api/v1/users/session`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            email=peggie.kassulke%40schneider.biz&password=password

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "2019-07-25 06:44:32 UTC",
                "type": "tokens",
                "attributes": {
                  "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjQwNDA2NzIsInVzZXJfaWQiOnsiJG9pZCI6IjVkMzk0ZmQwOGQzNjY5NWFlODgyMWJiNyJ9LCJ1aWQiOiI3MTQxYmFmMy1kMDExLTQ1ZWUtYWY4OS02YTQyYzAzOWI5NDYiLCJleHAiOjE1NjQwNDA2NzJ9.8kh0_ztJcaVqPZNBpPXAHAqDc5xKn0Q3fdmPmT2DfxE"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

### Create a new user video [POST /api/v1/users/video]


+ Request renders video data
**POST**&nbsp;&nbsp;`/api/v1/users/video`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            {"name":"test video","source_file":{"tempfile":"#\u003cFile:0x000055ec0e9e3c20\u003e","original_filename":"short_video.mp4","content_type":"video/mp4","headers":"Content-Disposition: form-data; name=\"source_file\"; filename=\"short_video.mp4\"\r\nContent-Type: video/mp4\r\nContent-Length: 27106741\r\n"},"trimming_start_time":"1","duration":"2"}

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "5d394fd08d36695ae8821bb9",
                "type": "videos",
                "attributes": {
                  "name": "test video"
                },
                "relationships": {
                  "user": {
                    "meta": {
                      "included": false
                    }
                  },
                  "request": {
                    "meta": {
                      "included": false
                    }
                  }
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }
