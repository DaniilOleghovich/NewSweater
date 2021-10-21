<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<h1>
    Registration
</h1>
<h3>
    ${message!" "}
</h3>

<@l.login "/registration" true/>
</@c.page>