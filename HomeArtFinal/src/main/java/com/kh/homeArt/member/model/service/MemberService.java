package com.kh.homeArt.member.model.service;

import java.util.ArrayList;


import com.kh.homeArt.common.Request;
import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.member.model.vo.Member;

public interface MemberService {

   int signUpUser(Member m);

   Member login(Member m);

   Member findId(Member m);

   Member searchPwEmail(Member m);

   int changePw(Member m);

   Member idScan(Member m);

///////////////////////////////////////////회원정보수정 파트///////////////////////////////////////////////////////   
   
//회원탈퇴
int deleteMember(String id);

Member selectEncodePwd(String id);

//닉네임 중복확인
int selectNickName(String nickName);

//전문가 회원정보 수정
int modifyExpert(Member loginUser);

//일반 회원 정보 수정
int modifyMember(Member loginUser);

//의뢰 요청 추가
int insertRequest(Request request);

//전문가id를 매개변수로 넘겨  프로필 조회
Expert selectExpertProfile(String id);

//전문가 프로필번호에 해당하는 요청List 가져오기
ArrayList<Request> selectRequestList(int expertProfileNo);

//요청의 상태가 W(대기)중일 경우 요청을 보낸 회원의 정보를 불러오기
Member selectMember(String memberId);

//로그인한 회원 계정으로 의뢰한 요청 조회해서 가져오기
ArrayList<Request> memberRequest(String id);

//해당 전문가 프로필에 동일한 회원ID로 이미 의뢰요청을 했는지 검사
int dupReqCheck(Request request);

//해당 전문가 프로필에 동일한 회원ID로  이미 매칭된 상태인지 검사
int dupReqCheck2(Request request);

//승인할 회원의 ID를 가진 REQUEST테이블의 해당 레코드 요청상태를 'Y'로 바꿔주기
int allowRequest(Request request);

//거절할 회원의 ID를 가진 REQUEST테이블의 해당 레코드 요청상태를 'N'으로 바꿔주기 
int rejectRequest(String requesterId);

//매칭 취소할 회원의 ID에 해당하는 REQUEST테이블의 해당 레코드의 요청상태를 'Y'에서  'N'으로 바꿔주기
int matchCancelE(String requesterId);

//전문가 프로필 넘버로 전문가 프로필 조회해서 받아오기
Expert selectExpertProfile2(int expertProfileNo);

//전문가 회원 정보를  경력을 기준으로 내림차순 상위 3개의 값을 가져옴 
ArrayList<Member> topExpertMemberList();

//모든 (전문가)Member객체를 가져옴
ArrayList<Member> allExpertMember();

//모든 (전문가)Member객체를 랜덤정렬로 가져옴
ArrayList<Member> randomExpertList();

//매칭 취소할 전문가 프로필 넘버에 해당하는 REQUEST테이블의 해당 레코드의 요청상태를 'Y'에서 'N'으로 바꿔주기 
int matchCancelM(int expertProfileNo);

//보낸 의뢰요청을 취소할 전문가 프로필 넘버에 해당하는 REQUEST테이블의 해당 레코드 요청상태를 'W'에서 'N'으로 바꿔주기 
int requestCancelM(int expertProfileNo);

//모든 전문가 회원의 객체를 경력을 기준으로 내림차순하여 가져온다. 
ArrayList<Member> allExpertCareere();

   
   
   
   
   
   
   
   
   
}