#!/bin/bash

# connect to postgres in interactive mode
# psql -U poc -d moviesdb -h 127.0.0.1 -p 5433 -W

# PRIMEIRO RODAR ISSO
# sudo -i -u postgres

# SEGUNDO RODAR ISSO
# pushd /home/lucas/Desktop/Poc01-OrganizadorFilmes/scripts/

# RODAR ./create-dabase.sh
psql -U poc -d postgres -h 127.0.0.1 -p 5433 -W \
    -c "CREATE DATABASE moviesdb"

# run script to create tables 
psql -U poc -d moviesdb -h 127.0.0.1 -p 5433 -W \
    -f ./database.sql

# POR ULTIMO RODAR ISSO
# popd