#!/bin/bash
psql -c 'CREATE DATABASE leadme_topicos WITH TEMPLATE template1'
psql -d leadme_topicos -f ./create_tables.sql
