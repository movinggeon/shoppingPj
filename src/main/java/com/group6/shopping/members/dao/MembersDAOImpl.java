package com.group6.shopping.members.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.group6.shopping.members.vo.MembersVO;

@Repository
public class MembersDAOImpl implements MembersDAO {
	
	// 객체가 주입 대상이라는 것을 알려주는 어노테이션 
	// root-context.xml에서 <bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">의 부모 
	// 결국 주입 대상은 SqlSessionTemplate의 부모 interface SqlSession --> 다형성
	@Inject
	private SqlSession sqlSession;
	
	// membersMapper.xml에서 mapper namespace 복사
	private static final String namespace = "com.group6.shopping.members.MembersDAO";

    @Override
    public List<MembersVO> getAllMembers() throws Exception{

    	List<MembersVO> membersList = sqlSession.selectList(namespace + ".getAllMembers");
    	
    	return membersList;
    }
}
