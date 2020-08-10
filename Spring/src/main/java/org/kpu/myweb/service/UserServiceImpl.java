package org.kpu.myweb.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.UserVO;
import org.kpu.myweb.persistence.UserDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.security.util.Password;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


@Service
public class UserServiceImpl implements UserService, UserDetailsService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserDAO UserDAO;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public UserServiceImpl(UserDAO UserDAO) {
		this.UserDAO = UserDAO;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO user = new UserVO();
		UserVO userInfo;
		try {
			logger.info("loadUserByUsername");
			userInfo = UserDAO.readByUserID(username);
		
			user.setUsername(userInfo.getUsername());
			user.setPassword(userInfo.getPassword());
			logger.info("userInfo : " + userInfo.getUsername() + userInfo.getPassword());
			logger.info("userInfo : " + userInfo.getAuthorities());
			user.setAuthorities(UserDAO.readAuthByUserID(username));
			
		} catch (Exception e) {
			return null;
		}

		return user;
	}
	public UserVO readUser(int id) throws Exception {
		return UserDAO.read(id);
	}
	
	public List<UserVO> readUserList() throws Exception{
		return UserDAO.readList();
	}
	
	public void addUser(UserVO User) throws Exception {
		// User.setPassword(passwordEncoder.encode(User.getPassword())); // 암호화
		Collection<? extends GrantedAuthority> authorities = User.getAuthorities();
		ArrayList<GrantedAuthority> list = new ArrayList<GrantedAuthority>(authorities);
		String[] temp = new String[3];

		temp[0] = User.getUsername();
		temp[1] = User.getPassword();
		temp[2] = list.get(0).toString();
		logger.info("temp : " + temp[0] + temp[1] + temp[2]);
		
		UserDAO.add(temp); // id와 password insert
	}
	
	public void deleteUser(int id) throws Exception {
		UserDAO.delete(id);
	}
	
	public void updateUser(UserVO User) throws Exception {
		UserDAO.update(User);
	}
	
	public UserVO viewUser(UserVO User) throws Exception {
		return UserDAO.viewUser(User);
	}
	public Integer readID(String username) throws Exception{
		return UserDAO.readID(username);
	}
	
	/*로그인*/
	public boolean login(UserVO user) throws Exception {
		boolean result= UserDAO.login(user);
		return result;
	}
}