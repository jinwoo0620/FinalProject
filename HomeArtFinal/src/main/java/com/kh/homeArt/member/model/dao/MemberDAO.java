package com.kh.homeArt.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.common.Request;
import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

   // 회원가입1
   public int signUpUser(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.insert("memberMapper.signUpUser", m);
   }
   
   // 로그인 
   public Member login(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.login", m);
   }

   // 아이디 찾기
   public Member findId(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.findId", m);
   }

   // 비번찾기_인증메일
   public Member searchPwEmail(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.searchPwEmail", m);
   }

   // 비번찾기_재설정
   public int changePw(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.update("memberMapper.changePw", m);
   }

   // 아이디 중복검사
   public Member idScan(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.idScan", m);
   }

   
///////////////////////////////////////////회원정보수정 파트///////////////////////////////////////////////////////   
   
// 회원 탈퇴
public int deleteMember(SqlSessionTemplate sqlSession, String id) {      
return sqlSession.update("memberMapper.deleteMember", id);            
}

public Member selectEncodePwd(SqlSessionTemplate sqlSession, String id) {   
return sqlSession.selectOne("memberMapper.selectEncodePwd", id);
}

public int selectNickName(SqlSessionTemplate sqlSession, String nickName) {
return sqlSession.selectOne("memberMapper.selectNickName", nickName);
}

public int modifyExpert(SqlSessionTemplate sqlSession, Member loginUser) {
return sqlSession.update("memberMapper.modifyExpert", loginUser);
}

public int modifyMember(SqlSessionTemplate sqlSession, Member loginUser) {
return sqlSession.update("memberMapper.modifyMember", loginUser);
}


public int insertRequest(SqlSessionTemplate sqlSession, Request request) {
return sqlSession.insert("memberMapper.insertRequest", request);
}

public Expert selectExpertProfile(SqlSessionTemplate sqlSession, String id) {
return sqlSession.selectOne("memberMapper.selectExpertProfile", id);
}

//전문가 프로필 번호에 해당하는 의뢰 요청 List갖고 오기
public ArrayList<Request> selectRequestList(SqlSessionTemplate sqlSession, int expertProfileNo) {
return (ArrayList)sqlSession.selectList("memberMapper.selectRequestList", expertProfileNo);
}

//요청의 상태가 W(대기)중일 경우 요청을 보낸 회원의 정보를 불러오기
public Member selectMember(SqlSessionTemplate sqlSession, String memberId) {
return sqlSession.selectOne("memberMapper.selectMember", memberId);
}

//로그인한 회원 계정으로 의뢰한 요청 조회해서 가져오기
public ArrayList<Request> memberRequest(SqlSessionTemplate sqlSession, String id) {
return (ArrayList)sqlSession.selectList("memberMapper.memberRequest", id);
}

//해당 전문가 프로필에 동일한 회원ID로 이미 의뢰요청을 했는지 검사
public int dupReqCheck(SqlSessionTemplate sqlSession, Request request) {
return sqlSession.selectOne("memberMapper.dupReqCheck", request);
}

//해당 전문가 프로필에 동일한 회원ID로  이미 매칭된 상태인지 검사
public int dupReqCheck2(SqlSessionTemplate sqlSession, Request request) {
return sqlSession.selectOne("memberMapper.dupReqCheck2", request);
}   

//승인할 회원의 ID를 가진 레코드의 요청상태 'Y'으로 바꿔주기
public int allowRequest(SqlSessionTemplate sqlSession, Request request) {
return sqlSession.update("memberMapper.allowRequest", request);
}

//거절할 회원의 ID를 가진 REQUEST테이블의 해당 레코드 요청상태를 'N'으로 바꿔주기
public int rejectRequest(SqlSessionTemplate sqlSession, String requesterId) {
return sqlSession.update("memberMapper.rejectRequest", requesterId);
}

//매칭 취소할 회원의 ID에 해당하는 REQUEST테이블의 해당 레코드의 요청상태를 'Y'에서  'N'으로 바꿔주기
public int matchCancelE(SqlSessionTemplate sqlSession, String requesterId) {
return sqlSession.update("memberMapper.matchCancelE", requesterId);
}

//전문가 프로필 넘버로 전문가 프로필 조회해서 받아오기
public Expert selectExpertProfile2(SqlSessionTemplate sqlSession, int expertProfileNo) {
return sqlSession.selectOne("memberMapper.selectExpertProfile2", expertProfileNo);
}

//전문가 회원 정보를  경력을 기준으로 내림차순 상위 3개의 값을 가져옴 
public ArrayList<Member> topExpertMemberList(SqlSessionTemplate sqlSession) {
return (ArrayList)sqlSession.selectList("memberMapper.topExpertMemberList");
}

//모든 (전문가)Member객체를  가져옴
public ArrayList<Member> allExpertMember(SqlSessionTemplate sqlSession) {
return (ArrayList)sqlSession.selectList("memberMapper.allExpertMember");
}

//모든 (전문가)Member객체를 랜덤정렬로 가져옴
public ArrayList<Member> randomExpertList(SqlSessionTemplate sqlSession) {
return (ArrayList)sqlSession.selectList("memberMapper.randomExpertList");
}

//매칭 취소할 전문가 프로필 넘버에 해당하는 REQUEST테이블의 해당 레코드의 요청상태를 'Y'에서 'N'으로 바꿔주기 
public int matchCancelM(SqlSessionTemplate sqlSession, int expertProfileNo) {
return sqlSession.update("memberMapper.matchCancelM", expertProfileNo);
}

//보낸 의뢰요청을 취소할 전문가 프로필 넘버에 해당하는 REQUEST테이블의 해당 레코드 요청상태를 'W'에서 'N'으로 바꿔주기 
public int requestCancelM(SqlSessionTemplate sqlSession, int expertProfileNo) {
return sqlSession.update("memberMapper.requestCancelM", expertProfileNo);
}

//모든 전문가 회원의 객체를 경력을 기준으로 내림차순하여 가져온다. 
public ArrayList<Member> allExpertCareere(SqlSessionTemplate sqlSession) {
return (ArrayList)sqlSession.selectList("memberMapper.allExpertCareere");
}
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}