package com.std.security;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.std.domain.AuthVO;
import com.std.domain.MemVO;
import com.std.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Setter(onMethod_ = @Autowired)
	private  UserMapper mapper;

	
	@Test
	public void testRead() {
		MemVO vo = mapper.read("abcd");
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}

	@Test
	public void test() {
		String sql = "insert into member(userid,password,username) values (?,?,?)";
		for(int i=0; i<10; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(2, pwencoder.encode("password"+i));
				if(i<3) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(3, "일반사용자"+i);
				} else if(i<7) {
					pstmt.setString(1, "manager"+i);
					pstmt.setString(3, "운영자"+i);
				} else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(3, "관리자"+i);
				}
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null) {try {pstmt.close();} catch(Exception e) {} }
				if(con != null) {try {con.close();} catch(Exception e) {} }
			}
		}
	}

}
