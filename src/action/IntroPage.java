package action;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;

public class IntroPage implements Printable {

	  private final static int POINTS_PER_INCH = 72;

	@Override
	public int  print(Graphics g, PageFormat pageFormat, int page) {
		 Graphics2D g2d = (Graphics2D) g;

	      //--- Translate the origin to 0,0 for the top left corner
	      g2d.translate(pageFormat.getImageableX(), pageFormat
	          .getImageableY());

	      //--- Set the default drawing color to black
	      g2d.setPaint(Color.black);

	      //--- Draw a border arround the page
	      Rectangle2D.Double border = new Rectangle2D.Double(0, 0, pageFormat
	          .getImageableWidth(), pageFormat.getImageableHeight());
	      g2d.draw(border);

	      //--- Print the title
	      String titleText = "Printing in Java Part 2, Example 4";
	      Font titleFont = new Font("helvetica", Font.BOLD, 18);
	      g2d.setFont(titleFont);

	      //--- Compute the horizontal center of the page
	      FontMetrics fontMetrics = g2d.getFontMetrics();
	      double titleX = (pageFormat.getImageableWidth() / 2)
	          - (fontMetrics.stringWidth(titleText) / 2);
	      double titleY = 3 * POINTS_PER_INCH;
	      g2d.drawString(titleText, (int) titleX, (int) titleY);

	      return (PAGE_EXISTS);
	}

}


