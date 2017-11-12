<%@ include file="init.jsp" %>

<%@ page import="org.apache.cxf.endpoint.Client" %>
<%@ page import="org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%

	String endpoint="http://www.webservicex.net/geoipservice.asmx?WSDL";
	String method ="GetGeoIP";
	String uname ="2.96.151.114";
	Object result = "";

	Object[] params = new Object[2] ;
	params[0] = (Object)uname;

	result = call(endpoint, method, params);
	System.out.println("Result : "+result.toString());
%>
<%!

	public static  Object call(String endpoint, String method, Object[] params) {

		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();

		try {
			Client client = dcf.createClient(endpoint);
			System.out.println("Client Object Create successfully  :");
			Object[]  returnVals = client.invoke(method, params);
			//extract returned value. getting 1st value as sakai ws calls returns only one value.
			if(returnVals!=null && returnVals.length>0)
				return returnVals[0];
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("A connection error occurred: " + e.getClass() + ": " + e.getMessage());
		}
		return null;
	}
%>
