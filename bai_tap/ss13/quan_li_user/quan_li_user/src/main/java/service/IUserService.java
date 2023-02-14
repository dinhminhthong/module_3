package service;

import module.Users;

import java.util.List;

public interface IUserService {
    List<Users> selectAllUser();

    Users selectById(int id);

    boolean insertUser(Users users);

    boolean updateUser(int id, Users users);

    boolean deleteUser(int id);
    List<Users> sortByNameUser();
    List<Users> searchByCountry(String country);
}
