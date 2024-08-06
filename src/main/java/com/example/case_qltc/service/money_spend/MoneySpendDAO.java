package com.example.case_qltc.service.money_spend;

import com.example.case_qltc.model.MoneySpend;

import java.sql.*;

public class MoneySpendDAO {
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

    public void createMonnySpend(MoneySpend monnySpend) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into money_spend(date, amount, note, categorySpend_id, wallet_id) value (?,?,?,?,?)");
        ){
            preparedStatement.setDate(1, Date.valueOf(monnySpend.getDate()));
            preparedStatement.setInt(2, monnySpend.getAmount());
            preparedStatement.setString(3, monnySpend.getNote());
            preparedStatement.setInt(4, monnySpend.getCategoryId());
            preparedStatement.setInt(5, monnySpend.getWalletId());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
