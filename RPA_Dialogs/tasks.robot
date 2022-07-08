*** Settings ***
Documentation   RPA Dialogs Related Keywords Example
Library         RPA.Dialogs
Library         BuiltIn


*** Variables   ***
${TARGET_DIR}       %{ROBOT_ROOT}/Caption

*** Keywords  ***
Create Form With BuiltIn Keywords
        Add heading    USER INPUT FORM
        
        Add Text Input  Target Language     tLanguage
        Add File Input  name=captions
        ...             label=Choose Caption File
        ...             source= /home/gabriel/Documentos/RPA/RPA_Dialogs
        ...             destination=${TARGET_DIR}
        ...             file_type=${EMPTY} # application/json
        Add Text        Select Caption File Type
        Add Radio Buttons     element_id=type  options=WebVTT,VTT  default=VTT
        
        ${response}=     Run dialog    
        
        Log             ${response}[tLanguage]
        Log             ${response}[captions][0]
        Log             ${response}[captions]
        Log             ${response}[type]
        
        [Return]        ${response}[tLanguage]      ${response}[type]       ${response}[captions][0]
      

*** Tasks ***
Example of Dialogs Library
    ${Lan}  ${ftype}   ${fpath}   Create Form With BuiltIn Keywords
    Log      ${Lan}
    Log      ${ftype}
    Log      ${fpath} 
