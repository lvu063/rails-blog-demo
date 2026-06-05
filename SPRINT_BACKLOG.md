# docs/agile/SPRINT_BACKLOG.md
# Rails Blog Demo — Agile Sprint Documentation
#
# Demonstrates: Scrum methodology, user stories, sprint planning,
# acceptance criteria, and definition of done.
# Closes gap: Agile / JIRA / Confluence, project management basics.

---

## Project: Rails Blog Demo
**Sprint:** 1 of 2  |  **Duration:** 2 weeks  |  **Team size:** 1 (solo)
**Sprint Goal:** Deliver a working CRUD blog application with categories and comments.

---

## Product Backlog (prioritised)

| ID | User Story | Priority | Story Points | Status |
|---|---|---|---|---|
| US-001 | As a reader, I can view a list of all articles so I know what content is available | High | 2 | ✅ Done |
| US-002 | As a writer, I can create a new article with a title, body, and category so I can share content | High | 3 | ✅ Done |
| US-003 | As a writer, I can edit an existing article so I can correct mistakes | High | 2 | ✅ Done |
| US-004 | As a writer, I can delete an article so I can remove outdated content | High | 1 | ✅ Done |
| US-005 | As a reader, I can filter articles by category so I can find relevant content | Medium | 3 | ✅ Done |
| US-006 | As a reader, I can add a comment to an article so I can engage with the content | Medium | 3 | ✅ Done |
| US-007 | As a writer, I can delete inappropriate comments so I can maintain quality | Medium | 1 | ✅ Done |
| US-008 | As a developer, I want automated tests so regressions are caught before deployment | High | 5 | ✅ Done |
| US-009 | As a developer, I want a CI/CD pipeline so every push is validated automatically | High | 3 | ✅ Done |

**Total story points committed:** 23  |  **Velocity achieved:** 23 (100%)

---

## Sprint 1 — User Story Detail

### US-001: View article list
**As a** reader  
**I want** to see a list of all published articles  
**So that** I can browse available content and decide what to read

**Acceptance Criteria:**
- [ ] Articles display title, category, and creation date
- [ ] Articles are sorted newest first
- [ ] Empty state shows a helpful message when no articles exist
- [ ] Category filter persists across page navigation

**Definition of Done:**
- Code reviewed and merged to main
- Unit test written and passing
- Feature accessible via `/articles` route
- No Brakeman security warnings introduced

---

### US-002: Create article
**As a** writer  
**I want** to create a new article with a title, body, and category  
**So that** I can publish content for readers

**Acceptance Criteria:**
- [ ] Form validates title (min 3 chars), body (min 10 chars), and category (from allowed list)
- [ ] Successful creation redirects to article show page with success flash
- [ ] Invalid submission re-renders form with error messages
- [ ] Category must be one of: Technology, Finance, Economics, Policy, Other

**Definition of Done:**
- Strong parameters implemented (no mass assignment vulnerability)
- Model-level validations tested
- Controller test covers happy path and sad path
- No N+1 queries introduced

---

### US-005: Filter by category
**As a** reader  
**I want** to filter articles by category  
**So that** I can find content relevant to my interests

**Acceptance Criteria:**
- [ ] Filter dropdown appears on index page
- [ ] Selecting a category shows only articles in that category
- [ ] Selecting "All" shows all articles
- [ ] Filter works via URL parameter (`?category=Finance`) for shareability

**Definition of Done:**
- Scope defined on model (`by_category`)
- URL parameter preserved on pagination
- Empty state handled per category

---

## Sprint 2 — Planned (not yet implemented)

| ID | User Story | Priority | Story Points |
|---|---|---|---|
| US-010 | As a writer, I can tag articles with multiple tags | Medium | 5 |
| US-011 | As a reader, I can search articles by keyword | Medium | 5 |
| US-012 | As a developer, deploy to AWS EC2 via CI/CD | High | 8 |

---

## Retrospective — Sprint 1

**What went well:**
- Rails convention-over-configuration made CRUD fast to implement
- TDD approach caught 2 bugs before they reached manual testing
- GitHub Actions CI runs in < 3 minutes — fast feedback loop

**What to improve:**
- Add integration tests (currently unit tests only)
- Set up staging environment before Sprint 2 AWS deployment

**Action items for Sprint 2:**
- [ ] Add request specs for controller actions
- [ ] Configure environment variables via Rails credentials
- [ ] Write deployment runbook before EC2 deploy
