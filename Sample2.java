import com.rinearn.graph3d.RinearnGraph3D;

/**
 * An example to plot a graph from arrays.
 */
public class Sample2 {

	public static void main(String[] args) {
		
		// Stores coordinate values in arrays
		int n = 300;
		double[] x = new double[n];
		double[] y = new double[n];
		double[] z = new double[n];
		for(int i=0; i<n; i++) {
			x[i] = i*0.1;
			y[i] = Math.sin(x[i]);
			z[i] = Math.cos(x[i]);
		}
		
		// Plots data stored in arrays
		RinearnGraph3D graph = new RinearnGraph3D();
		graph.setData(x, y, z);
	}
}