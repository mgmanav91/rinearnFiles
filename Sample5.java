import com.rinearn.graph3d.RinearnGraph3D;
import com.rinearn.graph3d.renderer.RinearnGraph3DRenderer;
import java.awt.Color;

/**
 * An example to draw shapes by calling APIs of the renderer.
 */
public class Sample5 {
	
	public static void main(String[] args) {
		
		// Lanches the graph and gets the instance of the graphics engine (renderer)
		RinearnGraph3D graph = new RinearnGraph3D();
		RinearnGraph3DRenderer renderer = graph.getRenderer();
		
		// Range settings
		graph.setXRange(1.0, 10.0);
		graph.setYRange(1.0, 10.0);
		graph.setZRange(1.0, 10.0);
		
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
		
		// Renders the screen (Executes 3DCG rendering)
		renderer.render();
	}
}
