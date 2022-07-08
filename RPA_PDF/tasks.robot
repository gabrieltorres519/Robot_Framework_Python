*** Settings ***
Documentation   RPA PDF Related Keywords Example
Resource        KeywordLibrary/pdf.robot


*** Variables   ***
${SRC_FILE}          /home/gabriel/Documentos/RPA/RPA_PDF/DataSets/stfdoc.pdf 


*** Tasks ***
Example of PDF Library Use Case One
   Extract Pages With Images   ${SRC_FILE}


*** Tasks   ***
Example of PDF Library Use Case Two
    Save URL As Image In PDF        https://cloud.robocorp.com     
    Save URL As Image In PDF        https://robocorp.com/docs/


