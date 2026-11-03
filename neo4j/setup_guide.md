# Neo4j Setup Guide

## 1. Overview

The Transportation Knowledge Framework uses Neo4j to store and query transportation entities and their relationships.

The knowledge graph contains three main components:

* **Road Network Graph:** Roads and junctions extracted from OpenStreetMap and SUMO.
* **Incident Graph:** Synthetic traffic incidents connected to affected roads.
* **Congestion Graph:** Congestion events derived from SUMO traffic measurements.

The graph uses the ontology concepts and relationships developed during Phase 2.

## 2. Prerequisites

Install the following software:

* Python and the dependencies listed in `requirements.txt`.
* Neo4j Desktop with a local Neo4j database.
* Jupyter Notebook or VS Code with Jupyter support.
* SUMO, if the traffic simulation needs to be rerun.

The repository includes previously generated datasets under `data/outputs/`.

## 3. Start Neo4j

1. Open Neo4j Desktop.
2. Create or start a local database.
3. Set a password for the `neo4j` user.
4. Ensure the Bolt connection is available at `bolt://localhost:7687`.
5. Open Neo4j's Query interface.

The project notebooks use the `neo4j` database by default. If a different database name or Bolt port is used, update the notebook connection settings accordingly.

## 4. Create the Database Schema

Open:

`neo4j/03_phase2_schema.cypher`

Execute its statements in Neo4j.

This creates uniqueness constraints for the transportation entities and indexes for selected properties.

The main node labels are:

`Road`, `Junction`, `Vehicle`, `EmergencyVehicle`, `Signal`, `Route`, `Congestion`, and `Incident`.

The main relationship types are:

`CONNECTED_TO`, `CAUSES`, `LOCATED_AT`, `INFLUENCES`, `BLOCKS`, and `PRIORITIZES`.

## 5. Load the Phase 1 Demonstration Graph

Run the Cypher statements in:

`neo4j/01_create_graph.cypher`

This creates the small demonstration road network used during Phase 1.

The graph includes junctions, road connections, and example transportation relationships.

## 6. Load the Phase 2 Ontology Data

Run:

`notebooks/08_phase2_neo4j_load.ipynb`

This notebook reads the Phase 2 ontology and imports its entities, properties, and relationships into Neo4j.

The ontology files are located in:

`ontology/phase2/`

The notebook uses the existing ontology-to-Neo4j mapping.

## 7. Load the Phase 3 Road Network

Run:

`notebooks/11_phase3_neo4j_import.ipynb`

The notebook reads:

* `data/outputs/junctions.csv`
* `data/outputs/roads.csv`

It imports road and junction nodes and creates `CONNECTED_TO` relationships.

Phase 3 node identifiers use the `SUMO_` prefix to distinguish them from the earlier demonstration graph.

## 8. Load Incidents and Congestion

Run these notebooks in order:

**Incident Graph:**

`notebooks/13_phase3_incidents.ipynb`

This notebook creates three synthetic incidents and connects them to affected roads using `BLOCKS` and `LOCATED_AT`.

**Congestion Graph:**

`notebooks/14_phase3_congestion.ipynb`

This notebook classifies congestion from SUMO traffic measurements and imports the detected events into Neo4j.

The source data is available in `data/outputs/`.

## 9. Explore the Knowledge Graph

To visualize part of the road network:

```cypher
MATCH (r:Road)-[rel:CONNECTED_TO]->(j:Junction)
WHERE r.id STARTS WITH 'SUMO_'
RETURN r, rel, j
LIMIT 50;
```

To visualize the synthetic incidents:

```cypher
MATCH (i:Incident)-[rel:BLOCKS]->(r:Road)
WHERE i.source = 'Simulated'
RETURN i, rel, r;
```

To display detected congestion:

```cypher
MATCH (c:Congestion)-[rel:LOCATED_AT]->(r:Road)
WHERE c.source = 'SUMO_Simulation'
RETURN c, rel, r
LIMIT 20;
```

Additional queries are available in:

* `neo4j/02_queries.cypher`
* `neo4j/04_phase2_competency_queries.cypher`
* `neo4j/05_phase3_explainability.cypher`

## 10. Important Limitations

The Phase 3 incidents were generated independently of the SUMO simulation.

Therefore, the incident relationships do not prove that those incidents caused the measured congestion.

Congestion classifications are based on a simplified speed-threshold rule.

The implementation is a local research prototype rather than a real-time traffic management system.

## 11. Reproducibility Notes

* Use the project root directory when running commands.
* Select the project's Python environment when opening notebooks.
* Run the notebooks in the documented order.
* Keep Neo4j running while executing database-related notebooks.
* Enter the Neo4j password when prompted.
* Do not store passwords or credentials in the repository.

The ontology, Cypher scripts, datasets, and notebooks provide the main resources required to reproduce the knowledge graph.
