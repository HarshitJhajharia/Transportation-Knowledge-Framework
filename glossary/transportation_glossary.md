Transportation Knowledge Framework: Glossary

Project: Transportation Knowledge Framework
Phase: Phase 1 — Transportation Knowledge and Explainability Foundations

## 1. Transportation Systems and Traffic Flow

### 1. Traffic Flow

The number of vehicles passing a particular point on a road per unit of time. It is commonly measured in vehicles per hour.

### 2. Traffic Density

The number of vehicles occupying a unit length of road at a given time, commonly expressed as vehicles per kilometre.

### 3. Traffic Speed

The rate at which vehicles travel along a road. Average traffic speed is an important indicator of traffic conditions.

### 4. Road Capacity

The maximum sustainable traffic flow that a road or traffic facility can accommodate under specified conditions.

### 5. Congestion

A traffic condition in which demand approaches or exceeds available road capacity, resulting in reduced speeds and increased travel times.

### 6. Bottleneck

A location where the road network’s effective capacity is reduced, restricting traffic flow and potentially causing congestion.

### 7. Traffic Shockwave

A moving boundary between traffic states, such as free-flowing and congested traffic. Shockwaves can propagate upstream when vehicles slow down or encounter a restriction.

### 8. Junction

A location where two or more roads meet or cross, allowing vehicles to change direction or move between road segments.

### 9. Road Segment

A section of road connecting two locations, such as adjacent junctions. It can be represented as an edge in a road network graph.

### 10. Signal Phase

A period during which a particular combination of traffic movements receives a specified signal indication, such as green.

### 11. Signal Cycle

The complete sequence of signal phases repeated by a traffic signal controller.

### 12. Travel Time

The time required to travel between two locations, including delays encountered along the route.

### 13. Queue Length

The number of vehicles waiting in a queue, such as at a signal, toll booth, or road obstruction.

### 14. Traffic Demand

The number of trips or vehicles seeking to use a road or transportation facility during a specified period.

### 15. Traffic State

A representation of current traffic conditions using variables such as speed, flow, density, occupancy, and congestion level.

## 2. Incident Management and Route Guidance

### 16. Traffic Incident

An unexpected event, such as a collision, vehicle breakdown, or fallen object, that disrupts normal traffic operations.

### 17. Incident Detection

The process of identifying a traffic incident using sources such as sensors, cameras, connected vehicles, or reports.

### 18. Incident Management

The coordinated process of detecting, responding to, managing, and clearing traffic incidents to restore normal road operations.

### 19. Road Closure

A restriction preventing or limiting access to a road or road segment, potentially due to an incident, construction, or emergency.

### 20. Diversion

The redirection of traffic away from an affected road or route toward an alternative path.

### 21. Route Guidance

The provision of route recommendations to help travellers reach a destination, potentially using traffic conditions, travel times, and road restrictions.

### 22. Route Optimization

The process of selecting a route that minimizes or balances an objective, such as travel time, distance, cost, or risk.

### 23. Shortest Path

A path between two nodes that minimizes the sum of edge weights. The weights may represent distance, travel time, or another cost.

### 24. Dynamic Routing

Route selection that adapts to changing conditions, such as congestion, incidents, or road closures.

### 25. Emergency Transportation

Transportation activities involving emergency services, such as ambulances, fire engines, and rescue vehicles, where timely and safe travel is important.

### 26. Emergency Vehicle Preemption

A traffic signal control strategy that modifies normal signal operation to provide an emergency vehicle with a more favourable movement through an intersection.

### 27. Emergency Vehicle Rerouting

The process of selecting an alternative route for an emergency vehicle when its current route becomes unsuitable due to congestion, closure, or another restriction.

### 28. Traffic Control

The use of signals, signs, road markings, regulations, and operational strategies to manage traffic movements and improve safety and efficiency.

## 3. Graph Theory and Knowledge Graphs

### 29. Graph

A mathematical structure consisting of vertices, also called nodes, and edges connecting pairs of vertices.

### 30. Node

A vertex in a graph. In a transportation graph, a node may represent a junction, station, or other location.

### 31. Edge

A connection between nodes. In a road network, an edge may represent a road segment connecting two junctions.

### 32. Directed Graph

A graph in which edges have a direction. It can represent one-way roads or directed relationships between entities.

### 33. Weighted Graph

A graph in which edges have associated numerical values, such as distance, estimated travel time, or congestion cost.

### 34. Connectivity

A property describing whether nodes can reach one another through paths in a graph. For directed graphs, reachability depends on edge direction.

### 35. Knowledge Graph

A graph-based representation of entities and their relationships, often enriched with properties and domain-specific meaning.

### 36. Triple

A statement consisting of a subject, predicate, and object. For example, Junction_A — CONNECTS_TO — Junction_B.

### 37. RDF

The Resource Description Framework, a W3C standard for representing information as subject-predicate-object triples.

### 38. RDFS

RDF Schema, a vocabulary for defining basic classes, properties, and class hierarchies in RDF data.

### 39. Ontology

A formal representation of concepts in a domain, including classes, relationships, properties, and constraints.

### 40. OWL

The Web Ontology Language, a W3C standard for representing ontologies with richer semantics and logical relationships than basic RDF Schema.

### 41. Property Graph

A graph model in which nodes and relationships can have labels, properties, and values. It is commonly used in graph databases such as Neo4j.

### 42. Neo4j

A graph database that stores nodes, relationships, and properties and supports querying through the Cypher query language.

### 43. Cypher

Neo4j’s declarative query language for creating, reading, updating, and deleting graph data.

### 44. Graph Traversal

The process of visiting or exploring nodes and relationships in a graph to discover connections or paths.

## 4. Explainable AI and Trustworthy Transportation Intelligence

### 45. Explainable AI (XAI)

Methods that make an AI system’s predictions or decisions understandable to people.

### 46. Rule-Based System

A system that uses explicit rules, typically expressed as IF–THEN statements, to derive conclusions or recommend actions.

### 47. Rule-Based Explanation

A human-readable justification that identifies the rule and relevant facts responsible for a system’s decision.

### 48. Human-Centric AI

An approach to AI design that considers human needs, abilities, values, oversight, and decision-making requirements.

### 49. Trustworthy AI

AI designed and evaluated with attention to properties such as reliability, safety, transparency, accountability, privacy, and fairness, as appropriate to its application.

### 50. Causal Reasoning

Reasoning about cause-and-effect relationships rather than only identifying correlations or associations.

### 51. Causal Chain

A sequence of cause-and-effect relationships. For example, an incident causes a road blockage, which contributes to congestion and motivates rerouting.

### 52. Decision Trace

A record of the facts, rules, intermediate steps, and outcomes involved in reaching a decision.

### 53. Provenance

Information about the origin of data or a conclusion, including where it came from and how it was produced.

### 54. Transparency

The degree to which relevant information about a system’s operation, inputs, limitations, and decisions is accessible and understandable.

### 55. Accountability

The ability to identify responsibility for a system’s decisions and actions and to provide appropriate oversight, review, and correction.

## 5. Project-Specific Example

Consider a road network containing several junctions and road segments.
An incident blocks one road segment, reducing the effective capacity of the affected route. Traffic begins to build up, and the estimated travel time increases. A route guidance system then recommends an alternative path for an ambulance.

The Transportation Knowledge Framework can represent:

- Entities: roads, junctions, vehicles, signals, and incidents.
- Relationships: roads connect junctions, incidents affect roads, and vehicles travel along routes.
- Rules: if a road is blocked, exclude it from feasible routes; if an alternative route has a lower estimated travel time and is safe, recommend it.
- Explanation: identify the incident, the affected road, the resulting route restriction, and the reason for recommending an alternative.

This example illustrates how transportation knowledge, graph representations, rule-based reasoning, and explanations can work together.
