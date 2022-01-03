/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.dao;

import com.mvc.bean.AddBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Zeroc
 */
public class AddDao {
    public String checkInsert(AddBean addBean) {
        String name = addBean.getName(); //get name through addBean object and store in te
        String work_place = addBean.getWork_place(); //get owner through addBean object and store in
        String phone = addBean.getPhoneNo();

        String url = "jdbc:mysql://localhost:3306/test"; //database connection
        String username = "root"; //database connection username
        String password = ""; //database password

        try {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con = DriverManager.getConnection(url, username, password); //create

            PreparedStatement pstmt = null; //create statement

            pstmt = con.prepareStatement("insert into employee(name,work_place,phoneNo) values(?,?,?)"); //
            pstmt.setString(1, name);
            pstmt.setString(2, work_place);
            pstmt.setString(3, phone);
            pstmt.executeUpdate(); //execute query

            pstmt.close(); //close statement

            con.close(); //close connection

            return "INSERT SUCCESS"; //if valid return "INSERT SUCCESS" string
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "FAIL INSERT"; //if invalid return "FAIL INSERT" string //To change body of generated methods, choose Tools | Templates.
    }

   

}
