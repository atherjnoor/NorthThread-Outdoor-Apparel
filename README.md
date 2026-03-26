# NorthThread Outdoor Apparel

Rails 8.1 e-commerce storefront for Winnipeg winter apparel.

## Requirements

* Ruby 3.3.x
* Rails 8.1.x
* PostgreSQL 15+
* Node (for importmap asset pipeline)
* Bundler

## Setup

```bash
bundle install
cp config/database.yml.example config/database.yml  # if needed
bin/rails db:create db:migrate db:seed
```

## Dev server

```bash
bin/rails server
```

Visit `http://localhost:3000`

## Authentication

* Customer model: `User` (Devise)
* Admin model: `AdminUser` (Devise + ActiveAdmin)
* Admin dashboard: `http://localhost:3000/admin`
* Admin credentials seeded: `admin@norththread.ca` / `password123`

## Features

* Product catalog with category filter, keyword search, pagination
* Product detail page with image, price, add-to-cart flow
* Session-based cart, quantity updates, remove item
* Page content via `pages` table (`about`, `contact`)
* ActiveAdmin product/category/page management
* Province tax setup and order snapshots

## Apply recommended git flow

```bash
git init
git checkout -b feature/admin-setup
# one commit
git checkout -b feature/product-display
# one commit
git checkout -b feature/shopping-cart
# one commit
```

## Deployment

* Docker/`kamal` stubs are included
* `aws-sdk-s3` configured for future Active Storage S3 usage

---

## Notes

All front-end uses SCSS + Bootstrap. No inline style tags in core templates.

