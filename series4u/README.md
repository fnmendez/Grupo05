# Conexión local

##### Para Ubuntu 16.04 con rails 5.1.0

#### 1. Instalar base de datos PostgreSQL

`$ sudo apt-get update`

`$ sudo apt-get install postgresql postgresql-contrib`

#### 2. Conectarse a la consola psql con usuario por defecto llamado postgres y luego desconectarse

`$ sudo -u postgres psql`

`postgres=# \q`

#### 3. Crear rol (usuario) psql llamado series4u con contraseña series4udb

``$ createuser -P -E -d -s series4u`

```
Enter password for new role: series4udb
Enter it again: series4udb
```

#### 4. Abrir consola en la carpeta series4u del repositorio

#### 5. Eliminar Gemfile.lock

`$ sudo rm Gemfile.lock`

#### 6. Instalar gemas

`$ bundle install`

#### 7. Abrir la conexión local

`$ rails server`
