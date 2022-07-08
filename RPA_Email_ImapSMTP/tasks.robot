*** Settings ***
Documentation   RPA GMAIL Related Keywords Example
Library         PythonLibrary/RPA_Email.py
Library         Collections


# +
*** Variables   ***
${recipient_email}     gabrieltorres9909@gmail.com
${mail_subject}        EMAIL WITH ONE ATTACHMENT
${mail_body}           This is email body part
${file_one}            /home/gabriel/Documentos/RPA/RPA_Email_ImapSMTP/DataSets/output.pdf
${file_two}            /home/gabriel/Documentos/RPA/RPA_Email_ImapSMTP/DataSets/Detalle_Ticket.pdf
@{files_to_attach}


${email_html_body}     <h1>Stock For Day : <img src='portf.png' alt='daily stock image'/></h1>
${image}               /home/gabriel/Documentos/RPA/RPA_Email_ImapSMTP/Images/portf.png


${download_folder}     /home/gabriel/Documentos/RPA/RPA_Email_ImapSMTP/DataSets/download
# -

*** Tasks   ***
Example of Email Library Use Cases
    # Append To List      ${files_to_attach}     ${file_two}    ${file_one}
    # Send Text Email     ${recipient_email}     ${mail_subject}    ${mail_body}      ${files_to_attach}
    
    Save Attachment Where Subject Contains      ${mail_subject}    ${download_folder}
    
    # Send Html Email With Image   ${recipient_email}     ${mail_subject}     ${email_html_body}      ${image}