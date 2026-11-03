Transportation Knowledge Framework

Research Notebook — Phase 1

Phase: Transportation Knowledge and Explainability Foundations
Focus: Transportation Systems, Knowledge Graphs, and Explainable AI

Purpose: Establish the domain knowledge required to model transportation networks, reason about traffic conditions, and explain routing decisions.

Part I: Transportation Systems

1. Traffic Flow Fundamentals

Traffic flow describes how vehicles move through a transportation network. Understanding traffic flow helps identify congestion, estimate travel times, and support routing decisions.

1.1 Fundamental Variables

Variable Symbol Meaning Common Unit
Traffic flow q Number of vehicles passing a point per unit time vehicles/hour
Traffic density k Number of vehicles occupying a unit length of road vehicles/km
Space-mean speed v Average speed calculated over a road section km/hour
Travel time T Time required to travel between two locations seconds or minutes
Road capacity — Maximum sustainable flow under specified conditions vehicles/hour

A commonly used relationship in traffic flow theory is:

q = k × v

Flow equals density multiplied by space-mean speed, provided the variables use compatible definitions and units.

1.2 Free-Flow and Congested Traffic

- Free-flow traffic: Vehicles generally travel at their desired speeds with relatively little interference from other vehicles.
- Congested traffic: Vehicle interactions and traffic demand reduce speeds and may create queues.
- Bottleneck: A location where available traffic capacity is restricted, causing vehicles to accumulate upstream.

  1.3 Congestion Formation

Congestion may form when traffic demand approaches or exceeds available road capacity.

Common causes include:

1. High traffic demand.
2. Road incidents or lane closures.
3. Roadworks and temporary restrictions.
4. Poorly coordinated traffic signals.
5. Bottlenecks near junctions or merges.

Congestion can propagate upstream as vehicles slow down and queues grow. Changes in traffic conditions can also produce traffic shockwaves.

1.4 Relevance to the Project

The Transportation Knowledge Framework can represent road capacity, traffic conditions, bottlenecks, and congestion as domain concepts.

These concepts can support rules such as:

- If a road is blocked, it is unavailable for normal route planning.
- If estimated travel time rises significantly, the road may be experiencing a delay.
- If an alternative feasible route has a lower estimated travel time, a routing system may recommend it.

These are illustrative rules. A practical system requires appropriate traffic data, thresholds, and safety constraints.

2. Incident Management

A traffic incident is an unexpected event that disrupts normal transportation operations. Examples include collisions, vehicle breakdowns, fallen objects, and other road obstructions.

2.1 Incident Management Lifecycle

1. Detection: Identify an incident using sensors, cameras, connected vehicles, or reports.
2. Verification: Confirm the incident and determine its location and severity.
3. Assessment: Evaluate affected lanes, expected delays, and potential safety risks.
4. Response: Coordinate emergency services, traffic control, and road-user information.
5. Traffic management: Apply suitable measures, such as closures or diversions.
6. Recovery: Clear the incident and restore normal traffic operations.
7. Evaluation: Review the response to identify improvements.

2.2 Why Incident Knowledge Matters

An incident is more than an isolated event. Its effects may extend to connected roads, nearby junctions, emergency response times, and route recommendations.

Representing these relationships in a knowledge graph can help answer questions such as:

- Which roads are affected by an incident?
- Which junctions may become difficult to reach?
- Which routes avoid the affected road?
- Why was a particular road excluded from a recommendation?

  2.3 Relevance to the Project

The ontology can represent an Incident class and relationships such as:

- Blocks
- LocatedAt
- Causes

A knowledge graph can connect incidents to roads and junctions, supporting structured queries and rule-based explanations.

These properties are proposed examples for the project ontology, not a prescribed transportation standard.

3. Route Guidance

Route guidance recommends a path between an origin and a destination using information such as distance, estimated travel time, road restrictions, and traffic conditions.

3.1 Static and Dynamic Routing

Static routing uses relatively fixed information, such as road distances or predetermined route costs.

Dynamic routing updates route recommendations when relevant conditions change, such as congestion, incidents, or closures.

3.2 Shortest Path

A shortest-path algorithm identifies a path that minimizes the sum of edge weights.

For a transportation network, the weight may represent:

- Distance.
- Estimated travel time.
- Monetary cost.
- A defined combination of travel cost and other factors.

The shortest-distance route is not necessarily the fastest route. The result depends on the chosen edge weights.

3.3 Routing Under Incidents

When an incident blocks a road, a routing system may exclude that road from feasible routes and recalculate a path.

A useful decision process is:

1. Identify the incident and affected road.
2. Determine whether the road is unavailable or has increased travel cost.
3. Identify feasible alternative paths.
4. Compare their estimated costs.
5. Recommend an appropriate alternative.

Actual route selection must also consider road access restrictions, vehicle dimensions, emergency-service requirements, and safety constraints where relevant.

3.4 Relevance to the Project

The road network can be represented as a graph:

- Nodes: Junctions.
- Edges: Road segments.
- Edge properties: Distance, travel time, and road status.

Graph algorithms can calculate paths, while a knowledge graph can provide additional context about incidents, road restrictions, and transportation entities.

4. Emergency Transportation

Emergency transportation involves moving emergency vehicles, personnel, or resources to locations where timely assistance is required.

Examples include ambulances travelling to medical emergencies and fire engines responding to fires.

4.1 Main Challenges

- Congestion and unpredictable travel times.
- Blocked roads and traffic incidents.
- Restricted road access.
- Delays at intersections.
- The need to balance response time with safety.

  4.2 Emergency Vehicle Preemption

Emergency vehicle preemption modifies traffic signal operation to favour an approaching emergency vehicle’s movement through an intersection.

Preemption differs from ordinary traffic signal coordination because it temporarily prioritizes an emergency movement when appropriate.

Preemption must be implemented with suitable safeguards to protect pedestrians and other road users.

4.3 Emergency Vehicle Rerouting

An emergency vehicle may need a different route when its original route becomes blocked or significantly delayed.

A knowledge-driven routing system could combine:

- The vehicle’s origin and destination.
- Road connectivity.
- Incident locations.
- Road closures.
- Estimated travel times.
- Vehicle-specific restrictions.

  4.4 Relevance to the Project

The framework can represent emergency vehicles, roads, incidents, and routing decisions as connected entities.

For example:

“The ambulance was rerouted because an incident blocked Road R2. The alternative route avoids R2 and has a lower estimated travel time among the feasible routes considered.”

This explanation is illustrative. A real system would require verified incident information, reliable travel-time estimates, and appropriate emergency-routing constraints.

Part II: Knowledge Graphs and Ontologies

5. Knowledge Graphs and Graph Theory

5.1 What Is a Knowledge Graph?

A knowledge graph represents real-world entities and their relationships in a graph structure. Entities may represent roads, junctions, vehicles, traffic signals, or incidents.

For example:

Junction_A → CONNECTS_TO → Junction_B

This statement represents a relationship between two junctions. Additional relationships can describe road conditions, incidents, and vehicle movements.

Why Use Knowledge Graphs for Transportation?

Transportation systems contain many interconnected entities. A knowledge graph can represent these relationships explicitly, making it possible to query connected information and combine facts from different sources.

Potential applications include:

- Identifying roads affected by incidents.
- Finding alternative paths between junctions.
- Connecting traffic conditions to routing decisions.
- Tracing the facts supporting an explanation.
- Integrating information from different transportation systems.

A knowledge graph does not automatically guarantee accurate information or explainable decisions. Its usefulness depends on data quality, its schema, and the reasoning methods applied to it.

5.2 Graph Theory Fundamentals

Graph theory provides the mathematical foundation for representing transportation networks.

A graph is commonly written as:

G = (V, E)

Where:

- V: The set of vertices or nodes.
- E: The set of edges connecting nodes.

For a road network:

- Nodes represent junctions.
- Edges represent road segments.
- Edge weights may represent distance or estimated travel time.
- Directed edges represent permitted travel direction.

Graph algorithms can identify paths, check connectivity, and calculate shortest routes.

5.3 Knowledge Graphs vs. Relational Databases

A relational database stores structured information in tables connected through keys. A knowledge graph represents entities and their relationships directly as graph elements.

Feature Relational Database Knowledge Graph
Main structure Tables and rows Entities and relationships
Relationships Foreign keys and joins Explicit graph relationships
Schema Usually defined through tables and constraints Depends on the graph model and schema approach
Relationship traversal Often uses joins or recursive queries Uses graph traversal and relationship patterns
Complex network queries Possible, but may require multiple joins Often natural to express as graph patterns
Reasoning Can use application logic and database features Can use graph queries, rules, or ontology-based reasoning
Typical use Structured transactions and records Highly interconnected information and relationship analysis

Key takeaway: These approaches are complementary rather than mutually exclusive. A transportation application may use a relational database for operational records and a knowledge graph for connected domain knowledge.

5.4 RDF and Triples

The Resource Description Framework (RDF) is a W3C standard for representing information as triples.

Each triple contains:

1. Subject: The entity being described.
2. Predicate: The relationship or property.
3. Object: The related entity or value.

Example:

Junction_A — connectsTo — Junction_B

In Turtle syntax:

@prefix ex: <http://example.org/transport#> .
ex:Junction_A ex:connectsTo ex:Junction_B .

This represents a relationship between two resources.

RDF is useful when information needs to be represented using a standardized, machine-readable graph model.

5.5 RDFS and OWL

RDF Schema (RDFS)

RDFS provides vocabulary for defining classes, properties, and class hierarchies.

For example, a transportation ontology might define Road as a subclass of TransportationAsset.

Web Ontology Language (OWL)

OWL supports richer logical constructs, such as class restrictions, property characteristics, and logical class relationships.

OWL reasoning may derive additional facts from explicitly represented axioms. The conclusions depend on the ontology’s semantics and the capabilities of the reasoner being used.

Why Are Ontologies Useful?

An ontology defines the concepts and relationships used to describe a domain.

For this project, the initial ontology will contain:

Classes

- Road
- Junction
- Vehicle
- Signal
- Incident

Example properties

- connectsTo
- Blocks
- LocatedAt
- Causes

These classes and properties establish a shared vocabulary for the transportation domain.

The initial ontology is intentionally small. It can be extended later with traffic conditions, emergency vehicles, road closures, and routing decisions.

5.6 RDF vs. Property Graphs

RDF and property graphs both represent connected information, but their data models differ.

Feature RDF Graph Property Graph
Basic representation Subject-predicate-object triples Nodes, relationships, and properties
Relationship representation Predicates connect resources Relationships connect nodes and can have properties
Schema and semantics Can use RDFS and OWL Often defined through labels, properties, constraints, and application logic
Query language SPARQL Cypher in Neo4j
Common use Semantic Web and interoperable knowledge representation Graph applications, traversal, and network analysis

Neither model is universally superior. The choice depends on interoperability requirements, data structure, query patterns, reasoning needs, and implementation constraints.

For this project, RDF/OWL will be used to explore ontology modeling, while Neo4j will be used to explore property-graph storage and querying.

The two representations do not automatically share data or semantics without an appropriate mapping or integration process.

5.7 Neo4j and Cypher

Neo4j is a graph database that stores nodes, relationships, and properties.

For example, a transportation network could contain:

- Nodes labelled Junction.
- Relationships labelled CONNECTS_TO.
- Relationship properties such as distance and travelTime.

A simple Cypher query is:

MATCH (a:Junction)-[r:CONNECTS_TO]->(b:Junction)
RETURN a, r, b;

This query finds directed CONNECTS_TO relationships between junction nodes.

Neo4j is useful for querying network structure, traversing relationships, and representing connected transportation information.

It is important to distinguish graph storage from reasoning: Neo4j queries can implement application-specific rules, but installing Neo4j alone does not provide automatic OWL reasoning.

5.8 How the Technologies Fit Together

Technology Role in the Project
Graph theory Mathematical foundation for representing and analysing road networks
NetworkX Python library for graph algorithms and network analysis
RDF Standard representation for graph-based statements
OWL Formal ontology modeling and logical semantics
RDFLib Python library for working with RDF graphs
Owlready2 Python library for working with OWL ontologies
Neo4j Property-graph database for storing and querying transportation networks
Cypher Query language for interacting with Neo4j

The intended workflow is:

1. Define transportation concepts using an ontology.
2. Represent a small road network as a graph.
3. Store and query network relationships in Neo4j.
4. Apply rules to selected transportation scenarios.
5. Generate explanations that connect decisions to relevant facts.

This workflow is a project design, not a claim that all components have already been integrated.

5.9 Key Takeaways

1. Graph theory provides algorithms for analysing network structure and finding routes.
2. Knowledge graphs represent transportation entities and their relationships.
3. Ontologies define a formal vocabulary for concepts and relationships.
4. RDF provides a standardized triple-based representation.
5. OWL supports richer ontology semantics and logical reasoning.
6. Neo4j provides property-graph storage and querying through Cypher.
7. RDF/OWL and Neo4j serve different but potentially complementary roles.
8. A transportation knowledge framework can connect domain concepts, network data, and rule-based decision explanations.

Part III: Explainable AI and Causal Reasoning

6. Explainable Artificial Intelligence (XAI)

6.1 What Is Explainable AI?

Explainable Artificial Intelligence (XAI) refers to methods that help people understand how an AI system produces predictions, recommendations, or decisions.

In transportation, an intelligent system might recommend an alternative route because of an incident or a predicted delay. An explanation should communicate the relevant evidence and reasoning behind that recommendation.

Why Is Explainability Important in Transportation?

Transportation decisions can affect travel time, road safety, emergency response, and the allocation of limited resources.

An explanation can help users:

- Understand why a route was selected.
- Identify the traffic conditions affecting a recommendation.
- Check whether a road closure influenced the decision.
- Detect missing, outdated, or incorrect information.
- Review the reasoning before acting on a recommendation.

An explanation does not automatically make a decision correct or safe. The underlying data, decision logic, and operating constraints must also be evaluated.

6.2 Rule-Based Systems

A rule-based system uses explicitly defined rules to derive conclusions or recommend actions.

Rules are commonly expressed using IF–THEN statements.

Example 1

IF a road is confirmed to be blocked,
THEN exclude that road from feasible routes.

Example 2

IF an alternative route is feasible and has a lower estimated travel time,
THEN recommend evaluating that route.

The second rule is illustrative rather than a complete emergency-routing policy. A practical system must also account for safety, access restrictions, uncertainty, and other relevant constraints.

Advantages

- Rules are explicit and relatively easy to inspect.
- The decision logic can be tested against known scenarios.
- Explanations can identify the rule and facts that led to a recommendation.
- Domain experts can review and revise the rules.

Limitations

- Rules must be maintained as conditions and requirements change.
- Conflicting rules may require a priority or conflict-resolution strategy.
- Incomplete or incorrect input data can produce unsuitable conclusions.
- Complex environments may require more sophisticated reasoning.

  6.3 Rule-Based Explanations

A rule-based explanation describes the relevant facts and rules behind a system’s decision.

Observed facts

- An incident has been reported on Road R2.
- Road R2 is confirmed to be blocked.
- The original ambulance route uses Road R2.
- An alternative route is feasible and has a lower estimated travel time than other feasible routes considered.

Decision: Recommend the alternative route.

Human-readable explanation:

“The ambulance was rerouted because an incident blocked Road R2, making the original route unavailable. The recommended alternative avoids the blocked road and has the lowest estimated travel time among the feasible routes evaluated.”

The example assumes the incident and travel-time information have been verified and that the alternative route satisfies the applicable emergency-vehicle constraints.

6.4 Human-Centric AI

Human-centric AI considers the needs, abilities, responsibilities, and values of people who interact with an AI system or are affected by its decisions.

Different transportation users may need different explanations.

User Information That May Be Useful
Traffic operator Incident location, affected roads, and network-level consequences
Emergency dispatcher Route feasibility, estimated travel time, and important restrictions
Driver Recommended route and relevant road closures
Transportation researcher Data sources, decision rules, assumptions, and evaluation results

An explanation should be understandable to its intended audience without hiding important uncertainty or limitations.

Human oversight is especially important when recommendations have safety implications.

6.5 Trustworthy AI

Trustworthy AI refers to AI systems designed and evaluated with attention to properties such as reliability, safety, transparency, accountability, and fairness, as appropriate to the application.

For transportation applications, relevant considerations include:

- Reliability: Does the system behave consistently under the conditions for which it was designed?
- Safety: Does it account for relevant road restrictions and operational hazards?
- Transparency: Can users understand the basis of its recommendations?
- Accountability: Can decisions be reviewed and responsibility established?
- Privacy: Is personal or location data handled appropriately?
- Robustness: Does the system handle unexpected or incomplete inputs appropriately?

Explainability contributes to transparency, but it does not guarantee trustworthiness.

A system can provide a convincing explanation for a recommendation based on incorrect data. Trustworthy operation therefore requires appropriate validation, monitoring, and safeguards.

7. Causal Reasoning

7.1 What Is Causal Reasoning?

Causal reasoning examines cause-and-effect relationships.

It differs from identifying correlations or associations: two events may occur together without one necessarily causing the other.

For example, an incident may cause a lane closure, which reduces available road capacity and contributes to congestion. However, congestion may also depend on traffic demand, signal timing, and other factors.

A causal explanation should distinguish verified causes from plausible contributing factors.

7.2 A Transportation Causal Chain

Consider the following illustrative chain:

Incident → Road Blockage → Reduced Available Capacity → Congestion → Route Change

1. Incident → Road Blockage: An incident may cause a road to become blocked.
2. Road Blockage → Reduced Available Capacity: Blocking a road or lane can reduce the capacity available to traffic.
3. Reduced Available Capacity → Congestion: If traffic demand exceeds the remaining capacity, congestion may develop or worsen.
4. Congestion or Blockage → Route Change: A routing system may select another feasible route to avoid the affected road or reduce travel time.

This chain is a simplified model. Congestion is not inevitable after every incident, and the strength of each causal relationship depends on the circumstances.

7.3 Causal Reasoning vs. Rule-Based Reasoning

Aspect Rule-Based Reasoning Causal Reasoning
Main question What conclusion follows from the stated facts and rules? What caused an observed outcome?
Basis Explicit rules and known facts Cause-and-effect assumptions, evidence, and potentially causal models
Example If Road R2 is blocked, exclude it from feasible routes Blocking Road R2 reduced available capacity and contributed to congestion
Main limitation Rules may not capture all relevant conditions Causal relationships may be uncertain or confounded

A rule can encode a causal assumption, but writing a rule does not establish that its causal claim is scientifically valid.

7.4 Representing Explanations with a Knowledge Graph

A transportation knowledge graph can store entities and relationships associated with an event.

For example:

- Incident_1 AFFECTS Road_R2
- Incident_1 CAUSES Road_Blockage_1
- Road_Blockage_1 REDUCES_AVAILABLE_CAPACITY Road_R2
- Congestion_1 OCCURS_ON Road_R2
- Reroute_Decision_1 AVOIDS Road_R2

These are illustrative relationship names for the project, not standardized transportation vocabulary.

The graph can connect the relevant facts so that a query or explanation generator can retrieve information supporting a routing decision.

However, storing a relationship labelled CAUSES does not itself prove causation. The relationship must be supported by suitable evidence or explicitly identified as a modeling assumption.

7.5 Proposed Explainability Workflow

The Transportation Knowledge Framework can use the following workflow:

1. Observe: Receive information about a road, vehicle, or incident.
2. Represent: Store relevant entities and relationships in a structured form.
3. Evaluate: Determine whether the affected road is blocked or unsuitable.
4. Reason: Apply explicit rules to identify feasible actions.
5. Explain: Present the relevant facts, rules, and assumptions behind the decision.
6. Review: Allow a user to assess the recommendation and its limitations.

This workflow is a proposed design for the project. Its actual effectiveness will depend on the implementation and evaluation.

8. Research Directions

The Phase 1 foundations suggest several possible research directions for transportation intelligence.

8.1 Knowledge-Graph-Based Transportation Reasoning

Investigate how structured relationships between roads, junctions, incidents, and vehicles can support connected queries and decision-making.

8.2 Explainable Route Guidance

Explore how routing recommendations can be accompanied by understandable explanations identifying affected roads, relevant incidents, and decision criteria.

8.3 Ontology-Driven Data Integration

Investigate how a shared transportation vocabulary can help integrate information from different sources while preserving consistent meanings.

8.4 Causal Explanations for Traffic Events

Explore how incident information and network relationships can support explanations of congestion and routing changes, while distinguishing established evidence from assumptions.

These are possible research directions, not claims that the proposed methods have already been evaluated or shown to outperform existing systems.

9. Overall Phase 1 Summary

Phase 1 establishes the foundations for a reusable Transportation Knowledge Framework.

Transportation theory provides the domain concepts. Graph theory supports network representation and route analysis. Ontologies establish a shared vocabulary, while knowledge graphs connect roads, junctions, vehicles, and incidents.

Rule-based reasoning can derive decisions from explicit facts and rules. Explainable AI can then present the relevant information behind those decisions, while causal reasoning helps organize potential cause-and-effect relationships.

10. Selected Research Papers and Further Reading

This section identifies research relevant to transportation knowledge graphs, ontology-based knowledge representation, route prediction, and explainable transportation intelligence.

The papers are intended to support future literature review and survey-paper development. They have not all been read in full as part of this Phase 1 notebook.

10.1 Transportation Knowledge Graphs

Paper 1: Mobility Knowledge Graph: Review and Its Application in Public Transport

Authors: Qi Zhang, Zhenliang Ma, Erik Jenelius, and Pengfei Zhang
Publication: Transportation, published online in 2023; volume 52, pages 1119–1145, 2025.
Link: https://doi.org/10.1007/s11116-023-10451-8

Why it is relevant: This paper reviews mobility knowledge graphs and discusses their application to public transport. It provides useful background on representing mobility information as connected knowledge.

What to look for when reading:

- How a mobility knowledge graph is defined.
- What types of transportation data can be integrated.
- How knowledge graphs support mobility analysis.

Paper 2: Survey of Dynamic Knowledge Graph for Urban Traffic: Construction, Representation and Application

Authors: Yihan Liu, Nianwen Ning, Donglin Yang, Wei Li, Bin Wu, and Yi Zhou
Publication: Journal of Geo-information Science, 2024, volume 26, issue 4, pages 946–966.
Link: https://doi.org/10.12082/dqxxkx.2024.230572

Why it is relevant: This survey focuses on dynamic knowledge graphs for urban traffic. It is particularly useful for understanding how transportation knowledge can change as traffic conditions and events evolve.

What to look for when reading:

- Methods for constructing traffic knowledge graphs.
- Representation of changing traffic information.
- Applications of dynamic knowledge graphs in urban traffic.

Paper 3: A Review of Knowledge Graph Construction Using Large Language Models in Transportation: Problems, Methods, and Challenges

Authors: Yancheng Ling, Zhenlin Qin, and Zhenliang Ma
Publication: Transportation Research Part C: Emerging Technologies, 2026, volume 183, article 105428.
Link: https://doi.org/10.1016/j.trc.2025.105428

Why it is relevant: This review examines the use of large language models to construct transportation knowledge graphs. It discusses construction approaches and challenges involving models, data, and computing.

What to look for when reading:

- How transportation knowledge can be extracted from different sources.
- How ontologies can guide knowledge graph construction.
- What challenges arise when automating graph construction with language models.

Priority: Read the abstract and introduction first. This paper is especially relevant if the project later expands toward automated knowledge extraction.

10.2 Knowledge Graphs for Route Prediction and Autonomous Driving

Paper 4: RouteKG: A Knowledge Graph-Based Framework for Route Prediction on Road Networks

Authors: Yihong Tang, Zhan Zhao, Weipeng Deng, Shuyu Lei, Yuebing Liang, and Zhenliang Ma
Publication: IEEE Transactions on Intelligent Transportation Systems, 2025, volume 26, issue 12, pages 22277–22295.
Link: https://doi.org/10.1109/TITS.2025.3615448

Why it is relevant: This paper investigates knowledge graphs for route prediction on road networks. It is closely related to the project’s interest in representing roads and their relationships.

What to look for when reading:

- How road networks are represented.
- How spatial relationships contribute to route prediction.
- How the proposed framework differs from approaches based only on sequential travel patterns.

Important distinction: Route prediction estimates likely travel behaviour; shortest-path routing selects a path according to a defined cost function. They are related but different tasks.

Paper 5: Integrating Knowledge Graphs into Autonomous Vehicle Technologies: A Survey of Current State and Future Directions

Authors: Swe Nwe Nwe Htun and Ken Fukuda
Publication: Information, 2024, volume 15, issue 10, article 645.
Link: https://doi.org/10.3390/info15100645

Why it is relevant: This open-access survey discusses knowledge graphs in autonomous vehicle technologies, including the challenges of integrating information and supporting intelligent transportation applications.

What to look for when reading:

- How knowledge graphs support autonomous vehicle systems.
- The role of structured knowledge in decision-making.
- Research gaps involving reliability, integration, and future applications.

  10.3 Explainable AI and Trustworthy Transportation

Paper 6: Explanations in Autonomous Driving: A Survey

Authors: Daniel Omeiza, Helena Webb, Marina Jirotka, and Lindsay Kunze
Publication: IEEE Transactions on Intelligent Transportation Systems, 2022, volume 23, issue 8, pages 10142–10162.
Link: https://doi.org/10.1109/TITS.2021.3122865

Why it is relevant: This survey examines explanations for autonomous driving, including stakeholder needs and explanations for different vehicle operations.

What to look for when reading:

- Why different users need explanations.
- How explanation requirements vary by stakeholder.
- What challenges remain in making transportation decisions understandable.

Paper 7: Explainable AI for Safe and Trustworthy Autonomous Driving: A Systematic Review

Authors: Anton Kuznietsov, Balint Gyevnar, Cheng Wang, Steven Peters, and Stefano V. Albrecht
Publication: IEEE Transactions on Intelligent Transportation Systems, 2024, volume 25, issue 12, pages 19342–19364.
Link: https://doi.org/10.1109/TITS.2024.3474469

Why it is relevant: This systematic review connects explainability with safety and trustworthiness in autonomous driving. It provides a useful framework for thinking about how explanations should be designed and evaluated.

What to look for when reading:

- Different categories of explainability methods.
- The relationship between explanations and safety assurance.
- How explanations can support monitoring and validation.

Paper 8: Explainable Artificial Intelligence for Autonomous Driving: A Comprehensive Overview and Field Guide for Future Research Directions

Publication: IEEE Access, 2024, volume 12, pages 101603–101625.
Link: https://doi.org/10.1109/ACCESS.2024.3431437

Why it is relevant: This review surveys explainable AI methods for autonomous driving and discusses potential approaches for improving transparency and trust.

What to look for when reading:

- Different approaches to explaining driving decisions.
- The strengths and limitations of explanation methods.
- Potential directions for future explainable transportation systems.

11. Suggested Reading Strategy

Given the project’s three-day timeline, the immediate goal is to identify relevant literature rather than read all eight papers in full.

First Priority: Read the Abstract and Introduction

Start with:

1. Mobility Knowledge Graph: Review and Its Application in Public Transport
2. Survey of Dynamic Knowledge Graph for Urban Traffic
3. Explanations in Autonomous Driving: A Survey
4. Explainable AI for Safe and Trustworthy Autonomous Driving: A Systematic Review

These provide a useful starting point for understanding the knowledge graph and explainability research landscape.

Second Priority: Explore Application-Specific Work

Next, examine:

5. RouteKG: A Knowledge Graph-Based Framework for Route Prediction on Road Networks
6. Integrating Knowledge Graphs into Autonomous Vehicle Technologies
7. A Review of Knowledge Graph Construction Using Large Language Models in Transportation
8. Explainable Artificial Intelligence for Autonomous Driving

Focus on the methods, system architectures, evaluation criteria, and stated research limitations.

11.1 Literature Review Extraction Template

For each paper, record the following information:

Field What to Record
Citation Authors, year, title, venue, DOI
Research problem What problem does the paper address?
Method What model, framework, or approach is proposed?
Data What datasets or information sources are used?
Main findings What are the paper’s main results or contributions?
Limitations What limitations do the authors identify?
Relevance How does the paper relate to the Transportation Knowledge Framework?
Research gap What question remains open for further investigation?

Do not invent results or limitations. Extract them from the paper itself when you read it.

12. Initial Research Gap to Investigate

A possible research direction for this project is the integration of:

1. A reusable transportation ontology.
2. A graph representation of roads, junctions, vehicles, and incidents.
3. Rule-based reasoning for routing decisions.
4. Human-readable explanations that trace decisions to relevant facts.

The project can investigate how these components work together in small transportation scenarios.
