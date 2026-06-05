# Rails Blog Demo

> A full CRUD blog application built with Ruby on Rails 7 — demonstrating MVC architecture, ActiveRecord ORM, RESTful routing, model validations, nested resources, and automated CI/CD via GitHub Actions.

---

**Live demo:** [rails-demo.lovable.app](https://rails-demo.lovable.app/)

---

## Features

- Full CRUD for articles (create, read, update, delete)
- Categories: Technology, Finance, Economics, Policy, Other
- Filter articles by category via URL parameter (`?category=Finance`)
- Nested comments on articles (create and delete)
- Model validations with descriptive error messages
- Flash messages for user feedback
- 10 automated model tests
- Three-stage CI/CD pipeline via GitHub Actions

---

## Tech stack

| Layer | Technology |
|---|---|
| Framework | Ruby on Rails 7.1 |
| Language | Ruby 3.2 |
| Database | SQLite (development) |
| Frontend | ERB templates · Turbo · Stimulus |
| Testing | Rails MiniTest |
| CI/CD | GitHub Actions |
| Container | Docker |

---

## Quick start

```bash
bundle install
bin/rails db:migrate
bin/rails server
```

Open: http://localhost:3000

**With Docker:**
```bash
docker build -t rails-blog-demo .
docker run -p 3000:3000 rails-blog-demo
```

---

## Run tests

```bash
bin/rails test
```

10 model tests covering validations, associations, scopes, and edge cases.

---

## CI/CD Pipeline

Three-stage GitHub Actions pipeline on every push to `main`:

```
push to main
    │
    ├── 1. Test     → MiniTest suite + database setup
    ├── 2. Security → Brakeman static analysis scan
    └── 3. Docker   → build image + smoke test container
```

See `.github/workflows/ci.yml`.

---

## Agile documentation

Sprint backlog, user stories, acceptance criteria, and retrospective in `docs/agile/SPRINT_BACKLOG.md`.

9 user stories · 2 sprints · 63 story points · 100% velocity

---

## Rails concepts demonstrated

| Concept | Where |
|---|---|
| MVC architecture | `app/controllers/` · `app/models/` · `app/views/` |
| ActiveRecord ORM | `Article` and `Comment` models with associations |
| Strong parameters | `article_params` — prevents mass assignment |
| `before_action` callbacks | `set_article` — DRY resource loading |
| Nested resources | `resources :articles do resources :comments` |
| Model validations | `validates :title` · `validates :category, inclusion:` |
| Named scopes | `scope :recent` · `scope :by_category` |
| Flash messages | `notice:` on redirect |
| Database migrations | `db/migrate/` |
| Cascade delete | `has_many :comments, dependent: :destroy` |
