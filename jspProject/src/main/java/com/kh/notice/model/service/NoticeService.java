package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.common.JDBCTemplate;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {

	public List<Notice> selectList() {
		Connection conn = JDBCTemplate.getConnection();
		
		List<Notice> noticeList = new NoticeDao().selectList(conn);
		
		JDBCTemplate.close(conn);
		
		return noticeList;
	}

	public int insertNotice(String title, String content, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().insertNotice(conn, title, content, userNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public Notice selectNotice(int nno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Notice notice = new NoticeDao().selectNotice(conn, nno);
		
		JDBCTemplate.close(conn);
		
		return notice;
	}
	
	//조회수 증가용 메서드
	public int increaseCount(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int updateNotice(int nno, String title, String content) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().updateNotice(conn, nno, title, content);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int deleteNotice(int nno) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, nno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.close(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
