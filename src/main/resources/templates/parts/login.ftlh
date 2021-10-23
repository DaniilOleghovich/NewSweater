<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="col-sm-6">
            <div class="mb-3">
                <label class="form-label"> User Name:</label>
                <input type="text" name="username"
                       value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="User Name"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
            <div class="mb-3">
                <label class="form-label"> Password:</label>
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Password"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
            <#if isRegisterForm>
                <div class="mb-3">
                    <label class="form-label"> Repeat Password:</label>
                    <input type="password" name="password2"
                           class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           placeholder="Repeat Password"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
                <div class="mb-3">
                    <label class="form-label"> Email:</label>
                    <input type="email" name="email"
                           value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid', '')}"
                           placeholder="some@some.com"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>

            </#if>

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