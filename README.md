# Rails API – Articles & Comments

API backend built with Ruby on Rails that provides endpoints for listing and creating articles, comments, and retrieving basic engagement information.

The API exposes two main resources:
- Articles: list and creation of articles.
- Comments: list, creation, and retrieval of individual comments.

## Requirements

- Ruby 3.4.7
- Rails 8.1.2
- PostgreSQL

## Installation

Install the dependencies
```
bundle install
```

Set up the database:
```
rails db:setup
```

Run the server
```
rails s
```

The API will be available at http://localhost:3000

## Running the tests

```
bundle exec rspec
```

## Running the Linter - RuboCop

```
bundle exec rubocop
```

## API Endpoints

### GET /api/articles

Response example:
```
[{
  "title": "Title",
  "authorName": "John Doe",
  "body": "Body",
  "createdAt": "2026-02-15T10:32:45Z",
  "commentsCount": 10
}]
```

### GET /api/articles/:id/comments

Response example:
```
[{
  "authorName": "John Doe",
  "body": "Body",
  "createdAt": "2026-02-15T10:32:45Z"
}]
```

### GET /api/comments

Response example:
```
[{
  "authorName": "John Doe",
  "body": "Body",
  "createdAt": "2026-02-15T10:32:45Z"
}]
```

### GET /api/comments/:id

Response example:
```
{
  "authorName": "John Doe",
  "body": "Body",
  "createdAt": "2026-02-15T10:32:45Z"
}
```

### POST /api/articles

Request body example:
```
{
  "title": "Title",
  "body": "Body"
  "author_name": "John Doe"
}
```

Response example:
```
{
  "title": "Title",
  "authorName": "John Doe",
  "body": "Body",
  "createdAt": "2026-02-15T10:32:45Z",
  "commentsCount": 10
}
```

### POST /api/comments

Request body example:
```
{
  "author_name": "John Doe",
  "body": "Body",
  "article_id": "1"
}
```

Response example:
```
{
  "authorName": "John Doe",
  "body": "Body",
  "createdAt": "2026-02-15T10:32:45Z"
}
```

## Additional details

The application exposes a JSON based API. 
Endpoints that return multiple items include a meta object containing pagination details like the example below:

```
"meta": {
  "total": 7,
  "page": 1,
  "per_page": 10,
  "total_pages": 1
}
```

## Improvements

- API Versioning
- Update and delete endpoints
- Unit tests for concerns
- Improve validations
- User accounts
- API Authentication with JWT
- Redis for production caching
