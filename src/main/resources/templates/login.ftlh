<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <h1>
        Login Page
    </h1>

    <h3>
        ${message!""}
    </h3>


    <@l.login "/login" false/>
</@c.page>