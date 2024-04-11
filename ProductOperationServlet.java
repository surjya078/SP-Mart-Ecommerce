package com.mycompany.ecommerce.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mycompany.ecommerce.dao.CategoryDao;
import com.mycompany.ecommerce.dao.ProductDao;
import com.mycompany.ecommerce.entities.Category;
import com.mycompany.ecommerce.entities.Product;
import com.mycompany.ecommerce.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			String op = request.getParameter("operation");
			if (op.trim().equals("addcategory")) {

				// add category
				// Fetching category data
				String cTitle = request.getParameter("catTitle");
				String cDescription = request.getParameter("catDescription");

				Category category = new Category();
				category.setCategoryTitle(cTitle);
				category.setCategoryDescription(cDescription);

				// save category in database
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.geFactory());
				int catId = categoryDao.saveCategory(category);

				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Category added Successfully...");
				response.sendRedirect("Admin.jsp");
				return;

			} else if (op.trim().equals("addproduct")) {

				// add product
				// Fetch product data
				String pName = request.getParameter("proTitle");
				String pDesc = request.getParameter("proDescription");
				int pPrice = Integer.parseInt(request.getParameter("proPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("proDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("proQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				// for file
				Part part = request.getPart("proImage");

				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());

				// get category by id
				CategoryDao cdao = new CategoryDao(FactoryProvider.geFactory());
				Category category = cdao.getCategoryById(catId);

				p.setCategory(category);

				// save product
				ProductDao pdao = new ProductDao(FactoryProvider.geFactory());
				pdao.saveProduct(p);

				// pic upload
				String path = request.getRealPath("img") + File.separator + "products" + File.separator
						+ part.getSubmittedFileName();
				System.out.println(path);

//				try {
//					// uploading code
//					FileOutputStream fos = new FileOutputStream(path);
//					InputStream is = part.getInputStream();
//
//					// reading data
//					byte[] data = new byte[is.available()];
//					is.read(data);
//					// Writing the data
//					fos.write(data);
//					fos.close();
//
//					/*
//					 * int byteValue; while ((byteValue = is.read()) != -1) { fos.write(byteValue);
//					 * }
//					 */
//
//				} catch (Exception e) {
//					e.printStackTrace();
//				}

				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product is added Successfully...");
				response.sendRedirect("Admin.jsp");
				return;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		doGet(request, response);
	}

}
