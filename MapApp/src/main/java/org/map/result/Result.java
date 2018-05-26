package org.map.result;
/**
 * @author wyhong
 * @date 2018-5-25
 */
public class Result {

	private String status = "200";
	private String message = "ok";
	private Object result;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	
	
}
