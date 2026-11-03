#Query1
MATCH (c:Congestion)-[:LOCATED_AT]->(r:Road)
WHERE c.source = "SUMO_Simulation"

RETURN r.id AS Road,
       r.speedLimit AS SpeedLimit,
       c.avgSpeed AS AverageSpeed,
       c.density AS Density,
       c.vehicleCount AS VehicleCount,
       c.begin AS StartTime,
       c.end AS EndTime,
       "Average speed below 50% of speed limit" AS Explanation

ORDER BY AverageSpeed
LIMIT 10;

#Query 2
MATCH (i:Incident)-[:BLOCKS]->(r:Road)
MATCH (c:Congestion)-[:LOCATED_AT]->(r)

WHERE i.source = "Simulated"
  AND c.source = "SUMO_Simulation"

RETURN r.id AS Road,
       i.incidentType AS Incident,
       i.severity AS Severity,
       c.avgSpeed AS AverageSpeed,
       c.congestionLevel AS CongestionLevel,
       "Simulated incident blocks this road; SUMO independently recorded low traffic speed." AS Explanation;

#Query3
MATCH (i:Incident)-[:BLOCKS]->(r:Road)

WHERE i.source = "Simulated"

RETURN i.id AS IncidentID,
       i.incidentType AS IncidentType,
       i.severity AS Severity,
       r.id AS BlockedRoad,
       r.status AS RoadStatus

ORDER BY Severity DESC;

#Query4
MATCH (c:Congestion)-[:LOCATED_AT]->(r:Road)

WHERE c.source = "SUMO_Simulation"
  AND r.speedLimit > 0

RETURN r.id AS Road,
       c.avgSpeed AS AverageSpeed,
       r.speedLimit AS SpeedLimit,
       round(100.0 * c.avgSpeed / r.speedLimit, 2) AS SpeedPercentage,
       c.density AS Density

ORDER BY SpeedPercentage ASC
LIMIT 10;

#Query5
MATCH (i:Incident)-[:BLOCKS]->(r:Road)
MATCH (r)-[:CONNECTED_TO]->(j:Junction)

WHERE i.source = "Simulated"

RETURN i.id AS Incident,
       r.id AS BlockedRoad,
       collect(DISTINCT j.id) AS ConnectedJunctions;

#Query6
MATCH (i:Incident)-[:BLOCKS]->(road:Road)
MATCH (i)-[:CAUSES]->(c:Congestion)
MATCH (c)-[:INFLUENCES]->(r:Route)

RETURN i.id AS Incident,
       road.id AS BlockedRoad,
       c.id AS Congestion,
       r.id AS AffectedRoute;