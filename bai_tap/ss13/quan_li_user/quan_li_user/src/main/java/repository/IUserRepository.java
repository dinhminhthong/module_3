package repository;

import module.Users;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    List<Users> selectAllUser();

    Users selectById(int id);

    boolean insertUser(Users users);

    boolean updateUser(int id, Users users);

    boolean deleteUser(int id);
    List<Users> sortByNameUser();
    List<Users> searchByCountry(String country);
}
