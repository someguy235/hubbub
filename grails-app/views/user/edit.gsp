
<%@ page import="com.grailsinaction.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit User</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
        </div>
        <div class="body">
            <h1>Edit User</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${userInstance?.id}" />
                <input type="hidden" name="version" value="${userInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userId">User Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'userId','errors')}">
                                    <input type="text" maxlength="20" id="userId" name="userId" value="${fieldValue(bean:userInstance,field:'userId')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'password','errors')}">
                                    <input type="text" maxlength="8" id="password" name="password" value="${fieldValue(bean:userInstance,field:'password')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${userInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="profile">Profile:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'profile','errors')}">
                                    <g:select optionKey="id" from="${com.grailsinaction.Profile.list()}" name="profile.id" value="${userInstance?.profile?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="following">Following:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'following','errors')}">
                                    <g:select name="following"
from="${com.grailsinaction.User.list()}"
size="5" multiple="yes" optionKey="id"
value="${userInstance?.following}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="posts">Posts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'posts','errors')}">
                                    
<ul>
<g:each var="p" in="${userInstance?.posts?}">
    <li><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="post" params="['user.id':userInstance?.id]" action="create">Add Post</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags">Tags:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'tags','errors')}">
                                    
<ul>
<g:each var="t" in="${userInstance?.tags?}">
    <li><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="tag" params="['user.id':userInstance?.id]" action="create">Add Tag</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
