package org.kosta.watflix.model.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

public class ContentsServiceImpl implements ContentsService {

	@Override
	// 이미지 저장하기
	public void saveImage(String imgUrl , String path, String title) {
		URL url = null;
		InputStream in = null;
		OutputStream out = null;

		try {
			String fileName = title + ".jpg";
			File fileDir = new File(path);

			// 디렉토리 생성
			if (!fileDir.exists()) {
				fileDir.mkdirs();
			}

			url = new URL(imgUrl);
			// 다운로드
			in = url.openStream();
			// 덮어쓰기
			path += title + ".jpg";
			out = new FileOutputStream(path); // 저장경로
			System.out.println("실행후");

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
