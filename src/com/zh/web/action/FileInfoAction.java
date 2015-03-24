package com.zh.web.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zh.core.base.action.Action;
import com.zh.core.util.GlobEnv;

/**
 * 文件下载管理
 * 
 * @author caiyingying
 */
public class FileInfoAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9046635623724345893L;

	private static Logger LOGGER = LoggerFactory
			.getLogger(FileInfoAction.class);

	private String fileId;
	
	private String fileName;
	
	private InputStream fileInput;

	public String execute() {
		LOGGER.debug("execute()");

		return Action.SUCCESS;
	}

	/**
	 * 下载附件
	 * 
	 * @return
	 */
	public String downloadFile() {
		InputStream fis = null;
		//HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		try {
			// 组装文件保存路径
			StringBuffer filePath = GlobEnv.getUploadFilePath();
			File file = new File(filePath.toString().trim() + fileId.trim() + "//" + fileName.trim());

			fis = new FileInputStream(file);
			BufferedInputStream bin = new BufferedInputStream(fis);
			this.setFileInput(bin);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			/*try {
				if(fis != null){
					fis.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}*/
		}
		return Action.SUCCESS;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public InputStream getFileInput() {
		return fileInput;
	}

	public void setFileInput(InputStream fileInput) {
		this.fileInput = fileInput;
	}
	
}
