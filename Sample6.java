import com.rinearn.graph3d.RinearnGraph3D;
import com.rinearn.graph3d.renderer.RinearnGraph3DRenderer;
import com.rinearn.graph3d.event.RinearnGraph3DPlottingEvent;
import com.rinearn.graph3d.event.RinearnGraph3DPlottingListener;
import java.awt.Color;

/**
 * An example to draw shapes by calling APIs of the renderer
 * (and handling the event which occurs when re-drawing (re-plotting) is necessary).
 */
public class Sample6 implements RinearnGraph3DPlottingListener {
	
	RinearnGraph3D graph;
	RinearnGraph3DRenderer renderer;
	
	public static void main(String[] args) {
		new Sample6();
	}
	
	// Initialization
	public Sample6() {
	
		// Lanches the graph and gets the instance of the graphics engine (renderer)
		this.graph = new RinearnGraph3D();
		this.renderer = this.graph.getRenderer();
		
		// Range settings
		this.graph.setXRange(1.0, 10.0);
		this.graph.setYRange(1.0, 10.0);
		this.graph.setZRange(1.0, 10.0);
		
		// Registers the handler of plotting event which occurs when re-drawing is necessary
		this.graph.addPlottingListener(this);
		
		// Executes drawing of 3D shapes, and Renders the screen (Executes 3DCG rendering)
		this.draw();
		this.renderer.render();
	}
	
	
	// Drawing of 3D shapes
	public void draw() {
		
		// Draws a red point at the coodinate (1,2,3) with a radius of 10 pixels
		renderer.drawPoint(1.0,2.0,3.0, 10.0, Color.RED);
		
		// Draws a green line from (1,1,1) to (8,8,5) with a width of 5 pixels
		renderer.drawLine(1.0,1.0,1.0, 8.0,8.0,5.0, 5.0, Color.GREEN);
		
		// Draws a blue triangle with vertices at coordinates (1,4,5), (5,4,5), and (5,8,7)
		renderer.drawTriangle(1.0,4.0,5.0, 5.0,4.0,5.0, 5.0,8.0,7.0, Color.BLUE);
		
		// Draws a magenta quadrangle with vertices at (5,1,1), (8,1,1), (8,4,1) and (5,4,1)
		renderer.drawQuadrangle(
			5.0,1.0,1.0, 8.0,1.0,1.0, 8.0,4.0,1.0, 5.0,4.0,1.0, Color.MAGENTA
		);
	}
	
	
	// Handler of plotting event which occurs when re-drawing (re-plotting) is necessary
	@Override
	public void plottingRequested(RinearnGraph3DPlottingEvent e) {
		
		// Re-executes drawing of 3D shapes
		this.draw();
	}
	
	
	// Other handlers
	@Override
	public void plottingCanceled(RinearnGraph3DPlottingEvent e) {
	}
	@Override
	public void plottingFinished(RinearnGraph3DPlottingEvent e) {
	}
}