import com.rinearn.graph3d.RinearnGraph3D;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * An example to plot a graph from a file.
 */
public class Sample1 {

	public static void main(String[] args) {
		
		// Launches the graph
		RinearnGraph3D graph = new RinearnGraph3D();
		
		try {
			
			// Plots data stored in a file
			graph.openDataFile(new File("SampleDataFile1.txt"));
			
		// Exception handling
		} catch (FileNotFoundException fnfe) {
			System.err.println("The file is not found");
		} catch (IOException ioe) {
			System.err.println("The file can not be opened");
		}
	}
}