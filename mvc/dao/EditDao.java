/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mvc.dao;

import com.mvc.bean.EditBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Zeroc
 */
public class EditDao {

    public String checkUpdate(EditBean editBean) {
        String name_up = editBean.getName_UP();
        String workplace_up = editBean.getWork_place_UP(); //get all value through editBean object
        String phone_up = editBean.getPhoneNo_UP();
        int hidden_id = editBean.getHidden_ID();

        String url = "jdbc:mysql://localhost:3306/test"; //database connection
        String username = "root"; //database connection username
        String password = ""; //database password

        try {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con = DriverManager.getConnection(url, username, password); //create

            PreparedStatement pstmt = null; //create statement

            pstmt = con.prepareStatement("update employee set name=?, work_place=?, phoneNo=? where id=?");
            pstmt.setString(1, name_up);
            pstmt.setString(2, workplace_up);
            pstmt.setString(3, phone_up);
            pstmt.setInt(4, hidden_id);
            pstmt.executeUpdate(); //execute query

            pstmt.close(); //close statement

            con.close(); //close connection

            return "UPDATE SUCCESS"; //if valid return "UPDATE SUCCESS" string
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "FAIL UPDATE"; //if invalid return "FAIL UPDATE" string
        //To change body of generated methods, choose Tools | Templates.
    }

}
