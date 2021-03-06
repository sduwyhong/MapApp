package org.map.webservice;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;

/**
 * <a href="http://www.webxml.com.cn/" target="_blank">WebXml.com.cn</a>
 * <strong>����Ԥ�� Web ����</strong>������Դ��<strong>�й������</strong> <a
 * href="http://www.cma.gov.cn/" target="_blank">http://www.cma.gov.cn/</a>
 * ������ÿ2.5Сʱ�����Զ�����һ�Σ�׼ȷ�ɿ������� 340 ����й���Ҫ���к� 60
 * ���������Ҫ���������ڵ�����Ԥ�����ݡ�</br>������Ԥ��Web
 * Services�벻Ҫ�����κ���ҵĿ�ģ�������Ҫ��<a
 * href="http://www.webxml.com.cn/zh_cn/contact_us.aspx"
 * target="_blank">��ϵ����</a>����ӭ���������� QQ��8409035<br />
 * <strong>ʹ�ñ�վ WEB ������ע�������ӱ�վ��http://www.webxml.com.cn/
 * ��л��ҵ�֧��</strong>��<br />
 * <span style="color:#999999;">֪ͨ������Ԥ�� WEB ������ԭ��ʹ�õ�ַ
 * http://www.onhap.com/WebServices/WeatherWebService.asmx �ģ���ĳ�����ʹ�õķ����ַ
 * http://www.webxml.com.cn/WebServices/WeatherWebService.asmx
 * ���������ü��ɡ�</span><br />
 * <br />
 * &nbsp;
 * 
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.3-hudson-390-
 * Generated source version: 2.0
 * <p>
 * An example of how this class may be used:
 * 
 * <pre>
 * WeatherWebService service = new WeatherWebService();
 * WeatherWebServiceSoap portType = service.getWeatherWebServiceSoap();
 * portType.getSupportCity(...);
 * </pre>
 * 
 * </p>
 * 
 */
@WebServiceClient(name = "WeatherWebService", targetNamespace = "http://WebXml.com.cn/", wsdlLocation = "file:/E:/\u8f6f\u4ef6\u5f00\u53d1\u6280\u672f/mapapp/WeatherWebService.wsdl")
public class WeatherWebService extends Service {

	private final static URL WEATHERWEBSERVICE_WSDL_LOCATION;
	private final static Logger logger = Logger
			.getLogger(org.map.webservice.WeatherWebService.class.getName());

	static {
		URL url = null;
		try {
			URL baseUrl;
			baseUrl = org.map.webservice.WeatherWebService.class
					.getResource(".");
			url = new URL(baseUrl,
					"file:/E:/\u8f6f\u4ef6\u5f00\u53d1\u6280\u672f/mapapp/WeatherWebService.wsdl");
		} catch (MalformedURLException e) {
			logger.warning("Failed to create URL for the wsdl Location: 'file:/E:/\u8f6f\u4ef6\u5f00\u53d1\u6280\u672f/mapapp/WeatherWebService.wsdl', retrying as a local file");
			logger.warning(e.getMessage());
		}
		WEATHERWEBSERVICE_WSDL_LOCATION = url;
	}

	public WeatherWebService(URL wsdlLocation, QName serviceName) {
		super(wsdlLocation, serviceName);
	}

	public WeatherWebService() {
		super(WEATHERWEBSERVICE_WSDL_LOCATION, new QName(
				"http://WebXml.com.cn/", "WeatherWebService"));
	}

	/**
	 * 
	 * @return returns WeatherWebServiceSoap
	 */
	@WebEndpoint(name = "WeatherWebServiceSoap")
	public WeatherWebServiceSoap getWeatherWebServiceSoap() {
		return super.getPort(new QName("http://WebXml.com.cn/",
				"WeatherWebServiceSoap"), WeatherWebServiceSoap.class);
	}

	/**
	 * 
	 * @return returns WeatherWebServiceSoap
	 */
	@WebEndpoint(name = "WeatherWebServiceSoap12")
	public WeatherWebServiceSoap getWeatherWebServiceSoap12() {
		return super.getPort(new QName("http://WebXml.com.cn/",
				"WeatherWebServiceSoap12"), WeatherWebServiceSoap.class);
	}

	/**
	 * 
	 * @return returns WeatherWebServiceHttpGet
	 */
	@WebEndpoint(name = "WeatherWebServiceHttpGet")
	public WeatherWebServiceHttpGet getWeatherWebServiceHttpGet() {
		return super.getPort(new QName("http://WebXml.com.cn/",
				"WeatherWebServiceHttpGet"), WeatherWebServiceHttpGet.class);
	}

	/**
	 * 
	 * @return returns WeatherWebServiceHttpPost
	 */
	@WebEndpoint(name = "WeatherWebServiceHttpPost")
	public WeatherWebServiceHttpPost getWeatherWebServiceHttpPost() {
		return super.getPort(new QName("http://WebXml.com.cn/",
				"WeatherWebServiceHttpPost"), WeatherWebServiceHttpPost.class);
	}

}
