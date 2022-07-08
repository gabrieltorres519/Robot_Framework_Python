*** Settings ***
Documentation   RPA HTTP Related Keywords Example
Library         RPA.HTTP
Library         RPA.JSON


# +
*** Variables   ***
${URL}     https://reqres.in

${SingleUser}        /api/users/2
${AllUser}           /api/users?page=2  
${RegisterUser}      /api/register
${createUser}        /api/users

# +
*** Keywords   ***
Execute GET
    [Arguments]     ${session}     ${url}
    ${resp} =  Get Request    ${session}    ${url}
    Status Should Be    200    ${resp}
    [Return]    ${resp.json()}
    
Execute POST With Json
    [Arguments]     ${session}     ${url}    ${data}     ${code}=200
    ${resp} =  Post Request    ${session}    ${url}     json=${data}
    Status Should Be    ${code}    ${resp}
    [Return]    ${resp.json()}
    
Execute PUT With Json
    [Arguments]     ${session}     ${url}    ${data}     ${code}=200
    ${resp} =  Put Request    ${session}    ${url}     json=${data}
    Status Should Be    ${code}    ${resp}
    [Return]    ${resp.json()}
    
Execute DELETE
    [Arguments]     ${session}     ${url}     ${code}=204
    ${resp} =  Delete Request    ${session}    ${url}
    Status Should Be    ${code}    ${resp}
# -

*** Tasks   ***
Example of HTTP Library Use Cases
        Create Session    reqres    ${URL}
        
        # &{response} =   Execute GET       reqres    ${SingleUser}
        # ${user_email} =  Get value from JSON      ${response}   $.data.email
        
        # &{response} =   Execute GET       reqres   ${AllUser}
        # ${user_info} =  Get value from JSON      ${response}   $.data.[0]
        # ${avatar} =   Get value from JSON      ${response}   $.data.[0].avatar
        
        # ${data} =   Convert String to JSON    {"email":"eve.holt@reqres.in", "password":"pistol"}
        # &{response} =  Execute POST With Json     reqres      ${RegisterUser}     ${data}
        # ${token} =  Get value from JSON      ${response}   $.token
        
        
        ${data} =   Convert String to JSON    {"name":"john", "job":"software engineer"}
        &{response} =  Execute POST With Json     reqres      ${createUser}    ${data}    201
        Log     ${response}
        ${id} =   Get value from JSON      ${response}   $.id
        
        
        ${data} =   Convert String to JSON    {"name":"john", "job":"devops engineer"}
        &{response} =  Execute PUT With Json     reqres      ${createUser}${/}${id}    ${data}
        Log     ${response}
        
        Execute DELETE      reqres      ${createUser}${/}${id}
