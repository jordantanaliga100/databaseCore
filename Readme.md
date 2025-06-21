# 🐳 Docker Setup: PostgreSQL, MySQL, MongoDB + GUI Tools

This project sets up the following containers:

- **PostgreSQL 16**
- **MySQL 8**
- **MongoDB**
- **Adminer** (web UI for PostgreSQL & MySQL)
- **Mongo Express** (web UI for MongoDB)

---

## 🚀 Getting Started

### 1. Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/)

---

### 2. Run the stack

```bash

### quick run
docker-compose up -d
docker-compose down -v
  OR
### for conventions
docker-compose -p db-dev up -d
docker-compose -p db-dev down -v

```
