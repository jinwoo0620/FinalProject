package com.kh.homeArt.notice.model.service;

import java.util.ArrayList;

import com.kh.homeArt.notice.model.vo.Notice;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply;

public interface NoticeService {

	int getListCount();

	ArrayList<Notice> getNoticeList(PageInfo pi);

	int insertNotice(Notice n);

	Notice selectNotice(int nId);

	int updateNotice(Notice n);

	int deleteNotice(int nId);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int nId);

}
