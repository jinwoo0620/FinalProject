package com.kh.homeArt.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.kh.homeArt.common.Request;
import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.member.model.dao.MemberDAO;
import com.kh.homeArt.member.model.vo.Member;
@Service("mService")
public class MemberServiceImpl implements MemberService{
   
   @Autowired
   private MemberDAO mDAO;
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   // 회원가입
   @Override
   public int signUpUser(Member m) {
       return mDAO.signUpUser(sqlSession, m);
   }

   // 로그인 
   @Override
   public Member login(Member m) {
       return mDAO.login(sqlSession,m);
   }

   // 아이디찾기_회원조회
   @Override
   public Member findId(Member m) {
      return mDAO.findId(sqlSession,m);
   }

   // 비번찾기_인증메일
   @Override
   public Member searchPwEmail(Member m) {
      return mDAO.searchPwEmail(sqlSession,m);
   }

   // 비번 찾기
   @Override
   public int changePw(Member m) {
      return mDAO.changePw(sqlSession, m);
   }

   // 아이디 중복검사
   @Override
   public Member idScan(Member m) {
      return mDAO.idScan(sqlSession, m);
   }
   
   
   
///////////////////////////////////////////회원정보수정 파트///////////////////////////////////////////////////////      

@Override
public int deleteMember(String id) {
return mDAO.deleteMember(sqlSession, id);
}

@Override
public Member selectEncodePwd(String id) {   
return mDAO.selectEncodePwd(sqlSession, id);
}

@Override
public int selectNickName(String nickName) {
return mDAO.selectNickName(sqlSession, nickName);
}

@Override
public int modifyExpert(Member loginUser) {
return mDAO.modifyExpert(sqlSession, loginUser);

}

//일반회원 정보 수정
@Override
public int modifyMember(Member loginUser) {
return mDAO.modifyMember(sqlSession, loginUser);
}


//요청 레코드 추가
@Override
public int insertRequest(Request request) {
return mDAO.insertRequest(sqlSession, request);
}

//전문가 id로 작성한 프로필 조회
@Override
public Expert selectExpertProfile(String id) {
return mDAO.selectExpertProfile(sqlSession, id);
}


//전문가 프로필 번호에 해당하는 의뢰 요청 List갖고 오기
@Override
public ArrayList<Request> selectRequestList(int expertProfileNo) {
return mDAO.selectRequestList(sqlSession, expertProfileNo);
}

//요청의 상태가 W(대기)중일 경우 요청을 보낸 회원의 정보를 불러오기
@Override
public Member selectMember(String memberId) {
return mDAO.selectMember(sqlSession, memberId);
}

//로그인한 회원 계정으로 의뢰한 요청 조회해서 가져오기
@Override
public ArrayList<Request> memberRequest(String id) {
return mDAO.memberRequest(sqlSession, id);

}

//해당 전문가 프로필에 동일한 회원ID로 이미 의뢰요청을 했는지 검사
@Override
public int dupReqCheck(Request request) {
return mDAO.dupReqCheck(sqlSession, request);
}

//해당 전문가 프로필에 동일한 회원ID로  이미 매칭된 상태인지 검사
@Override
public int dupReqCheck2(Request request) {
return mDAO.dupReqCheck2(sqlSession, request);
}

//승인할 회원의 ID를 가진 레코드의 요청상태 'Y'으로 바꿔주기
@Override
public int allowRequest(Request request) {
return mDAO.allowRequest(sqlSession, request);
}

//거절할 회원의 ID를 가진 REQUEST테이블의 해당 레코드 요청상태를 'N'으로 바꿔주기
@Override
public int rejectRequest(String requesterId) {
return mDAO.rejectRequest(sqlSession, requesterId);
}

//매칭 취소할 회원의 ID에 해당하는 REQUEST테이블의 해당 레코드의 요청상태를 'Y'에서  'N'으로 바꿔주기
@Override
public int matchCancelE(String requesterId) {
return mDAO.matchCancelE(sqlSession, requesterId);
}

//전문가 프로필 넘버로 전문가 프로필 조회해서 받아오기
@Override
public Expert selectExpertProfile2(int expertProfileNo) {
return mDAO.selectExpertProfile2(sqlSession, expertProfileNo);
}

//전문가 회원 정보를  경력을 기준으로 내림차순 상위 3개의 값을 가져옴 
@Override
public ArrayList<Member> topExpertMemberList() {
return mDAO.topExpertMemberList(sqlSession);
}

//모든 (전문가)Member객체를 가져옴
@Override
public ArrayList<Member> allExpertMember() {
return mDAO.allExpertMember(sqlSession);
}

//모든 (전문가)Member객체를 랜덤정렬로 가져옴
@Override
public ArrayList<Member> randomExpertList() {
return mDAO.randomExpertList(sqlSession);
}

//매칭 취소할 전문가 프로필 넘버에 해당하는 REQUEST테이블의 해당 레코드의 요청상태를 'Y'에서 'N'으로 바꿔주기 
@Override
public int matchCancelM(int expertProfileNo) {
return mDAO.matchCancelM(sqlSession, expertProfileNo);
}

//보낸 의뢰요청을 취소할 전문가 프로필 넘버에 해당하는 REQUEST테이블의 해당 레코드 요청상태를 'W'에서 'N'으로 바꿔주기 
@Override
public int requestCancelM(int expertProfileNo) {
return mDAO.requestCancelM(sqlSession, expertProfileNo);
}

//모든 전문가 회원의 객체를 경력을 기준으로 내림차순하여 가져온다. 
@Override
public ArrayList<Member> allExpertCareere() {
return mDAO.allExpertCareere(sqlSession);
}
   
   
   
   
   
   
   
   
   
   
   
   
   
}