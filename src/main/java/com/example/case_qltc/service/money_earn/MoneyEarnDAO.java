package com.example.case_qltc.service.money_earn;

import com.example.case_qltc.model.MoneyEarn;

import java.sql.*;

public class MoneyEarnDAO {
    public static Connection getConnection() {
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/financial_management";
        String user = "root";
        String password = "012345";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        }catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            connection = DriverManager.getConnection(url,user,password);
            System.out.println("Ket noi thanh cong");
        }catch (SQLException e) {
            System.out.println("Loi ket noi");
        }
        return connection;
    }

    public void createMonnyEarn(MoneyEarn monnyEarn) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into money_earn(date, amount, note, categoryEarn_id, wallet_id) value (?,?,?,?,?)");
        ){
            preparedStatement.setDate(1, Date.valueOf(monnyEarn.getDate()));
            preparedStatement.setInt(2, monnyEarn.getAmount());
            preparedStatement.setString(3, monnyEarn.getNote());
            preparedStatement.setInt(4, monnyEarn.getCategoryId());
            preparedStatement.setInt(5, monnyEarn.getWalletId());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
