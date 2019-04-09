# geo
Geospatial kdb+

Using [geo.zip](https://github.com/KxSystems/kdb/blob/master/e/geo.zip) from Kx as a starting point.

Expanding on the [geospatial](https://code.kx.com/q/cookbook/geospatial/) example.

Main changes:

* Updated for latest s2geometry [v0.9.0](https://github.com/google/s2geometry/releases/tag/v0.9.0)
* Move to openstreetmap.org from mapbox.com
* Updated to leaflet 1.4

## Instructions

This is a demo showing basics of geospatial indexing with kdb+.

1 million points are randomly generated around central London and the included html allows querying the data set.

to run:

```bash
./build.sh
./run.sh
```

This uses the google [s2 library](https://github.com/google/s2geometry), as a q shared object.

When loading data, the function `ids[lats;lons]` is used to map `(lat;lon)` coordinates on a sphere to one-dimensional cell ids. These are stored as 32-bit integers with the `p#` attribute applied.

The demonstrated lookup, `lu` in `geo.q` retrieves points contained in the given spherical rectangle.
lu takes the rectangle coordinates and a time filter, calculates the coverage (ranges of cells covering the rectangle) with `rect[(lat0;lat1);(lon0;lon1)]`.
The cell id ranges are looked up with `pl`. The result is then filtered to remove points outside of the rectangle (since the covering might exceed the rectangle dimensions) and to constrain by time.

The simple html interface is implemented with openstreetmap and leaflet. In the top row of the interface are five text fields: 
1. current click coordinates
1. number of returned results
1. min date
1. max date
1. lookup rectangle size in degrees

(the last three are editable filters).

On mouse click, its lat lon coordinates are sent to the server together with the filters over a websocket connection, and the points in the response are plotted on the map. In addition to coordinates, the server returns a trk column, which the client interprets as point colour. This is useful, for example, for plotting GPS tracks.
