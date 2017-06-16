package action;

import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.font.LineBreakMeasurer;
import java.awt.font.TextAttribute;
import java.awt.font.TextLayout;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.awt.print.Book;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterJob;
import java.text.AttributedString;

import com.google.gson.Gson;
import com.im.model.Person;
import com.im.model.Road;
import com.im.model.population;
import com.opensymphony.xwork2.ActionSupport;

public class certificate extends ActionSupport {

	public String persondata;
	public String name;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPersondata() {
		return persondata;
	}

	public void setPersondata(String persondata) {
		this.persondata = persondata;
	}

	public String livingcertificate(){
		System.out.println("Hello");
		
		return "sucess";
	}
	
	public String areacertificateload() {
		return "sucess";

	}
	
	public String livingofcertificat(){
		System.out.println("Certificate :" +getName());
		Person person = new Person();
		try {
//			
			String x = getName();
	
			JSONObject json = (JSONObject) new JSONParser().parse(x);
			String idNo = json.get("txtIdNo").toString();
			String yera = json.get("txtYear").toString();
			String liveSttus = json.get("livetrue").toString();
			String reason = json.get("requeatfor").toString();
//			
			System.out.println("Values "+idNo+" - "+ yera + " - "+liveSttus + " - "+reason);
			
				Configuration c1 = new Configuration();
				SessionFactory sf = HibernateUtil.getSessionFactory();
				Session session = sf.openSession();
				String sql = "select first_name,address_number,road,city,city1,land_year,land from person_detail as p  JOIN family_detail as f ON p.person_sub_no = f.home_sub_number JOIN house_detail as h ON h.home_number = f.home_number  WHERE p.id_number = '"+idNo+"'";
				System.out.println("SQL is : "+sql);
				SQLQuery query = session.createSQLQuery(sql);

				
//				Query query = session.createQuery(sql);
				
				List employees = query.list();
				JSONArray array = new JSONArray();

				List<Object[]> rows = query.list();
				
			    for (Object[] row : rows) {		        
	List<String> list = new ArrayList<>();		
	
	int yearDef = 2017 - Integer.parseInt(row[5].toString());
					person.setTxtfirstName(row[0].toString());
					person.setTxtnameByLetter(row[1].toString());
					person.setComputerLiteracy(row[2].toString());
					person.setTxtIdNumber(row[3].toString());					
					person.setTxtGeneric(row[4].toString());
					person.setTxtBrithday(String.valueOf(yearDef));
					person.setTxtEducationCatagory(row[6].toString());
					person.setTxtTelephoneNumber(yera);
					person.setTxtBeforeDistric(reason);
					person.setTxtEnglishKnoledge(liveSttus);
					
					
				
					System.out.println("list "+list);
					array.add(list);
			    }
				 
			    
				
				
				Gson gson = new Gson();
				String result = gson.toJson(array);
				System.out.println("Certificate :" +result);
				HttpServletResponse res = ServletActionContext.getResponse();
				res.setContentType("text/plan;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println(result.toString()+"@@@");
				out.flush();
				
			} catch (Exception e) {
				System.out.println(e);
			}


			
			
//			
			
			
//			
				PrinterJob pj = PrinterJob.getPrinterJob();
				SimpleWrite simpleWrite = new SimpleWrite();
				
	            PageFormat pf = pj.defaultPage();
	            Paper paper = new Paper();
	            double margin = 36; // half inch
	            paper.setImageableArea(10, 5, paper.getWidth() * 2, 1500);
	            pf.setPaper(paper);
	            pj.setPrintable(new SimpleWrite.MyPrintable(person), pf);
	            try {
					pj.print();
				} catch (PrinterException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
//		
	
			

//		} catch (Exception e) {
//			System.out.println(e);
//		}

		return "sucess";
	}
	
	public String areacertificate(){
		
		Configuration c1 = new Configuration();
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		StringBuilder builder = new StringBuilder();
		builder.append("select count(id) AS total,( select count(id) from person_detail where sex = 'පුරුෂ') AS mail_count, ");
		builder.append(" ( select count(id) from person_detail where sex = 'ස්ත්‍රී') AS femail_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'සිංහල') AS sinhala_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'සිංහල' and sex = 'පුරුෂ') AS sinhala_male_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'සිංහල' and sex = 'ස්ත්‍රී') AS sinhala_female_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'දමිළ' ) AS tamil_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'දමිළ' and sex = 'පුරුෂ') AS tamil_male_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'දමිළ' and sex = 'ස්ත්‍රී') AS tamil_female_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'මුස්ලිම්' ) AS musilm_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'මුස්ලිම්' and sex = 'පුරුෂ') AS musilm_male_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'මුස්ලිම්' and sex = 'ස්ත්‍රී') AS musilm_female_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'බර්ගර්') AS berger_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'බර්ගර්' and sex = 'පුරුෂ') AS berger_male_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'බර්ගර්' and sex = 'ස්ත්‍රී') AS berger_female_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'මැලේ') AS mala_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'මැලේ' and sex = 'පුරුෂ') AS mala_male_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'මැලේ' and sex = 'ස්ත්‍රී') AS mala_female_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'වෙනත්') AS orthet_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'වෙනත්' and sex = 'පුරුෂ') AS orthet_male_count, ");
		builder.append(" ( select count(id) from person_detail where generic = 'වෙනත්' and sex = 'ස්ත්‍රී') AS orthet_female_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'බෞද්ධ') AS budhist_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'බෞද්ධ' and sex = 'පුරුෂ') AS budhist_male_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'බෞද්ධ' and sex = 'ස්ත්‍රී') AS budhist_female_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'කතෝලික') AS roman_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'කතෝලික' and sex = 'පුරුෂ') AS roman_male_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'කතෝලික' and sex = 'ස්ත්‍රී') AS roman_female_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'ක්‍රිස්තියානි') AS chatholict_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'ක්‍රිස්තියානි' and sex = 'පුරුෂ') AS chatholict_male_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'ක්‍රිස්තියානි' and sex = 'ස්ත්‍රී') AS chatholic_female_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'හින්දු') AS hinducount, ");
		builder.append(" ( select count(id) from person_detail where religion = 'හින්දු' and sex = 'පුරුෂ') AS hindu_male_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'හින්දු' and sex = 'ස්ත්‍රී') AS hindu_female_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'ඉස්ලාම්') AS islam_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'ඉස්ලාම්' and sex = 'පුරුෂ') AS islam_male_count, ");
		builder.append(" ( select count(id) from person_detail where religion = 'ඉස්ලාම්' and sex = 'ස්ත්‍රී') AS islam_female_count ");
		builder.append(" from person_detail ");
		
	
		SQLQuery query = session.createSQLQuery(builder.toString());
		List employees = query.list();
		
		JSONArray array = new JSONArray();

		List<Object[]> rows = query.list();
		population population = new population();
	    for (Object[] row : rows) {		        
List<String> list = new ArrayList<>();		

int yearDef = 2017 - Integer.parseInt(row[5].toString());
			
			population.setPopulate(row[0].toString());
			population.setMaleTotal(row[1].toString());
			population.setFemailTotal(row[2].toString());
			population.setSinhalaTotal(row[3].toString());
			population.setSinhalaMaleTotal(row[4].toString());
			population.setSinhalaFemailTotal(row[5].toString());
			population.setTamilTotal(row[6].toString());
			population.setTamilmailTotal(row[7].toString());
			population.setTamilFemailTotal(row[8].toString());
			population.setMusilmTotal(row[9].toString());
			population.setMusilmmailTotal(row[10].toString());
			population.setMusilmFemailTotal(row[11].toString());
			population.setBergerTotal(row[12].toString());
			population.setBergermailTotal(row[13].toString());
			population.setBergerFemailTotal(row[14].toString());
			population.setMalaTotal(row[15].toString());
			population.setMalaMaleTotal(row[16].toString());
			population.setMalaFemailTotal(row[17].toString());
			population.setOtherTotal(row[18].toString());
			population.setOthermailTotal(row[19].toString());
			population.setOtherFemailTotal(row[20].toString());
			population.setBuddhistTotal(row[21].toString());
			population.setBuddhistmailTotal(row[22].toString());
			population.setBuddhistFemailTotal(row[23].toString());
			population.setRomanChalalicTotal(row[24].toString());
			population.setRomanChatholicmailTotal(row[25].toString());
			population.setRomanChatholicFemailTotal(row[26].toString());
			population.setChathilicTotal(row[27].toString());
			population.setChathilicMaleTotal(row[28].toString());
			population.setChathilicFemailTotal(row[29].toString());
			population.setHinduTotal(row[30].toString());
			population.setHinduMaleTotal(row[31].toString());
			population.setHinduFemailTotal(row[32].toString());			
			population.setIslamTotal(row[33].toString());
			population.setIslamMaleTotal(row[34].toString());
			population.setIslamFemailTotal(row[35].toString());	
			
			
			
			
			
			
			
			
	    }
		
		
		
		
System.out.println("Query Val "+employees);
		PrinterJob pj = PrinterJob.getPrinterJob();
		SimpleWrite simpleWrite = new SimpleWrite();
		
        PageFormat pf = pj.defaultPage();
        Paper paper = new Paper();
        double margin = 36; // half inch
        paper.setImageableArea(10, 5, paper.getWidth() * 2, 1500);
        pf.setPaper(paper);
        pj.setPrintable(new SimplePdf.MyPrintable(population), pf);
        try {
			pj.print();
		} catch (PrinterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		
		return "sucess";
	}
	private final static int POINTS_PER_INCH = 72;
	
	public String areacertificatpdf(){
		
		  PrinterJob printJob = PrinterJob.getPrinterJob();

		    //--- Create a new book to add pages to
		    Book book = new Book();

		    //--- Add the cover page using the default page format for this print
		    // job
		    book.append(new IntroPage(), printJob.defaultPage());

		    //--- Add the document page using a landscape page format
		    PageFormat documentPageFormat = new PageFormat();
		    documentPageFormat.setOrientation(PageFormat.PORTRAIT);
		    book.append(new Document(), documentPageFormat);

		    //--- Tell the printJob to use the book as the pageable object
		    printJob.setPageable(book);

		    //--- Show the print dialog box. If the user click the
		    //--- print button we then proceed to print else we cancel
		    //--- the process.
		    if (printJob.printDialog()) {
		      try {
		        printJob.print();
		      } catch (Exception PrintException) {
		        PrintException.printStackTrace();
		      }
		    }
		  
        
        
		return "sucess";
	}

}
