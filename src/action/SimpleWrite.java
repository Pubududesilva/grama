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

import com.im.model.Person;

import javax.imageio.ImageIO;

public class SimpleWrite  {
	
	 public static class MyPrintable implements Printable {
		 public Person persondata = new Person();
		 MyPrintable(Person p){
			 this.persondata = p;
		 }
		 

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
g2.drawString("අංකය : 164/A,මහ පමුණුගම", 360, 150);
g2.drawString("දිනය  : "+DateX, 360, 170);


g2.setFont(new Font("Iskoola Pota", Font.PLAIN, 12));
g2.setPaint(Color.black);



//Body


g2.drawString("ප්‍රාදේශිය ලේඛම් තුමා,", 45, 250);
g2.drawString("වත්තල", 45, 270);
g2.drawString("මහත්මානනි/මහත්මියනි,", 45, 290);
g2.setFont(new Font("Iskoola Pota", Font.PLAIN, 14));
g2.setPaint(Color.black);
g2.drawString("පදිංචිය සහතික කිරීම", 250, 320);

g2.setFont(new Font("Iskoola Pota", Font.PLAIN, 12));
g2.setPaint(Color.black);
g2.drawLine(240, 325, 370, 325);

StringBuilder txtBody = new StringBuilder();
txtBody.append(persondata.getTxtfirstName());
txtBody.append(" මයා/මිය/මෙනවිය,මෙම ග්‍රාම  නිලධාරි කොට්ඨාශයේ  "+persondata.getTxtnameByLetter()+" "+persondata.getComputerLiteracy() +" "+persondata.getTxtIdNumber()+" "+persondata.getTxtGeneric());
txtBody.append(" දරණ ස්ථානයේ වසර , "+persondata.getTxtBrithday());
txtBody.append(" කාලයක සිට  "+persondata.getTxtEducationCatagory()+", පදිංචිව සිටින බවත්  "+ persondata.getTxtTelephoneNumber() + " වසර ");
txtBody.append("සදහා ඡන්ද හිමි නාම ලේඛනයේ ලියා පදිංචි වී "+persondata.getTxtEnglishKnoledge()+" බවත් මෙයින් වාර්ථා කරමි.");

System.out.println("Length "+txtBody.length());

int value = 0;
int value1 = 90;
int row = 360;
int volum = txtBody.length() % 90;
int volum1 = txtBody.length() / 90;

System.out.println("volum "+volum +"volum1 "+volum1 );
for(int x = 0; x<= volum1; x++){
	System.out.println("Row "+value +" Row "+value1 +" X Val "+x);
	if(x == volum1){
		System.out.println("volum1-1");
//		value = value1;
		value1 = txtBody.length();
		String v1 = (String) txtBody.subSequence(value, txtBody.length());	

		char c = v1.charAt(0);
	
		g2.drawString(v1,45,row);
	}
	else{
	String v1 = (String) txtBody.subSequence(value, value1);
	

	g2.drawString(v1,45,row);
	row +=20;
	value = value1;
	value1 += 90;
	}
//	String v1 = (String) txtBody.subSequence(value, value1);
//	g2.drawString((String) txtBody.subSequence(90, 180),45,row);
//	row +=20;
//	g2.drawString((String) txtBody.subSequence(180, txtBody.length()),45,row);
	
//	value1 = value1 + 90;
	
}


//g2.drawString(persondata.getTxtfirstName(), 30, 360);
//g2.drawString("මයා/මිය/මෙනවිය,මෙම ග්‍රාම  නිලධාරි කොට්ඨාශයේ  "+persondata.getTxtnameByLetter()+" "+persondata.getComputerLiteracy() +" "+persondata.getTxtIdNumber()+" "+persondata.getTxtGeneric(), 30, 380);
//g2.drawString("දරණ ස්ථානයේ වසර , "+persondata.getTxtBrithday()+" පමන ", 30, 400);
//g2.drawString("කාලයක සිට  "+persondata.getTxtEducationCatagory()+", පදිංචිව සිටින බවත්  "+ persondata.getTxtTelephoneNumber() + " වසර", 30, 420);
//g2.drawString("සදහා ඡන්ද හිමි නාම ලේඛනයේ ලියා පදිංචි වී "+persondata.getTxtEnglishKnoledge()+" බවත් මෙයින් වාර්ථා කරමි.", 30, 440);
g2.drawString("ඉල්ලුම් කරුගේ ඉල්ලීම මත, ", 45, 480);
g2.drawString(persondata.getTxtBeforeDistric(), 45, 500);
g2.drawString("ඉදිරිපත් කරමි.", 45, 520);
g2.drawString("ග්‍රාම  නිළධාරි", 400, 550);
g2.drawString("අනු අත්සන් කරමි", 45, 570);
g2.drawString("ප්‍රාදේශීය ලේකම් ", 150, 600);
g.drawLine(30, 630, 600, 630);

g2.setFont(new Font("Iskoola Pota", Font.BOLD, 12));
g2.setPaint(Color.black);
g2.drawString("ප්‍රාදේශිය ලේඛම් කාර්යාලය    0112930384               ", 30, 650);
g2.drawString("DIVISIONAL SECRETARIAL", 30, 670);

g2.drawString("ග්‍රාම  නිලධාරි කාර්යාලය  0710912960", 400, 650);
g2.drawString("GRAMA MILADARI OFFICE", 400, 670);






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
