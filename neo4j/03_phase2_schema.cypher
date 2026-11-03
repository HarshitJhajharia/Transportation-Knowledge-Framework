// PHASE 2: TRANSPORTATION KNOWLEDGE GRAPH SCHEMA

// ========================================
// 1. UNIQUENESS CONSTRAINTS
// ========================================

// Road
CREATE CONSTRAINT road_id_unique IF NOT EXISTS
FOR (r:Road)
REQUIRE r.id IS UNIQUE;

// Junction
CREATE CONSTRAINT junction_id_unique IF NOT EXISTS
FOR (j:Junction)
REQUIRE j.id IS UNIQUE;

// Vehicle
CREATE CONSTRAINT vehicle_id_unique IF NOT EXISTS
FOR (v:Vehicle)
REQUIRE v.id IS UNIQUE;

// Signal
CREATE CONSTRAINT signal_id_unique IF NOT EXISTS
FOR (s:Signal)
REQUIRE s.id IS UNIQUE;

// Route
CREATE CONSTRAINT route_id_unique IF NOT EXISTS
FOR (r:Route)
REQUIRE r.id IS UNIQUE;

// Congestion
CREATE CONSTRAINT congestion_id_unique IF NOT EXISTS
FOR (c:Congestion)
REQUIRE c.id IS UNIQUE;

// Incident
CREATE CONSTRAINT incident_id_unique IF NOT EXISTS
FOR (i:Incident)
REQUIRE i.id IS UNIQUE;

// ========================================
// 2. INDEXES
// ========================================

// Search roads by speed limit
CREATE INDEX road_speed_index IF NOT EXISTS
FOR (r:Road)
ON (r.speedLimit);

// Search incidents by severity
CREATE INDEX incident_severity_index IF NOT EXISTS
FOR (i:Incident)
ON (i.severity);

// Search congestion by level
CREATE INDEX congestion_level_index IF NOT EXISTS
FOR (c:Congestion)
ON (c.congestionLevel);