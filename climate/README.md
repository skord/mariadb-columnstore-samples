# NOAA Global Historical Climatology Network

Global Historical Climatology Network is a dataset from NOAA that contains daily observations over global land areas. It contains station-based measurements from land-based stations worldwide, about two thirds of which are for precipitation measurement only. Other meteorological elements include, but are not limited to, daily maximum and minimum temperature, temperature at the time of observation, snowfall and snow depth. It is a composite of climate records from numerous sources that were merged together and subjected to a common suite of quality assurance reviews. Some data are more than 175 years old. 

This script imports data from 1763 to 2017. 

## Creating and Loading the Database
The following script will create (and drop if it already exists) the *climate* database:
```sh
$ ./create_climate_db.sh
```

This includes the following 3 tables:
- **observations** : Weather Observations
- **stations**     : Dimension table for stations
- **inventories    : Dimension table for station inventories

To import the data: 
```sh
$ ./import_climate_data.sh
```

This load the stations and inventories tables, then fetch each year's observation data seperately and import it into columnstore.

Both scripts assume a root install of ColumnStore exists on the host but can be run as a regular user. 
