*** Settings ***
Library    OperatingSystem

*** Variables ***
${outputDir}    outputDirectory
${DirOne}       fromDirectory
${DirTwo}       toDirectory
${file1}        index1.html
${file2}        index2.html
${file3}        index3.html

*** Keywords ***
Create a base dir
    Create Directory    ${outputDir}
    Should Exist        ${outputDir}

Create source directory
    ${directoryPath}=    Join Path    ${outputDir}    ${DirOne}
    Create Directory     ${directoryPath}

Create dest directory
    ${directoryPath}=    Join Path    ${outputDir}    ${DirTwo}
    Create Directory     ${directoryPath}
    Should Exist         ${directoryPath}

Create File1
    ${filePath}=    Join Path    ${outputDir}    ${DirOne}    ${file1}
    Create File     ${filePath}    <h1>Content of file1</h1>
    Should Exist    ${filePath}

Create File2
    ${filePath}=    Join Path    ${outputDir}    ${DirTwo}    ${file2}
    Create File     ${filePath}    <h1>Content of file1</h1>
    Should Exist    ${filePath}

Create File3
    ${filePath}=    Join Path    ${outputDir}    ${DirOne}    ${file3}
    Create File     ${filePath}    <h1>Content of file1</h1>
    Should Exist    ${filePath}

Move File3 from DirtOne to DirtTwo
    ${sourcePath}=    Join Path    ${outputDir}    ${DirOne}    ${file3}
    ${targetPath}=    Join Path    ${outputDir}    ${DirTwo}    ${file3}
    Move File    ${sourcePath}    ${targetPath}
    Should Exist    ${targetPath}
    Should Not Exist    ${sourcePath}

Copy File1 from DirtOne to DirtTwo
    ${sourcePath}=    Join Path    ${outputDir}    ${DirOne}    ${file1}
    ${targetPath}=    Join Path    ${outputDir}    ${DirTwo}    ${file1}
    Copy File    ${sourcePath}    ${targetPath}
    Should Exist    ${sourcePath}
    Should Exist    ${targetPath}
