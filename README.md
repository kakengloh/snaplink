# Snaplink

Snaplink is an open-source link shortener that allows users to shorten long URLs and create unique short links for easy sharing.

## Table of Contents

- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
- [Deployment](#deployment)

## Project Structure

Snaplink is composed of two separate modules, each fulfilling distinct roles in the system.

The API module is built using Ruby on Rails and provides a RESTful interface to handle the core business logic of the application, including generating unique short links and interacting with the PostgreSQL database.

The Web module is a Next.js application that provides a user-friendly interface for users to interact with. It communicates with the API module to create short links and display them to users.

## Installation

Snaplink is dockerized and requires Docker and docker-compose to be installed on your machine. To get started, follow the instructions below:

1. Clone the repository:

   ```bash
   git clone https://github.com/kakengloh/snaplink.git
   ```

2. Build the Docker images:

   ```bash
   docker-compose build
   ```

3. Create database, run migrations and seeds:

   ```bash
   docker-compose run --rm api rails db:create db:migrate db:seed
   ```

4. Start the API and Web servers:
   ```bash
   docker-compose up
   ```

API should be running on http://localhost:3000 and Web should be running on http://localhost:8000.

## Usage

Snaplink provides a simple and user-friendly interface for shortening URLs. To shorten a URL, follow the steps below:

1. Visit the web app at http://localhost:8000
2. Enter the long URL you wish to shorten in the input field.
3. Click the "Shorten" button to generate a unique short link.
4. Copy the generated short link and use it for sharing.

## API Reference

Snaplink's API provides two endpoints:

1. `POST /v1/links` - This endpoint creates short links. It accepts a long URL as a parameter and returns a unique short link.

2. `GET /:slug` - This endpoint tracks the link visit and redirects users to the target URL associated with the provided slug.

## Deployment

Snaplink is deployed separately to ensure optimal performance and scalability.

The API module is deployed to [Render](https://render.com) and can be accessed via the public URL: https://snaplink.onrender.com.

The Web module is deployed to [Vercel](https://vercel.com) and can be accessed via the public URL: https://snaplink.vercel.app.

Both environments are configured to automatically build and deploy the latest changes from the main branch of the Snaplink repository on GitHub. This ensures that the public-facing applications are always up-to-date with the latest features and bug fixes.
