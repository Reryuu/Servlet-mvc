/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mvc.controller;

import com.mvc.bean.EditBean;
import com.mvc.dao.EditDao;
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
@WebServlet(name = "EditController", urlPatterns = {"/EditController"})
public class EditController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btn_edit") != null) //check button click event not null f
        {
            String name_up = request.getParameter("txt_name"); //get textbox name "txt_nam
            String work_place_up = request.getParameter("txt_work_place"); //get textbox name "txt_o
            String phoneNo_up = request.getParameter("txt_phoneNo");
            int hidden_id = Integer.parseInt(request.getParameter("hidden_id")); //get hid

            EditBean editBean = new EditBean(); //this class contain setting up all receiv

            editBean.setName_UP(name_up);
            editBean.setWork_place_UP(work_place_up); //set all value through editBean object
            editBean.setPhoneNo_UP(phoneNo_up);
            editBean.setHidden_ID(hidden_id);

            EditDao editDao = new EditDao(); //this class contain main logic to perform fu

            String updateValidate = editDao.checkUpdate(editBean); //send editBean object

            if (updateValidate.equals("UPDATE SUCCESS")) //check calling checkUpdate() fu
            {
                request.setAttribute("UpdateSuccessMsg", updateValidate); //setAttribute
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("UpdateErrorMsg", updateValidate); //setAttribute va
                RequestDispatcher rd = request.getRequestDispatcher("edit.jsp");
                rd.include(request, response);
            }
        }
    }
}

