package org.kosta.watflix.model.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ContentsMapper;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.GenreVO;
import org.springframework.stereotype.Service;
@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	ContentsMapper cm;
	
	@Override
	public void genreRegister(String genreCode, String genreName) {
		//장르
		GenreVO gvo = new GenreVO();
		gvo.setGenreCode(genreCode);
		gvo.setGenreName(genreName);
		//장르테이블에 insert
		cm.mGenreRegister(gvo);
	}
	
	@Override
	public GenreVO findByGenreCode(String genreCode) {
		return cm.mFindGenreByCode(genreCode);
	}
	
	@Override
	// 이미지 저장하기(이미지url, 저장경로, 제목, 컨텐츠id)
	public void saveThumbnail(String sImgUrl, String bImgUrl, String path, String contentsId,String title,String summary,String type,String genreCode, String genreName) throws IOException  {
	
		//컨텐츠
		ContentsVO cvo = new ContentsVO();
		cvo.setContentsNo(contentsId);
		cvo.setContentsTitle(title);
		cvo.setContentsSummary(summary);
		cvo.setContentsType(type);
		//장르
		GenreVO gvo = new GenreVO();
		gvo.setGenreCode(genreCode);
		gvo.setGenreName(genreName);

		cvo.setGenreVO(gvo);
		//작은 썸네일 다운로드
		String fileName = "S_"+title + ".jpg";
		cvo.setContentsSmallThumbnail("resources\\contents\\"+contentsId+"\\"+fileName);
		saveImg(fileName,path,sImgUrl);
		
		
		//큰 썸네일 다운로드
		fileName = "B_"+title + ".jpg";
		cvo.setContentsBigThumbnail("resources\\contents\\"+contentsId+"\\"+fileName);
		saveImg(fileName,path,bImgUrl);
		System.out.println("==============썸네일 저장 완료==============");
		if(cm.mFindContentsByNo(contentsId)==null) {
			cm.mContentsRegister(cvo);
			System.out.println("==============컨텐츠 등록 완료==============");
		}
		else {
			System.out.println("==============컨텐츠 이미 등록됨==============");
		}
		
	}
	
	//실제 이미지를 하드웨어 저장시키는 메소드
	public void saveImg(String fileName, String path,String imgURL) throws IOException {
		URL url = null;	
		InputStream in = null;
		OutputStream out = null;
		try {
			File fileDir = new File(path);

			// 디렉토리 생성
			if (!fileDir.exists()) {
				fileDir.mkdirs();
			}

			url = new URL(imgURL);
			// 다운로드
			in = url.openStream();
			// 덮어쓰기
			path += fileName;
			out = new FileOutputStream(path); // 저장경로

			while (true) {
				// 이미지를 읽어온다.
				int data = in.read();
				if (data == -1) {
					break;
				}
				// 이미지를 쓴다.
				out.write(data);
			}
			in.close();
			out.close();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
			if (out != null) {
				out.close();
			}
		}
	}

	
}