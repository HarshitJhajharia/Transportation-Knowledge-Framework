# Transportation Knowledge Framework

A reproducible educational framework for representing transportation knowledge with ontologies and knowledge graphs, analysing road networks, simulating traffic, and explaining transportation conditions and routing decisions.

## Overview

Transportation systems involve interconnected roads, junctions, vehicles, signals, incidents, routes, and traffic conditions. This project combines formal knowledge representation, graph analysis, simulation, and rule-based explanations in a single workflow.

The implementation includes a small demonstration network developed during Phase 1, an expanded transportation ontology and Neo4j schema developed during Phase 2, and an OpenStreetMap-based SUMO simulation integrated with Neo4j during Phase 3.

**Scope:** This is an educational research prototype, not a live traffic-management, incident-detection, or emergency-dispatch system.

## Objectives

- Model transportation concepts and relationships using RDF/OWL.
- Represent and query roads, junctions, incidents, congestion, vehicles, signals, and routes.
- Analyze road connectivity and illustrate incident-aware rerouting.
- Import a selected OpenStreetMap road network into SUMO and Neo4j.
- Generate simulated traffic measurements and classify congestion using explicit rules.
- Produce traceable explanations using graph relationships and recorded measurements.
- Evaluate graph completeness, query performance, and scalability.

## Technology Stack

| Technology | Purpose |
| --- | --- |
| Python and Jupyter | Data processing, experiments, and integration |
| NetworkX | Road-network graph analysis |
| RDFLib and Owlready2 | RDF/OWL ontology creation and querying |
| HermiT reasoner | OWL consistency and inference checks |
| Neo4j and Cypher | Property-graph storage, querying, and evaluation |
| OpenStreetMap | Source road-network data |
| SUMO, Netconvert, and NetEdit | Network conversion and microscopic traffic simulation |
| Pandas and Matplotlib | Processing, evaluation tables, and plots |

## Repository Structure

```text
Transportation-Knowledge-Framework/
├── README.md
├── requirements.txt
├── glossary/
│   └── transportation_glossary.md
├── notebooks/
│   ├── research_notes.md
│   ├── 01_road_network.ipynb
│   ├── 02_transportation_ontology.ipynb
│   ├── 03_explainability.ipynb
│   ├── 04_neo4j_integration.ipynb
│   ├── 05_ontology_exercises.ipynb
│   ├── 06_phase2_ontology.ipynb
│   ├── 07_phase2_sparql.ipynb
│   ├── 08_phase2_neo4j_load.ipynb
│   ├── 10_phase3_road_extraction.ipynb
│   ├── 11_phase3_neo4j_import.ipynb
│   ├── 12_phase3_simulation.ipynb
│   ├── 13_phase3_incidents.ipynb
│   ├── 14_phase3_congestion.ipynb
│   └── 15_phase3_evaluation.ipynb
├── ontology/
│   ├── transportation.owl
│   ├── transportation_extended.owl
│   ├── transportation_reasoned.owl
│   ├── transportation_phase2_validated.owl
│   ├── queries/
│   │   └── competency_queries.sparql
│   └── phase2/
│       ├── ontology_design.md
│       ├── transportation_v2.owl
│       └── transportation_v2.ttl
├── neo4j/
│   ├── 01_create_graph.cypher
│   ├── 02_queries.cypher
│   ├── 03_phase2_schema.cypher
│   ├── 04_phase2_competency_queries.cypher
│   └── 05_phase3_explainability.cypher
├── data/
│   ├── osm/
│   │   └── selected_area.osm
│   ├── sumo/
│   │   ├── selected_area.net.xml
│   │   ├── traffic.trips.xml
│   │   ├── traffic.rou.xml
│   │   ├── traffic.add.xml
│   │   └── traffic.sumocfg
│   └── outputs/
│       ├── roads.csv
│       ├── junctions.csv
│       ├── traffic_data.csv
│       ├── incidents.csv
│       ├── congestion.csv
│       ├── graph_completeness.csv
│       ├── query_performance.csv
│       ├── index_performance.csv
│       └── scalability_results.csv
├── scripts/
├── docs/
│   └── phase3/
└── presentation/
    ├── phase1_presentation.md
    ├── notes/
    │   └── speaker_notes.md
    ├── slides/
    └── screenshots/
```

This is a **reference layout** based on the completed workflow. Some filenames or optional folders may differ locally; retain the actual names used by your notebooks and scripts. The Phase 3 setup notebook was optional and is not required for execution.

## Development Progress

| Phase | Work completed | Status |
| --- | --- | --- |
| Phase 1 | Transportation foundations, basic ontology, toy road graph, Neo4j integration, rule-based explanation | Completed |
| Phase 2 | Expanded OWL ontology, constraints and reasoning, OWL/Turtle exports, Neo4j mapping, competency queries | Completed |
| Phase 3 — Part A | OSM/SUMO data, road and junction import, simulated incidents, congestion classification, explainability queries, completeness/performance/scalability evaluation | Completed |
| Phase 3 — Part B | Documentation, review, and remaining deliverables | In progress |

## Getting Started (Windows)

### Requirements

- Python with a virtual environment and Jupyter Notebook or VS Code.
- Neo4j Desktop with a running local database.
- SUMO installed with `sumo`, `sumo-gui`, `netconvert`, and SUMO tools available.
- A Java runtime if needed by the configured OWL reasoner.

From the project root, activate the existing virtual environment and install the project's dependencies:

```powershell
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
```

If setting up on a different machine, create the virtual environment first and install the Jupyter kernel as appropriate.

### Neo4j

1. Start the existing Neo4j instance in Neo4j Desktop.
2. Confirm the Bolt connection (the notebooks use `bolt://localhost:7687` unless configured otherwise).
3. Run the schema in `neo4j/03_phase2_schema.cypher` if setting up a fresh database.
4. Use the Phase 1 and Phase 2 notebooks to create the foundational data, then run the Phase 3 import notebook.

The Python notebooks prompt for the Neo4j password. **Do not put passwords in the README or commit them to a repository.**

### Run the SUMO Simulation

The Phase 3 implementation uses the OpenStreetMap area you selected and converted into `data/sumo/selected_area.net.xml`. The following command uses the existing simulation configuration:

```powershell
sumo -c "data\sumo\traffic.sumocfg" --summary-output "data\outputs\simulation_summary.xml"
```

To view vehicles moving through the network:

```powershell
sumo-gui -c "data\sumo\traffic.sumocfg"
```

The simulation configuration references the route and additional-output XML files in `data/sumo/`. If working from a fresh checkout, regenerate missing route files using SUMO's `randomTrips.py` before running the simulation.

### Notebook Workflow

Run notebooks in numbered order within each phase. Important Phase 3 notebooks:

| Notebook | Purpose |
| --- | --- |
| `10_phase3_road_extraction.ipynb` | Extract roads and junctions from the SUMO network |
| `11_phase3_neo4j_import.ipynb` | Import the road network into Neo4j |
| `12_phase3_simulation.ipynb` | Parse SUMO traffic measurements |
| `13_phase3_incidents.ipynb` | Create synthetic incidents in Neo4j |
| `14_phase3_congestion.ipynb` | Classify congested intervals and create graph records |
| `15_phase3_evaluation.ipynb` | Evaluate completeness, query latency, index plans, and scalability |

Before running a notebook, select the project's Python environment/kernel and confirm that the expected input files exist.

## Knowledge Representation

The Phase 2 ontology centers on eight classes: `Road`, `Junction`, `Vehicle`, `Signal`, `Route`, `Congestion`, `Incident`, and `EmergencyVehicle` (a subclass of `Vehicle`).

The implemented main object properties are `ConnectedTo`, `Causes`, `LocatedAt`, `Influences`, `Blocks`, and `Prioritizes`. Neo4j uses the corresponding uppercase relationship types, such as `CONNECTED_TO` and `BLOCKS`. Consult `ontology/phase2/ontology_design.md` for ontology constraints, mapping decisions, and known limitations.

The Phase 3 import uses prefixed identifiers (`SUMO_...`) to distinguish selected real-world road-network records from the initial toy graph.

## Explainability and Important Limitations

- The project provides **rule-based and graph-based explanations**; it does not claim to perform verified causal inference from observational data.
- Congestion is classified from **simulated** road-speed measurements using an explicit threshold rule. This identifies why a record was classified as congested, not the underlying cause of slow traffic.
- Phase 3 accidents, breakdowns, and roadworks are **synthetic incidents created separately from the SUMO traffic run**. Their presence in Neo4j does not demonstrate that they caused measured SUMO congestion.
- The Phase 2 `Incident → CAUSES → Congestion → INFLUENCES → Route` chain is a controlled illustrative example, not a causal finding from Phase 3.
- Directed SUMO road segments are represented as `Road` nodes connected to endpoint `Junction` nodes. The `CONNECTED_TO` relationship captures endpoints, not travel direction; original `fromJunction` and `toJunction` fields remain in the extracted CSV.
- Completeness measures import coverage and basic relationship/property checks. Timing measurements are local Python-to-Neo4j benchmarks and may vary across machines.
- The Phase 3 Neo4j congestion-location mapping should be reconciled with the OWL `LocatedAt` domain before exporting those relations into OWL.

## Outputs and Evaluation

Results are stored in `data/outputs/`, including:

- `roads.csv` and `junctions.csv` — extracted SUMO network.
- `traffic_data.csv` — aggregated road measurements from SUMO intervals.
- `incidents.csv` and `congestion.csv` — synthetic incident records and simulation-derived congestion classifications.
- `graph_completeness.csv` — source-versus-database count comparison.
- `query_performance.csv` and `index_performance.csv` — local Neo4j query benchmarks.
- `scalability_results.csv` — load and query measurements at several dataset sizes.

See `neo4j/05_phase3_explainability.cypher` for explanation queries. Actual results depend on the selected map, generated trips, and simulation settings; no numerical evaluation result is assumed here.

## Documentation and Presentation

- `glossary/transportation_glossary.md` — transportation and knowledge-representation terminology.
- `notebooks/research_notes.md` — Phase 1 background research.
- `ontology/phase2/ontology_design.md` — Phase 2 model and implementation documentation.
- `presentation/phase1_presentation.md` — Phase 1 slide draft.
- `presentation/notes/speaker_notes.md` — notes corresponding to the Phase 1 slides.
- `docs/phase3/` — Phase 3 Part B documentation (in progress).

## Research Directions

Possible extensions include temporally aligned incident simulation, validated incident-to-congestion inference, directional routing using SUMO network semantics, richer route composition, explanation-quality assessment, and integration with live traffic sources.

## License

No license has been selected yet. Choose an appropriate license before publishing the project for reuse.
