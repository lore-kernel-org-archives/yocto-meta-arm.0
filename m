Return-Path: <kai.schade@upower.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381DDC636CD
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 01:53:31 +0000 (UTC)
Subject: Ubuntu BASE on embedded ARM platform
To: meta-arm@lists.yoctoproject.org
From: kai.schade@upower.com
X-Originating-Location: Sunnyvale, California, US (98.45.166.136)
X-Originating-Platform: Windows Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 05 Feb 2023 17:53:23 -0800
Message-ID: <MLAd.1675648403918240445.gs7D@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="UpOZnf5v3UQWrBB10UGh"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Feb 2023 01:53:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4367

--UpOZnf5v3UQWrBB10UGh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings everyone !

Sporadically, Ive seen dinky embedded boards come with recipes supporting Y=
octo builds that generate Ubuntu images (typically 16.04 or 18.04) which ar=
e based on Ubuntu BASE.
http://cdimage.ubuntu.com/ubuntu-base/releases/18.04.5/release/
(note the 'ubuntu-base')

These base images are less than 50MB in size. Quite compact but very useful=
 to work with.

I wondered if anyone has an insight into what the general approach would be=
 to incorporate the ubuntu-base images into my yocto build ?
(The alternative is to reverse engineer all those .inc .bbappend .bb etc.. =
files manually, which is quite laborious)

Ubuntu's website, unfortunately, is not very detailed in regard what the ba=
se images contain.

So, Idk what changes I would have to to to my yocto (the destination) , nor=
 what Ubuntu sticks into they base-images (the source).
Thereby, indecisive which side to look at first.

Hence, posting the question here - maybe so. has thought about that before.

Thanks !

P.S. Ive also looked into customized ARM server images Ubuntu offers ( http=
s://wiki.ubuntu.com/ARM/Server/Install ) but there, too, they are quite tig=
ht-lipped as to exactly how they generated those. I assume thats b/c they w=
ant to sell Canonical consultancy, resp. customized Ubuntu Core implementat=
ions. But, again, Ive seen these small EVBs, baked the Ubuntu base images, =
tried and tested them, I know it works. Therefore the desire to put that on=
to my other board as well ^^

--UpOZnf5v3UQWrBB10UGh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Greetings everyone !<br /><br />Sporadically, Ive seen dinky embedded bo=
ards come with recipes supporting Yocto builds that generate Ubuntu images =
(typically 16.04 or 18.04) which are based on Ubuntu BASE.<br /><a href=3D"=
http://cdimage.ubuntu.com/ubuntu-base/releases/18.04.5/release/">http://cdi=
mage.ubuntu.com/ubuntu-base/releases/18.04.5/release/</a><br />(note the 'u=
buntu-base')<br /><br />These base images are less than 50MB in size. Quite=
 compact but very useful to work with.<br /><br />I wondered if anyone has =
an insight into what the general approach would be to incorporate the ubunt=
u-base images into my yocto build ?<br />(The alternative is to reverse eng=
ineer all those .inc .bbappend .bb etc.. files manually, which is quite lab=
orious)<br /><br />Ubuntu's website, unfortunately, is not very detailed in=
 regard what the base images contain.<br /><br />So, Idk what changes I wou=
ld have to to to my yocto (the destination) , nor what Ubuntu sticks into t=
hey base-images (the source).<br />Thereby, indecisive which side to look a=
t first.<br /><br />Hence, posting the question here - maybe so. has though=
t about that before.<br /><br />Thanks !<br /><br />P.S. Ive also looked in=
to customized ARM server images Ubuntu offers (&nbsp;<a href=3D"https://wik=
i.ubuntu.com/ARM/Server/Install">https://wiki.ubuntu.com/ARM/Server/Install=
</a>&nbsp;) but there, too, they are quite tight-lipped as to exactly how t=
hey generated those. I assume thats b/c they want to sell Canonical consult=
ancy, resp. customized Ubuntu Core implementations. But, again, Ive seen th=
ese small EVBs, baked the Ubuntu base images, tried and tested them, I know=
 it works. Therefore the desire to put that onto my other board as well ^^<=
/p>
<p><br /><br /></p>
<p>&nbsp;</p>
<p>&nbsp;</p>

--UpOZnf5v3UQWrBB10UGh--

