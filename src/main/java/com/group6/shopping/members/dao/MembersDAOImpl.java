package com.group6.shopping.members.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.group6.shopping.members.vo.MembersVO;
import com.group6.shopping.security.CustomMemDetails;

@Repository
public class MembersDAOImpl implements MembersDAO {
	
	// 객체가 주입 대상이라는 것을 알려주는 어노테이션 
	// root-context.xml에서 <bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">의 부모 
	// 결국 주입 대상은 SqlSessionTemplate의 부모 interface SqlSession --> 다형성
	@Inject
	private SqlSession sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// membersMapper.xml에서 mapper namespace 복사
	private static final String namespace = "com.group6.shopping.members.MembersDAO";

    @Override
    public List<MembersVO> getAllMembers() throws Exception{

    	List<MembersVO> membersList = sqlSession.selectList(namespace + ".getAllMembers");
    	
    	return membersList;
    }
    
    @Override
    public String lookupId(String memId) throws Exception{
    	
    	//System.out.println(memId);
    	
    	return sqlSession.selectOne(namespace + ".lookupId", memId);
    }
    
    @Override
    public void insertMem(MembersVO membersVo) throws Exception {
    	
    	String endcodedPassword = bcryptPasswordEncoder.encode(membersVo.getMem_password());
    	membersVo.setMem_password(endcodedPassword);
    	
    	int row = sqlSession.insert(namespace + ".insertMem", membersVo);
    	
    	System.out.println("members 테이블 -> " + row + "행 추가.");
    }
    
    @Override
    public CustomMemDetails getMemById(String memId) throws Exception {
    	
    	CustomMemDetails members = sqlSession.selectOne(namespace + ".getMemById", memId);
    	
    	return members;
    }
}
