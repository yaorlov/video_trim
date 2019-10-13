

# Group Registrations
Users group

## Registrations [api/v1/users/registration]


### Create a new user [POST /api/v1/users/registration]


+ Request renders created user
**POST**&nbsp;&nbsp;`/api/v1/users/registration`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            email=lavon_rowe%40zieme.name&password=%211password&password_confirmation=%211password

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "5d39f6108d366978db32e7c8",
                "type": "users",
                "attributes": {
                  "email": "lavon_rowe@zieme.name"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

# Group Requests
Requests group

## Requests [api/v1/users/requests]


### Returns a list of user's requests [GET /api/v1/users/requests]


+ Request renders all requests
**GET**&nbsp;&nbsp;`/api/v1/users/requests`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjQwODMyMzIsInVzZXJfaWQiOnsiJG9pZCI6IjVkMzlmNjEwOGQzNjY5NzhkYjMyZTdjOSJ9LCJ1aWQiOiIxMmUzNDJkZS01Y2JjLTQwZDYtOGJkMy04ZWFjODFmZGZkYzIiLCJleHAiOjE1NjQwODMyMzJ9.7UpvZE0IKG8Ysmm_tHGw-w9pmjwflUczImXXYoDeeug

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": [
                {
                  "id": "5d39f6108d366978db32e7ca",
                  "type": "requests",
                  "attributes": {
                    "status": "scheduled"
                  },
                  "relationships": {
                    "user": {
                      "meta": {
                        "included": false
                      }
                    },
                    "video": {
                      "meta": {
                        "included": false
                      }
                    }
                  }
                },
                {
                  "id": "5d39f6108d366978db32e7cd",
                  "type": "requests",
                  "attributes": {
                    "status": "scheduled"
                  },
                  "relationships": {
                    "user": {
                      "meta": {
                        "included": false
                      }
                    },
                    "video": {
                      "meta": {
                        "included": false
                      }
                    }
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request renders error data
**GET**&nbsp;&nbsp;`/api/v1/users/requests`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 401

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized",
                  "source": {
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request renders error data
**GET**&nbsp;&nbsp;`/api/v1/users/requests`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: token

+ Response 401

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized",
                  "source": {
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

### Returns restarted request data [POST /api/v1/users/requests/{id}/restart]

+ Parameters
    + id: `5d39f6118d366978db32e7e5` (string, required)

+ Request renders request data
**POST**&nbsp;&nbsp;`/api/v1/users/requests/5d39f6118d366978db32e7e5/restart`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjQwODMyMzMsInVzZXJfaWQiOnsiJG9pZCI6IjVkMzlmNjEwOGQzNjY5NzhkYjMyZTdkZSJ9LCJ1aWQiOiJkYTFiYTFkNy0zYjM3LTQ3NGQtYTRmNC03N2I5ZjY2MDgxODAiLCJleHAiOjE1NjQwODMyMzN9.OG-ah5AM9SyjlY9mkBNtk3NAjhLJ3k25O85lCs4iI-g
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "5d39f6118d366978db32e7e5",
                "type": "requests",
                "attributes": {
                  "status": "scheduled"
                },
                "relationships": {
                  "user": {
                    "meta": {
                      "included": false
                    }
                  },
                  "video": {
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

+ Request renders error data
**POST**&nbsp;&nbsp;`/api/v1/users/requests/5d39f6118d366978db32e7ef/restart`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized",
                  "source": {
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request renders error data
**POST**&nbsp;&nbsp;`/api/v1/users/requests/5d39f6118d366978db32e7f9/restart`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: token
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized",
                  "source": {
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request renders error data
**POST**&nbsp;&nbsp;`/api/v1/users/requests/5d39f6128d366978db32e803/restart`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjQwODMyMzQsInVzZXJfaWQiOnsiJG9pZCI6IjVkMzlmNjExOGQzNjY5NzhkYjMyZTdmYyJ9LCJ1aWQiOiI2MWEwMDU5OS05YjcyLTQ4Y2ItOGMxYy0zZTdmNGE2NTU0ODkiLCJleHAiOjE1NjQwODMyMzR9.tpN2F8Cr9PC6Nt0YDzz9zzPb4YGmXCudDb9pNrWoIrU
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: text/html

# Group Sessions
Sessions group

## Sessions [api/v1/users/session]


### Create a new user session [POST /api/v1/users/session]


+ Request renders auth tokens
**POST**&nbsp;&nbsp;`/api/v1/users/session`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            email=andrea.cartwright%40harber.com&password=password

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "2019-07-25 18:33:54 UTC",
                "type": "tokens",
                "attributes": {
                  "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjQwODMyMzQsInVzZXJfaWQiOnsiJG9pZCI6IjVkMzlmNjEyOGQzNjY5NzhkYjMyZTgwNCJ9LCJ1aWQiOiI3OWU4ZDAzNC1kZmM0LTRkZGMtYjQzMS05NWM4ZWNiOWU3OTMiLCJleHAiOjE1NjQwODMyMzR9.ou7skmu1n_nRtMojlpKF-AjeXxAuu323WrpKlYPQ9QA"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

# Group Videos
Videos group

## Videos [api/v1/users/videos]


### Create a new user video [POST /api/v1/users/videos]


+ Request renders video data
**POST**&nbsp;&nbsp;`/api/v1/users/videos`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjQwODMyMzQsInVzZXJfaWQiOnsiJG9pZCI6IjVkMzlmNjEyOGQzNjY5NzhkYjMyZTgwNSJ9LCJ1aWQiOiJiZjQ0YzhkMC1jYWIwLTRlOGEtODE2Yy1kNGMxNzQ5MzEwOTUiLCJleHAiOjE1NjQwODMyMzR9.jDcXigfYfkugXM3c6Tid0Py_y9IwnehAETPB8fJaay4
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            {"name":"test video","source_file":{"tempfile":"#\u003cFile:0x000055ad58f38648\u003e","original_filename":"short_video.mp4","content_type":"video/mp4","headers":"Content-Disposition: form-data; name=\"source_file\"; filename=\"short_video.mp4\"\r\nContent-Type: video/mp4\r\nContent-Length: 27106741\r\n"},"trimming_start_time":"1","duration":"2"}

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "5d39f6128d366978db32e806",
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

+ Request renders error data
**POST**&nbsp;&nbsp;`/api/v1/users/videos`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized",
                  "source": {
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request renders error data
**POST**&nbsp;&nbsp;`/api/v1/users/videos`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: token
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized",
                  "source": {
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

### Returns a list of user's trimmed videos [GET /api/v1/users/videos]


+ Request renders all videos
**GET**&nbsp;&nbsp;`/api/v1/users/videos`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjQwODMyMzQsInVzZXJfaWQiOnsiJG9pZCI6IjVkMzlmNjEyOGQzNjY5NzhkYjMyZTgwOCJ9LCJ1aWQiOiIzMmM5ZWNlOS0yMTlkLTQ1ZTgtYjQ5NC05MTYzZTY2NGVjMjEiLCJleHAiOjE1NjQwODMyMzR9.p03kk29wNjBm0cu2WSto5ImemcomrU_az5xTv7R9b2k

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": [
                {
                  "id": "5d39f6128d366978db32e80a",
                  "type": "videos",
                  "attributes": {
                    "duration": "00:00:03",
                    "url": "memory://afe467ef8fa3f3622af823a33047c131.mp4"
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
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request renders error data
**GET**&nbsp;&nbsp;`/api/v1/users/videos`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 401

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized",
                  "source": {
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request renders error data
**GET**&nbsp;&nbsp;`/api/v1/users/videos`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: token

+ Response 401

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "Not authorized",
                  "source": {
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }
