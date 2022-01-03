/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mvc.controller;

import com.mvc.bean.AddBean;
import com.mvc.dao.AddDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Zeroc
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("btn_add") != null) //check button click event not null fr
        {
            String name = request.getParameter("txt_name"); //get textbox name "txt_name"
            String work_place = request.getParameter("txt_work_place"); //get textbox name "txt_owne
            String phoneNo = request.getParameter("txt_phoneNo");

            AddBean addBean = new AddBean(); //this class contain setting up all receive v

            addBean.setName(name); //set name through addBean object
            addBean.setWork_place(work_place); //set owner through addBean object
            addBean.setPhoneNo(phoneNo);

            AddDao addDao = new AddDao(); //this class contain main logic to perform funct

            String insertValidate = addDao.checkInsert(addBean); //send addBean object val

            if (insertValidate.equals("INSERT SUCCESS")) //check calling checkInsert() fu
            {
                request.setAttribute("InsertSuccessMsg", insertValidate); //setAttribute
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("InsertErrorMsg", insertValidate); //setAttribute va
                RequestDispatcher rd = request.getRequestDispatcher("add.jsp");
                rd.include(request, response);
            }
        }
    }
}

