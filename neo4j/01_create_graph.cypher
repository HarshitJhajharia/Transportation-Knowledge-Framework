CREATE CONSTRAINT junction_name_unique IF NOT EXISTS
FOR (j:Junction)
REQUIRE j.name IS UNIQUE;

UNWIND ["A", "B", "C", "D", "E", "F", "G"] AS name
MERGE (j:Junction {name: name})
RETURN j;

UNWIND [
    {from:"A", to:"B", distance:4},
    {from:"A", to:"C", distance:3},
    {from:"B", to:"D", distance:5},
    {from:"B", to:"E", distance:2},
    {from:"C", to:"E", distance:4},
    {from:"C", to:"G", distance:6},
    {from:"D", to:"F", distance:3},
    {from:"F", to:"G", distance:2}
] AS road

MATCH (a:Junction {name:road.from})
MATCH (b:Junction {name:road.to})

MERGE (a)-[r:ROAD]->(b)

SET r.distance = road.distance,
    r.status = "Open"

RETURN a, r, b;

MATCH (a:Junction)-[r:ROAD]->(b:Junction)
RETURN a, r, b;

MATCH (j:Junction)
RETURN count(j) AS TotalJunctions;

MATCH ()-[r:ROAD]->()
RETURN count(r) AS TotalRoads;

MATCH (c:Junction {name:"C"})-[r:ROAD]-(g:Junction {name:"G"})

SET r.status = "Blocked",
    r.incident = "Accident"

MERGE (i:Incident {id:"Accident_1"})
SET i.type = "Accident",
    i.description = "Accident on road C-G"

RETURN c, r, g, i;

MATCH (a:Junction)-[r:ROAD]-(b:Junction)
WHERE r.status = "Blocked"
RETURN a.name AS FromJunction,
       b.name AS ToJunction,
       r.incident AS Incident,
       r.status AS Status;

