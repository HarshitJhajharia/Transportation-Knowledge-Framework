Speaker Notes: Transportation Knowledge Framework

Slide 1 — Title

Introduce the Transportation Knowledge Framework as a project focused on representing transportation knowledge and explaining decisions.

Explain that Phase 1 establishes the domain concepts and technical foundations required for the later implementation.

Mention the key technologies: Python, NetworkX, RDF, OWL, and Neo4j.

Slide 2 — Problem Statement

Transportation systems contain interconnected entities. A road incident can affect traffic conditions, road accessibility, and route selection.

A routing system might recommend a different path, but users also need to understand why that recommendation was made.

The project explores how structured transportation knowledge can support both network analysis and explanations.

Slide 3 — Project Objectives

Explain the five objectives in order.

First, the ontology defines a shared vocabulary. Second, graph theory represents the road network. Third, graph queries retrieve connected information. Fourth, explicit rules support decisions. Finally, explanations communicate the relevant facts and decision criteria.

Clarify that the goal is a small, reproducible demonstration rather than a complete operational traffic management system.

Slide 4 — Why Knowledge Graphs?

Explain the example Junction_A → CONNECTS_TO → Junction_B.

A graph can represent roads, junctions, incidents, and vehicles together with their relationships.

This representation makes it possible to query connected information and trace which facts are relevant to a decision.

Mention that graph-based representation alone does not guarantee data accuracy or explainability; appropriate rules and explanation mechanisms are also needed.

Slide 5 — Ontology and Knowledge Representation

An ontology defines the meaning of domain concepts and their relationships.

For example, Road, Junction, Vehicle, Signal, and Incident provide an initial transportation vocabulary.

RDF represents statements as triples, while OWL supports richer logical modeling.

RDFLib and Owlready2 provide Python interfaces for working with these representations.

The initial ontology is deliberately small so it can be extended in later phases.

Slide 6 — Proposed System Architecture

Walk through the architecture from transportation entities to the final explanation.

NetworkX supports road network analysis. RDFLib and Owlready2 support ontology modeling. Neo4j stores and queries a property graph. Python implements the application-specific rules and generates explanations.

Clarify that RDF/OWL and Neo4j use different data models. A mapping or transfer step is required to connect them.

Describe this as the intended architecture, and distinguish planned integration from functionality that has already been implemented.

Slide 7 — Demonstration Scenario

Describe an incident that blocks Road R2.

The routing logic identifies the blockage, excludes the affected road from feasible routes, and evaluates alternatives.

The explanation identifies the incident and road restriction and states why the alternative was selected.

Use actual screenshots from the implementation when available.

Do not claim that a route is optimal unless the code compares the relevant feasible alternatives using the stated objective and constraints.

Slide 8 — Explainability and Causal Reasoning

Explain the chain from an incident to a road blockage, potential congestion, and a routing change.

Clarify that this is a simplified causal model. Congestion depends on traffic demand, remaining road capacity, signal timing, and other conditions.

A rule-based system applies explicit rules to known facts. Causal reasoning investigates why an event occurred.

A trustworthy explanation should distinguish observed facts, assumptions, and inferred conclusions.

Slide 9 — Conclusion and Next Steps

Summarize how transportation theory, graph theory, ontology modeling, graph databases, and explainability fit together.

Describe the next stage as extending the ontology, populating the knowledge graph, and testing the framework using transportation scenarios.

Conclude by emphasizing the longer-term objective: a reusable framework that connects transportation knowledge with understandable, traceable decisions.
