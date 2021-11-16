Return-Path: <ashish.emailaddress@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1797FC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 14:34:56 +0000 (UTC)
Subject: Initial pointer to start with new BSP  Yocto 3.1 for ARM-V8.2
 Cortex-A55
To: meta-arm@lists.yoctoproject.org
From: "Ashishx88" <ashish.emailaddress@gmail.com>
X-Originating-Location: Thane, Maharashtra, IN (103.39.244.240)
X-Originating-Platform: Linux Chrome 95
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 16 Nov 2021 06:34:55 -0800
Message-ID: <yChx.1637073295739529105.DNcu@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="AElg2DhZI1wd0y4OTD2I"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 14:34:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2409

--AElg2DhZI1wd0y4OTD2I
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Team ,
I have some experience with usage of yocto on packages and kernel compilati=
on of existing recipe

We have an project planned where we are trying to create and Yocto-BSP for =
ARM-V8.2 Cortex-A55 , 64bit little endian
Till now , i used to use Yocto to tweaks the existing stuff in BSP.

Any pointer as to how to approach creation of new BSP for ARM-V8.2 Cortex-A=
55 , 64bit little endian
- Like is there any existing sample BSP which i can look .
- What are the prerequisites that i should keep ready before starting with =
new architecture.
- Any other suggestion will be helpful
-=C2=A0We are planning for an custom ARM board , this has working kernel co=
de base but code base is not yocto compliance.
We use to compile like we do for vanilla code & then add our custom changes=
 on top of this vanilla code.
Now we are trying to make this yocto compliance bsp

Thanks ,
Ashish Mishra

--AElg2DhZI1wd0y4OTD2I
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Team ,&nbsp;<br />I have some experience with usage of yocto on packages=
 and kernel compilation of existing recipe&nbsp;<br /><br />We have an proj=
ect planned where we are trying to create and Yocto-BSP for&nbsp;<span styl=
e=3D"color: #000000; font-family: Roboto, RobotoDraft, Helvetica, Arial, sa=
ns-serif; font-size: 13px; white-space: pre-wrap;">ARM-V8.2 Cortex-A55 , 64=
bit little endian<br />Till now , i used to use Yocto to tweaks the existin=
g stuff in BSP. <br /><br />Any pointer as to how to approach creation of n=
ew BSP for </span><span style=3D"color: #000000; font-family: Roboto, Robot=
oDraft, Helvetica, Arial, sans-serif;"><span style=3D"font-size: 13px; whit=
e-space: pre-wrap;">ARM-V8.2 Cortex-A55 , 64bit little endian</span></span>=
<br /><span style=3D"color: #000000; font-family: Roboto, RobotoDraft, Helv=
etica, Arial, sans-serif;"><span style=3D"font-size: 13px; white-space: pre=
-wrap;">- Like is there any existing sample BSP which i can look .</span></=
span><br /><span style=3D"color: #000000; font-family: Roboto, RobotoDraft,=
 Helvetica, Arial, sans-serif;"><span style=3D"font-size: 13px; white-space=
: pre-wrap;">- What are the prerequisites that i should keep ready before s=
tarting with new architecture.<br /></span></span>- Any other suggestion wi=
ll be helpful&nbsp;<br />-&nbsp;We are planning for an custom ARM board , t=
his has working kernel code base but code base is not yocto compliance.&nbs=
p;<br />&nbsp; We use to compile like we do for vanilla code &amp; then add=
 our custom changes on top of this vanilla code.<br />&nbsp; &nbsp;Now we a=
re trying to make this yocto compliance bsp&nbsp;<br /><br />Thanks ,<br />=
Ashish Mishra&nbsp;<br /><br /><br /><br /><br />

--AElg2DhZI1wd0y4OTD2I--

