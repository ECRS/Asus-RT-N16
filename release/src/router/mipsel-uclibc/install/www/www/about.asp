<html>
<head>
<meta http-equiv='content-type' content='text/html;charset=utf-8'>
<meta name='robots' content='noindex,nofollow'>
<title>About</title>
<link rel='stylesheet' type='text/css' href='tomato.css'>
<% css(); %>
<script type='text/javascript' src='tomato.js'></script>
<script type='text/javascript'>
<% nvram(''); %>    // http_id
</script>
</head>
<!--<body onload='init()'>-->
<body>
<table id='container' cellspacing=0>
<tr><td colspan=2 id='header'>
<div class='digital'><img src='digital_logo.png' /></div>
</td></tr>
<tr id='body'><td id='navi'><script type='text/javascript'>navi()</script></td>
<td id='content'>
<div id='ident'><% ident(); %></div>
<div style='float:right;margin:20px 20px;text-align:center'>
<img src='tux.png' alt='Linux &amp; Tomato' id='tux'>
</div>
<div class='about'>
<b>ECRS Asus RT-N16 Firmware <% version(1); %></b><br>
<br>
<p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> <a href="http://www.ecrs.com">ECR Software Corporation</a>.</p>
<br>
<p>Several components of this firmware are copyrighted by other parties and distributed under multiple licenses.</p>
<br>
</p>This firmware is distributed under the terms of the GNU General Public License v3.0, or any later version. This requires public availability of the source code. To obtain the source code for this firmware, go to <a target="_blank" href="https://github.com/ECRS/Asus-RT-N16.git">our GitHub repository</a>.
<br>
<br>
<pre id="buildtime">Built on Wed 09 Dec 2015 09:48:15 AM EST</pre>
</td>
</tr>
</table>
</body>
</html>
