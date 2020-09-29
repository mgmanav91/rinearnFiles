import com.rinearn.graph3d.RinearnGraph3D;
import com.rinearn.graph3d.RinearnGraph3DOptionItem;

/**
 * An example to plot a mesh-graph from arrays.
 */
public class Sample3 {

	public static void main(String[] args) {
		
		// Stores coordinate values in arrays
		int n = 80; // The number of sectors of the mesh per each directions
		double[][] x = new double[n+1][n+1]; //num of vertices is num of sectors+1
		double[][] y = new double[n+1][n+1];
		double[][] z = new double[n+1][n+1];
		for(int i=0; i<=n; i++) {
			for(int j=0; j<=n; j++) {
				x[i][j] = i * 0.1;
				y[i][j] = j * 0.1;
				z[i][j] = Math.sin(x[i][j]) * Math.sin(y[i][j]);
			}
		}
		
		// Launches graph, and plots data stored in arrays
		RinearnGraph3D graph = new RinearnGraph3D();
		graph.setData(x, y, z);
		
		// Settings of plotting options
		// (disables point-plotting and enables mesh-plotting)
		graph.setOptionSelected(RinearnGraph3DOptionItem.POINT, false);
		graph.setOptionSelected(RinearnGraph3DOptionItem.MESH, true);
		
		// Range settings
		graph.setXRange(0.0, 5.0);
		graph.setYRange(0.0, 5.0);
		graph.setZRange(-1.0, 1.0);
	}
}