package action;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.Printable;
import static java.awt.print.Printable.NO_SUCH_PAGE;
import static java.awt.print.Printable.PAGE_EXISTS;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.Timer;



import javax.imageio.ImageIO;

public class SimplePdf2  {
	
	 public static class MyPrintable implements Printable {

		@Override
		 public int print(Graphics g, PageFormat pf, int pageIndex) throws PrinterException  {

			 if(pageIndex != 0)
			      return NO_SUCH_PAGE;
			    Graphics2D g2 = (Graphics2D) g;
			    Graphics2D g3 = (Graphics2D) g;
	
			    URL urltim = this.getClass().getResource("/image/government1.png");
                
                BufferedImage biTim = null;
                BufferedImage biTim1 = null;
                try {
                    biTim = ImageIO.read(urltim);
                } catch (IOException ex) {
                    System.out.println(ex);
                }
                
                g2.drawImage(biTim, 130, 50, 70, 70, new ImageObserver(){
//                g2.drawImage(biTim, 50, 50, new ImageObserver() {

                    public boolean imageUpdate(Image img, int infoflags, int x, int y, int width, int height) {
                        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                    }
                });
                
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                Date date = new Date(); 
                String DateX = dateFormat.format(date);
        

//g2.drawString("DFCC Vardhana Bank", 25, 40);


                g2.setFont(new Font("Iskoola Pota", Font.BOLD, 15));
                g2.setPaint(Color.black);

g.drawLine(30, 200, 600, 200);
g.drawLine(300, 0, 300, 200);
g2.drawString("ග්‍රාම  නිළධාරි කාර්යාලය", 100, 150);
g2.drawString("Grama Niladgari Office", 90, 170);
g2.drawString("බී.කේ.එන්.ජේ. රුද්‍රිගු‍ ", 360, 110);
g2.drawString("ග්‍රාම  නිළධාරී ", 360, 130);
g2.drawString("අංකය   :     164/A,මහ පමුණුගම", 360, 150);
g2.drawString("දිනය  : "+DateX, 360, 170);

g2.drawString("ජනගහනය  ", 30, 240);
g2.drawString("ජාතින් අනුව ජනගහනය : " +"", 30, 360);
g2.drawString("ආගම අනුව ජනගහනය : " +"", 30, 520);

g2.setFont(new Font("Iskoola Pota", Font.PLAIN, 12));
g2.setPaint(Color.black);



//Body

g2.drawString("මුලු ජනගහනය : " +"5444", 30, 270);

g2.drawString("ස්ත්‍රි : " +"3000", 30, 290);
g2.drawString("පුරුශ : " +"3000", 30, 310);
g2.drawString("ලියාපදිංචි ජන්ද සංඛාව : " +"3000", 30, 330);



g2.drawString("සිංහල : " +"1000", 30, 390);  g2.drawString("ස්ත්‍රි : " +"1000", 300, 390);   g2.drawString("පුරුශ : " +"1000", 400, 390);
g2.drawString("දමිළ : " +"500", 30, 410);    g2.drawString("ස්ත්‍රි : " +"1000", 300, 410);   g2.drawString("පුරුශ : " +"1000", 400, 410);
g2.drawString("මුස්ලිම් : " +"100", 30, 430);		g2.drawString("ස්ත්‍රි : " +"1000", 300, 430);   g2.drawString("පුරුශ : " +"1000", 400, 430);
g2.drawString("බර්ගර් : " +"200", 30, 450);		g2.drawString("ස්ත්‍රි : " +"1000", 300, 450);   g2.drawString("පුරුශ : " +"1000", 400, 450);
g2.drawString("මැලේ : " +"300", 30, 470);		g2.drawString("ස්ත්‍රි : " +"1000", 300, 470);   g2.drawString("පුරුශ : " +"1000", 400, 470);
g2.drawString("වෙනත් : " +"200", 30, 490);		g2.drawString("ස්ත්‍රි : " +"1000", 300, 490);   g2.drawString("පුරුශ : " +"1000", 400, 490);




g2.drawString("බෞද්ධ : " +"1000", 30, 550);  g2.drawString("ස්ත්‍රි : " +"1000", 300, 550);   g2.drawString("පුරුශ : " +"1000", 400, 550);
g2.drawString("කතෝලික : " +"500", 30, 570);    g2.drawString("ස්ත්‍රි : " +"1000", 300, 570);   g2.drawString("පුරුශ : " +"1000", 400, 570);
g2.drawString("ක්‍රිස්තියානි : " +"100", 30, 590);		g2.drawString("ස්ත්‍රි : " +"1000", 300, 590);   g2.drawString("පුරුශ : " +"1000", 400, 590);
g2.drawString("හින්දු : " +"200", 30, 610);		g2.drawString("ස්ත්‍රි : " +"1000", 300, 610);   g2.drawString("පුරුශ : " +"1000", 400, 610);
g2.drawString("ඉස්ලාම් : " +"300", 30, 630);		g2.drawString("ස්ත්‍රි : " +"1000", 300, 630);   g2.drawString("පුරුශ : " +"1000", 400, 630);




//g2.drawString("Thank You For Using BOC Banking Services! ", 10, 200);
//g2.drawString("This advice will serve as your transaction input record. ", 10, 210);
//g2.drawString("Your payment is subject to verification by ", 10, 220);
//g2.drawString("the Bank under CCTV surveillance.  ", 10, 230);

g2.drawImage(biTim1, 50, 240, new ImageObserver() {

    public boolean imageUpdate(Image img, int infoflags, int x, int y, int width, int height) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
});
//g2.drawString("Customer Copy of "+M1.getTransaction_Type(), 10, 290);

Rectangle2D outline = new Rectangle2D.Double(pf.getImageableX(), pf.getImageableY(), pf
.getImageableWidth(), pf.getImageableHeight());
//g2.draw(outline);
return PAGE_EXISTS;
			
			
		}
		 
	 }
	

}
