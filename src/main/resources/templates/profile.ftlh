<#import "parts/common.ftlh" as c>

<@c.page>
    <h1>
        User Profile Page
    </h1>

    <h3>
        ${username}
    </h3>

    <h5>
        ${message!''}
    </h5>

    <form method="post">
        <div class="col-sm-6">
            <div class="mb-3">
                <label class="form-label"> Email:</label>
                <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!""}"/>
            </div>
            <div class="mb-3">
                <label class="form-label"> Password:</label>
                <input type="password" name="password" class="form-control" placeholder="Password"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">

            <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </form>

</@c.page>