*** Settings ***
Documentation   RPA GMAIL Related Keywords Example
Library         PythonLibrary/RPA_Email.py


# +
*** Variables   ***
${recipient_email}     gabrieltorres9909@gmail.com
${mail_subject}        EMAIL WITH ONE ATTACHMENT



${email_html_body}     <h1>Stock For Day : <img src='portf.png' alt='daily stock image'/></h1>
${image}               %{ROBOT_ROOT}/Images/portf.png


# -

*** Tasks   ***
Example of Email Library Use Cases
    # Append To List      ${files_to_attach}     ${file_two}    ${file_one}
    # Send Text Email     ${recipient_email}     ${mail_subject}    ${mail_body}      ${files_to_attach}
    
    # Save Attachment Where Subject Contains      ${mail_subject}    ${download_folder}
    
    Send Html Email With Image   ${recipient_email}     ${mail_subject}     ${email_html_body}      ${image}