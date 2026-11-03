# Phase 3: Transportation Knowledge Graph Implementation and Evaluation

## 1. Introduction

Phase 3 focuses on integrating real-world road network data, traffic simulation, and knowledge graph technologies into the Transportation Knowledge Framework developed during Phases 1 and 2.

The implementation uses OpenStreetMap for road network data, SUMO for traffic simulation, Python for data processing, and Neo4j for representing and querying transportation knowledge.

The framework supports road network analysis, incident representation, congestion detection, and rule-based explanations.

## 2. Objectives

The main objectives of Phase 3 are:

1. Extract a real-world road network using OpenStreetMap.
2. Simulate traffic using SUMO.
3. Construct a Road Network Graph in Neo4j.
4. Represent simulated traffic incidents using an Incident Graph.
5. Detect congestion using traffic simulation measurements.
6. Develop explainable queries connecting transportation entities.
7. Evaluate graph completeness, query performance, and scalability.

## 3. Technologies Used

| Technology       | Purpose                                                         |
| ---------------- | --------------------------------------------------------------- |
| OpenStreetMap    | Obtain real-world road network data                             |
| Netconvert       | Convert OpenStreetMap data into a SUMO network                  |
| SUMO             | Simulate vehicle movement and traffic conditions                |
| NetEdit          | Visualize and inspect the SUMO road network                     |
| Python           | Data extraction, processing, and integration                    |
| Pandas           | Process traffic measurements and CSV datasets                   |
| Neo4j            | Store and query the Transportation Knowledge Graph              |
| Cypher           | Retrieve transportation relationships and generate explanations |
| Jupyter Notebook | Implement and evaluate the framework                            |

## 4. System Architecture

The framework follows a data-processing and knowledge-representation workflow.

### 4.1 Data Processing Pipeline

```text
OpenStreetMap
      |
      v
SUMO Netconvert
      |
      v
SUMO Road Network
      |
      +---------------------+
      |                     |
      v                     v
Road Network Data     Traffic Simulation
      |                     |
      v                     v
Roads and Junctions   Traffic Measurements
      |                     |
      +----------+----------+
                 |
                 v
          Python Processing
                 |
                 v
       Transportation Knowledge
               Graph
              (Neo4j)
                 |
                 v
        Explainability Queries
                 |
                 v
        Evaluation and Results
```

### 4.2 Knowledge Graph Components

The framework contains three main graph components.

**Road Network Graph:** Represents roads and junctions extracted from the selected OpenStreetMap area. Roads are connected to their corresponding junctions using the `CONNECTED_TO` relationship.

**Incident Graph:** Represents synthetic traffic incidents, including accidents, breakdowns, and roadworks. Incidents are connected to affected roads through `BLOCKS` and `LOCATED_AT` relationships.

**Congestion Graph:** Represents congestion events identified from SUMO traffic measurements. Congestion is classified using a predefined speed-based threshold and associated with the corresponding road.

All three components use the existing Neo4j schema developed during Phase 2.

## 5. Implementation Overview

### 5.1 Road Network Extraction

A geographic area was selected manually using OpenStreetMap and exported as an OSM file.

The exported data was converted into a SUMO-compatible network using Netconvert and inspected in NetEdit.

Python's `sumolib` library was used to extract road and junction information.

The extracted properties included:

* Road and junction identifiers.
* Road lengths.
* Speed limits.
* Lane counts.
* Road connectivity.
* Junction coordinates.

The extracted data was saved in CSV format and imported into Neo4j.

### 5.2 Traffic Simulation

Synthetic vehicle trips were generated using SUMO's `randomTrips.py` utility.

The simulation produced traffic measurements over defined time intervals.

The measurements included average vehicle speed, vehicle entries, and traffic density.

These measurements were exported and processed using Python and Pandas.

### 5.3 Incident Graph

Three synthetic incident scenarios were generated:

1. Traffic accident.
2. Vehicle breakdown.
3. Roadwork.

Each incident was associated with a road from the selected SUMO network.

The incidents were imported into Neo4j using the existing `Incident` label and connected through `BLOCKS` and `LOCATED_AT` relationships.

### 5.4 Congestion Graph

Congestion was classified using a simple rule:

**A road interval is classified as congested when its measured average speed is below 50% of its speed limit, provided a positive number of vehicle entries was recorded.**

Detected congestion events were stored in Neo4j using the existing `Congestion` label.

The corresponding traffic measurements were retained to support explanations.

### 5.5 Explainability

Cypher queries were developed to retrieve explanations about transportation conditions.

These queries can identify:

* Roads classified as congested.
* Measurements supporting congestion classifications.
* Roads blocked by simulated incidents.
* Junctions connected to blocked roads.
* Incidents and congestion events associated with the same roads.
* Transportation explanation chains represented in the knowledge graph.

**Important limitation:** Synthetic incidents were not injected into the SUMO simulation. Therefore, the framework does not establish that these incidents caused congestion observed in the traffic measurements.

The project distinguishes measured traffic conditions, simulated incidents, and illustrative causal relationships.

## 6. Evaluation Overview

The framework was evaluated using three criteria.

### 6.1 Graph Completeness

Graph completeness was evaluated by comparing source dataset counts with the corresponding imported Neo4j node counts.

Missing properties and missing relationships were also checked.

### 6.2 Query Performance

Representative Cypher queries were executed repeatedly to measure their execution times.

Indexed and non-indexed execution strategies were compared, and Neo4j's `EXPLAIN` and `PROFILE` commands were used to inspect query execution plans.

### 6.3 Scalability

Scalability was evaluated using temporary road network datasets representing 25%, 50%, and 100% of the extracted road data.

Graph loading time and query execution time were measured for each dataset size.

Temporary benchmark nodes were removed after testing to preserve the original project database.

The detailed evaluation results will be documented in the next section.

## 7. Evaluation Results and Analysis

### 7.1 Graph Completeness Results

Graph completeness was evaluated by comparing the number of entities in the source CSV datasets with the corresponding nodes imported into Neo4j.

The evaluation considered four entity categories: Road, Junction, Incident, and Congestion.

**Results:** 
Entity,Source Count,Neo4j Count,Completeness (%)
Roads,794,794,100.0
Junctions,276,276,100.0
Incidents,3,3,100.0
Congestion,75,75,100.0


The completeness percentage was calculated using:

$$
\text{Completeness (\%)} =
\frac{\text{Imported Node Count}}{\text{Source Record Count}}
\times 100
$$

The evaluation also checked whether road nodes contained essential properties and whether imported entities had the expected relationships.

**Analysis:** Record which categories achieved 100% completeness, identify any missing data, and report any categories with no source records. Matching counts provide an initial completeness check but do not independently prove that every source identifier was imported correctly.

### 7.2 Query Performance Results

Six representative Cypher queries were evaluated to measure the framework's query performance.

Each query was executed once for warm-up and five additional times for measurement.

**Results:** 
Query,Avg Time (ms),Min Time (ms),Max Time (ms)
All Roads,5.794,5.51,6.137
Blocked Roads,7.236,6.022,10.467
High Speed Roads,5.426,5.09,5.932
Simulated Incidents,4.832,4.522,5.228
Congested Roads,5.278,4.946,5.69
Incident Connections,6.115,5.041,8.798


The measurements include average, minimum, and maximum execution times in milliseconds.

**Analysis:** Identify the fastest and slowest queries using the measured results. Explain that performance depends on query complexity, graph size, indexing, caching, and Python-to-Neo4j communication overhead.

### 7.3 Index Performance Results

The evaluation compared two execution strategies for retrieving roads with speed limits greater than 50 km/h:

1. An indexed lookup using the existing `road_speed_index`.
2. A label scan without using the speed-limit property index.

**Results:** 
Method,Matched Roads,Avg Time (ms)
Using Index,753,4.771
Using Label Scan,753,5.846


**Analysis:** Compare the recorded execution times. Both strategies should return the same number of matching roads. An indexed query is not necessarily faster for a small dataset, so conclusions should reflect the actual measurements.

### 7.4 Scalability Results

The scalability evaluation measured graph loading and query execution times using three dataset sizes:

* 25% of the road network.
* 50% of the road network.
* 100% of the road network.

Temporary nodes were created using the existing Road and Junction labels and connected using `CONNECTED_TO` relationships.

**Results:** 
Dataset (%),Roads,Junctions,Connections,Load Time (ms),Query Time (ms)
25,198,185,396,411.259,5.795
50,397,268,794,228.542,11.287
100,794,276,1588,370.651,9.007


Include the scalability graph saved as `presentation/screenshots/phase3_scalability.png`.

**Analysis:** Describe how loading time and query latency changed as dataset size increased. Note that measurements on a single computer and relatively small road network do not establish performance at city-wide or production scale.

### 7.5 Evaluation Summary

The evaluation provides evidence about three aspects of the implemented Transportation Knowledge Framework:

* **Completeness:** Whether the source records are represented in Neo4j.
* **Query performance:** How quickly representative transportation queries execute.
* **Scalability:** How loading and query times change with increasing graph size.

The findings should be interpreted in the context of the selected OpenStreetMap network, synthetic traffic simulation, and local Neo4j environment.

## 8. Limitations

Although the Transportation Knowledge Framework successfully integrates road network data, simulated traffic measurements, and knowledge graph representations, the current implementation has several limitations.

### 8.1 Simulated Traffic Data

The framework uses SUMO-generated traffic measurements rather than real-time traffic information.

The simulation is based on synthetic vehicle trips and does not necessarily reproduce actual traffic demand, driver behavior, or congestion patterns in the selected geographic area.

Therefore, the detected congestion should be interpreted as simulated traffic conditions rather than verified real-world observations.

### 8.2 Synthetic Traffic Incidents

The Incident Graph contains three manually generated incident scenarios: an accident, a vehicle breakdown, and roadwork.

These incidents were added to Neo4j independently of the SUMO simulation.

Consequently, the framework can identify relationships between incidents and affected roads, but it cannot establish that these incidents caused congestion observed in SUMO.

### 8.3 Simplified Congestion Detection

Congestion is detected when the average recorded vehicle speed is below 50% of the road's speed limit, provided the interval contains a positive number of vehicle entries.

This approach is simple and explainable but does not account for all congestion indicators, such as queue length, travel-time reliability, lane occupancy, or sustained traffic demand.

The threshold has not been calibrated against real-world traffic observations.

### 8.4 Limited Geographic Coverage

The implementation uses a manually selected OpenStreetMap area rather than a complete city-wide transportation network.

This keeps the simulation and knowledge graph manageable but limits the generalizability of the evaluation results.

### 8.5 Limited Scalability Testing

Scalability was evaluated using three subsets of the same road network.

The experiments measure loading and query performance on a local Neo4j database.

They do not establish how the framework would perform with millions of entities, multiple simultaneous users, or continuously arriving traffic information.

### 8.6 Simplified Road Connectivity Representation

SUMO road edges represent directed travel movements.

However, the implemented Neo4j `CONNECTED_TO` relationship associates each road with its connected junctions without explicitly representing which junction is the starting point and which is the ending point.

The original direction information is preserved in the extracted CSV data.

This representation is sufficient for basic connectivity queries but requires additional direction-aware processing for accurate routing on one-way roads.

### 8.7 Ontology and Neo4j Integration

OWL and Neo4j use different graph representations.

The current implementation imports ontology entities and relationships into Neo4j through Python scripts, but it does not provide automatic bidirectional synchronization.

Changes made directly in Neo4j are not automatically reflected in the exported OWL ontology.

Furthermore, some properties added during Phase 3 are not included in the original Phase 2 OWL definitions.

### 8.8 Limited Causal Reasoning

The framework uses explicit rules and graph relationships to generate understandable explanations.

However, rule-based explanations do not automatically establish real-world causation.

The Phase 2 incident–congestion–route chain is an illustrative scenario, while Phase 3 congestion measurements are derived independently from SUMO.

A validated causal model would require additional evidence, such as controlled simulations comparing traffic conditions with and without incidents.

---

## 9. Design Trade-offs

The implementation involves several design decisions intended to balance functionality, simplicity, and explainability.

| Design Decision                      | Advantage                                                        | Trade-off                                                        |
| ------------------------------------ | ---------------------------------------------------------------- | ---------------------------------------------------------------- |
| Use SUMO-generated traffic data      | Provides reproducible traffic measurements                       | May not reflect actual traffic conditions                        |
| Use synthetic incidents              | Makes incident scenarios easy to construct and test              | Does not establish incident-caused congestion                    |
| Use speed-based congestion detection | Simple to implement and explain                                  | Does not capture every aspect of congestion                      |
| Represent roads as Neo4j nodes       | Supports relationships with incidents, congestion, and junctions | Requires additional relationships for network connectivity       |
| Reuse the Phase 2 ontology schema    | Maintains consistency between project phases                     | Limits the relationships available for detailed Phase 3 modeling |
| Use Python for data integration      | Flexible and easy to inspect                                     | Requires explicit scripts to synchronize data                    |
| Use local Neo4j                      | Simple development and experimentation                           | Does not represent distributed or production-scale deployment    |
| Use rule-based explanations          | Produces traceable, understandable reasoning                     | Depends on predefined rules and available evidence               |

These decisions are suitable for an educational research prototype focused on knowledge representation and explainability.

---

## 10. Future Improvements

The Transportation Knowledge Framework can be extended in several directions.

### 10.1 Real-Time Traffic Integration

Integrate live traffic measurements from sensors, GPS-based systems, or transportation data services.

This would allow the knowledge graph to represent changing traffic conditions rather than only previously simulated measurements.

### 10.2 Incident-Based SUMO Simulation

Introduce accidents, lane closures, roadworks, and vehicle breakdowns directly into SUMO simulations.

Traffic measurements could then be compared before and after an incident to evaluate its effect on congestion.

### 10.3 Improved Congestion Detection

Extend the congestion classification method to consider multiple indicators, such as:

* Average speed relative to free-flow speed.
* Traffic density and occupancy.
* Vehicle waiting time.
* Queue length.
* Travel-time increases.

This could produce more informative congestion classifications.

### 10.4 Direction-Aware Route Representation

Extend the knowledge graph to preserve road direction and represent ordered route segments.

This would support more accurate routing queries, particularly for one-way roads and restricted movements.

### 10.5 Automated Ontology Synchronization

Develop a synchronization mechanism between OWL representations and Neo4j.

This could improve consistency when entities or relationships are updated.

### 10.6 Enhanced Explainability

Extend rule-based explanations to include:

* Data provenance.
* Temporal information.
* Confidence or uncertainty indicators.
* Alternative routing decisions.
* Comparisons between different traffic scenarios.

### 10.7 Larger-Scale Evaluation

Evaluate the framework using larger road networks, additional traffic scenarios, and higher volumes of graph data.

Additional experiments could examine memory consumption, concurrent query execution, and continuous data updates.

---

## 11. Conclusion

Phase 3 extended the Transportation Knowledge Framework from a conceptual ontology and small graph demonstrations into an integrated transportation knowledge representation prototype.

The implementation combined OpenStreetMap road data, SUMO traffic simulation, Python processing, and Neo4j knowledge graph storage.

Three graph components were constructed: the Road Network Graph, Incident Graph, and Congestion Graph.

Explainability queries were developed to retrieve road restrictions, congestion measurements, and relationships between transportation entities.

The framework was evaluated through graph completeness, query performance, and scalability experiments.

Overall, the project demonstrates how ontology-based knowledge representation, graph databases, traffic simulation, and explicit reasoning rules can be combined to support understandable transportation analysis.

The current framework remains a research prototype, with future improvements possible in real-time integration, incident simulation, causal analysis, and large-scale deployment.

