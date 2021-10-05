    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    	<!-- navbar navbar-inverse navbar-fixed-top -->
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><img src="/img/diulogo.png" style="margin-top: -4px;"  height="33" width="120"></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse" style="font-weight: bold;">
          <ul class="nav navbar-nav navbar-right">
          	<sec:authorize access="isAuthenticated()">
            	<li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/driverinformation">Diver</a></li>
            	<li><a href="${pageContext.request.contextPath}/helperinformation">Helper</a></li>
            	<li><a href="${pageContext.request.contextPath}/transportschedule">Schedule</a></li>

	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Functional <span class="caret"></span></a>
	              <ul class="dropdown-menu">
	              	<li class="dropdown-header">Entry Forms</li>
	                <li><a href="${pageContext.request.contextPath}/userregistration">Create User</a></li>	                
	             	<li><a href="${pageContext.request.contextPath}/brands">Brands</a></li>
	             	<li><a href="${pageContext.request.contextPath}/brandmodel">Brand Model</a></li>
	             	<li><a href="${pageContext.request.contextPath}/transport_type">Transport Type</a></li>
	             	<li><a href="${pageContext.request.contextPath}/transportinformation">Transport Information</a></li>
	             	
	             	
<%-- 	             	<li><a href="${pageContext.request.contextPath}/generaltravelinformation">General Travel Information</a></li> --%>
	             	       
	             	<sec:authorize access="hasAnyRole('ADMIN','CPUSER')">
						<li><a href="#">Admin Menu Item</a></li>
					</sec:authorize>
	                <li role="separator" class="divider"></li>
	                <li class="dropdown-header">Reports</li>
	                <li><a href="${pageContext.request.contextPath}/view-rpt-brands">Show Brands</a></li>
	                <li><a href="${pageContext.request.contextPath}/rpt-university-bus-schedule">University Bus Schedule</a></li>	                
	              </ul>
	            </li>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Travel/Trip <span class="caret"></span></a>
	              <ul class="dropdown-menu">
	              	<li class="dropdown-header">Entry Forms</li>
	              	<li><a href="${pageContext.request.contextPath}/institute">Institute</a></li>
	                <li><a href="${pageContext.request.contextPath}/venue">Venue</a></li>
	                <li><a href="${pageContext.request.contextPath}/transportschedule">Transport Schedule</a></li>
	                <li><a href="${pageContext.request.contextPath}/view-scheduled-transport-information">Scheduled Travel Information</a></li>
	                <li><a href="${pageContext.request.contextPath}/transportrequisition">Transport Requisition</a></li>
	                <li><a href="${pageContext.request.contextPath}/transport-requisition-approval">Transport Requisition Approval</a></li>
	                <li><a href="${pageContext.request.contextPath}/transport-assign">Transport Assign</a></li>
	                <li><a href="${pageContext.request.contextPath}/generaltravelinformation">General Travel Information</a></li>
	               
	             	<sec:authorize access="hasAnyRole('ADMIN','CPUSER')">
						<li><a href="#">Admin Menu Item</a></li>
					</sec:authorize>
	                <li role="separator" class="divider"></li>
	                <li class="dropdown-header">Reports</li>
	                <li><a href="#">Report 1</a></li>
	                <li><a href="#">Report...</a></li>	                
	              </ul>
	            </li>
	            
	            <!-- Form Needs to be added -->
	            <!-- =========================== -->

	            <!-- =========================== -->
	            <!-- end of Form Needs to be added -->
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
					<li>
						<a href="<c:url value='/login' />">Log in</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					
					<li>
						<a href="<c:url value='/logout' />"><b>Log out &nbsp;<span class="glyphicon glyphicon-log-out"></span></b></a>
					</li>
				</sec:authorize>
          </ul>
          
          	<ul class="nav navbar-nav navbar-right">
				
				
			</ul>
			
        </div><!--/.nav-collapse -->
      </div>
    </nav>



