package com.learn.mycart.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.learn.mycart.dao.CategoryDoa;
import com.learn.mycart.dao.CourseDoa;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Course;
import com.learn.mycart.helper.FactoryProvider;

@MultipartConfig
@WebServlet("/CourseOperationServlet")
public class CourseOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		try {
			String op = request.getParameter("operation");
			if (op.trim().equals("addcategory")) {
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");

				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);

				CategoryDoa categorydoa = new CategoryDoa(FactoryProvider.getFactory());
				int catid = categorydoa.saveCategory(category);
				System.out.print(catid);
				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("catmessage", "Category Added Successfully");
				response.sendRedirect("Admin.jsp");
				return;

			} else if (op.trim().equals("addcourse")) {
				String cname = request.getParameter("cname");
				String cdesc = request.getParameter("cDescription");
				int cprice = Integer.parseInt(request.getParameter("cprice"));
				int cdiscount = Integer.parseInt(request.getParameter("cDiscount"));
				int cquantity = Integer.parseInt(request.getParameter("cquantity"));
				int cid = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("cpic");

				Course c = new Course();
				c.setCourseTitle(cname);
				c.setCourseDesc(cdesc);
				c.setCoursePrice(cprice);
				c.setCourseDiscount(cdiscount);
				c.setCourseQuantity(cquantity);
				c.setCoursePhoto(part.getSubmittedFileName());

				CategoryDoa cdoa = new CategoryDoa(FactoryProvider.getFactory());
				Category category = cdoa.getCategoryById(cid);
				c.setCategory(category);

				CourseDoa crdoa = new CourseDoa(FactoryProvider.getFactory());
				crdoa.saveCourse(c);
				String path = request.getRealPath("Images") + File.separator + "Courses" + File.separator
						+ part.getSubmittedFileName();
				System.out.println(path);
				try {
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = part.getInputStream();
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("Done With Product");
				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("coursemessage", "Course Added Successfully");
				response.sendRedirect("Admin.jsp");
				return;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}
//	
}
