Transportation Knowledge Framework

Phase 1: Transportation Knowledge and Explainability Foundations

Project: Transportation Knowledge Framework
Domain: Intelligent Transportation Systems
Focus: Ontologies, Knowledge Graphs, and Explainable AI

Slide 1 — Title

Transportation Knowledge Framework

Building a reusable foundation for transportation knowledge and explainable decision-making

Phase 1: Transportation Knowledge and Explainability Foundations

Key Technologies

- Python
- NetworkX
- RDF and OWL
- Neo4j
- Rule-based reasoning

Presenter: Sanvi Rastogi, Harshit Jhajharia
Institution: LNMIIT, Jaipur

Slide 2 — Problem Statement

Understanding Transportation as a Knowledge System

Modern transportation networks involve interconnected entities, including roads, junctions, vehicles, traffic signals, and incidents.

These entities influence traffic conditions and routing decisions.

Key Challenges

- Traffic incidents can disrupt road connectivity.
- Congestion can increase travel time.
- Emergency vehicles may require alternative routes.
- Transportation information may be distributed across different sources.
- Routing recommendations may not explain the reasoning behind a decision.

Problem: How can transportation knowledge be represented systematically and used to produce understandable, traceable decisions?

Slide 3 — Project Objectives

What Are We Building?

The Transportation Knowledge Framework aims to establish a reusable structure for representing transportation concepts and supporting explainable decisions.

Objectives

1. Define transportation concepts through an ontology.
2. Represent road networks using graph theory.
3. Store and query connected transportation information.
4. Apply explicit rules to transportation scenarios.
5. Generate human-readable explanations for decisions.

Expected Outcome

A small, reproducible demonstration showing how transportation entities, relationships, and rules can support explainable route decisions.

Slide 4 — Why Knowledge Graphs?

Representing Relationships Explicitly

A knowledge graph represents entities and the relationships between them.

Example

Junction_A → CONNECTS_TO → Junction_B

Incident_1 → AFFECTS → Road_R2

Ambulance_1 → USES → Route_1

Benefits

- Explicit representation of interconnected entities.
- Flexible relationship traversal.
- Easier querying of connected transportation information.
- Support for tracing facts relevant to a decision.
- Potential integration of information from different sources.

Key Idea: Transportation decisions depend not only on individual data points but also on relationships between roads, incidents, vehicles, and routes.

Slide 5 — Ontology and Knowledge Representation

Defining a Shared Transportation Vocabulary

An ontology defines the concepts, properties, and relationships used to describe a domain.

Initial Ontology Classes

- Road
- Junction
- Vehicle
- Signal
- Incident

Example Properties

- connectsTo
- affectsRoad
- locatedAt
- hasSeverity

Technologies

- RDF: Represents information as subject-predicate-object triples.
- OWL: Supports richer ontology semantics and logical reasoning.
- RDFLib and Owlready2: Python tools for working with RDF graphs and OWL ontologies.

Purpose: Establish a consistent vocabulary that can be extended as the framework grows.

Slide 6 — Proposed System Architecture

From Transportation Data to Explanations

Conceptual Workflow

Transportation Entities and Events
↓
Transportation Ontology
↓
Road Network Graph and Knowledge Representation
↓
Neo4j Graph Queries and Python Graph Analysis
↓
Rule-Based Decision Logic
↓
Human-Readable Explanation

Technology Roles

- NetworkX: Road network modeling and graph algorithms.
- RDFLib / Owlready2: RDF and ontology modeling.
- Neo4j: Property-graph storage and Cypher queries.
- Python: Rule evaluation and explanation generation.

Design Note: RDF/OWL and Neo4j use different graph models. Integration requires an explicit mapping or data-transfer step; the technologies do not automatically synchronize.

Slide 7 — Demonstration Scenario

Incident-Driven Emergency Vehicle Rerouting

Scenario

An incident blocks Road R2. An ambulance’s original route uses that road.

Reasoning Process

1. Identify the incident.
2. Determine that Road R2 is blocked.
3. Exclude the blocked road from feasible routes.
4. Evaluate alternative routes.
5. Select an appropriate feasible alternative based on the defined routing criteria.
6. Generate a human-readable explanation.

Illustrative Explanation

“The ambulance was rerouted because an incident blocked Road R2, making the original route unavailable. The recommended alternative avoids the blocked road and has the lowest estimated travel time among the feasible routes evaluated.”

[Insert Screenshot: Road Network and Alternative Route]

[Insert Screenshot: Rule-Based Explanation Output]

The screenshots should be added after the implementation has been executed and verified.

Slide 8 — Explainability and Causal Reasoning

Explaining Why a Decision Was Made

Illustrative Causal Chain

Incident
↓
Road Blockage
↓
Reduced Available Capacity
↓
Potential Congestion
↓
Route Change

Rule-Based Reasoning

IF a road is confirmed to be blocked,
THEN exclude it from feasible routes.

Explanation Components

- Relevant incident.
- Affected road.
- Routing constraint.
- Alternative route.
- Decision criteria.

Key Distinction

Rule-based reasoning derives conclusions from explicit rules and facts. Causal reasoning examines cause-and-effect relationships and requires suitable evidence or clearly stated assumptions.

An explanation improves transparency but does not, by itself, guarantee that a recommendation is correct or safe.

Slide 9 — Conclusion and Next Steps

Building Toward Reusable Transportation Intelligence

Phase 1 Foundations

- Transportation domain concepts.
- Graph theory and network analysis.
- RDF, OWL, and ontology modeling.
- Neo4j and graph querying.
- Rule-based explanations and causal reasoning.

Next Steps

1. Develop a more complete transportation ontology.
2. Populate and query a transportation knowledge graph.
3. Connect traffic incidents with routing decisions.
4. Evaluate explanation quality using controlled scenarios.
5. Investigate relevant research and identify research gaps.

Long-Term Direction

A reusable transportation knowledge framework that connects domain knowledge, graph-based representation, and explainable decision-making.

Thank You
Questions?
