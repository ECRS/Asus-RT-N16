#!/bin/bash

function insertCommentStripping
{
read -r -d '' FUNC << EndOfMessage
function stripBlankLines(string)
{
    return string.replace(/^\s*[\r\n]/gm, "");
}

function stripComments(string, identifier, message)
{
    var lines = string.split("\n");

    var filterred = lines.filter(function (line)
    {
        return line.indexOf("" + identifier) != 0;
    });

    if (typeof message == 'undefined')
        message = "All comments have been removed"

    alert("NOTE: " + message + " and any infinite loops have been removed to reduce NVRAM usage.");

    return stripBlankLines(filterred.join("\n"));
}

function stripShellComments(string)
{
    var message = "All shell comments (lines starting with #) have been removed";

    return stripComments(string, "#", message);
}
EndOfMessage

echo "${FUNC}" >> ecrs.js
echo -e "\n" >> ecrs.js
}

function insertReadFile
{
read -r -d '' FUNC << EndOfMessage
function readFile(id)
{
    return (document.getElementById("" + id).contentDocument
        || document.getElementById("" + id).contentWindow.document)
        .body.firstChild.textContent;
}
EndOfMessage

echo "${FUNC}" >> ecrs.js
echo -e "\n" >> ecrs.js
}


rm -f ecrs.js
insertCommentStripping
insertReadFile


sed -n '/\/\/\s/,$p' ../src/router/www/tomato.js.stock >> ecrs.js
mv ecrs.js ../src/router/www/tomato.js
