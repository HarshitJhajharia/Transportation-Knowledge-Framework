// PHASE 2: TRANSPORTATION KNOWLEDGE GRAPH
// COMPETENCY QUERIES


// Query 1: Which roads are blocked by incidents?

MATCH (i:Incident)-[:BLOCKS]->(r:Road)
RETURN i.id AS Incident,
       r.id AS BlockedRoad;


// Query 2: Which incidents cause congestion?

MATCH (i:Incident)-[:CAUSES]->(c:Congestion)
RETURN i.id AS Incident,
       c.id AS Congestion;


// Query 3: Which routes are influenced by congestion?

MATCH (c:Congestion)-[:INFLUENCES]->(r:Route)
RETURN c.id AS Congestion,
       r.id AS Route;


// Query 4: Which signals prioritize emergency vehicles?

MATCH (s:Signal)-[:PRIORITIZES]->(v:EmergencyVehicle)
RETURN s.id AS Signal,
       v.id AS EmergencyVehicle;


// Query 5: Which junctions are connected to Road C-G?

MATCH (r:Road {id:"Road_C_G"})-[:CONNECTED_TO]->(j:Junction)
RETURN r.id AS Road,
       j.id AS Junction
ORDER BY Junction;


// Query 6: Which roads have a speed limit greater than 50 km/h?

MATCH (r:Road)
WHERE r.speedLimit > 50
RETURN r.id AS Road,
       r.speedLimit AS SpeedLimit
ORDER BY Road;


// Query 7: Where is Ambulance_1 located?

MATCH (v:Vehicle {id:"Ambulance_1"})-[:LOCATED_AT]->(j:Junction)
RETURN v.id AS Vehicle,
       j.id AS Location;


// Query 8: What is the complete incident-to-route explanation chain?

MATCH (i:Incident)-[:BLOCKS]->(road:Road),
      (i)-[:CAUSES]->(c:Congestion)-[:INFLUENCES]->(r:Route)

RETURN i.id AS Incident,
       road.id AS BlockedRoad,
       c.id AS Congestion,
       r.id AS AffectedRoute;