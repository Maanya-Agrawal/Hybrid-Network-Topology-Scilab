// Experiment No.2
// Hybrid Topology – Bus + Ring + Star
clear;
clc;

// ------------------------------------------------------------
// STEP 8(a): Create Hybrid Topology
// ------------------------------------------------------------

NameOfNetwork = "Hybrid Topology";
NumberOfNodes = 25;

// Bus topology (1–10)
BusStart = [1 2 3 4 5 6 7 8 9];
BusEnd   = [2 3 4 5 6 7 8 9 10];

// Ring topology (11–17)
RingStart = [11 12 13 14 15 16 17];
RingEnd   = [12 13 14 15 16 17 11];

// Star topology (center = 18)
StarStart = [19 20 21 22 23 24 25];
StarEnd   = [18 18 18 18 18 18 18];

// Hybrid links
HybridStart = [10 17];
HybridEnd   = [11 18];

// Combine edges
StartNodes = [BusStart RingStart StarStart HybridStart];
EndNodes   = [BusEnd   RingEnd   StarEnd   HybridEnd];

// Node coordinates
X = [100 200 300 400 500 600 700 800 900 1000 ...
     600 650 700 750 700 650 600 ...
     1200 ...
     1100 1200 1300 1100 1300 1200 1200];

Y = [300 300 300 300 300 300 300 300 300 300 ...
     600 650 700 650 600 550 600 ...
     600 ...
     500 500 500 700 700 800 400];

// Create graph
TopologyGraph = NL_G_MakeGraph( ...
    NameOfNetwork, NumberOfNodes, ...
    StartNodes, EndNodes, X, Y);

// ------------------------------------------------------------
// STEP 8(a): Display topology
// ------------------------------------------------------------
NL_G_ShowGraph(TopologyGraph, 1);
xtitle("Hybrid Topology", "X-Nodes", "Y-Nodes");

// ------------------------------------------------------------
// STEP 8(b): Node & Edge numbers
// ------------------------------------------------------------
NL_G_ShowGraphNE(TopologyGraph, 2);
xtitle("Node and Edge Numbers", "X-Nodes", "Y-Nodes");

// ------------------------------------------------------------
// STEP 8(c): Colour nodes
// ------------------------------------------------------------
[Graph1, Nodes] = NL_G_HighlightNodes( ...
    TopologyGraph, ...
    [1 5 10 11 14 18 22], ...
    30, 10, 25, 3);
xtitle("Coloured Nodes", "X-Nodes", "Y-Nodes");

// ------------------------------------------------------------
// STEP 8(c): Colour edges
// ------------------------------------------------------------
[Graph2, Edges] = NL_G_HighlightEdges( ...
    TopologyGraph, ...
    [1 5 10 15], ...
    5, 5, 4);
xtitle("Coloured Edges", "X-Nodes", "Y-Nodes");

// ------------------------------------------------------------
// STEP 8(d): Number of edges connected to each node
// (USING NARVAL FUNCTION — NO LOGIC)
// ------------------------------------------------------------

disp("Number of edges connected to each node:");

EdgeCount = zeros(1, NumberOfNodes);

for i = 1:NumberOfNodes
    EdgeList = NL_G_EdgesOfNode(TopologyGraph, i);
    EdgeCount(i) = length(EdgeList);
    disp("Node " + string(i) + " -> " + string(EdgeCount(i)) + " edges");
end

// Node with maximum edges (manual, no max())
MaxEdges = EdgeCount(1);
MaxNode = 1;

for i = 2:NumberOfNodes
    if EdgeCount(i) > MaxEdges then
        MaxEdges = EdgeCount(i);
        MaxNode = i;
    end
end

disp("Node with maximum edges:");
disp(MaxNode);
disp("Maximum number of edges:");
disp(MaxEdges);

// ------------------------------------------------------------
// STEP 8(e): Total nodes and edges
// ------------------------------------------------------------

[TotalNodes, TotalEdges] = NL_G_GraphSize(TopologyGraph);
disp("Total number of nodes:");
disp(TotalNodes);
disp("Total number of edges:");
disp(TotalEdges);
