MATCH (j:Junction)
RETURN j.name AS Junction
ORDER BY Junction;

MATCH (a:Junction {name:"A"})-[:ROAD]-(b:Junction)
RETURN a.name AS Source,
       b.name AS Neighbor;

MATCH (a:Junction)-[r:ROAD]->(b:Junction)

RETURN a.name AS FromJunction,
       b.name AS ToJunction,
       r.distance AS Distance,
       r.status AS Status

ORDER BY FromJunction;

MATCH (a:Junction)-[r:ROAD]->(b:Junction)

WHERE r.status = "Blocked"

RETURN a.name AS FromJunction,
       b.name AS ToJunction,
       r.incident AS Incident;

MATCH (a:Junction)-[r:ROAD]->(b:Junction)

WHERE r.status = "Open"

RETURN a.name AS FromJunction,
       b.name AS ToJunction,
       r.distance AS Distance;

MATCH (a:Junction {name:"A"})
MATCH (f:Junction {name:"F"})

MATCH p = shortestPath((a)-[:ROAD*]-(f))

RETURN [n IN nodes(p) | n.name] AS Route,
       length(p) AS NumberOfRoads;

MATCH (a:Junction {name:"A"})
MATCH (f:Junction {name:"F"})

MATCH p = (a)-[:ROAD*1..6]-(f)

WHERE all(r IN relationships(p) WHERE r.status = "Open")
  AND all(n IN nodes(p) WHERE single(m IN nodes(p) WHERE m = n))

WITH p,
     reduce(total = 0, r IN relationships(p) |
            total + r.distance) AS totalDistance

RETURN [n IN nodes(p) | n.name] AS Route,
       totalDistance AS Distance

ORDER BY Distance
LIMIT 1;

