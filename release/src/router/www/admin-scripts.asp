<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0//EN'>
<!--
	Tomato GUI
	Copyright (C) 2006-2010 Jonathan Zarate
	http://www.polarcloud.com/tomato/

	For use with Tomato Firmware only.
	No part of this file may be used without permission.
-->
<html>
<head>
<meta http-equiv='content-type' content='text/html;charset=utf-8'>
<meta name='robots' content='noindex,nofollow'>
<title>Admin: Scripts</title>
<link rel='stylesheet' type='text/css' href='tomato.css'>
<link rel='stylesheet' type='text/css' href='color.css'>
<script type='text/javascript' src='tomato.js'></script>

<!-- / / / -->
<style type='text/css'>
.as-script {
	font: 12px monospace;
	width: 99%;
	height: 400px;
	overflow: scroll;
	border: 1px solid #eee;
	border-top: none;
}
</style>

<script type='text/javascript' src='debug.js'></script>

<script type='text/javascript'>

//	<% nvram("script_init,script_shut,script_fire,script_wanup"); %>

document.onkeydown = function(e)
{
    e = e || window.event;

    if (e.keyCode == 13 && document.activeElement.id == 'as-hht-ip')
    {
        setKioskIP('as-hht-ip');
        return false;
    }
}

tabs = [['as-init', 'Init'],['as-shut', 'Shutdown'],['as-fire','Firewall'],['as-wanup', 'WAN Up']];

function tabSelect(name)
{
	tabHigh(name);
	for (var i = 0; i < tabs.length; ++i) {
		var on = (name == tabs[i][0]);
		elem.display(tabs[i][0] + '-text', on);
	}
	if (i >= tabs.length) return;
	E(name + '-text').focus();
	cookie.set('scripts_tab', name)
}

function wordWrap()
{
	for (var i = 0; i < tabs.length; ++i) {
		var e = E(tabs[i][0] + '-text');
		var s = e.value;
		var c = e.cloneNode(false);
		wrap = E('as-wordwrap').checked;
		c.setAttribute('wrap', wrap ? 'virtual' : 'off');
		e.parentNode.replaceChild(c, e);
		c.value = s;
	}
}

function save()
{
	var i, t, n, x;

	for (i = 0; i < tabs.length; ++i) {
		t = tabs[i];
		n = E(t[0] + '-text').value.length;
		x = (t[0] == 'as-fire') ? 8192 : 4096;
		if (n > x) {
			tabSelect(t[0]);
			alert(t[1] + ' script is too long. Maximum allowed is ' + x + ' bytes.');
			return;
		}
	}

    // If script is not empty then strip out all shell comments before submitting the form
    if (E('as-init-text').value.length)
        document.getElementById('as-init-text').value = stripShellComments(E('as-init-text').value);
    if (E('as-shut-text').value.length)
        document.getElementById('as-shut-text').value = stripShellComments(E('as-shut-text').value);
    if (E('as-fire-text').value.length)
        document.getElementById('as-fire-text').value = stripShellComments(E('as-fire-text').value);
    if (E('as-wanup-text').value.length)
        document.getElementById('as-wanup-text').value = stripShellComments(E('as-wanup-text').value);

	form.submit('_fom', 1);
}

function earlyInit()
{
	for (var i = 0; i < tabs.length; ++i) {
		var t = tabs[i][0];
		E(t + '-text').value = nvram['script_' + t.replace('as-', '')];
	}
	tabSelect(cookie.get('scripts_tab') || 'as-init');
}

function biDirectional(checkbox, text, frameid)
{
    var firetb = E('as-fire-text');
    var fwscript = readFile(frameid);

    if (checkbox.checked)
    {
        // Insert the firewall script if not already there
        if (firetb.value.indexOf(text) < 0)
        {
            firetb.value = firetb.value + "\n" + fwscript;
        }
    }
    else
    {
        // Remove the firewall script
        var newArr = [""];
        var firesplit = firetb.value.split("\n");

        for (var i = 0; i < firesplit.length; i++)
        {
            if (fwscript.indexOf(firesplit[i]) < 0)
            {
                newArr.push(firesplit[i]);
            }
        }

        firetb.value = newArr.join("\n");
    }
}

function hht(checkbox, text, frameid)
{
    var firetb = E('as-fire-text');
    var hhtip = E('as-hht-ip');
    var fwscript = readFile(frameid);

    if (checkbox.checked)
    {
        // Enable the HHT IP text box and submit button
        E('hht-dependent').style.display = "inline";
        E('as-hht-ip').focus();

        // Insert the firewall script if not already there
        if (firetb.value.indexOf(text) < 0)
        {
            firetb.value = fwscript.trim() + " " + hhtip.value + "\n" + firetb.value;
        }
    }
    else
    {
        // Hide the HHT IP text box and submit button
        E('hht-dependent').style.display = "none";

        // Remove the firewall script
        firetb.value = firetb.value.split("\n").filter(function(line)
        {
            if (line.indexOf("DNAT --to-destination") >= 0)
            {
                return false;
            }

            return true;
        }).join("\n");
    }
}

function setKioskIP(textbox)
{
    var firetb = E('as-fire-text');
    var hhtcheckbox = E('as-hht');
    textbox = E(textbox);

    if (hhtcheckbox.checked)
        firetb.value = firetb.value.replace(/--to-destination.*/gm, '--to-destination ' + textbox.value);
}
</script>

</head>
<body onload="tabSelect('as-fire');">
<form id='_fom' method='post' action='tomato.cgi'>
<table id='container' cellspacing=0>
<tr><td colspan=2 id='header'>
	<div class='digital'><img src='digital_logo.png' /></div>
</td></tr>
<tr id='body'><td id='navi'><script type='text/javascript'>navi()</script></td>
<td id='content'>
<div id='ident'><% ident(); %></div>
<!-- / / / -->


<input type='hidden' name='_nextpage' value='admin-scripts.asp'>

<script type='text/javascript'>
tabCreate.apply(this, tabs);

wrap = cookie.get('scripts_wrap') || 0;
y = Math.floor(docu.getViewSize().height * 0.65);
s = 'height:' + ((y > 300) ? y : 300) + 'px;display:none';
for (i = 0; i < tabs.length; ++i) {
	t = tabs[i][0];
	W('<textarea class="as-script" name="script_' + t.replace('as-', '') + '" id="' + t + '-text" wrap=' + (wrap ? 'virtual' : 'off') + ' style="' + s + '"></textarea>');
}
W('<br><input type="checkbox" id="as-wordwrap" onclick="wordWrap()" onchange="wordWrap()" ' +
  (wrap ? 'checked' : '') + '> Word Wrap');

var bidirtext = "bidirectional";
var hhttext = "DNAT --to-destination";
var bidirset = nvram.script_fire.indexOf(bidirtext);
var hhtset = nvram.script_fire.indexOf(hhttext);

W('<br><input type="checkbox" id="as-' + bidirtext + '" ' + 
    'onclick="biDirectional(this, \'' + bidirtext + '\', \'bidirectionalframe\')" ' + 
    (bidirset >= 0 ? 'checked' : '') + '> Bidirectional Communication');

W('<br><input type="checkbox" id="as-hht" ' + 
    'onclick="hht(this, \'' + hhttext + '\', \'hhtframe\')" ' +
     (hhtset >= 0 ? 'checked' : '') + '> Redirect HHT to Kiosk');

W('<div id="hht-dependent" style="display: ' + (hhtset >= 0 ? 'inline' : 'none') + ';">' + 
    '<br>' + 
    '<input type="text" id="as-hht-ip" value="' +
    (hhtset >= 0 ? nvram.script_fire.split(hhttext)[1].split(/\r?\n/)[0].trim() : '10.217.1.2') + '">' + 
    '<input type="button" id="as-hht-setip" onclick="setKioskIP(\'as-hht-ip\');" value="Set Kiosk IP">' +
'</div>');
</script>

<div id="hht-dependent" style="display: none;">
    <br>
    <input type="text" id="as-hht-ip" value="10.217.1.2">
    <input type="button" id="as-hht-setip" onclick="setKioskIP('as-hht-ip');" value="Set Kiosk IP">
</div>
<iframe id="bidirectionalframe" src="bidirectional.html" style="display: none"></iframe>
<iframe id="hhtframe" src="hht.html" style="display: none"></iframe>

<!-- / / / -->

</td></tr>
<tr><td id='footer' colspan=2>
	<span id='footer-msg'></span>
	<input type='button' value='Save' id='save-button' onclick='save()'>
	<input type='button' value='Cancel' id='cancel-button' onclick='reloadPage();'>
</td></tr>
</table>
</form>
<script type='text/javascript'>earlyInit();</script>
</body>
</html>
