package com.spring.client.reply.service;

import java.util.List;

import com.spring.client.reply.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(Integer num);
	public int replyInsert(ReplyVO rvo);
}
