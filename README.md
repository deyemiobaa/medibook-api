![](https://img.shields.io/badge/Microverse-blueviolet)
# medibook-api
Backend API for the Medi-Book health appointment platform

This app uses a Rails back-end as an API to send doctor details and appointment data to the frontend for scheduling appointments

## Table of Contents
* [Getting started](#getting-started)
* [Setup](#setup)
* [Usage](#usage)
* [Testing](#testing)
* [Authors](#authors)

## Link to Kanban
- [Kanban Board Link](https://github.com/orgs/medi-book/projects/1)


## Link to REACT FRONTEND

[REACT FRONTEND](https://github.com/medi-book/medibook-ui)

## Built With

- Ruby
- Ruby on Rails
- PostgreSQL
- Heroku
- Rspec
- Rswag


## Getting Started

To get a local copy up and running follow these simple example steps.
In your terminal, navigate to your current directory and run this code

`git clone https://github.com/medi-book/medibook-api`

Then run:

`cd medibook-api`

Open in your preferred text editor. Run `code .` to open VScode.

## Setup

This guide assumes you have already installed the necessary dependencies to use a postgreSQL database and Ruby on Rails.

- Add all ruby gems to your Gemfile (`bundle install`)
- Create a .env file in the root of your project and add the following lines: `PASSWORD_DB = your_password`
- Run `rails db:create db:migrate db:seed` to create the database and run migrations.

## Usage

- Run `rails s` to start the server.
- To create a new user, send a POST request to `http://localhost:3000/signup` with the following body:

```json
{
  "user": {
    "username": "John Doe",
    "password": "password",
    "password_confirmation": "password"
  }
}
```
- To create an admin user use the rails console and run:

```ruby
User.create(username: "admin", password: "password", password_confirmation: "password", role: "admin")
```

- To login, send a POST request to `http://localhost:3000/authenticate` with the following body:
```json
{
  "user": {
    "username": "John Doe",
    "password": "password"
  }
}
```
Response: The token would be used in the Authorization header for all subsequent requests.

```json
{
  "username": "John Doe",
  "token" : "token",
  "role": "regular"
}
```
- To create a new appointment, send a POST request to `http://localhost:3000/appointments` with the following body:
```json
{
  "appointment": {
    "doctor_id": 1,
    "date": "2023-01-01 00:00:00",
    "duration": 5,
  }
}
```
headers: 
```json
{
  "Authorization": "token"
}
```
Response:
```json
{
  "message": "appointment added", 
  "status": "created",
}
```

- To get all appointments, send a GET request to `http://localhost:3000/appointments` with the following headers:
```json
{
  "Authorization": "token"
}
```
Response:
```json
{
  [
    {
      "id": 1,
      "name": "John Doe",
      "total": "000",
      "duration": 5,
      "date": "2023-01-01 00:00:00",
    },
    {
      "id": 2,
      "name": "John Doe",
      "total": "000",
      "duration": 5,
      "date": "2023-01-01 00:00:00",
    }
  ]
}
```

- To cancel an appointment, send a DELETE request to `http://localhost:3000/appointments/1` with the following headers:
```json
{
  "Authorization": "token"
}
```
Response:
```json
{
  "message": "appointment deleted",
  "status": "ok"
}
```

- To get all doctors, send a GET request to `http://localhost:3000/doctors` with the following headers:
```json
{
  "Authorization": "token"
}
```
Response:
```json
{
  [
    {
      "id": 1,
      "name": "John Doe",
      "specialization": "specialty",
      "hourly_rate": "$$",
      "picture": "image.png",
      "created_at": "created_at",
      "updated_at": "updated_at"
    },
    {
      "id": 2,
      "name": "John Doe",
      "specialization": "specialty",
      "hourly_rate": "$$",
      "picture": "image.png",
      "created_at": "created_at",
      "updated_at": "updated_at"
    }
  ]
}
```
## Testing
### Run Test for models and api requests:

Run migrations for test database: `rails db:migrate RAILS_ENV=test`

`rspec spec/models`
`rspec spec/requests`


### Link to documentation

[docs link](https://api-medibook-app.herokuapp.com/api-docs)

## Authors

👤 **Sodiq Aderibigbe**

- GitHub: [@deyemiobaa](https://github.com/deyemiobaa)
- Twitter: [@deyemiobaa](https://twitter.com/deyemiobaa)
- LinkedIn: [Sodiq Aderibigbe](https://linkedin.com/in/sodiqa)

👤 **Anicet Murhula**

- GitHub: [@AnicetFantomas](https://github.com/AnicetFantomas)
- Twitter: [@FantomasAnicet](https://twitter.com/FantomasAnicet)
- LinkedIn: [Anicet Murhula](https://www.linkedin.com/in/anicet-murhula/)

👤 **Ifza Rasool**
- GitHub: [@ifzarasool](https://github.com/IfzaRasool
- Twitter: [@ifzaarain](https://twitter.com/ifzaarain)
- LinkedIn: [@ifza-arain]https://www.linkedin.com/in/ifza-arain/

👤 **Oybek Kayumov**

- GitHub: [@OybekKayumov](https://github.com/OybekKayumov)
- Twitter: [@KayumovOybek](https://twitter.com/KayumovOybek)
- LinkedIn: [Oybek Kayumov](https://www.linkedin.com/in/oybek-kayumov/)

👤 **Saningo Lekalantula**

- GitHub: [@sainingo](https://github.com/sainingo)
- Twitter: [@sainingo](https://www.linkedin.com/in/sainingo/)
- LinkedIn: [sainingo](https://twitter.com/saningoInn)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/medi-book/medibook-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](LICENSE) licensed.
