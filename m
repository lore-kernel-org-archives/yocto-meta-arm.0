Return-Path: <G.Kautzmann@PRIMES.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF57C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 08:10:00 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by mx.groups.io with SMTP id smtpd.web10.3097.1720771797627186854
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jul 2024 01:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: domain mismatch" header.i=g.kautzmann@primes.de header.s=s1-ionos header.b=eZO5I6dv;
 spf=pass (domain: primes.de, ip: 212.227.126.131, mailfrom: g.kautzmann@primes.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=PRIMES.de;
	s=s1-ionos; t=1720771795; x=1721376595; i=g.kautzmann@primes.de;
	bh=P3jrEKoqfWYspNHJEilkOX4NewzKK1LhgYvrqJUi+1M=;
	h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:Content-Type:
	 MIME-Version:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=eZO5I6dv64c6/TOf0j/qcuKjdz89lDfYJGtxo2KZzL6EaDEL6fteayuFHsCxWSM6
	 guFFiUsOp5ZIn6e1oAqxTXbqxtj+QK9TqbFKn1+iwaSGctahn5D7X4br2cFjosZJv
	 YOpxDB0om/n7J2RahnrAUEvBsOp1VGPqUwA+Ri0V31bEtSWkUSl6xjfPHir/p0N1q
	 hPvJWsE2pwHZ99aJLnHI70cMwrI/T0TjOW5BXEsh59oi4T57OV++mlmVmytp5Sdy0
	 82OIcPueFYGTa6UbbTThsG59jIYCjOAHxSqq7gG55JqhZwUM4E1B0sGCxddjQaSML
	 VB8H4KTVElahsSy3gw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from Exchange2013.PRIMES.local ([149.249.153.88]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQeIA-1sgydp3NbS-00KhDK for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul
 2024 10:09:55 +0200
Received: from EXCHANGE2013.PRIMES.local ([192.168.116.253]) by
 Exchange2013.PRIMES.local ([192.168.116.253]) with mapi id 14.03.0513.000;
 Fri, 12 Jul 2024 10:09:55 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: RaspberryPi 4 Scarthgap core-image-minimal 
Thread-Topic: RaspberryPi 4 Scarthgap core-image-minimal 
Thread-Index: AdrUMorfz3Z6MisUTD+6epHvdYZh4g==
Date: Fri, 12 Jul 2024 08:09:54 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC01106D19C0@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.140]
Content-Type: multipart/alternative;
	boundary="_000_1619D009AA8C9E469331A8EE22395AEC01106D19C0Exchange2013P_"
MIME-Version: 1.0
X-Provags-ID: V03:K1:uQzdm2hJ7Zto8mg4RlZtzFF19LE5JWOFnkKqc7sijMxBWhpy+Uc
 2N35yTp3BbdbqLUewSDWnT7ZEUdUcSmRS0qrUj14ZBSeFkl+HTgpNt3fg4oCbv3h2NOOxK+
 xufqup8OBbWYQ3CQtcxOq7Vkn2vcdIUHnp/nO+/b6hHQ3Hn1zzzyXxmxi5kttwhn52jmExo
 50vs8wn1/Af7eaDs46jRQ==
UI-OutboundReport: notjunk:1;M01:P0:znzD2flELGg=;4IjyWHkcSFst/OkQ1AGg053DQ2n
 y3bNE1yz7DHy1Vg3+K6neawzprQfKJaJsyZS347a9ELLa7ufUcVDacFmTEywussEVFwv5uPTj
 SHJaI0d58oPkU9usa+FVIpwm/HSVhDEvvgVWRGWvawtwUW/gr3e1KYA+GIMkUpDvVhYfg/XEa
 i1zHwkH8274hj8n30dCk7DOaI6xEUIy9o1D7YE2QCq9fIU8Lyjtx4xReAyrRFSz6WBi2/5xkw
 aHdlM8sySvACxnnUlJQF2uMSrzxHnQo2MWRzvIF6jbq1pPD1yPN9ldptG551wLhJw1sX48UMx
 ZU2W8RuQRU4MU+1iLCNdyPqel3hBs97Dz0ORkBSTH8dNZJzfqXZzP9ykv1Xv3jSX2YHV9u3Ut
 775mDGUMcVE4Z6Ya7M8UQL2Q7XTQfYIlwWu95kwHqxJMAwlbVNtbdf6jF2A30liLmMnJTN/kr
 csIpsQWjkQqZFh7DPfEyOJPC8aPueQIuMI9Yb/s900dESSjoCNWWLPmgzAxrHr9FVBxBl+66C
 HapccLTMrROTB6q3ARh60QUgFuj0KXND+eRZq8CkPUT0vRYBVBjL+mTZ/Xr5sGMnl0hL4rE1l
 tt3P9h3cME+1MSbE++HRrCMeliEU/RJqLAxBonTzhUVgDgC902SD/WQ72pkHjV8po8TL0gLoi
 nRR90A29GtEcFwJPSFAKScsM7dImZ2wWoI4N+kFbmkhGDE2CVK3nA+ox4rEfk44uVQtA0Roas
 lb7K7BRAhS+9GDrN5VUnbdPI8OeXex5rw==
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 08:10:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5884

--_000_1619D009AA8C9E469331A8EE22395AEC01106D19C0Exchange2013P_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

On Dunfell I used the command

sbin/modprobe i2c-dev

in my startup scrips, now under Scarthgap I got only this reply:

modprobe: FATAL: Module i2c-dev not found in directory /lib/modules/6.6.22-=
v7l

The whole folder /lib/modules is missing in my build.

What should be added to get back all the missing modules?


PRIMES GmbH    Max-Planck-Str. 2    64319 Pfungstadt   Germany
T +49 6157 9878 0
CEO: Dr.-Ing. Reinhard Kramer, Dr. rer. nat. Thomas Umschlag
Local Court: Darmstadt HRB 5134
g.kautzmann@primes.de<mailto:g.kautzmann@primes.de>    www.primes.de<blocke=
d::http://www.primes.de/>


--_000_1619D009AA8C9E469331A8EE22395AEC01106D19C0Exchange2013P_
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
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
<p class=3D"MsoNormal">Hello,<br>
<br>
On Dunfell I used the command <br>
<br>
<o:p></o:p></p>
<p class=3D"MsoNormal">sbin/modprobe i2c-dev<br>
<br>
<o:p></o:p></p>
<p class=3D"MsoNormal">in my startup scrips, now under Scarthgap I got only=
 this reply:<br>
<br>
modprobe: FATAL: Module i2c-dev not found in directory /lib/modules/6.6.22-=
v7l<br>
<br>
The whole folder /lib/modules is missing in my build.<br>
<br>
What should be added to get back all the missing modules?<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:1.0pt;margin-right:0cm;m=
argin-bottom:1.0pt;margin-left:0cm">
<span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black;mso-fareast-language:DE"><o:p>&nbsp;</o:p></span></=
p>
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
-fareast-language:DE"><a href=3D"mailto:g.kautzmann@primes.de"><span style=
=3D"color:#0563C1">g.kautzmann@primes.de</span></a></span><span style=3D"fo=
nt-size:8.0pt;color:#4F4D51;mso-fareast-language:DE">&nbsp;&nbsp;&nbsp;
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

--_000_1619D009AA8C9E469331A8EE22395AEC01106D19C0Exchange2013P_--

