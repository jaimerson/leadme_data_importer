### Setup

Create the database:

```bash
psql -c 'CREATE DATABASE leadme_topicos WITH TEMPLATE template1'
```

Create the tables:

```bash
psql -d leadme_topicos -f ./create_tables.sql
```

Populate the tables:

```bash
./bin/populate.sh
```
