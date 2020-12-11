package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ContentsMapper;
import org.springframework.stereotype.Service;

@Service
public class ContentsLikeServiceImpl implements ContentsLikeService {
	@Resource
	ContentsMapper contentsMapper;
	
	
}
