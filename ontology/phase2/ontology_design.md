# Transportation Knowledge Framework

## Phase 2: Transportation Ontology Design and Validation

**Version:** 0.2 (implemented Phase 2 model)  
**Status:** Implementation documented; final verification against exported OWL files recommended  
**Project:** Transportation Knowledge Framework

## 1. Ontology Overview

### 1.1 Purpose

The transportation ontology provides a shared vocabulary for roads, junctions, vehicles, signals, routes, congestion, and incidents. It supports semantic queries (SPARQL), a mapped Neo4j property graph (Cypher), and explicit rule-based explanations.

The aim is a small, modular educational framework rather than a production traffic-management or automatic causal-inference system.

### 1.2 Scope and artifacts

Phase 2 extended the earlier Phase 1 ontology and produced a validated OWL model, OWL/Turtle exports, sample individuals, Neo4j schema and import code, and competency queries.

Relevant files in this project are:

| File | Purpose |
| --- | --- |
| `ontology/transportation_phase2_validated.owl` | OWL model saved after Phase 2 reasoning |
| `ontology/phase2/transportation_v2.owl` | Versioned Phase 2 OWL export |
| `ontology/phase2/transportation_v2.ttl` | Turtle serialization |
| `ontology/queries/competency_queries.sparql` | SPARQL competency questions |
| `neo4j/03_phase2_schema.cypher` | Neo4j constraints and indexes |
| `neo4j/04_phase2_competency_queries.cypher` | Cypher competency questions |
| `notebooks/06_phase2_ontology.ipynb` | Ontology construction and reasoning |
| `notebooks/07_phase2_sparql.ipynb` | SPARQL validation and export |
| `notebooks/08_phase2_neo4j_load.ipynb` | OWL-to-Neo4j data transfer |

These are project paths; the exported OWL files remain the source of truth for the axioms actually serialized.

## 2. Entity Definitions

| Class | Definition | Example |
| --- | --- | --- |
| **Road** | Physical road or identifiable segment with length, speed limit, lanes and status. | `Road_C_G` |
| **Junction** | Location where roads connect or intersect. | `Junction_A` |
| **Vehicle** | Entity capable of traveling on the network. | `Vehicle_V1` |
| **Signal** | Traffic-control device controlling movements at a location. | `Signal_B` |
| **Route** | Path or proposed path through connected road segments. | `Route_1` |
| **Congestion** | Traffic condition associated with reduced traffic performance. | `Congestion_1` |
| **Incident** | Event such as accident, breakdown or roadwork that may disrupt traffic. | `Accident_1` |
| **EmergencyVehicle** | Specialized `Vehicle` used in emergency response. | `Ambulance_1` |

A route is not a single road; congestion is not an incident; a junction is not a road. `EmergencyVehicle` is a subclass of `Vehicle`, not a disjoint top-level class.

## 3. Competency Questions

Competency questions define information the system should be able to retrieve. Some depend on data or relationships not included in the small Phase 2 seed graph.

| ID | Question | Status / limitation |
| --- | --- | --- |
| CQ1 | Which roads are blocked by incidents? | Supported by `Incident -[:BLOCKS]-> Road`. |
| CQ2 | Which incidents cause modeled congestion? | Supported by explicitly asserted `CAUSES` links; not proof of real-world causality. |
| CQ3 | Which junctions connect to a given road? | Supported by `CONNECTED_TO`. |
| CQ4 | Which signals are located at a junction? | Expressible through `LOCATED_AT` where location data exists. |
| CQ5 | Which signals prioritize emergency vehicles? | Supported by `PRIORITIZES`. |
| CQ6 | Which routes are influenced by congestion? | Supported by `INFLUENCES`. |
| CQ7 | Which incidents are associated with congestion on a road? | Requires explicit incident/congestion links and road-location data. |
| CQ8 | Which roads does an incident block? | Supported by `BLOCKS`; location alone is insufficient. |
| CQ9 | Where is an emergency vehicle located? | Supported by `LOCATED_AT`. |
| CQ10 | Which roads form a route, and in what order? | **Not fully implemented**; needs a route-composition model such as `ContainsRoad` and ordering information. |

**Phase 2 validation:** Eight SPARQL examples and eight Cypher examples were created for the implemented seed scenario. They demonstrate selected competency questions, not comprehensive coverage of all ten questions above. Queries asking about *active* or *current* conditions additionally require consistent temporal/status data.

### 3.1 Modeling cautions

- An incident being `LOCATED_AT` a road does not automatically make it `BLOCKS` that road.
- Congestion can arise without an incident. A `CAUSES` edge must not be generated from co-location alone.
- Signal location does not imply emergency-vehicle priority.
- `CONNECTED_TO` expresses endpoint association, not permitted travel direction or route order.
- Location and traffic state may change with time; a static individual is not automatically a history of observations.

## 4. Design Decisions

| ID | Decision | Rationale |
| --- | --- | --- |
| D1 | Separate `Road` and `Junction`. | Keep segments distinct from connection points. |
| D2 | Separate `Route` and `Road`. | A route can involve many segments. |
| D3 | Model `Congestion` independently. | Traffic conditions vary and have multiple possible causes. |
| D4 | Model `Incident` as an event. | Incidents may block roads or cause congestion, but neither effect is automatic. |
| D5 | Make `EmergencyVehicle` a `Vehicle` subclass. | Retain general vehicle characteristics and add emergency-specific semantics. |
| D6 | Use an extensible, compact ontology. | Keep the prototype understandable and testable. |
| D7 | Assert meaningful relationships explicitly. | Improve traversal, querying and explanation traceability. |
| D8 | Keep ontology distinct from routing and signal-control algorithms. | An ontology describes concepts; application logic makes operational decisions. |

## 5. Scope and Assumptions

1. Road and junction identifiers are unique within the project dataset.
2. Phase 2 example data is a *toy transportation scenario*, not live traffic observations.
3. Lengths use kilometres; speeds use kilometres per hour in the ontology and Neo4j representation.
4. OWL represents formal semantics; Neo4j stores a property-graph projection. They do not synchronize automatically.
5. Some data properties retained from Phase 1 have different names from the refined Phase 2 properties; their continued presence is for backward compatibility.
6. OWL's open-world semantics and class inference do not replace application-level data validation.
7. The initial scope does not include full route composition, real-time routing, traffic prediction or operational emergency-signal control.

## 6. Naming Conventions

### 6.1 Classes

Use **PascalCase**: `Road`, `Junction`, `Vehicle`, `Signal`, `Route`, `Congestion`, `Incident`, `EmergencyVehicle`.

### 6.2 OWL object properties

Use exact **UpperCamelCase** identifiers: `ConnectedTo`, `Causes`, `LocatedAt`, `Influences`, `Blocks`, `Prioritizes`.

### 6.3 Data properties

Use **lowerCamelCase**: `roadName`, `speedLimit`, `signalPhase`, `routeDistance`, `congestionLevel`, etc. Case matters for ontology queries and RDF predicates.

### 6.4 Individuals and Neo4j IDs

Use stable identifiers such as `Road_C_G`, `Junction_A`, `Accident_1` and `Ambulance_1`. The Neo4j `id` property identifies transferred individuals. Phase 3 SUMO imports add a `SUMO_` prefix to avoid collisions with Phase 2 demo IDs.

## 7. Class Hierarchy and Logical Constraints

### 7.1 Implemented core hierarchy

```text
owl:Thing
├── Road
├── Junction
├── Vehicle
│   └── EmergencyVehicle
├── Signal
├── Route
├── Congestion
└── Incident
```

The Phase 1 exercise also introduced vehicle specializations including `Car` and `Ambulance`; they are not additional top-level classes. `Accident`, `Breakdown` and `Roadwork` may be added as *future* `Incident` subclasses. In the implemented Phase 3 Neo4j incident graph, the categories are represented using `Incident.incidentType`, not separate labels.

### 7.2 Restrictions

- The Phase 2 ontology places a minimum qualified cardinality restriction on `Road`: `ConnectedTo min 2 Junction`.
- The seven top-level categories (`Road`, `Junction`, `Vehicle`, `Signal`, `Route`, `Congestion`, `Incident`) were declared mutually disjoint in the Phase 2 ontology notebook.
- `EmergencyVehicle` is **not** disjoint from `Vehicle`, because it is a subclass.
- Under OWL's open-world assumption, a minimum-cardinality restriction does **not** by itself verify that two named endpoints are explicitly stored. The Neo4j import and dataset checks separately verify known junction connectivity.

## 8. Object Properties

### 8.1 Implemented Phase 2 properties

| OWL property | Intended domain | Intended range | Neo4j relationship | Meaning |
| --- | --- | --- | --- | --- |
| `ConnectedTo` | `Road` | `Junction` | `CONNECTED_TO` | Road connects to a junction. |
| `Causes` | `Incident` | `Congestion` | `CAUSES` | Explicitly modeled causal link. |
| `LocatedAt` | `Vehicle` or `Incident` or `Signal` | `Road` or `Junction` | `LOCATED_AT` | Entity has a location. |
| `Influences` | `Congestion` | `Route` | `INFLUENCES` | Congestion affects a route. |
| `Blocks` | `Incident` | `Road` | `BLOCKS` | Incident blocks a road. |
| `Prioritizes` | `Signal` | `EmergencyVehicle` | `PRIORITIZES` | Signal prioritizes emergency vehicle. |

**Property characteristics:** The six Phase 2 properties are directed. `ConnectedTo` is **not declared symmetric** in the implemented Phase 2 model. None of the six was documented as functional or transitive in that model.

`ContainsRoad` was proposed in the earlier design but was **not implemented** among these six relationships. Consequently, Phase 2 `Route` individuals do not by themselves provide a full ordered road-segment sequence.

### 8.2 Example relations

```text
Road_C_G       ConnectedTo   Junction_C
Accident_1     Blocks        Road_C_G
Accident_1     Causes        Congestion_1
Congestion_1   Influences    Route_1
Signal_B       Prioritizes   Ambulance_1
Ambulance_1    LocatedAt     Junction_A
```

These demonstrate graph semantics within the toy scenario. In particular, `Accident_1 Causes Congestion_1` is an *asserted scenario relation*, not a causal conclusion calculated from SUMO telemetry.

### 8.3 Phase 3 compatibility note

Phase 3 also uses `(Congestion)-[:LOCATED_AT]->(Road)` in Neo4j to connect SUMO-derived congestion observations with road nodes. The Phase 2 **OWL** domain for `LocatedAt` did not include `Congestion`. This distinction must be resolved before exporting Phase 3 congestion-location edges as OWL assertions: expand the OWL property's intended domain appropriately and rerun reasoning, or use a separately modeled observational relationship. Neo4j does not enforce OWL domain axioms.

## 9. Data Properties

### 9.1 Phase 2 vocabulary

The table gives the names and *intended value types* used by the implementation; the exact serialized XSD ranges should be checked against the `.owl` or `.ttl` export before claiming formal datatype validation.

| Class | Property | Intended type | Meaning / units |
| --- | --- | --- | --- |
| `Road` | `roadName` | string | Road name or identifier. |
| `Road` | `length` | numeric | Road length in km. |
| `Road` | `speedLimit` | numeric | Speed limit in km/h. |
| `Road` | `lanes` | integer | Number of lanes. |
| `Road` | `status` | string | Open/blocked or other status; retained from earlier ontology. |
| `Junction` | `junctionId` | string | Junction identifier. |
| `Vehicle` | `vehicleId` | string | Vehicle identifier. |
| `Vehicle` | `vehicleType` | string | Vehicle category; retained from Phase 1. |
| `Vehicle` | `hasRole` | string | Role used in the Phase 1 reasoning exercise. |
| `Signal` | `signalState` | string | Signal indication. |
| `Signal` | `signalPhase` | string | Signal phase identifier/description. |
| `Route` | `routeId` | string | Route identifier. |
| `Route` | `routeDistance` | numeric | Route length in km. |
| `Congestion` | `congestionLevel` | string | Qualitative congestion category. |
| `Congestion` | `avgSpeed` | numeric | Observed or assigned average speed in km/h. |
| `Incident` | `incidentType` | string | Accident, breakdown, roadwork, etc. |
| `Incident` | `severity` | numeric in Phase 3 records | Incident severity; Phase 3 uses values 1–5. |
| `Incident` | `startTime` | timestamp representation | Incident start time; representation must be consistent between OWL and Neo4j. |

The actual OWL-to-Neo4j loader maps the listed refined properties and retained Phase 1 names. Neo4j additionally assigns its own node `id` property as a stable lookup key.

**Corrections from the early design draft:** use `lanes` rather than `laneCount`, `junctionId` rather than `junctionName`, `signalPhase` rather than `phase`, and `avgSpeed` rather than `averageSpeed`. `routeDistance` replaces the earlier unimplemented `origin`/`destination` literal fields as the implemented route measurement. `severity` is numeric in Phase 3 Neo4j incident records. Formal OWL datatype declarations may differ; check the export if OWL/Neo4j round-trip interchange is required.

### 9.2 Phase 3 observation fields (Neo4j only)

The SUMO import adds fields such as `Road.fromJunction` / `toJunction` in CSVs, SUMO junction coordinates `x`/`y`, and congestion measurement `density`, `vehicleCount`, `begin`, `end`, and `source`. These fields are useful operational metadata, **not** part of the core Phase 2 OWL data-property list. The import preserves road direction in CSV endpoint fields; `CONNECTED_TO` itself is not directional traffic movement.

### 9.3 Data-quality decisions

- Measurements must retain explicit units and consistent spellings.
- Time fields should not be mixed without a documented simulation-to-clock-time mapping.
- Categorical values such as `Open`, `Blocked`, `Low`, and `High` should be standardized.
- Required values, unique identifiers, positivity constraints and historical accuracy need application/database checks in addition to OWL axioms.

## 10. Implementation and Validation

### 10.1 OWL development and exports

The Phase 2 ontology notebook extended the Phase 1 reasoned ontology with `Route` and `Congestion`, refined relationships and property values, added road-junction assertions, and saved `transportation_phase2_validated.owl`. The SPARQL notebook exported the versioned `transportation_v2.owl` and `transportation_v2.ttl` files.

### 10.2 Example seed data

The Phase 2 demonstrator models seven junctions (`A`–`G`), eight road connections, an incident blocking `Road_C_G`, one congestion condition, an affected route, a priority signal and an emergency vehicle. The ontology graph provides a controlled demonstration and must not be described as live observed traffic.

### 10.3 Reasoner validation

The Phase 2 notebook ran the HermiT OWL reasoner and saved its reasoned model. This is evidence that a reasoning step was executed; a full validation report should additionally record reasoner output, any unsatisfiable classes, and which competency queries returned expected answers. OWL reasoning does not establish real-world causal truth.

### 10.4 Neo4j schema

`neo4j/03_phase2_schema.cypher` defines uniqueness of `id` for seven node labels:

`Road`, `Junction`, `Vehicle`, `Signal`, `Route`, `Congestion`, `Incident`.

It also defines three property indexes:

| Index | Node property |
| --- | --- |
| `road_speed_index` | `Road.speedLimit` |
| `incident_severity_index` | `Incident.severity` |
| `congestion_level_index` | `Congestion.congestionLevel` |

`EmergencyVehicle` is represented as an additional label on a `Vehicle` node, rather than being a separate eighth constrained base label.

### 10.5 OWL-to-Neo4j mapping

The Phase 2 import notebook reads the RDF/OWL graph, maps individuals to Neo4j nodes, carries over selected data-property values, and creates relationships using these exact names:

| OWL class/property | Neo4j representation |
| --- | --- |
| `Road`, `Junction`, `Vehicle`, `Signal`, `Route`, `Congestion`, `Incident` | Corresponding node label |
| `EmergencyVehicle` | Additional `EmergencyVehicle` label on `Vehicle` |
| `ConnectedTo` | `CONNECTED_TO` |
| `Causes` | `CAUSES` |
| `LocatedAt` | `LOCATED_AT` |
| `Influences` | `INFLUENCES` |
| `Blocks` | `BLOCKS` |
| `Prioritizes` | `PRIORITIZES` |

The importer matches pre-existing Phase 1 junction nodes by `name` when possible and sets the ontology-derived `id`. Numeric RDF `Decimal` values are converted to floats before insertion into Neo4j.

### 10.6 Competency-query validation

The project includes eight SPARQL query examples and eight comparable Cypher query examples. They cover blocked roads, incident–congestion chains, road endpoints, emergency signal priority, and other relationships in the toy graph. The notebooks/queries should be executed against the actual generated artifacts to record results; this document does not invent pass counts or execution timings.

### 10.7 Design trade-offs and limitations

1. **Completeness:** The ontology defines core transportation concepts but does not fully encode ordered route composition, lane-level traffic controls, or a comprehensive observation history.
2. **Direction:** `Road -[:CONNECTED_TO]-> Junction` specifies road endpoints, not legal movement direction. SUMO edges remain directed in the underlying simulation dataset.
3. **Time:** Static facts in an ontology are insufficient to conclude that an incident is currently active; timestamps and statuses must be interpreted consistently.
4. **Causality:** In Phase 3, simulated incidents were created separately from SUMO traffic observations. Co-location does not justify a new `CAUSES` assertion.
5. **OWL versus Neo4j:** Neo4j can store flexible properties that do not automatically obey OWL domains/ranges. Synchronization needs explicit mapping and validation.
6. **Proposed extensions:** `ContainsRoad`, ordered route segments, incident subclasses, time-stamped observations and an updated OWL location model can be added in a subsequent version. They are not claimed as already implemented in the six-property Phase 2 schema.

## 11. Summary

The implemented Phase 2 ontology establishes eight core concepts, six principal object properties, refined data properties, example individuals, OWL reasoning, and a reproducible transfer to Neo4j. Its primary contribution is a consistent representation on which road-network, incident, congestion and explanation workflows can be built. Claims about real-world traffic effects must be grounded separately in measured or controlled simulation evidence.
