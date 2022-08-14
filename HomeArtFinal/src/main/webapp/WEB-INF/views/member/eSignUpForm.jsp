<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<link href="${contextPath}/resources/css/signUpFormCSS.css"  rel="stylesheet"/>
</head>
<body>

	<div class="bodyWrap">
		<c:import url="memberHeader.jsp"></c:import>
		<div class="container">
			<h2>전문가 회원가입</h2>
			<div class="containerBox">
				<div class="eProgress" id="eProgress">
					<div class="pBar"></div>
					<div class="pNum1 goSign"></div>
					<div class="pNum2"></div>
					<div class="pNum3"></div>
					<div class="pNum4"></div>
				</div>
				<form method="post" action="signUp.me" encType="multipart/form-data" >
					<div class="context" id="context">
						<div  class="signTable1 viewOn" id="signTable1">
							<table>
							<tbody>
								<tr>
									<td>
										<label class="inputName">아이디<strong class="ckS">(필수)</strong></label>
										<input type="text" name="id" id="userId" class="userId" />
										<div class="checkText checkId" id="checkId">영문,숫자 사용 및 4~16글자 입력</div>
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">비밀번호<strong class="ckS">(필수)</strong></label>
										<input type="password" name="pwd" id="userPw" class="userPw" />
										<div class="checkText checkPwd" id="checkPw">영문, 숫자, 특수문자(@$!%*?&) 사용 및 4~16글자 이상 입력</div>
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">비밀번호 확인<strong class="ckS">(필수)</strong></label>
										<input type="password" name="pwd2" id="userPw2" class="userPw2" />
										<div class="checkText checkPwd2" id="checkPw2"></div>
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">이메일<strong class="ckS">(필수)</strong></label>
										<input type="email" name="email" id="email" class="email" />
										<input type="text" name="emailCk" id="emailCk" class="emailCk" disabled="disabled" />
										<button type="button" id="checkEmailBt">인증번호전송</button>
										<div class="checkText checkEmail" id="checkEmail"></div>
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">이름<strong class="ckS">(필수)</strong></label>
										<input type="text" name="name" id="userName" class="userName" />
										<div class="checkText checkName" id="checkName">실명을 입력해주세요</div>
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">성별<strong class="ckS">(필수)</strong></label>
										<input type="radio" name="gender" value="남자" /> <label>남자</label>
										<input type="radio" name="gender" value="여자" /> <label>여자</label>
										<input type="radio" name="gender" value="미공개" checked/> <label>미공개</label>
									</td>
								</tr>
							</tbody>
							</table>
							<div class="signPage">
								<button type="button" id="signPrew1">돌아가기</button>
								<button type="button" id="signNext1">다음</button>
							</div>
						</div>
						<div  class="signTable2" id="signTable2">
							<table>
							<tbody>
								<tr> 
									<td>
										<label class="inputName">닉네임<strong class="ckS">(필수)</strong></label>
										<input type="text" name="nickName" id="nickName" class="nickName" />
										<input type="hidden" name="power" value="1"/>
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">연락처<strong class="ckS">(필수)</strong></label>
										<input type="text" name="phone" id="phone" class="phone" />
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">주소</label>
										<input type="text" name="address1" id="address1" class="address" />
										<button type="button" id="searchAddress">검색</button>
										<input type="text" name="address2" id="address2" class="address" />
										<input type="text" name="address3" id="address3" class="address" placeholder="상세주소 입력" />
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">프로필 사진</label>
										<span>프로필 사진은 내정보에서<br> 등록 및 변경이 가능합니다.</span>
										<div class="profilebox">
											<img id="profile" width="100" height="100">
										</div>
										<input type="file" id="profilePt" name="profilePt" accept="image/gif, image/jpeg, image/png, image/jpg" />
									</td>
								</tr>
							</tbody>
							</table>
							<div class="signPage">
								<button type="button" id="signPrew2">이전</button>
								<button type="button" id="signNext2">다음</button>
							</div>
						</div>
						<div class="signTable3" id="signTable3"> 
							<table>
							<tbody>
								<tr>
									<td>
										<h3>전문가 추가사항<strong>추후 마이페이지에서 등록/수정이 가능합니다.</strong></h3>
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">분야</label>
										<input type="checkbox" name="field" id="field1" class="field" value="이사/입주청소" /><label>이사/입주청소</label>
										<input type="checkbox" name="field" id="field2" class="field" value="타일시공" /><label>타일시공</label>
										<input type="checkbox" name="field" id="field3" class="field" value="도배/장판" /><label>도배/장판</label>
										<input type="checkbox" name="field" id="field4" class="field" value="에어컨 설치/수리" /><label>에어컨 설치/수리</label>
										<input type="checkbox" name="field" id="field5" class="field" value="실내 인테리어" /><label>실내 인테리어</label>
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">경력</label>
										<input type="text" name="career" id="career" class="career" maxlength="2"/>년
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">근무요일</label>
										<input type="checkbox" name="workingDay" id="day1" value="월요일"/><label>월</label>
										<input type="checkbox" name="workingDay" id="day2" value="화요일"/><label>화</label>
										<input type="checkbox" name="workingDay" id="day3" value="수요일"/><label>수</label>
										<input type="checkbox" name="workingDay" id="day4" value="목요일"/><label>목</label>
										<input type="checkbox" name="workingDay" id="day5" value="금요일"/><label>금</label>
										<input type="checkbox" name="workingDay" id="day6" value="토요일"/><label>토</label>
										<input type="checkbox" name="workingDay" id="day7" value="일요일"/><label>일</label>
									</td>
								</tr>
								<tr>
									<td>
										<label class="inputName">연락시간</label>
										<input type="time" name="workingTime1" id="working_dayOP" />
										<strong>~</strong>
										<input type="time" name="workingTime2" id="working_dayED" />
									</td>
								</tr>
							</tbody>
							</table>
							<div class="signPage">
								<button type="button" id="signPrew3">이전</button>
								<button type="button" id="signNext3">다음</button>
							</div>
						</div>
						<div  class="signTable4" id="signTable4">
							<table>
							<tbody>
								<tr>
									<td>
										<input type="checkbox" name="ckAll" id="ckAll" class="ckAll" />
										<label class="checkName">홈아트 이용약관, 개인정보 수집및 이용, 프로모션 정보수신(선택)에 모두 동의합니다.</label>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" name="ckService" id="ckService" class="ckOther" />
										<label class="checkName">홈아트 이용약관 동의<strong class="ckS">(필수)</strong></label>
										<textarea style="resize:none;" readonly>
											홈아트 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 홈아트 서비스의 이용과 관련하여 홈아트 서비스를 제공하는 홈아트 주식회사(이하 ‘홈아트’)와 이를 이용하는 홈아트 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 홈아트 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
											
											홈아트 서비스를 이용하시거나 홈아트 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
											
											다양한 홈아트 서비스를 즐겨보세요.
											홈아트는 www.homeArt.com을 비롯한 홈아트 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
											여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 홈아트 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 홈아트 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.
											
											홈아트는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.
											
											회원으로 가입하시면 홈아트 서비스를 보다 편리하게 이용할 수 있습니다.
											여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 홈아트는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 홈아트 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 홈아트 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 홈아트 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 홈아트 회원가입 방법 등에서 확인해 주세요.
											
											여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.
											홈아트는 여러분이 게재한 게시물이 홈아트 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 홈아트 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 말합니다.
											
											홈아트는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다.
											
											한편, 홈아트 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다.
											게시물 게재로 여러분은 홈아트에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다.
											
											홈아트는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 홈아트 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.
											만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.
											
											또한 여러분이 제공한 소중한 콘텐츠는 홈아트 서비스를 개선하고 새로운 홈아트 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 홈아트 및 홈아트 계열사에서 사용될 수 있습니다. 홈아트는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.
											
											홈아트는 여러분이 자신이 제공한 콘텐츠에 대한 홈아트 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 홈아트 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.
											다만, 일부 홈아트 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다.
											
											여러분의 개인정보를 소중히 보호합니다.
											홈아트는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 홈아트가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.
											
											타인의 권리를 존중해 주세요.
											여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. 홈아트는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요.
											
											한편, 홈아트 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다. 여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다.
											
											홈아트는 여러분이 홈아트 서비스를 마음껏 이용할 수 있도록 여러분께 홈아트 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다. 이 경우 여러분의 자유로운 이용은 홈아트가 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요.
											
											홈아트 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.
											홈아트는 여러분이 홈아트 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 홈아트 서비스를 보다 안전하게 이용하고 홈아트 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 홈아트 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.
											
											회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.
											타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.
											관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.
											자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.
											자동화된 수단을 활용하는 등 홈아트 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 홈아트 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 홈아트 서비스 이용에 불편을 초래하고 더 나아가 홈아트의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.
											홈아트의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 홈아트 서비스 회원으로 가입을 시도 또는 가입하거나, 홈아트 서비스에 로그인을 시도 또는 로그인하거나, 홈아트 서비스 상에 게시물을 게재하거나, 홈아트 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), 홈아트 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, 홈아트 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 홈아트 서비스의 제공 취지에 부합하지 않는 방식으로 홈아트 서비스를 이용하거나 이와 같은 홈아트 서비스에 대한 어뷰징(남용) 행위를 막기 위한 홈아트의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.
											홈아트의 동의 없이 자동화된 수단에 의해 홈아트 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, 홈아트 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. 홈아트 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 홈아트 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.
											홈아트는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.
											
											부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.
											홈아트는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 홈아트가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.
											
											또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 홈아트는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 홈아트 서비스 이용에 대한 주의를 당부하거나, 홈아트 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 홈아트 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다.
											
											부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다.
											
											홈아트 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 홈아트는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다.
											
											언제든지 홈아트 서비스 이용계약을 해지하실 수 있습니다.
											홈아트에게는 참 안타까운 일입니다만, 회원은 언제든지 홈아트 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 홈아트는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다.
											
											홈아트 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 홈아트가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.
											
											일부 홈아트 서비스에는 광고가 포함되어 있습니다.
											여러분이 다양한 홈아트 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다. 홈아트 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다.
											
											원하는 홈아트 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 홈아트 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 홈아트가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다.
											
											홈아트는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다.
											
											한편, 홈아트는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다.
											
											이 경우 홈아트는 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다.
											
											홈아트는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 홈아트는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.
											
											여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.
											홈아트는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다.
											
											홈아트는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.
											
											홈아트는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 홈아트에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 홈아트로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다.
											
											홈아트 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다.
											
											본 약관은 한국어를 정본으로 합니다. 본 약관 또는 홈아트 서비스와 관련된 여러분과 홈아트와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 홈아트 서비스와 관련하여 여러분과 홈아트 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.
											
											공지 일자: 2022년 6월 20일
											적용 일자: 2022년 6월 30일
											홈아트 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 1588 – ****/ 평일 09:00~18:00)로 문의 주시기 바랍니다.
										</textarea>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" name="ckPrivacy" id="ckPrivacy" class="ckOther" />
										<label class="checkName">개인정보 수집 및 이용 동의<strong class="ckS">(필수)</strong></label>
										<textarea style="resize:none;" readonly>
											개인정보보호법에 따라 홈아트에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

											1. 수집하는 개인정보
											이용자는 회원가입을 하지 않으면 정보 검색, 게시판 보기 등 대부분의 홈아트 서비스를 회원과 동일하게 이용할 수 없습니다.
											
											회원가입 시점에 홈아트가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
											- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 성별, 이메일’을 필수항목으로 수집합니다. 그리고 선택항목으로 이메일 주소, 연락처, 주소를 수집합니다.
											서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
											- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진, 프로필 소개)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 이름이 별명으로 자동 입력됩니다.
											
											- 홈아트 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
											
											서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
											구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
											2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
											홈아트에서 제공하는 위치기반 서비스에 대해서는 '홈아트 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
											이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
											
											2. 수집한 개인정보의 이용
											홈아트 및 홈아트 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
											
											- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
											- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
											- 법령 및 홈아트 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
											- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
											- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
											- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
											- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
											3. 개인정보의 보관기간
											이용자의 개인정보를 회원 탈퇴 시 에도 영구 보관됩니다.
											단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
											
											이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
											- 부정 가입 및 이용 방지
											부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 영구 보관
											탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 영구 보관
											- 스마트플레이스 분쟁 조정 및 고객문의 대응
											휴대전화번호:등록/수정/삭제 요청 시로부터 영구 보관
											- 지식iN eXpert 재가입 신청 및 부정 이용 방지
											- 전자상거래 등에서 소비자 보호에 관한 법률
											계약 또는 청약철회 등에 관한 기록: 영구 보관
											대금결제 및 재화 등의 공급에 관한 기록: 영구 보관
											소비자의 불만 또는 분쟁처리에 관한 기록: 영구 보관
											- 전자문서 및 전자거래 기본법
											공인전자주소를 통한 전자문서 유통에 관한 기록 : 영구 보관
											- 전자서명 인증 업무
											인증서와 인증 업무에 관한 기록: 영구 보관
											- 통신비밀보호법
											로그인 기록: 1개월
											
											4. 개인정보 수집 및 이용 동의를 거부할 권리
											이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
										</textarea>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" name="ckPromotion" id="ckPromotion" class="ckOther" />
										<label class="checkName">프로모션정보 수진 동의<strong>(선택)</strong></label>
										<textarea style="resize:none;" readonly>
											홈아트에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(홈아트앱 알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 홈아트 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
										</textarea>
									</td>
								</tr>
								</tbody>
							</table>
							<div class="signPage">
								<button type="button" id="signPrew4">이전</button>
								<button type="submit" id="signNext4">회원가입</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
	
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(function(){
	// 로그인 돌아가기
	$("#signPrew1").click(function(){
		if(confirm('수정을 취소하시겠습니까?\n작성내용은 저장되지 않습니다.')){
			window.history.go(-1);
		}
	});
	
	// 페이지 넘어가기 체크
	var page1Id = false;
	var page1Pw1 = false;
	var page1Pw2 = false;
	var page1Email = false;
	var page1Name = false;
	
	// 1페이지 
	$("#signPrew1").click(function(){
		if(confirm('수정을 취소하시겠습니까?\n작성내용은 저장되지 않습니다.')){
			window.history.go(-1);
		}
	});
	
	
	
	$("#userId").change(function(){
		var id = $("#userId");
		var idLength =$(this).val().length;
		var idRule =  /[^0-9a-zA-Z]/g;
		if( idLength > 16 && idLength < 4 && idRule.test($(this).val())){
			$(this).focus();
			$("#checkId").html('영문,숫자 사용 및 4~16글자로 입력해 주세요.').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			page1Id = false;
		} else if( idLength > 16 || idLength < 4){
			$(this).focus();
			$("#checkId").html('4~16글자로 입력해 주세요.').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			page1Id = false;
		} else if(idRule.test($(this).val())){
			$(this).focus();
			$("#checkId").html('사용할 수 없는 문자가 포함되 있습니다.').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			page1Id = false;
		} else {
			$.ajax({
				url:'idScan.me',
				data: {id:id.val()},
				success: function(data){
					console.log(data);
					if(data == "newId"){
						$("#checkId").html('사용가능한 아이디 입니다.').attr({'style':'color:green'});
						$(this).css("border","1px solid #A7A7A7");
						page1Id = true;
					} else {
						$("#checkId").html("이미 사용중인 아이디 입니다.").attr({'style':'color:red'});
						$(this).css("border","1px solid red");
						page1Id = false;
					}
				},
				error: function(data){
					console.log(data);
				}
			});
		}
	});
	
	
	// 비밀번호 유효성검사
	$("#userPw").on('change paste keyup', function(){
		page1Pw1 = false;
	});
	
	$("#userPw").change(function(){
		var pwLength = $(this).val().length;
		var pwRule = /[^a-zA-Z0-9@$!%*?&]/g;
		var pwRule2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/g;
		
		if( pwLength > 16 || pwLength < 4){
			$(this).focus();
			$("#checkPw").html('6글자 이상 입력해 주세요.').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			page1Pw1 = false;
		}  else if(!pwRule2.test($(this).val())){
			$(this).focus();
			$("#checkPw").html('영문,숫자,특수문자(@$!%*?&)를 섞어서 사용해주세요').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			page1Pw1 = false;
		} else if(pwRule.test($(this).val())){
			$(this).focus();
			$("#checkPw").html('사용할 수 없는 문자가 포함되 있습니다. 특수문자 @$!%*?&만 사용').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			page1Pw1 = false;
		} else{
			$("#checkPw").html('사용가능한 비밀번호 입니다.').attr({'style':'color:green'});
			$(this).css("border","1px solid #A7A7A7");
			page1Pw1 = true;
		}
	});
	
	
	
	// 비밀번호 확인
	$("#userPw2").on('change paste keyup', function(){
		page1Pw2 = false;
	});
	
	$("#userPw2").change(function(){
		var pwd1 = $("#userPw").val();
		var pwd2 = $("#userPw2").val();
		if(pwd1 != pwd2){
			$(this).focus();
			$("#checkPw2").html('비밀번호가 일치하지 않습니다.').attr({'style':'color:red'});
			$(this).css("border","1px solid red");
			page1Pw2 = false;
		} else {
			$("#checkPw2").html('확인되었습니다.').attr({'style':'color:green'});
			$(this).css("border","1px solid #A7A7A7");
			page1Pw2 = true;
		}
	});
	
	// 이메일 인증
	
	var emailCheckNum = "";
	$("#checkEmailBt").click(function(){
		
		var userEmail = $("#email").val(); 
		var checkText = $("#checkEmail");
		if(userEmail == ""){
			alert("메일주소를 입력해 주세요");
		} else{
			$.ajax({
				url:"checkEmail.me",
				data:{email:userEmail},
				success :function(data){
					console.log("성공 :"+data);
					$("#emailCk").attr("disabled",false);
					$("#checkEmail").html("메일을 발송했습니다.").attr({'style':'color:green'});
					code = data;
				},
				error: function(data){
					console.log("실패 :"+data);	
					$("#checkEmail").html('메일주소를 확인해 주세요.').attr({'style':'color:red'});
				}
			});
		}
	});
	// 이메일 인증번호 입력
	$("#emailCk").on('change paste keyup', function(){
		page1Email = false;
	});
	
	$("#emailCk").blur(function(){
		if($(this).val() == code){
			$("#checkEmail").html("확인되었습니다.").attr({'style':'color:green'});
			page1Email = true;
		} else{
			$("#checkEmail").html('인증번호가 일치하지 않습니다.').attr({'style':'color:red'});
			page1Email = false;
		}
		
	});
	
	// 이름 입력확인
	$("#userName").on('change paste keyup', function(){
		page1Name = false;
	});
	$("#userName").blur(function(){
		if($("#userName").val() != ""){
			page1Name = true;
		}
	});
	
	
	// 2페이지 이동
	$("#signNext1").click(function(){
		if($("#userId").val() ==""){
			alert("아이디를 입력 해 주세요.");
			return false;
		}
		
		
		if(page1Id && page1Pw1 && page1Pw2 && page1Email && page1Name){
			$("#eProgress>div:first-of-type").css("width","33%");
			$("#context>div").fadeOut(500);
			setTimeout(function() { 
				$("#eProgress>div:nth-of-type(3)").addClass("goSign");
				$("#signTable2").fadeIn(500);
			}, 500);
			console.log(page1Id,page1Pw1,page1Pw2,page1Email,page1Name);
		} else{
			alert("필수 입력사항을 확인해 주세요");
			console.log(page1Id,page1Pw1,page1Pw2,page1Email,page1Name);
		}  
		 
	});
	
	// 1페이지 돌아가기
	$("#signPrew2").click(function(){
		$("#eProgress>div:first-of-type").css("width","0%");
		$("#eProgress>div:nth-of-type(3)").removeClass("goSign");
		$("#context>div").fadeOut(500);
		setTimeout(function() { 
			$("#signTable1").fadeIn(500);
		}, 500);
	});
	

	// 주소검색
	$("#searchAddress").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#address1").val(data.zonecode);
	        	$("#address2").val(data.address);
	        	$("#address3").focus();
	        }
	    }).open();
	});
	
	// 프로필 이미지 미리보기
	$("#profile").click(function(){
		$("#profilePt").click();
	});
	
	$("#profilePt").on("change", function(e){
			var file = e.target.files[0];
			var reader = new FileReader();
			reader.onload = function(ev){
				$("#profile").attr("src", ev.target.result);
			}
			reader.readAsDataURL(file);
	});
	
	// 3페이지로 이동
	$("#signNext2").click(function(){
		// 닉네임 입력안하면 이름 가져오게하기
		if($("#nickName").val() ==""){
			$("#nickName").val($("#userName").val());
		}
		if($("#phone").val() ==""){
			alert("필수사항을 입력 해 주세요.");
			return false;
		}
		$("#eProgress>div:first-of-type").css("width","66%");
		$("#context>div").fadeOut(500);
		setTimeout(function() { 
			$("#eProgress>div:nth-of-type(4)").addClass("goSign");
			$("#signTable3").fadeIn(500);
		}, 500);
	});
	
	// 2페이지 돌아가기
	$("#signPrew3").click(function(){
		$("#eProgress>div:first-of-type").css("width","33%");
		$("#eProgress>div:nth-of-type(4)").removeClass("goSign");
		$("#context>div").fadeOut(500);
		setTimeout(function() { 
			$("#signTable2").fadeIn(500);
		}, 500);
	});
	
	// 4페이지로 이동
	$("#signNext3").click(function(){
		$("#eProgress>div:first-of-type").css("width","100%");
		$("#context>div").fadeOut(500);
		setTimeout(function() { 
			$("#eProgress>div:nth-of-type(5)").addClass("goSign");
			$("#signTable4").fadeIn(500);
		}, 500);
	});
	
	// 3페이지 돌아가기
	$("#signPrew4").click(function(){
		$("#eProgress>div:first-of-type").css("width","66%");
		$("#eProgress>div:nth-of-type(5)").removeClass("goSign");
		$("#context>div").fadeOut(500);
		setTimeout(function() { 
			$("#signTable3").fadeIn(500);
		}, 500);
	});
	
	// 체크박스 설정
	$("#ckAll").click(function(){
		var checked = $("#ckAll").is(":checked");
		if(checked){
			$(".ckOther").prop("checked",true);
		}
	});
	$(".ckOther").click(function(){
		var checked = $("ckOther").is(":checked");
		if(!checked){
			$("#ckAll").prop("checked",false);
		}
	});
	
	// 회원가입 진행
	$("#signNext4").click(function(){
		var checked1 = $("#ckService").is(":checked");
		var checked2 = $("#ckPrivacy").is(":checked");
		if(checked1 && checked2){
			return true;
		}else{
			alert("필수사항에 동의해 주세요.");
			return false;
		}
	});
	
});
</script>
</html>