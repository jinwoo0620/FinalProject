
package com.kh.homeArt.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.homeArt.common.Request;
import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.member.model.exception.MemberException;
import com.kh.homeArt.member.model.service.MemberService;
import com.kh.homeArt.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

	@Autowired // string security
	private BCryptPasswordEncoder bcrypt;

	@Autowired
	private JavaMailSender mailSender; // 메일전송

	// 로그인 페이지로 이동
	@RequestMapping("loginView.me")
	public String loginView() {

		return "loginForm";
	}

	// 일반회원가입 페이지로 이동
	@RequestMapping("signUpView.me")
	public String signUpView() {

		return "signUpForm";
	}

	// 전문가 회원가입 페이지 이동
	@RequestMapping("eSignUpView.me")
	public String eSignUpView() {

		return "eSignUpForm";
	}

	// 회원가입
	@RequestMapping("signUp.me")
	public String signUp(@ModelAttribute Member m, @RequestParam("profilePt") MultipartFile profilePt,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2,
			@RequestParam("address3") String address3, @RequestParam("workingTime1") String workingTime1,
			@RequestParam("workingTime2") String workingTime2, HttpServletRequest request, Model model) {

		m.setPwd(bcrypt.encode(m.getPwd()));
		if (!address1.isEmpty() || !address2.isEmpty()) {
			m.setAddress(address1 + "/" + address2 + "/" + address3);
		}
		if (!workingTime1.isEmpty() || !workingTime2.isEmpty()) {
			m.setWorkingTime(workingTime1 + "~" + workingTime2);
		}

		System.out.println(m);
		System.out.println(profilePt);

		// 파일이 들어오지 않은경우 제외
		if (profilePt != null && !profilePt.isEmpty()) {
			String changeName = saveFile(profilePt, request);
			m.setOriginalFileName(profilePt.getOriginalFilename());
			m.setRenameFileName(changeName);
		}else {
	         m.setOriginalFileName("humanICon.png");
	         m.setRenameFileName("humanICon.png");
	      }
		System.out.println("사진넣은후 m : " + m);
		int result = mService.signUpUser(m);

		if (result > 0) {
			model.addAttribute("loginUser", m);
			return "signSuccess";
		} else {
			throw new MemberException("회원가입에에 실패하였습니다.");
		}

	}

	// (사용자 정의 메소드)
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\muploadFiles";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originName = file.getOriginalFilename();
		String changeName = sdf.format(new Date(System.currentTimeMillis()))
				+ originName.substring(originName.lastIndexOf("."));

		String saveImage = folder + "\\" + changeName;

		try {
			file.transferTo(new File(saveImage));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return changeName; // 변경된 이름을 회원가입시 같이 insert 하기 위해 보냄
	}

	// 아이디 중복 체크
	@RequestMapping("idScan.me")
	@ResponseBody
	public String idScan(@RequestParam("id") String id, Member m) {
		m.setId(id);
		Member result = mService.idScan(m);

		if (result != null) {
			return "usedId";
		} else {
			return "newId";
		}
	}

	// 아이디 찾기 페이지 이동
	@RequestMapping("searchId.me")
	public String searchId() {

		return "searchId";
	}

	// 아이디 찾기
	@RequestMapping("findId.me")
	@ResponseBody
	public String findId(@ModelAttribute Member m) {

		Member realMember = mService.findId(m);
		System.out.println(realMember);

		if (realMember != null) {
			// 메일전송
			String companyEmail = "minsuk0531@naver.com";
			String signEmail = m.getEmail();
			String title = "[홈아트]고객님의 아이디 조회요청 결과 보내드립니다.";
			String context = "<div style=\"margin: 0; padding: 0; height: 100%; min-height: 100%; font-family: Roboto, Noto Sans KR, Malgun Gothic, Segoe UI, helvetica, apple sd gothic neo, sans-serif, serif;\">"
					+ "<div style=\"display: inline-block; margin: 20px auto; padding: 50px 20px; text-align: center; width: 620px; border: 1px solid #4F8CD1;\">"
					+ "<a href=\"http://localhost:9580/homeArt/home.do\" target=\"_blank\" rel=\"noreferrer noopener\"><img src=\"https://imgur.com/rsbpQp6.png\" style=\"width: 100px; margin-bottom: 20px;\"></a><br><br>"
					+ "안녕하세요, <span style='color:red;font-size:1.2em;font-weight:bold;'>" + m.getName()
					+ " </span> 고객님!<br>" + "고객님께서 요청하신 아이디 조회 내역 보내드립니다.<br><br>"
					+ "<span style='color:blue; font-size:1.5em;font-weight:bold;'>" + realMember.getId()
					+ "</span><br><br>" + "고객님께요 요청하신 조회 내역이 아니실 경우 고객센터로 신고해주시기 바랍니다." + "</div>" + "</div>";
			MimeMessage message = mailSender.createMimeMessage();

			try {
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				helper.setFrom(companyEmail);
				helper.setTo(signEmail);
				helper.setSubject(title);
				helper.setText(context, true);
				mailSender.send(message);

			} catch (MessagingException e) {
				e.printStackTrace();
			}

			return "sendEmail";
		} else {
			return "noEmail";
		}

	}

	// 비밀번호 찾기 페이지 이동
	@RequestMapping("searchPw.me")
	public String searchPw() {

		return "searchPw";
	}

	// 비밀번호 찾기 인증번호 보내기
	@RequestMapping("searchPwEmail.me")
	@ResponseBody
	public String searchPwEmail(@ModelAttribute Member m, Model model) {
		System.out.println(m);
		Member loginUser = mService.searchPwEmail(m);

		if (loginUser != null) {

			// 인증번호 생성
			Random rd = new Random();
			Integer rdNum = rd.nextInt(888888) + 111111;
			System.out.println(rdNum);

			// 메일전송
			String companyEmail = "minsuk0531@naver.com";
			String signEmail = m.getEmail();
			String title = "[홈아트]이메일 인증번호가 도착했습니다.";
			String context = "<div style=\"margin: 0; padding: 0; height: 100%; min-height: 100%; font-family: Roboto, Noto Sans KR, Malgun Gothic, Segoe UI, helvetica, apple sd gothic neo, sans-serif, serif;\">"
					+ "<div style=\"display: inline-block; margin: 20px auto; padding: 50px 20px; text-align: center; width: 620px; border: 1px solid #4F8CD1;\">"
					+ "<a href=\"http://localhost:9580/homeArt/home.do\" target=\"_blank\" rel=\"noreferrer noopener\"><img src=\"https://imgur.com/rsbpQp6.png\" style=\"width: 100px; margin-bottom: 20px;\"></a><br><br>"
					+ "안녕하세요, <span style='color:red;font-size:1.2em;font-weight:bold;'>" + m.getName()
					+ " </span> 고객님!<br>" + "비밀번호 재설정을 위한 이메일 인증번호 보내드립니다.<br><br>"
					+ "<span style='color:blue; font-size:1.5em;font-weight:bold;'>" + rdNum + "</span><br><br>"
					+ "고객님께요 요청하신 내역이 아니실 경우 고객센터로 신고해주시기 바랍니다." + "</div>" + "</div>";
			MimeMessage message = mailSender.createMimeMessage();

			try {
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				helper.setFrom(companyEmail);
				helper.setTo(signEmail);
				helper.setSubject(title);
				helper.setText(context, true);
				mailSender.send(message);

			} catch (MessagingException e) {
				e.printStackTrace();
			}
			model.addAttribute("loginUser", loginUser);
			return rdNum.toString();
		} else {
			return "noEmail";
		}

	}

	// 비밀번호 재설정페이지 이동(인증번호가 맞을시)
	@RequestMapping("findPwView.me")
	public String findPwView() {
		return "findPw";
	}

	// 비밀번호 재설정페이지 처리
	@RequestMapping("changePw.me")
	public String findPw(@RequestParam("pwd") String pwd, HttpSession session) {
		String loginId = ((Member) session.getAttribute("loginUser")).getId();
		String changePwd = bcrypt.encode(pwd);
		Member m = new Member();
		m.setId(loginId);
		m.setPwd(changePwd);
//      System.out.println(m);

		int result = mService.changePw(m);

		if (result > 0) {
			return "loginForm";
		} else {
			throw new MemberException("비밀번호 변경에 실패하였습니다.");
		}

	}

	// 회원가입 이메일 인증
	@RequestMapping("checkEmail.me")
	@ResponseBody // 리턴값을 경로가 아닌 데이터로 변경**
	public String checkEmail(@RequestParam("email") String email) throws Exception {
		System.out.println(email); // 입력 메일 체크

		// 인증번호 생성
		Random rd = new Random();
		Integer rdNum = rd.nextInt(888888) + 111111;
		System.out.println(rdNum);

		// 메일전송
		String companyEmail = "jwrla0620@naver.com";
		String signEmail = email;
		String title = "[홈아트]이메일 인증번호가 도착했습니다.";
		String context = "<div style=\"margin: 0; padding: 0; height: 100%; min-height: 100%; font-family: Roboto, Noto Sans KR, Malgun Gothic, Segoe UI, helvetica, apple sd gothic neo, sans-serif, serif;\">"
				+ "<div style=\"display: inline-block; margin: 20px auto; padding: 50px 20px; text-align: center; width: 620px; border: 1px solid #4F8CD1;\">"
				+ "<a href=\"http://localhost:9580/homeArt/home.do\" target=\"_blank\" rel=\"noreferrer noopener\"><img src=\"https://imgur.com/rsbpQp6.png\" style=\"width: 100px; margin-bottom: 20px;\"></a><br><br>"
				+ "안녕하세요, 고객님!<br>" + "고객님께서는 <span style='color:red;font-size:1.2em;font-weight:bold;'>" + signEmail
				+ " </span>을 홈아트 회원가입 이메일로 등록하셨습니다.<br>" + "서비스 정상 가입을 위해, 아래 인증번호를 인증번호 확인란에 입력해 주세요.<br><br>"
				+ "<span style='color:blue; font-size:1.5em;font-weight:bold;'>" + rdNum + "</span><br><br>"
				+ "이 이메일주소로 가입한 적이 없으시다면 고객센터로 신고해주시기 바랍니다." + "</div>" + "</div>";

		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(companyEmail);
			helper.setTo(signEmail);
			helper.setSubject(title);
			helper.setText(context, true);
			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return rdNum.toString();
	}

	// 일반 로그인
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	@ResponseBody
	public String login(Member m, Model model) {
		System.out.println("암호화pwd : " + bcrypt.encode(m.getPwd()));
		Member loginUser = mService.login(m);
		if (loginUser == null) {
			return "noUser";
		}
		if (loginUser.getPower() == 0 || loginUser.getPower() == 2) {
			boolean pwMatch = bcrypt.matches(m.getPwd(), loginUser.getPwd());
			// System.out.println("loginUser" + loginUser);

			if (pwMatch) {
				model.addAttribute("loginUser", loginUser);
				return "success";
			} else {
				return "noUser";
			}
		} else {
			return "expert";
		}
	}

	// 전문가 로그인
	@RequestMapping(value = "elogin.me", method = RequestMethod.POST)
	@ResponseBody
	public String elogin(Member m, Model model) {
		System.out.println("암호화pwd : " + bcrypt.encode(m.getPwd()));
		Member loginUser = mService.login(m);
		if (loginUser == null) {
			return "noUser";
		}
		if (loginUser.getPower() == 1) {
			boolean pwMatch = bcrypt.matches(m.getPwd(), loginUser.getPwd());
			// System.out.println("loginUser" + loginUser);

			if (pwMatch) {
				model.addAttribute("loginUser", loginUser);
				return "success";
			} else {
				return "noUser";
			}
		} else {
			return "expert";
		}
	}

	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus st) {
		st.setComplete();
		return "redirect:home.do";
	}

//////////////////////////////////////////////회원정보 수정 파트///////////////////////////////////////////////

	@RequestMapping("caleander.me")
	public String caleanderPage() {
		return "scheduleForm";
	}

//전문가 회원정보 수정 
	@RequestMapping("expertModifyForm.me")
	public String expertModifyForm(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null) {

			String[] phoneArr = loginUser.getPhone().split("-");
			String[] emailArr = loginUser.getEmail().split("@");

			model.addAttribute("phoneArr", phoneArr);
			model.addAttribute("emailArr", emailArr);

//공통 선택입력값
			if (loginUser.getAddress() != null) {

				String[] addressArr = loginUser.getAddress().split("/");

				model.addAttribute("addressArr", addressArr);
			}

//전문가 추가사항(선택입력값)
			if (loginUser.getCareer() != null) {

				String career = loginUser.getCareer();

				model.addAttribute("career", career);
			}

			if (loginUser.getField() != null) {

				String field = loginUser.getField();

				model.addAttribute("field", field);
			}

			if (loginUser.getWorkingDay() != null) {

				String workingDay = loginUser.getWorkingDay();

				model.addAttribute("workingDay", workingDay);
			}

			if (loginUser.getWorkingTime() != null) {

				String[] workingTimeArr = loginUser.getWorkingTime().split("~");

				String[] workingStartArr = workingTimeArr[0].split(":");
				String[] workingFinishArr = workingTimeArr[1].split(":");

				model.addAttribute("workingStartArr", workingStartArr);
				model.addAttribute("workingFinishArr", workingFinishArr);
			}

		}

		return "expertModifyForm";
	}

//일반회원 정보수정 폼 가기 
	@RequestMapping("memberModifyForm.me")
	public String memberModifyForm(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null) {

			String[] phoneArr = loginUser.getPhone().split("-");
			String[] emailArr = loginUser.getEmail().split("@");

			model.addAttribute("phoneArr", phoneArr);
			model.addAttribute("emailArr", emailArr);

//공통 선택입력값
			if (loginUser.getAddress() != null) {

				String[] addressArr = loginUser.getAddress().split("/");

				model.addAttribute("addressArr", addressArr);
			}
		}

		return "memberModifyForm";
	}

	@RequestMapping("memberDeleteForm.me")
	public String deleteMember() {
		return "memberDeleteForm";
	}

	@RequestMapping("home.do")
	public String main() {
		return "../../../index";
	}

//회원탈퇴
	@RequestMapping("memberDelete.me")
	public String memberDelete(@RequestParam("password1") String password1, @RequestParam("password2") String password2,
			@RequestParam("id") String id, HttpSession session) {
		System.out.println("id:" + id);
		System.out.println("password1:" + password1);
		System.out.println("password2:" + password2);

		Member loginUser = (Member) session.getAttribute("loginUser");

//현재 로그인한 계정의 암호화된 비밀번호 와 회원 탈퇴하기에서 입력한 비밀번호를 같은지 비교 
		boolean match1 = bcrypt.matches(password1, loginUser.getPwd());

//현재 로그인한 계정의 id와 회원 탈퇴하기에서 입력한 id를 같은지 비교 
		boolean match2 = id.equals(loginUser.getId());

		System.out.println("boolean타입의 match:" + match1);

		if (match1 && match2) { // 두 조건이 모두 true면
			int result = mService.deleteMember(loginUser.getId());

			System.out.println("result: " + result);

			if (result > 0) {
				return "redirect:logout.me";
				/*
				 * throw new MemberException(
				 * "회원탈퇴에 성공하셨습니다. 그 동안 저희 HomeArt를 이용해주신 고객님께 감사의 말씀을 드립니다. 더욱 발전하는 HomeArt가 되도록 노력하겠습니다."
				 * );
				 */
			} else {
				throw new MemberException("회원탈퇴에 실패하였습니다.");
			}
		} else {
			throw new MemberException("일치하는 회원정보가 없습니다. 회원탈퇴에 실패하였습니다.");
		}
	}

//닉네임 중복확인
	@RequestMapping("checkNickName.me")
	public void checkNickName(@RequestParam("nickName") String nickName, HttpServletResponse response) {
		System.out.println("입력받은 닉네임: " + nickName);

		int nickNameCount = mService.selectNickName(nickName);

		System.out.println("같은 닉네임을 가진 회원 수:" + nickNameCount);

		try {
			PrintWriter out = response.getWriter();

			if (nickNameCount > 0) {
				out.print("1");
			} else {
				out.print("0");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//변경하려는 Pwd와 현재 Pwd가 같은지 확인하는 요청에 대한 처리(Ajax)
	@RequestMapping("pwDupCheck.me")
	public void pwDupCheck(@RequestParam("password1") String password1, @RequestParam("password2") String password2,
			Member member, HttpServletResponse response, HttpSession session) {
		System.out.println("비밀번호1: " + password1);
		System.out.println("비밀번호2: " + password2);

		Member loginUser = (Member) session.getAttribute("loginUser");

		boolean match = bcrypt.matches(password1, loginUser.getPwd());

		System.out.println("현재 로그인 상태인 계정의 비밀번호: " + loginUser.getPwd());

		try {
			PrintWriter out = response.getWriter();
			if (match) {
				out.print("1"); // 로그인한 Member의 암호화된 비밀번호가 입력한 새 비밀번호가 같으면 1반환
			} else {
				out.print("0"); // 로그인한 Member의 암호화된 비밀번호와 입력한 새 비밀번호가 같지 않으면 0반환
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//이메일 인증
	@RequestMapping("sendEmail.me")
	public void sendEamil(@RequestParam("emailId") String emailId, @RequestParam("emailAddress") String emailAddress,
			HttpServletResponse response) {

		System.out.println("이메일 아이디: " + emailId);
		System.out.println("이메일 주소: " + emailAddress);

		Random rd = new Random();
		int rdNum = rd.nextInt(888888) + 111111;// 앞자리가 0이 나오니 + 111111

		System.out.println("인증번호: " + rdNum);

		String sender = "itkw87@naver.com"; // 이메일 보내는 이
		String password = "79*MAst8546";

		String receiver = emailId + "@" + emailAddress;

		System.out.println("받는 사람 이메일: " + receiver);

		String title = "[홈아트]이메일 인증번호가 발송되었습니다.";
		String content = "<div style=\"margin: 0; padding: 0; height: 100%; min-height: 100%; font-family: Roboto, Noto Sans KR, Malgun Gothic, Segoe UI, helvetica, apple sd gothic neo, sans-serif, serif;\">"
				+ "<div style=\"display: inline-block; margin: 20px auto; padding: 50px 20px; text-align: center; width: 620px; border: 1px solid #4F8CD1;\">"
				+ "<a href=\"http://localhost:9580/homeArt/home.do\" target=\"_blank\" rel=\"noreferrer noopener\"><img src=\"https://imgur.com/rsbpQp6.png\" style=\"width: 100px; margin-bottom: 20px;\"></a><br><br>"
				+ "안녕하세요, 고객님!<br>" + "고객님께서는 <span style='color:red;font-size:1.2em;font-weight:bold;'>" + receiver
				+ " </span>을 홈아트의 새로운 이메일로 등록하셨습니다.<br>" + "본인 확인을 위해, 아래 인증번호를 인증번호 확인란에 입력해 주세요.<br><br>"
				+ "<span style='color:blue; font-size:1.5em;font-weight:bold;'>" + rdNum + "</span><br><br>"
				+ "이 이메일주소로 가입한 적이 없으시다면 고객센터로 신고해주시기 바랍니다." + "</div>" + "</div>";

		Properties prop = new Properties();
		prop.putIfAbsent("mail.smtp.host", "smtp.naver.com");
		prop.putIfAbsent("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});

		MimeMessage message = new MimeMessage(session);

		try {
			message.setFrom(new InternetAddress(sender)); // 보내는 이
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); // 받는이

			message.setSubject(title);
			message.setText(content, "UTF-8", "html");

			Transport.send(message);

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		JSONObject job = new JSONObject();
		job.put("checkNumber", rdNum);

		try {
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(job);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	//일반 회원정보 수정
	@RequestMapping("memberModify.me")
	public String memberModify(@RequestParam("uploadFile") MultipartFile uploadFile,
			@RequestParam("nickName") String nickName, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2, @RequestParam("address3") String address3,
			@RequestParam("password1") String password1, @RequestParam("phoneNumber1") String phoneNumber1,
			@RequestParam("phoneNumber2") String phoneNumber2, @RequestParam("phoneNumber3") String phoneNumber3,
			@RequestParam("email1") String email1, @RequestParam("email2") String email2, HttpServletRequest request,
			HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null) {

			String id = loginUser.getId();
			String mStatus = loginUser.getmStatus();
			int power = loginUser.getPower();

//비밀번호 암호화 해서 넘기기
			String encPwd = bcrypt.encode(password1);

			loginUser.setNickName(nickName);
			loginUser.setAddress(address1 + "/" + address2 + "/" + address3);
			loginUser.setPwd(encPwd);
			loginUser.setEmail(email1 + "@" + email2);
			loginUser.setPhone(phoneNumber1 + "-" + phoneNumber2 + "-" + phoneNumber3);

			if (uploadFile != null && !uploadFile.isEmpty()) {

				String[] strArr = saveImgFile(uploadFile, request);

				String renameFileName = strArr[0];

				loginUser.setOriginalFileName(uploadFile.getOriginalFilename());
				loginUser.setRenameFileName(renameFileName);
			}
		}
		System.out.println("업데이트할 회원 정보: " + loginUser);

		int result = mService.modifyMember(loginUser);

		if (result > 0) {
			return "redirect:home.do";

		} else {
			throw new MemberException("회원정보 수정에 실패하였습니다.");
		}
	}

//전문가 회원정보 수정
	@RequestMapping("expertModify.me")
	public String expertModify(@RequestParam("uploadFile") MultipartFile uploadFile,
			@RequestParam("nickName") String nickName, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2, @RequestParam("address3") String address3,
			@RequestParam("password1") String password1, @RequestParam("phoneNumber1") String phoneNumber1,
			@RequestParam("phoneNumber2") String phoneNumber2, @RequestParam("phoneNumber3") String phoneNumber3,
			@RequestParam("email1") String email1, @RequestParam("email2") String email2,
			@RequestParam("field") String field, @RequestParam("career") String career, @RequestParam("day") String day,
			@RequestParam("workTime1") String workTime1, @RequestParam("workTime2") String workTime2,
			HttpServletRequest request, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null) {

			String id = loginUser.getId();
			String mStatus = loginUser.getmStatus();
			int power = loginUser.getPower();

//비밀번호 암호화 해서 넘기기
			String encPwd = bcrypt.encode(password1);

			loginUser.setNickName(nickName);
			loginUser.setAddress(address1 + "/" + address2 + "/" + address3);
			loginUser.setPwd(encPwd);
			loginUser.setEmail(email1 + "@" + email2);
			loginUser.setPhone(phoneNumber1 + "-" + phoneNumber2 + "-" + phoneNumber3);
			loginUser.setField(field);
			loginUser.setCareer(career);
			loginUser.setWorkingDay(day);
			loginUser.setWorkingTime(workTime1 + "~" + workTime2);

			if (uploadFile != null && !uploadFile.isEmpty()) {

				String[] strArr = saveImgFile(uploadFile, request);

				String renameFileName = strArr[0];

				loginUser.setOriginalFileName(uploadFile.getOriginalFilename());
				loginUser.setRenameFileName(renameFileName);
			}
		}
		System.out.println("업데이트할 전문가 회원 정보: " + loginUser);

		int result = mService.modifyExpert(loginUser);

		if (result > 0) {
			return "redirect:home.do";

		} else {
			throw new MemberException("회원정보 수정에 실패하였습니다.");
		}
	}

//사용자 정의 메소드
	public String[] saveImgFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\muploadFiles";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
				+ originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;
		System.out.println("이름 수정후 파일 경로: " + renamePath);

		String[] strArr = { renameFileName, renamePath };

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return strArr;
	}

//////////////////////////////////////////////////////////의뢰 요청관련 ////////////////////////////////////////////////////////////////////

//일반회원 마이페이지로 이동 && 내 의뢰를 수락한 전문가 목록, 내가 보낸 의뢰요청 목록, 조회수 TOP3전문가 목록보기
	@RequestMapping("memberMyPage.me")
	public String memberMyPage(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null && loginUser.getPower() == 0) {// 로그인 계정의 권한이 일반회원이면

			ArrayList<Member> topExpertMemberList = mService.topExpertMemberList();

			model.addAttribute("topExpertMemberList", topExpertMemberList);

//해당 회원 ID가 있는 의뢰요청 목록을 받아옴
			ArrayList<Request> requestList = mService.memberRequest(loginUser.getId());

//의뢰요청을 받은 전문가 회원들의 객체를 모두 담아줄 ArrayList객체 생성
			ArrayList<Member> myExpertList = new ArrayList<Member>();

			for (Request r : requestList) {// 의뢰요청목록을 하나씩 Request객체에 담는다.
				if (r.getRequestStatus().equals("Y")) {// 만약에 해당 Request객체의 요청상태가 매칭중이면

//요청상태가 'Y'(매칭)으로 되어있는 전문가 프로필 넘버로 전문가 프로필 객체를 받아와서 
//그 안에 있는 expertId필드를 이용해서해당 ID를 갖는 전문가 객체를 받아와야 한다. 

//전문가 프로필 넘버로 해당 전문가 프로필 객체 조회해서 받아오기
					Expert expert = mService.selectExpertProfile2(r.getExpertProfileNo());

//받아온 전문가 프로필 객체에서 전문가 ID만 따로 넘겨주어 해당 ID를 지닌 (전문가)Member객체를 받아온다.  
					Member myExpert = mService.selectMember(expert.getExpertId());

					myExpertList.add(myExpert);
				}
			}

			model.addAttribute("myExpertList", myExpertList);

//내가 보낸 요청들을 아직 수락하거나 거절하지 않은 전문가 회원(Member)개체 들을 담을 ArrayList
			ArrayList<Member> notAnswerList = new ArrayList<Member>();

			for (Request r : requestList) { // 내가 보낸 요청들 중 대기 상태인 요청
				if (r.getRequestStatus().equals("W")) {

//전문가 프로필 넘버로 해당 전문가 프로필 객체 조회해서 받아오기
					Expert expert = mService.selectExpertProfile2(r.getExpertProfileNo());

//받아온 전문가 프로필 객체에서 전문가 ID만 따로 넘겨주어 해당 ID를 지닌 (전문가)Member객체를 받아온다.  
					Member myExpert = mService.selectMember(expert.getExpertId());

					notAnswerList.add(myExpert);
				}
			}

			model.addAttribute("notAnswerList", notAnswerList);

			return "memberMyPageForm";
		} else {
			return "loginForm";
		}

	}

//전문가 마이페이지로 이동 && 전문가 순위 TOP3보이게 하기 && 전문가 마이페이지에 의뢰요청목록 보이게하기 && 전문가 마이페이지에 나와 매칭된 회원 보이게 하기
	@RequestMapping("expertMyPage.me")
	public String expertMyPage(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null && loginUser.getPower() == 1) {// 로그인 계정의 권한이 전문가이면

			ArrayList<Member> topExpertMemberList = mService.topExpertMemberList();

			model.addAttribute("topExpertMemberList", topExpertMemberList);

//전문가 id에 해당하는 profile정보를 받아옴(전문가당 하나의 프로필만 작성가능할경우 Expert단일 타입으로 받아옴)
			Expert expertProfile = mService.selectExpertProfile(loginUser.getId());

			if (expertProfile != null) {
//현재 전문가의 프로필 넘버에 해당하는 의뢰목록을 받아옴
				ArrayList<Request> requestList = mService.selectRequestList(expertProfile.getExpertProfileNo());

//의뢰요청을 한 회원들의 객체를 모두 담아줄 ArrayList객체 생성

//의뢰요청 회원 리스트
				ArrayList<Member> requesterList = new ArrayList<Member>();

//나와 매칭된 회원 리스트 
				ArrayList<Member> myCustomerList = new ArrayList<Member>();

				for (Request r : requestList) {// 의뢰요청목록을 하나씩 Request객체에 담는다.
					if (r.getRequestStatus().equals("W")) {// 만약에 해당 Request객체의 요청상태가 대기중이면

//해당 의뢰요청을 보낸 의뢰요청 상태가 대기중으로 되어있는  회원들의 id를 넘겨주어 의뢰요청한 회원의 정보를 객체로 받아옴 
						Member requesterMember = mService.selectMember(r.getMemberId());

						if (requesterMember.getAddress() != null) {
//주소를 우편번호만 가져가기위해 substring으로 잘라준다. 
							String address = requesterMember.getAddress();
							String subAddress = address.substring(0, 8);
							requesterMember.setAddress(subAddress);

							requesterList.add(requesterMember);

						} else {

							requesterMember.setAddress("주소 미입력 ");

							requesterList.add(requesterMember);

						}
					}
				}

				System.out.print("내가 받은 의뢰 요청 목록 requesterList:" + requesterList);

//의뢰요청의 상태가 'W'(대기)인 레코드의 회원 ID로 찾은 Member객체를 모아 놓은 requesterList
				model.addAttribute("requesterList", requesterList);

				for (Request r : requestList) {
					if (r.getRequestStatus().equals("Y")) {

//의뢰요청 상태가 수락으로 되어있는 회원들의 id를 넘겨주어 해당 회원의 정보를 객체로 받아옴
						Member myCustomerMember = mService.selectMember(r.getMemberId());

						if (myCustomerMember.getAddress() != null) {
//주소를 우편번호만 가져가기위해 substring으로 잘라준다. 
							String address = myCustomerMember.getAddress();
							String subAddress = address.substring(0, 8);
							myCustomerMember.setAddress(subAddress);
						} else {
							myCustomerMember.setAddress("주소 미입력 ");
						}

						myCustomerList.add(myCustomerMember);
					}
				}

//의뢰요청의 상태가 'Y'(수락)인 레코드의 회원 ID로 찾은 Member객체를 모아 놓은 myCustomerList
				model.addAttribute("myCustomerList", myCustomerList);

//expertMyPageForm페이지에서 expertProfileNo를 사용해야 하므로 request영역에 Expert타입의 
//expertProfile객체도 넣어 놓는다.
				model.addAttribute("expertProfile", expertProfile);

			} else {

				throw new MemberException("전문가 MyPage는 전문가 프로필을 작성한 회원만 이용하실 수 있습니다.");
			}

			return "expertMyPageForm";

		} else {

			return "loginForm";
		}

	}

//전문가에게 의뢰요청하기
	@ResponseBody
	@RequestMapping("requestToExpert.me")
	public String requestToExpert(@RequestParam("expertProfileNo") int expertProfileNo, HttpSession session,
			HttpServletResponse response) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null && loginUser.getPower() == 0) { // 로그인 상태이며 계정의 권한이 일반회원일 때

			String memberId = loginUser.getId();

			Request request = new Request();

			request.setExpertProfileNo(expertProfileNo);
			request.setMemberId(memberId);

//해당 전문가 프로필에 동일한 회원ID로 요청상태가 "W"(대기중)인 레코드가 있는지 확인 
			int dupResult = mService.dupReqCheck(request);

//해당 전문가 프로필에 동일한 회원ID로 요청상태가 "Y"(매칭중)인 레코드가 있는지 확인 
			int dupResult2 = mService.dupReqCheck2(request);

//중복된 레코드가 0개 이면
			if (dupResult == 0 && dupResult2 == 0) {

//REQUEST테이블에 새로운 의뢰 레코드 추가
				int result = mService.insertRequest(request);

				System.out.println("insert성공한 레코드 수: " + result);

				if (result > 0) {

					return "success";

				} else {

					return "fail";
				}

			} else if (dupResult > 0) {

				return "wait";

			} else if (dupResult2 > 0) {

				return "match";
			}
		}

		return "notLogin";
	}

//의뢰요청 허용하기
	@ResponseBody
	@RequestMapping("requestAllow.me")
	public String requestAllow(@RequestParam("requesterId") String requesterId, HttpSession session) {

		System.out.println("승인할 회원의 ID:" + requesterId);

		Member loginUser = (Member) session.getAttribute("loginUser");

//현재 의뢰를 받은 전문가의 ID
		String expertId = loginUser.getId();

		int expertProfileNo = mService.selectExpertProfile(expertId).getExpertProfileNo();

		Request request = new Request();

		request.setMemberId(requesterId);
		request.setExpertProfileNo(expertProfileNo);

//승인할 회원의 ID를 가진 레코드의 요청상태 'Y'으로 바꿔주기
		int result = mService.allowRequest(request);

		if (result > 0) {

			return "success";

		} else {

			return "fail";
		}
	}

//의뢰요청 거절하기
	@ResponseBody
	@RequestMapping("requestReject.me")
	public String requestReject(@RequestParam("requesterId") String requesterId, HttpSession session) {

		System.out.println("거절할 회원의 ID:" + requesterId);

//거절할 회원의 ID를 가진 레코드의 요청상태 'N'으로 바꿔주기
		int result = mService.rejectRequest(requesterId);

		System.out.println(result);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

//나(전문가)와 매칭된 회원 매칭취소하기
	@ResponseBody
	@RequestMapping("matchCancelE.me")
	public String matchCancelE(@RequestParam("requesterId") String requesterId) {

		System.out.println("매칭 취소할 회원의 ID:" + requesterId);

//매칭 취소할 회원의 ID에 해당하는 REQUEST테이블의 해당 레코드의 요청상태를 'Y'에서  'N'으로 바꿔주기
		int result = mService.matchCancelE(requesterId);
		;

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}

	}

//내가 보낸 의뢰요청에 아직 응답없는 전문가에 대한 의뢰 취소하기 
	@ResponseBody
	@RequestMapping("requestCancelM.me")
	public String requestCancelM(@RequestParam("requesterId") String requesterId) {

		System.out.println("의뢰 취소할 전문가 ID:" + requesterId);

//해당 ID를 가진 전문가 프로필을 찾아 해당 프로필의 넘버를 찾아낸다.
		Expert expertProfile = mService.selectExpertProfile(requesterId);

		int expertProfileNo = expertProfile.getExpertProfileNo();

//매칭 취소할 전문가 프로필 넘버에 해당하는 REQUEST테이블의 해당 레코드의 요청상태를 'W'에서 'N'으로 바꿔주기 
		int result = mService.requestCancelM(expertProfileNo);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

//나와 매칭된 전문가와 매칭취소하기
	@ResponseBody
	@RequestMapping("matchCancelM.me")
	public String matchCancelM(@RequestParam("requesterId") String requesterId) {

		System.out.println("매칭 취소할 전문가 ID:" + requesterId);

//해당 ID를 가진 전문가 프로필을 찾아 해당 프로필의 넘버를 찾아낸다.
		Expert expertProfile = mService.selectExpertProfile(requesterId);

		int expertProfileNo = expertProfile.getExpertProfileNo();

//매칭 취소할 전문가 프로필 넘버에 해당하는 REQUEST테이블의 해당 레코드의 요청상태를 'W'에서 'N'으로 바꿔주기 
		int result = mService.matchCancelM(expertProfileNo);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}

	}

//일반회원 마이페이지의 전문가 추천에서 의뢰요청 보내기 
	@ResponseBody
	@RequestMapping("requestExpertRecommendation.me")
	public String requestAtReco(@RequestParam("expertId") String expertId, HttpSession session) {

//요청을 보낸다는 것은 REQUEST테이블의 레코드를 한 행 추가해주는 것이므로 Request객체에 전문가 프로필넘버, 의뢰요청하는 회원ID를 넣어서 전송해준다. 
		Request request = new Request();

//전문가 ID를 조회해서 전문가 프로필 넘버를 구해오기 
		int expertProfileNo = mService.selectExpertProfile(expertId).getExpertProfileNo();

//의뢰요청을 보내는 일반회원의 ID
		Member loginUser = (Member) session.getAttribute("loginUser");

		request.setExpertProfileNo(expertProfileNo);
		request.setMemberId(loginUser.getId());

//해당 전문가 프로필에 동일한 회원ID로 이미 의뢰요청을 했는지 검사
		int dupResult = mService.dupReqCheck(request);

		if (dupResult == 0) {// 중복된 레코드가 없으면
			request.setMemberId(loginUser.getId());
			request.setExpertProfileNo(expertProfileNo);

//의뢰를 요청한 일반회원의 ID와 요청을 받을 전문가의 프로필 넘버를 담아준 REQUEST객체를 매개변수로 넘겨서 insert해준다.
			int result = mService.insertRequest(request);

			if (result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} else { // 중복된 레코드가 있으면
			return "dup";
		}

	}

//전문가 순위 확인하기(경력 기준)   
	@RequestMapping("myRankCheck.me")
	public void myRankCheck(HttpSession session, Model model, HttpServletResponse response) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser.getCareer() != null) {

			System.out.println("현재 로그인한 전문가의 경력: " + loginUser.getCareer());

//모든 전문가 회원의 객체를 경력을 기준으로 내림차순하여 가져온다. 
			ArrayList<Member> allExpertList = mService.allExpertCareere();

			System.out.println("경력을 기준으로 내림차순한 모든 전문가 회원(Member)의 객체: " + allExpertList);

			int rank = 0;
			for (int i = 0; i < allExpertList.size(); i++) {

				System.out.println(i + "번째 인덱스에 있는 ID가 " + allExpertList.get(i).getId() + "인 "
						+ allExpertList.get(i).getName() + " 전문가님의 경력:" + allExpertList.get(i).getCareer());

//로그인 id가 ArrayList의 i번째의 Member의 id와 같고, 로그인 경력이 ArrayList의 i번째 Member의 경력과 같으면
				if (loginUser.getId().equals(allExpertList.get(i).getId())
						&& loginUser.getCareer().equals(allExpertList.get(i).getCareer())) {

					System.out.println("로그인 유저와" + i + "번째 행의 멤버객체 가 일치합니다.");

					rank = i + 1;

					break;
				}
			}

			try {
				PrintWriter out = response.getWriter();
				out.print(rank);
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			try {
				PrintWriter out = response.getWriter();
				out.print(0);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}