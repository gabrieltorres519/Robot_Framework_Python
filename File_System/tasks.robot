*** Settings ***
Documentation       Template robot main suite.
Resource            KeywordLibrary/file-system.robot


*** Variables ***
${LOG_FILE_PATH} =  /home/gabriel/Documentos/RPA/File_System/FileLogs.txt


*** Tasks ***
Example of RPA FileSystem Library
    Create A New Log File    ${LOG_FILE_PATH}
    Search Files Info From Directory    ${CURDIR}    .robot    ${LOG_FILE_PATH}
