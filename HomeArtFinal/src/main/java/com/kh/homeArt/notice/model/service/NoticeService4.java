package com.kh.homeArt.notice.model.service;

import java.util.ArrayList;

import com.kh.homeArt.notice.model.vo.Notice4;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply4;

public interface NoticeService4 {

	int getListCount4();

	ArrayList<Notice4> getNoticeList4(PageInfo pi);

	int insertNotice4(Notice4 n);

	Notice4 selectNotice4(int nId);

	int updateNotice4(Notice4 n);

	int deleteNotice4(int nId);

	int insertReply4(Reply4 r);

	ArrayList<Reply4> selectReplyList4(int nId);

}
