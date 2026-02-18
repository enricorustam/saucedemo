*** Variables ***
${BASE_URL}     https://www.saucedemo.com/
${BROWSER}      Chrome

${VALID_USER}   standard_user
${PASSWORD}     secret_sauce
${INVALID_USER}   test123
${INVALID_PASSWORD}     test123

@{ALL_USERS}
...    standard_user
...    locked_out_user
...    problem_user
...    performance_glitch_user
...    error_user
...    visual_user
