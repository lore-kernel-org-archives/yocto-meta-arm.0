Return-Path: <marek.bykowski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD68C8302B
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 14:49:40 +0000 (UTC)
Subject: Re: boot fvp-base in aarch32
To: meta-arm@lists.yoctoproject.org
From: "Marek Bykowski" <marek.bykowski@gmail.com>
X-Originating-Location: Warsaw, Mazovia, PL (5.173.30.38)
X-Originating-Platform: Windows Chrome 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 07:49:33 -0700
References: <CAHw2UgBkVKuaj4+f-TzxiLzgFn197zWLQgJipK_yLvagkHL10w@mail.gmail.com>
In-Reply-To: <CAHw2UgBkVKuaj4+f-TzxiLzgFn197zWLQgJipK_yLvagkHL10w@mail.gmail.com>
Message-ID: <25560.1751294973424046402@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="srWKBf458qlQL2rRaRbM"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Jun 2025 14:49:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6597

--srWKBf458qlQL2rRaRbM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I see you have `fvp-base-arm32` that you dropped the support at the mickled=
ore Yocto release time.

I have built and successfully run it with Linux booting on a single CPU0 on=
 the FVP_BASE_REVC-2xAEMvA model.

It seems to be armv7 though. Can any of your experts please confirm with me=
 this is equivalent to armv8/AArch32 with reset to BL1 entrypoint?

Thanks,
Marek

--srWKBf458qlQL2rRaRbM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div id=3D":1cm" class=3D"Am aiL Al editable LW-avf tS-tW tS-tY" style=3D"d=
irection: ltr; min-height: 376px;" tabindex=3D"1" role=3D"textbox" contente=
ditable=3D"true" spellcheck=3D"false" aria-label=3D"Message Body" aria-mult=
iline=3D"true" aria-owns=3D":2zk" aria-controls=3D":2zk" aria-expanded=3D"f=
alse">I see you have `fvp-base-arm32` that you dropped the support at the m=
ickledore Yocto release time.<br /><br />
<div>I have built and successfully run it with Linux booting on a single CP=
U0 on the FVP_BASE_REVC-2xAEMvA model.<br /><br /></div>
<div>It seems to be armv7 though. Can any of your experts please confirm wi=
th me this is equivalent to armv8/AArch32 with reset to BL1 entrypoint?<br =
/>&nbsp;<br />Thanks,</div>
<div>Marek</div>
</div>

--srWKBf458qlQL2rRaRbM--

