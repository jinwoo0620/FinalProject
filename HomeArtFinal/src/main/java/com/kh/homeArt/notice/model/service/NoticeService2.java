package com.kh.homeArt.notice.model.service;

import java.util.ArrayList;

import com.kh.homeArt.notice.model.vo.Notice2;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply2;

public interface NoticeService2 {

	int getListCount2();

	ArrayList<Notice2> getNoticeList2(PageInfo pi);

	int insertNotice2(Notice2 n);

	Notice2 selectNotice2(int nId);

	int updateNotice2(Notice2 n);

	int deleteNotice2(int nId);

	int insertReply2(Reply2 r);

	ArrayList<Reply2> selectReplyList2(int nId);

}
