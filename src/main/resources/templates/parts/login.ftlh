<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="col-sm-6">
            <div class="mb-3">
                <label class="form-label"> User Name:</label>
                <input type="text" name="username" class="form-control" placeholder="User Name"/>
            </div>
            <#if isRegisterForm>
            <div class="mb-3">
                <label class="form-label"> Email:</label>
                <input type="email" name="email" class="form-control" placeholder="some@some.com"/>
            </div>
            </#if>
            <div class="mb-3">
                <label class="form-label"> Password:</label>
                <input type="password" name="password" class="form-control" placeholder="Password"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <#if !isRegisterForm>
                <a href="/registration">Registration</a>
            </#if>

            <button type="submit" class="btn btn-primary">Sign In</button>
        </div>
    </form>

</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Sign Out</button>
    </form>
</#macro>