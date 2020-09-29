import com.rinearn.graph3d.RinearnGraph3D;
import com.rinearn.graph3d.RinearnGraph3DOptionItem;
import java.awt.event.WindowListener;
import java.awt.event.WindowEvent;

/**
 * An example of animation plottings.
 */
public class Sample4 implements Runnable, WindowListener {
	
	private Thread thread = null; // Animation thread
	private RinearnGraph3D graph = null;
	private volatile boolean continuesLoop = true; // Condition flag of the loop of the animation
	
	public static void main(String[] args) {
		new Sample4();
	}
	
	// Settings of the graph and starting of the animation thread
	public Sample4() {
		
		// Launches the graph and sets plotting options (for membrane-plotting)
		this.graph = new RinearnGraph3D();
		this.graph.setOptionSelected(RinearnGraph3DOptionItem.POINT, false);
		this.graph.setOptionSelected(RinearnGraph3DOptionItem.MEMBRANE, true);
		
		// Range setting
		this.graph.setXRange(0.0, 5.0);
		this.graph.setYRange(0.0, 5.0);
		this.graph.setZRange(-1.0, 1.0);
		this.graph.setXAutoRangingEnabled(false);
		this.graph.setYAutoRangingEnabled(false);
		this.graph.setZAutoRangingEnabled(false);
		
		// Make plottings asynchronous with updating of data (for real-time animation)
		//（This setting is not appropriate for exporting images）
		this.graph.setAsynchronousPlottingEnabled(true);
		
		// Registers the window-closing operation implemented in this code to the graph window
		// as a event listener, and disables default one
		this.graph.addWindowListener(this);
		this.graph.setAutoDisposingEnabled(false);
		
		// Creates the animation thread and start
		this.thread = new Thread(this);
		this.thread.start();
	}
	
	// The processing of the animation thread
	@Override
	public void run() {
		int n = 80; // The number of sectors of the mesh per each directions
		double[][] x = new double[n+1][n+1]; //num of vertices is num of sectors+1
		double[][] y = new double[n+1][n+1];
		double[][] z = new double[n+1][n+1];
		
		// The loop of the animation（continues "continuesLoop" is true）
		for(int frame=0; this.continuesLoop; frame++) {
			double t = frame * 0.05; // time
    	
			// Updates data (coordinate values) in arrays
			for(int i=0; i<=n; i++) {
				for(int j=0; j<=n; j++) {
					x[i][j] = i * (5.0/n);
					y[i][j] = j * (5.0/n);
					z[i][j] = Math.sin(x[i][j]-t) * Math.cos(y[i][j]+t)
							* Math.sin(Math.cos(x[i][j]+y[i][j])-2*t-0.7);
				}
			}
			
			// Transfer data to the graph
			// (The plotting will be executed asynchronous)
			this.graph.setData(x, y, z);
            
			// Waits 50 milliseconds
			try {
				Thread.sleep(50);
			} catch(InterruptedException e) {
				// Please implement exception handling code here if necessary
			}
		}
		
		// Disposes the graph when exitted from the animation loop 
		this.graph.dispose();
		
		// The end-point of the processing of the animation thread:
		// the program will end if other threads and resources are not remained
	}
	
	
	// Closing operation of the graph window
	@Override
	public void windowClosing(WindowEvent e) {
		// Exits the animation loop
		this.continuesLoop = false;
	}
	
	// Other event handlers
	@Override
	public void windowDeactivated(WindowEvent e) { }
	@Override
	public void windowActivated(WindowEvent e) { }
	@Override
	public void windowDeiconified(WindowEvent e) { }
	@Override
	public void windowIconified(WindowEvent e) { }
	@Override
	public void windowOpened(WindowEvent e) { }
	@Override
	public void windowClosed(WindowEvent e) { }

}
