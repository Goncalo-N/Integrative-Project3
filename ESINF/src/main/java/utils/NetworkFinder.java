package utils;

import graph.Algorithms;
import graph.Edge;
import graph.MatrixGraph;
import model.Hub;
import model.Particular;
import model.Producer;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;


public class NetworkFinder
{
	/**
	 * Builds a Graph with the Shortest Network
	 *
	 * @param graph
	 * @return a graph with the shortestNetwork that includes all Particulars and Producers
	 */
	public Graph<Hub, Distance> shortestNetwork(Graph<Hub, Distance> graph)
	{
		//find one Particular or Producer to start with
		Hub start = null;
		for (Hub h : graph.vertices()) {
			if (h instanceof Particular || h instanceof Producer) {
				start = h;
				break;
			}
		}
		//no Producer or Particular found
		if (start == null)
			return new MatrixGraph<Hub, Distance>(false);

		//build list of remaining vertices
		List<Hub> remaining = new ArrayList<Hub>();
		for (Hub h : graph.vertices()) {
			if (h instanceof Particular || h instanceof Producer) {
				if (!h.equals(start))
					remaining.add(h);
			}
		}

		LinkedList<Hub> totalPath = new LinkedList<>();

		int min = -1;

		Hub minHub=null;
		while(!remaining.isEmpty()) {
			LinkedList<Hub> minPath = null;
			for (Hub h : remaining) {
				LinkedList<Hub> p = new LinkedList<>();
				Hub st = start;
				Distance d = Algorithms.shortestPath(graph, start, h,
						(d1, d2) -> d1.getDistance() - d2.getDistance(),
						(sum, d1) -> new Distance(st.toString(), h.toString(),sum.getDistance() + d1.getDistance()),
						new Distance("id1","id2", 0), p);
				if (minPath == null || d.getDistance() < min) {
					min = d.getDistance();
					minPath = p;
					minHub = h;
				}
			}
			//remove the first vertex on all subsequent paths except the first
			if (!totalPath.isEmpty())
				minPath.remove(0);
			remaining.remove(minHub);
			totalPath.addAll(minPath);
			start = minHub;
		}

		//build the network graph
		MatrixGraph<Hub, Distance> network = new MatrixGraph<Hub, Distance>(false);
		for (Hub h : totalPath) {
			network.addVertex(h);
		}
		Hub from = totalPath.get(0);
		for (int i = 1; i < totalPath.size(); i++) {
			Hub to = totalPath.get(i);
			Edge<Hub, Distance> e = graph.edge(from, to);
			Distance d = e.getWeight();
			network.addEdge(from, to, d);
			from=to;
		}
		return network;
	}
}
