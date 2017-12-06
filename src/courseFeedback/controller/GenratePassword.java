package courseFeedback.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.util.BooleanList;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import courseFeedback.dao.DateProgramDetailsDAO;
import courseFeedback.util.DBConnection;

public class GenratePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GenratePassword() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String temp = request.getParameter("selProgramDetailsId");

		ServletOutputStream os = response.getOutputStream();
		response.setContentType("application/pdf");
		Document doc = new Document();
		Font bf13 = new Font(FontFamily.TIMES_ROMAN, 13);
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = null;

		try {

			PdfWriter.getInstance(doc, os);
			doc.addAuthor("Sharvil");
			doc.addCreationDate();
			doc.addProducer();
			doc.addCreator("Sharvil");
			doc.addTitle("Password List");
			doc.setPageSize(PageSize.A3);
			conn = DBConnection.getConnection();
			sql = "select username,password from passwordpool pd,dateprogramdetails dp where pd.programDetailsId=dp.programDetailsId and dp.programDetailsId=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, temp);
			ResultSet rs = stmt.executeQuery();
			doc.open();
			doc.add(new Paragraph());
			boolean result = false;
			while (rs.next()) {
				result = true;
				doc.add(new Paragraph(" URL = http://localhost:CourseFeedback/index.html |   Password = "
						+ rs.getString("password") + " |   Username = " + rs.getString("username"), bf13));
				doc.add(Chunk.NEWLINE);
			}

			if (!result)
				doc.add(new Paragraph("Sorry...! No Passwords are available...!"));
			rs.close();
			stmt.close();
			doc.close();
		} catch (DocumentException e) {

		} catch (Exception e) {

		}
	}

}
