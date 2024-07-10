Return-Path: <G.Kautzmann@PRIMES.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D27C3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 12:06:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by mx.groups.io with SMTP id smtpd.web10.12772.1720613165141464931
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 05:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: domain mismatch" header.i=g.kautzmann@primes.de header.s=s1-ionos header.b=ogCvhzWo;
 spf=pass (domain: primes.de, ip: 212.227.126.130, mailfrom: g.kautzmann@primes.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=PRIMES.de;
	s=s1-ionos; t=1720613163; x=1721217963; i=g.kautzmann@primes.de;
	bh=ngzbOCYBHGcxssp/bjuclMJujKrHLKDKQ3syGNJKmjk=;
	h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:References:
	 In-Reply-To:Content-Type:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ogCvhzWoq4g3j+DDA+fOBy1BB5sIF4rNIZfZBQ9cm+qQ/xDdUhV4brBxDjOgf0lM
	 6V0tHFKfwGOTh5Bcwm8uEVD2eunAPOuP46GmHDfQ+0ZbRFmZYnd8TzuRDtwnMlUU0
	 +CPptAei5DP0ZEpdIMlKa04w0NB6gSsuRt4te8tzhrjp8dWlzEnh6h7caBNUYc9gA
	 mzWmjMIVUBYcByA6bYad4bzFCTPTyM1RcNbVYVshrUIg0HuSF9YyRJQuFt4NSuRaD
	 vWMvccp3DeG1wcEaNmlQNI5oEAgzJz2zKI6aq4rK0/tCKLZoaevhS0j93XGsumlV7
	 yZcPVoVlHgFvYFSGfQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from Exchange2013.PRIMES.local ([149.249.153.244]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLiTI-1sj2y31Mf2-00K9Ax for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jul
 2024 14:06:03 +0200
Received: from EXCHANGE2013.PRIMES.local ([192.168.116.253]) by
 Exchange2013.PRIMES.local ([192.168.116.253]) with mapi id 14.03.0513.000;
 Wed, 10 Jul 2024 14:06:03 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: WG: Problems building a minimal system for RasPi4
Thread-Topic: Problems building a minimal system for RasPi4
Thread-Index: AdrStQsfysAZYB3mQSOzeFip5vt29QADGXKA
Date: Wed, 10 Jul 2024 12:06:02 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AECE291C85C@Exchange2013.PRIMES.local>
References: <1619D009AA8C9E469331A8EE22395AECE291C83F@Exchange2013.PRIMES.local>
In-Reply-To: <1619D009AA8C9E469331A8EE22395AECE291C83F@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.140]
Content-Type: multipart/alternative;
	boundary="_000_1619D009AA8C9E469331A8EE22395AECE291C85CExchange2013PRI_"
MIME-Version: 1.0
X-Provags-ID: V03:K1:42HOM3lVKv5oYMNi3AEyjxI21EQE+mxeZf6lOdw1ER4GuAwuO2p
 LrT9iiOva+ktpL+7Bdm28cONSljH6czGRX2vlzEJEqQlTVDM+3lnjDU6XQ9NZQR3cdkIuSF
 NuQCH6mF8l5bWcFrOlh6PieL/X05pk8vRBzb5FKHOo4JJWlqemYndZ28R8NkkVz7QK7FRmB
 Q1yM8xZC+1/uJSS71Lrpg==
UI-OutboundReport: notjunk:1;M01:P0:VN4tF+u7VzA=;Hst+nK82cRYUFBOUVzvLGMecIEf
 07vRn7YOa7s8DY0MCXr4IRiwbodIS29Y7ryZwdH75erKKG44b/mjgkiDhKRyYHPZy9Aw0ed2t
 i+w8bKtiJxsH82SObZlNQ0G0wXfuCGiJo+LPaPDr3i+z29GM8udaPJjQm3MZOdonT3BZ4weq9
 OvmrrppMaa9TmuHaN9zVyOAyQJdpKgv6LvMVBwqB44tCTSmULVG9JXz2/UlcQO+cQnzoNtBOk
 qQfmLw0QVfuIXf6CI1ROXKG62vPKnTXei8D4pZbvzfyBAkJ/nwMEPSDPG782Gb1ehDe645fLF
 gaDa+b9bisfHRORKNZtRjpBY2cxW4BOgsofwywR3ikSR8Vh0/ag2Fl/d2azZiwhxBT0OqMujq
 cdO4p0/v/5H9nlCccRF39TMGonA22oC3m3nvfXqUDBnocbPXtdlVUPxeQbOxgBVmghapmi/hl
 Df0qPHwLuOEmoigIVhastaTIXoqxk2Vl7VnjhGvfcz0ZyNixI6eQ/7iiLSQCA69VhWewE3FkA
 gBeG1thzOjZv7HcXy3IsBXJXabmpF2xogClJ2iqB8wtyLCYIBrl95GZRsWjDdthdbMSyOdJsE
 P2jGTY1k0GohH5h4+vtk79BMHd8wGOoko62toV4e6GSyHtjTn1p/mOro3GXHKsTZs6kfaw+Yb
 mvWWhs9vA4P2Dez8wgjaQjhwGdXvMhg00Hn8zl7HXB0IkEpvGK2GM2Ioilfqvuw1fdrJ+he1i
 Ts+y6TDaaOYROtQCDkgU+mCEaD7Dk5lAw==
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Jul 2024 12:06:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5878

--_000_1619D009AA8C9E469331A8EE22395AECE291C85CExchange2013PRI_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello members,

Introduction:
I'm an embedded software developer who had got his first experiences in Yoc=
to by sucessfully building a 'core-image-minimal' system under Yocto Dunfel=
l for RasPi4 with camera drivers for a vc- imx296.

Actual Problem:

I switched from Dunfell to Scarthgap and expierenced some problematic chang=
es.

Under Yocto Dunfell I only needed some minimal settings to get a working im=
age for RasPi4:

BBLAYERS ?=3D " \
  /home/user/yocto/poky/meta \
  /home/user/yocto/poky/meta-poky \
  /home/user/yocto/poky/meta-yocto-bsp \
  /home/user/yocto/poky/meta-raspberrypi \
  "


On Scarthgap I got an Image that might or might not be working correctly, I=
 couldn't watch the (ASCII) boot screen, it only flashes with some text mes=
sages but goes dark (monitor switch off) imidiatly.

The system is reaction to ping (TCP/IP and DHCP are working) but I couldn't=
 log in via SSH.

Im currently using this layers:
BBLAYERS ?=3D " \
  /home/gerd/yocto_nk/poky/meta \
  /home/gerd/yocto_nk/poky/meta-poky \
  /home/gerd/yocto_nk/poky/meta-yocto-bsp \
  /home/gerd/yocto_nk/meta-raspberrypi \
  /home/gerd/yocto_nk/meta-openembedded/meta-oe \
  "

And this settings in local.conf:

MACHINE ?=3D "raspberrypi4"

# For SD card image
IMAGE_FSTYPES =3D "tar.xz ext3 rpi-sdimg"

# add this at the end of local.conf for ssh
EXTRA_IMAGE_FEATURES +=3D "ssh-server-dropbear"


Building the image worked without warnings but maybe I missed a setting to =
display the boot screen.


Thanks for reading and thanks more for reply.

ps.:
I know this is a X-posting to Problem with Yocto Build (Dunfell:OK -> Scart=
hgap: Noooo) - Raspberry Pi Forums<https://forums.raspberrypi.com/viewtopic=
.php?t=3D373460>
But I will post possible solutions on both networks.


PRIMES GmbH    Max-Planck-Str. 2    64319 Pfungstadt   Germany
T +49 6157 9878 0
CEO: Dr.-Ing. Reinhard Kramer, Dr. rer. nat. Thomas Umschlag
Local Court: Darmstadt HRB 5134
g.kautzmann@primes.de<mailto:g.kautzmann@primes.de>    www.primes.de<blocke=
d::http://www.primes.de/>


--_000_1619D009AA8C9E469331A8EE22395AECE291C85CExchange2013PRI_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.E-MailFormatvorlage18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.E-MailFormatvorlage19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Hello members,<br>
<br>
Introduction:<o:p></o:p></p>
<p class=3D"MsoNormal">I&#8217;m an embedded software developer who had got=
 his first experiences in Yocto by sucessfully building a &#8218;core-image=
-minimal&#8216; system under Yocto Dunfell for RasPi4 with camera drivers f=
or a vc- imx296.<br>
<br>
Actual Problem:<br>
<br>
I switched from Dunfell to Scarthgap and expierenced some problematic chang=
es.<br>
<br>
Under Yocto Dunfell I only needed some minimal settings to get a working im=
age for RasPi4:<br>
<br>
BBLAYERS ?=3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; /home/user/yocto/poky/meta \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; /home/user/yocto/poky/meta-poky \<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp; /home/user/yocto/poky/meta-yocto-bsp \<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp; /home/user/yocto/poky/meta-raspberrypi \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:bla=
ck;mso-fareast-language:DE"><br>
<br>
On Scarthgap I got an Image that might or might not be working correctly, I=
 couldn&#8217;t watch the (ASCII) boot screen, it only flashes with some te=
xt messages but goes dark (monitor switch off) imidiatly.<br>
<br>
The system is reaction to ping (TCP/IP and DHCP are working) but I couldn&#=
8217;t log in via SSH.<br>
<br>
Im currently using this layers:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE">BBL=
AYERS ?=3D &quot; \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE">&nb=
sp; /home/gerd/yocto_nk/poky/meta \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE">&nb=
sp; /home/gerd/yocto_nk/poky/meta-poky \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE">&nb=
sp; /home/gerd/yocto_nk/poky/meta-yocto-bsp \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE">&nb=
sp; /home/gerd/yocto_nk/meta-raspberrypi \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE">&nb=
sp; /home/gerd/yocto_nk/meta-openembedded/meta-oe \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE">&nb=
sp; &quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:bla=
ck;mso-fareast-language:DE">And this settings in local.conf:<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE">MAC=
HINE ?=3D &quot;raspberrypi4&quot;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE"># F=
or SD card image<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE">IMA=
GE_FSTYPES =3D &quot;tar.xz ext3 rpi-sdimg&quot;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black;mso-fareast-language:DE"># a=
dd this at the end of local.conf for ssh<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:bla=
ck;mso-fareast-language:DE">EXTRA_IMAGE_FEATURES &#43;=3D &quot;ssh-server-=
dropbear&quot;<br>
<br>
<br>
Building the image worked without warnings but maybe I missed a setting to =
display the boot screen.<br>
<br>
<br>
Thanks for reading and thanks more for reply.<br>
<br>
ps.:<br>
I know this is a X-posting to </span><a href=3D"https://forums.raspberrypi.=
com/viewtopic.php?t=3D373460">Problem with Yocto Build (Dunfell:OK -&gt; Sc=
arthgap: Noooo) - Raspberry Pi Forums</a><br>
But I will post possible solutions on both networks. <span lang=3D"EN-US" s=
tyle=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blac=
k;mso-fareast-language:DE">
<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:5.65pt"><span style=3D"font-siz=
e:2.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#383739;mso-fareast-=
language:DE"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:5.65pt;line-height:11.5pt;mso-l=
ine-height-rule:exactly">
<b><span lang=3D"EN-GB" style=3D"font-size:8.0pt;font-family:&quot;Arial&qu=
ot;,sans-serif;color:#4F4D51;mso-fareast-language:DE">PRIMES GmbH&nbsp;&nbs=
p;&nbsp;
</span></b><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#4F4D51;mso-fareast-language:DE">Max-Planck-St=
r.
</span><span style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-se=
rif;color:#4F4D51;mso-fareast-language:DE">2<b>&nbsp;&nbsp;&nbsp;
</b>64319 Pfungstadt&nbsp;&nbsp; Germany&nbsp;&nbsp;&nbsp; <o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-left:5.65pt;line-height:11.5pt;mso-l=
ine-height-rule:exactly">
<span style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#4F4D51;mso-fareast-language:DE">T &#43;49 6157 9878 0&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:5.65pt;line-height:11.5pt;mso-l=
ine-height-rule:exactly">
<span style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#4F4D51;mso-fareast-language:DE">CEO: Dr.-Ing. Reinhard Kramer, Dr. rer.=
 nat. Thomas Umschlag&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:5.65pt;line-height:11.5pt;mso-l=
ine-height-rule:exactly">
<span style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#4F4D51;mso-fareast-language:DE">Local Court: Darmstadt HRB 5134<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:0cm;mar=
gin-bottom:12.0pt;margin-left:5.65pt;line-height:11.1pt;mso-line-height-rul=
e:exactly">
<span style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;mso=
-fareast-language:DE"><a href=3D"mailto:g.kautzmann@primes.de">g.kautzmann@=
primes.de</a></span><span style=3D"font-size:8.0pt;color:#4F4D51;mso-fareas=
t-language:DE">&nbsp;&nbsp;&nbsp;
</span><span style=3D"mso-fareast-language:DE"><a href=3D"blocked::http://w=
ww.primes.de/" title=3D"blocked::http://www.primes.de/=0A=
http://www.primes.de/"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:#4F4D51;text-decoration:none">www.primes.de</span=
></a></span><span style=3D"font-size:8.0pt;color:#4F4D51;mso-fareast-langua=
ge:DE">&nbsp;</span><span style=3D"position:relative;top:3.0pt;mso-text-rai=
se:-3.0pt;mso-fareast-language:DE"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_1619D009AA8C9E469331A8EE22395AECE291C85CExchange2013PRI_--

