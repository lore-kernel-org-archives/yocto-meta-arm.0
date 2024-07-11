Return-Path: <G.Kautzmann@PRIMES.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E481C3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 13:33:01 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by mx.groups.io with SMTP id smtpd.web11.11938.1720704779990416950
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jul 2024 06:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: domain mismatch" header.i=g.kautzmann@primes.de header.s=s1-ionos header.b=WWT30CBM;
 spf=pass (domain: primes.de, ip: 217.72.192.75, mailfrom: g.kautzmann@primes.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=PRIMES.de;
	s=s1-ionos; t=1720704778; x=1721309578; i=g.kautzmann@primes.de;
	bh=cOrkZo1aiTrJI15Ff/dtQYY7pvUPj0fMzzstDFeO2xw=;
	h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:References:
	 In-Reply-To:Content-Type:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WWT30CBMv56CykdgXhFVRjiPbY8J1e5dHQLcBM3hQtiozi3umGmV06lB78IoC8oh
	 S1LB0gtW8QyjCnFpVvrVV5Sn5QvhT1Ke/iRzdms5y9qFWxDf1nHMIwOT8C5nDx1aq
	 iEdgKqKoBrKmxi7C3pMIpzh02zwHF8o4mPl2JiQ2UuUKyC+oMZLv4S8YLkYZ1KK8I
	 Eelt+qutzlbPNfbtFMUuj0WXI/lO1GrDK6wXGmb7u/RUkEP4GPoDYJe7OFkZgPDQQ
	 3on5tUKIaufZCHOB+uXw0ETVkX9AsDp0sG+ns7vXusDLLNWWcXNM6kXolUBVoDVVT
	 27KHr/872OMyG/rt1g==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from Exchange2013.PRIMES.local ([80.154.17.250]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MZT2u-1suzXA0cWU-00W5xG for <meta-arm@lists.yoctoproject.org>; Thu, 11
 Jul 2024 15:32:58 +0200
Received: from EXCHANGE2013.PRIMES.local ([192.168.116.253]) by
 Exchange2013.PRIMES.local ([192.168.116.253]) with mapi id 14.03.0513.000;
 Thu, 11 Jul 2024 15:32:57 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: AW: Problems building a minimal system for RasPi4
Thread-Topic: Problems building a minimal system for RasPi4
Thread-Index: AdrStQsfysAZYB3mQSOzeFip5vt29QADGXKAADRgXpA=
Date: Thu, 11 Jul 2024 13:32:57 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC01106CF58E@Exchange2013.PRIMES.local>
References: <1619D009AA8C9E469331A8EE22395AECE291C83F@Exchange2013.PRIMES.local>
 <17E0D88EE83FA3C3.21385@lists.yoctoproject.org>
In-Reply-To: <17E0D88EE83FA3C3.21385@lists.yoctoproject.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.140]
Content-Type: multipart/alternative;
	boundary="_000_1619D009AA8C9E469331A8EE22395AEC01106CF58EExchange2013P_"
MIME-Version: 1.0
X-Provags-ID: V03:K1:+pNBe95A4hUFtJEoUB0jofxrgwHBbcCl0IzFHPwiitx5in0+11N
 oMQ6MtTOwXxFbeMvbwxQtjKZh5QD0mu55rwpe3xY1J8UsHjXL0v+u8FsaytZSymPEINkSs5
 9lDGvLxWGw7UJj8fR3TDTClQOZEB/wnGLRLPlkTtB0rLSenHxwKuAYPFaQYvEoqYjbq2vn4
 dUhZ4yb78aLg9A1l8FGJQ==
UI-OutboundReport: notjunk:1;M01:P0:3lcJbVFhK4U=;FakWredf9LJ/8lFrLIuTwETRomq
 kuuW4R7S28JyJ+Zh/1RYYHjN15TY7wvWk1pqRs9CQZevaGixri6F+HCydkaBSFRzcSAg6rToD
 TFq71crUzbBSFvNuEnuqVurOXmi5b1zeemEDyI+g1nZRHcXMf6LC9xuhY5m+YhmlLM9OYeKRE
 Tr1GtVDwwh7yJiaz3FM0h2TAHb8OlBhuusG2mfNbuV80xS7gCvaBDqo6CwZ9ZquIXBOgcSIzD
 4W1G+ESHbCPMfHA15zHLl3t82OzbilJub+XTFDJBoPihUCz1hQlFKWxiyJfA2NZYFksp1+tgk
 CxPb34F+D6o7Q2FJI2A25PrsDHRM0sRf5W3HUYFnnshOTXis7dppMdz9E7Gr0OR5oqYlcRdlb
 F7eWeP0SceBeo2LhTtaRnrq13zu8emFhmVlW/IEBpyDH3D4f/Bpk9X/OEJP3qRHpgHOkD3UQN
 wopkJpJSxnvxqutquCGHomofTQG2spU9uD4+2Uv7jSYYn6Croox0TrPlsMQFr1PO3kJvbqTeL
 Bo2nDJdonmbr1rLdNerFdEfiL9DhifR5UtdvB5XA/0LTAgsYldKBgdQY8U5x6Dcph195OZltT
 fF7VyE+iA95/9ec83yFRifMm+SJ7FH35icOQ4Ijvf2WeJWabeiJ3kTfPZDjo1N0gCEbz/CJdG
 xbURrTRy48GtaNt9Nrz+bB4dPz4+RpfHeuWc1ajKEijhFe703MS+/I5QcfoPD9tQmLCxlxdZ6
 gy//zIgkANH3alCnjSaeWozzROssnfFmg==
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Jul 2024 13:33:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5881

--_000_1619D009AA8C9E469331A8EE22395AEC01106CF58EExchange2013P_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello members,

I have found out the reason for this often reported problem.

--- It may not be a bug so it must be a feature ---

I'm using the Async (RS232) as console now, not using the video output migh=
t even result in a smaller image.

It's not ideal for my project ( GPIO Pins are not open usable ) but I can u=
se it as workaround.



>>>>>>>>> Old Mail underneath <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<=
<<<<<<<<<<<<<<<<<<<<<


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

pps.:
ignore Raspberry Pi forum they have banned my account and deleted all my me=
ssages, without explanation

PRIMES GmbH    Max-Planck-Str. 2    64319 Pfungstadt   Germany
T +49 6157 9878 0
CEO: Dr.-Ing. Reinhard Kramer, Dr. rer. nat. Thomas Umschlag
Local Court: Darmstadt HRB 5134
g.kautzmann@primes.de<mailto:g.kautzmann@primes.de>    www.primes.de<blocke=
d::http://www.primes.de/>


--_000_1619D009AA8C9E469331A8EE22395AEC01106CF58EExchange2013P_
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
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.E-MailFormatvorlage20
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
<p class=3D"MsoNormal">Hello members,<br>
<br>
I have found out the reason for this often reported problem.<br>
<br>
--- It may not be a bug so it must be a feature ---<br>
<br>
I&#8217;m using the Async (RS232) as console now, not using the video outpu=
t might even result in a smaller image.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It&#8217;s not ideal for my project ( GPIO Pins are =
not open usable ) but I can use it as workaround.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Old Mail undern=
eath &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&l=
t;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;=
&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<br>
<br>
<br>
<o:p></o:p></p>
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
ck;mso-fareast-language:DE">And this settings in local.conf:<o:p></o:p></sp=
an></p>
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
But I will post possible solutions on both networks. <o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:bla=
ck;mso-fareast-language:DE"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US" =
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:bla=
ck;mso-fareast-language:DE">pps.:<br>
ignore Raspberry Pi forum they have banned my account and deleted all my me=
ssages, without explanation<o:p></o:p></span></p>
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
<a href=3D"mailto:g.kautzmann@primes.de"><span style=3D"font-size:8.0pt;fon=
t-family:&quot;Arial&quot;,sans-serif;mso-fareast-language:DE">g.kautzmann@=
primes.de</span></a><span style=3D"font-size:8.0pt;color:#4F4D51;mso-fareas=
t-language:DE">&nbsp;&nbsp;&nbsp;
</span><a href=3D"blocked::http://www.primes.de/" title=3D"blocked::http://=
www.primes.de/=0A=
http://www.primes.de/"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:#4F4D51;mso-fareast-language:DE;text-decoration:n=
one">www.primes.de</span></a><span style=3D"font-size:8.0pt;color:#4F4D51;m=
so-fareast-language:DE">&nbsp;</span><span style=3D"position:relative;top:3=
.0pt;mso-text-raise:-3.0pt;mso-fareast-language:DE"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_1619D009AA8C9E469331A8EE22395AEC01106CF58EExchange2013P_--

