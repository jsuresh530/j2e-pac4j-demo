<%@page import="org.pac4j.j2e.filter.RequiresAuthenticationFilter"%>
<%@page import="org.pac4j.core.client.Clients"%>
<%@page import="org.pac4j.j2e.configuration.ClientsConfiguration"%>
<%@page import="org.pac4j.core.context.WebContext"%>
<%@page import="org.pac4j.core.context.J2EContext"%>
<%@page import="org.pac4j.j2e.util.UserUtils"%>
<%@page import="org.pac4j.http.client.*"%>
<%@page import="org.pac4j.oauth.client.*"%>
<%@page import="org.pac4j.cas.client.*"%>
<%@page import="org.pac4j.openid.client.*"%>
<%
	session.setAttribute(RequiresAuthenticationFilter.ORIGINAL_REQUESTED_URL, null);
	WebContext context = new J2EContext(request, response); 
	Clients client = ClientsConfiguration.getClients();
	FacebookClient fbClient = (FacebookClient) client.findClient("FacebookClient");
	TwitterClient twClient = (TwitterClient) client.findClient("TwitterClient");
	FormClient formClient = (FormClient) client.findClient("FormClient");
	BasicAuthClient baClient = (BasicAuthClient) client.findClient("BasicAuthClient");
	CasClient casClient = (CasClient) client.findClient("CasClient");
	MyOpenIdClient myopenidClient = (MyOpenIdClient) client.findClient("MyOpenIdClient");
%>
<h1>index</h1>
<a href="facebook/index.jsp">Protected url by Facebook : facebook/index.jsp</a><br />
<a href="twitter/index.jsp">Protected url by Twitter : twitter/index.jsp</a><br />
<a href="form/index.jsp">Protected url by form authentication : form/index.jsp</a><br />
<a href="basicauth/index.jsp">Protected url by basic auth : basicauth/index.jsp</a><br />
<a href="cas/index.jsp">Protected url by CAS : cas/index.jsp</a><br />
<form action="myopenid/index.jsp" method="POST">
  <input type="text" name="openIdUser" value="http://xxx.myopenid.com/" />
  <input type="submit" value="Protected url by myopenid.com : myopenid/index.jsp" />
</form>
<br />
<a href="logout.jsp">logout</a>
<br /><br />
profile : <%=UserUtils.getProfile(session)%>
<br /><br />
<hr />
<a href="<%=fbClient.getRedirectionUrl(context)%>">Authenticate with Facebook</a><br />
<a href="<%=twClient.getRedirectionUrl(context)%>">Authenticate with Twitter</a><br />
<a href="<%=formClient.getRedirectionUrl(context)%>">Authenticate with form</a><br />
<a href="<%=baClient.getRedirectionUrl(context)%>">Authenticate with basic auth</a><br />
<a href="<%=casClient.getRedirectionUrl(context)%>">Authenticate with CAS</a><br />
<form action="<%=myopenidClient.getRedirectionUrl(context)%>" method="POST">
  <input type="text" name="openIdUser" value="http://xxx.myopenid.com/" />
  <input type="submit" value="Authenticate with myopenid.com" />
</form>
