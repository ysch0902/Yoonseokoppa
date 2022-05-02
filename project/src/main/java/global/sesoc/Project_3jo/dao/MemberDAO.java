package global.sesoc.Project_3jo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertMember(MemberVO member) {	
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;

		result = mapper.insertMember(member);
		return result;
	}

}
