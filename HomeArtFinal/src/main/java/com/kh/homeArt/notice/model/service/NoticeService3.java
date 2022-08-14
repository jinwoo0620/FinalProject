package com.kh.homeArt.notice.model.service;

import java.util.ArrayList;

import com.kh.homeArt.notice.model.vo.Notice3;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply3;

public interface NoticeService3 {

	int getListCount3();

	ArrayList<Notice3> getNoticeList3(PageInfo pi);

	int insertNotice3(Notice3 n);

	Notice3 selectNotice3(int nId);

	int updateNotice3(Notice3 n);

	int deleteNotice3(int nId);

	int insertReply3(Reply3 r);

	ArrayList<Reply3> selectReplyList3(int nId);

}
