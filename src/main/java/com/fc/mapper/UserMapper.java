package com.fc.mapper;

import com.fc.model.Info;
import com.fc.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface UserMapper {

    int selectEmailCount(String email);

    void insertUser(User user);

    int selectActived(User user);

    User selectUserByUid(int uid);

    //这里有点特殊
    Integer selectUidByEmailAndPassword(User user);

    User selectEditInfo(int uid);

    void updateUser(User user);

    void updatePostCount(Integer uid);

    void updateActived(String activateCode);

    void insertInfo(Info info);

    List<User> listUserByTime();

    List<User> listUserByHot();

    void updateHeadUrl(@Param("uid") int uid, @Param("headUrl") String headUrl);

    String selectHeadUrl(int uid);

    void updateScanCount(int uid);

    User selectUsernameByUid(int uid);

    String selectPasswordByUid(int uid);

    void updatePassword(@Param("newPassword") String newPassword,@Param("uid") int uid);

    String selectVerifyCode(String email);

    void updatePasswordByActivateCode(String code);


}
