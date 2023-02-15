package utils;

import graph.MatrixGraph;
import model.Company;
import model.Hub;
import model.Particular;
import model.Producer;
import org.junit.Test;
import utils.Distance;
import utils.Graph;
import utils.NetworkFinder;
import static org.junit.Assert.assertEquals;


public class NetworkFinderTest
{
    @Test
    public void shortestNetworkNoProducersOrParticularsTest()
    {
        Graph<Hub, Distance> graph = new MatrixGraph<>(false);
        Company e1 = new Company("E1", 4, 6, "E1");
        Company e2 = new Company("E2", 6, 1, "E2");
        graph.addVertex(e1);
        graph.addVertex(e2);
        graph.addEdge(e1, e2, new Distance(e1.getLocalizationId(),e2.getLocalizationId(),539));

        Graph<Hub, Distance> expected = new MatrixGraph<>(false);

        NetworkFinder nf = new NetworkFinder();

        Graph<Hub, Distance> shortest = nf.shortestNetwork(graph);

        assertEquals(expected, shortest);
    }

    @Test
    public void shortestNetworkTest()
    {
        Graph<Hub, Distance> graph = new MatrixGraph<>(false);
        Hub e1 = new Company("E1", 4, 6, "E1");
        Hub e2 = new Company("E2", 6, 1, "E2");
        Hub p1 = new Producer("P1",100,100, "P1");
        Hub p2 = new Producer("P2",300,300,"P2");
        Hub p3 = new Producer("P3",400,400,"P3");
        Hub c1 = new Particular("C1",100,400,"C1");
        Hub c2 = new Particular("C2",200,600,"C2");

        graph.addVertex(e1);
        graph.addVertex(e2);

        graph.addVertex(p1);
        graph.addVertex(p2);
        graph.addVertex(p3);

        graph.addVertex(c1);
        graph.addVertex(c2);

        graph.addEdge(e1,e2,new Distance(e1.getLocalizationId(), e2.getLocalizationId(), 539));
        graph.addEdge(p1,c1,new Distance(p1.getLocalizationId(), c1.getLocalizationId(),300));
        graph.addEdge(p1,p2,new Distance(p1.getLocalizationId(), p2.getLocalizationId(),283));
        graph.addEdge(p2,p3,new Distance(p2.getLocalizationId(), p3.getLocalizationId(),141));
        graph.addEdge(p2,c1,new Distance(p2.getLocalizationId(), c1.getLocalizationId(),224));
        graph.addEdge(c1,p3,new Distance(c1.getLocalizationId(), p3.getLocalizationId(),300));
        graph.addEdge(p3,e2,new Distance(p3.getLocalizationId(), e2.getLocalizationId(),361));
        graph.addEdge(p3,e1,new Distance(p3.getLocalizationId(), e1.getLocalizationId(),200));
        graph.addEdge(e1,c2,new Distance(e1.getLocalizationId(), c2.getLocalizationId(),200));

        Graph<Hub, Distance> expected = new MatrixGraph<>(false);
        expected.addVertex(p1);
        expected.addVertex(p2);
        expected.addVertex(p3);
        expected.addVertex(c1);
        expected.addVertex(e1);
        expected.addVertex(c2);
        expected.addEdge(p1,p2,new Distance(p1.getLocalizationId(), p2.getLocalizationId(),283));
        expected.addEdge(p2,p3,new Distance(p2.getLocalizationId(), p3.getLocalizationId(),141));
        expected.addEdge(p3,c1,new Distance(p3.getLocalizationId(), c1.getLocalizationId(),300));
        expected.addEdge(p3,e1,new Distance(p3.getLocalizationId(), e1.getLocalizationId(),200));
        expected.addEdge(e1,c2,new Distance(e1.getLocalizationId(), c2.getLocalizationId(),200));

        NetworkFinder nf = new NetworkFinder();

        Graph<Hub, Distance> shortest = nf.shortestNetwork(graph);

        assertEquals(expected, shortest);
    }
}
