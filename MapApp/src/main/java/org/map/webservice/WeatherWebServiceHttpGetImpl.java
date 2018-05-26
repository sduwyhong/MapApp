package org.map.webservice;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

@javax.jws.WebService(endpointInterface = "org.map.webservice.WeatherWebServiceHttpGet", targetNamespace = "http://WebXml.com.cn/", serviceName = "WeatherWebService", portName = "WeatherWebServiceHttpGet")
public class WeatherWebServiceHttpGetImpl {

	public ArrayOfString getSupportCity(String byProvinceName) {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Not implemented yet.");
	}

	public ArrayOfString getSupportProvince() {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Not implemented yet.");
	}

	public DataSet getSupportDataSet() {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Not implemented yet.");
	}

	public ArrayOfString getWeatherbyCityName(String theCityName) {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Not implemented yet.");
	}

	public ArrayOfString getWeatherbyCityNamePro(String theCityName,
			String theUserID) {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Not implemented yet.");
	}

}