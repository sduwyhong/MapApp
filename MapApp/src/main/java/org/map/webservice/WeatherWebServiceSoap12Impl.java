package org.map.webservice;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

@javax.jws.WebService(endpointInterface = "org.map.webservice.WeatherWebServiceSoap", targetNamespace = "http://WebXml.com.cn/", serviceName = "WeatherWebService", portName = "WeatherWebServiceSoap12")
@javax.xml.ws.BindingType(value = javax.xml.ws.soap.SOAPBinding.SOAP12HTTP_BINDING)
public class WeatherWebServiceSoap12Impl {

	public ArrayOfString getSupportCity(String byProvinceName) {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Not implemented yet.");
	}

	public ArrayOfString getSupportProvince() {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Not implemented yet.");
	}

	public org.map.webservice.GetSupportDataSetResponse.GetSupportDataSetResult getSupportDataSet() {
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