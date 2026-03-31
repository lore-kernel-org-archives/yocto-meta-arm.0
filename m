Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EA7109B46F
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:50:12 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20490.1774965011318659400
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 06:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VJVAvSBe;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-46701f2077cso5111570b6e.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774965010; cv=none;
        d=google.com; s=arc-20240605;
        b=jJFcbzM1KqSR1bUzbeVbWY3EIe8snJWxCqkRKCX1kE+3al5f1fMXNFksYex0as7V38
         HCCTRA58rbmJ5wGlYMC2rIF1om3EVnrAfhBU+nkccNa7FtS6Vcx9Ds280Ux5r3fSQITF
         TtZ7BOMFgI83KJCXZWXn52aCYFdwv9bPQiNfQ4rJ/ro7CzV3QGXHjkWZLgGUn7FbX/k3
         gRf+r60aN/1Kr3t4rswlXzZUJizfXD1g9IqBvVmD903bngSEtzka7mm3pygTYtkN/Kcq
         +WzlPz9RsnCFkpFryQbIDevWxKEngEcfz/Xx26zXe6HCPsNyYMP+JaZ/4VQ0GcH9aFIN
         GrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8dVxLUbSJXaNapJVkv46QrrDoa39kU+L/TUyJ4lT/0I=;
        fh=/RkKIJOtAY0PmKuSGNf2Xjo6L3ffZjtt8dtKg2aJzC8=;
        b=Ze6PWO013QFDgY2hhcRrLMmnAu/baKeewXRqckJnF6y49t8Lh1UXtqGSugVTTMYj1O
         DXk3DgHXyIJXJmal6CIl5v2qoO9oMdurBliWsJfqV40vE+m2pdlzlhebF08w1vtl8W1d
         /QmgfQMfxc4Tsi125OyCm4/BbmkiK0iwEkmR9gR4x3WWxhPPD3rUxbq8PfH47LeP4dP7
         35Dc9mdn3fYsAii64myLI4UslFVjdq1IcsDymbQb5A1Um6bQ613GKeNpQi3/IyDQvNy4
         mwjhL3O4Lru14kilmDI31+gnTV08NmN3p9A8ImVV+y1Zhzh6p1XY3+oQqp/6R5ey18kU
         0pqg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774965010; x=1775569810; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8dVxLUbSJXaNapJVkv46QrrDoa39kU+L/TUyJ4lT/0I=;
        b=VJVAvSBedEnAMA7T90VDlpZGejYndIFRx/w9moGG4rdR3gEMfMVk+cnNwecDpBHXlz
         byLHSIU+O9cDo/lcgrXKKGXEUYLpy53aXqopI9CHTDxUZjgtsjrrC55sHYUiOLnvPeui
         n8a12kCTsIgeNTSZZpIv60aBj2m1GKWaiy2c2IP8EkuE1MEJXislRRNbzjOea1ODHxD2
         VZ0xqKF5FT/vWYBR2y3eMFtrlrUID2fQwbzb8DKwe2v7cTbZvWGhu2nbYs5A/ZJV0fuo
         SzZKtKLCUY1b8fTmUKqFJ4aHQq7oYUEK3o7hTeaHgZv0u/nOl/9qB1Ad/yGVk4N3d1Va
         V4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965010; x=1775569810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dVxLUbSJXaNapJVkv46QrrDoa39kU+L/TUyJ4lT/0I=;
        b=YqdtqI7WHtzrgLpUMqNTMvONLqw49hDUaa3HIPHvzjaPhSJb/BWRQv/Jx7iJMyy9+h
         tfYaKo3/ji5tS/CgXkl0McZ10N/qxoq5Wq1wWdmA4DxLE4mtbEm5VxmYkYj9ryjy0Mb0
         6wuaLU3mw+fD3ZimkvEcKlaGry0JqpVvecpz5nN0FpKMBqntGGpzOjzfoHFih5Q4gg0o
         Gc+7Lysv/8k+hYqXH6dP0XC69Jty0Q6G0w6tjGCQP5r2OTWggRtaLyBEDSUGuo3o/P4m
         JTLojuqdWttDTRIQecCh6SDO+PZ2E2ebTlSiIxE2TBRofM5PYvi1Yiydl1ykNiF+H/Rz
         10EA==
X-Forwarded-Encrypted: i=1; AJvYcCXycLIVq9j50uz442D5lZJJnoMxDIu7DXepsG32mrFXCqgEDgfO+fnNUXAvXApfxELHLoAVG0YW9A==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzyEcdZsgfYYyjad67ofbDCTIdQ6Zf1vJGONVZeiP6+0nKVUvCJ
	Zi54Sqn5Qzt5J0qBZeCM0CUbl3hPrf48421W6vCwVMVBMz6zMzgo/2Pl3ay3W3471/SQXir0mkG
	X8/gYdaA5D38WISYQQrp6fNl0TGcdn/k=
X-Gm-Gg: ATEYQzyK4ZCKh942sz3JOv+XW+sK16rf3clvuVmBJq1zgI5thHoMJ2RQbr6TrQpdfDE
	oliFChDZiNSTXkbfYm7lA9cFWa+Wv/AqJO2AODhBDWFkUgET0FIg6b06H6+vNWpbVGxcMKmm5dS
	hjWOcKTHx6uAkLC56mo3c+8kcltOUMMhzf8SyBX+xFIQrGxtYcQLExUEVK2UPjle9RDsYi48+J4
	mEyn1eGRnSGNRyc4ARY9j7JAxBuU/rH7klb/uzrsNT/F+XHDOVpI6HMjjAxXZHTz7ZocSEupvXa
	KXNOor//
X-Received: by 2002:a05:6820:982:b0:67c:3142:b191 with SMTP id
 006d021491bc7-67e3d93ecfdmr2107112eaf.24.1774965010185; Tue, 31 Mar 2026
 06:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <92b1fbe3da82c19ed2ca7a617077f6055a74f7e3.camel@bootlin.com>
 <6C7BC2F4-364D-41C1-87CB-755547FE281E@arm.com> <CAMKF1sq=OEHMM97DiKsdBTnCdSCbsfzTLiADfyUb0=RbVBVYeA@mail.gmail.com>
 <39d5c5061d0c220d37a302b5669df66d04ca41c0.camel@bootlin.com>
In-Reply-To: <39d5c5061d0c220d37a302b5669df66d04ca41c0.camel@bootlin.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 31 Mar 2026 14:49:57 +0100
X-Gm-Features: AQROBzAE1R1LvchnQQWQWOCiDEhO6-_VixUV3V0pCbbYB_jgDbmPgJUL4uUZ2qo
Message-ID: <CANPvuRnRmv+46uN0oebjyiq9vqePtK4p3cykLsK6zhCy=RAapw@mail.gmail.com>
Subject: Re: [yocto] [RFC] Moving OP-TEE support from meta-arm to oe-core
To: yocto@lists.yoctoproject.org, thomas.perrot@bootlin.com
Cc: raj.khem@gmail.com, ross.burton@arm.com, 
	"nylon.chen@sifive.com" <nylon.chen@sifive.com>, "peter.lin@sifive.com" <peter.lin@sifive.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000ebc116064e523eb0"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 13:50:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6995

--000000000000ebc116064e523eb0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Could this proposal be sent to the OE-core mailing list? It's probably a
bit late for the next LTS, but it doesn't hurt to try.

Jose

Thomas Perrot via lists.yoctoproject.org <thomas.perrot=3D
bootlin.com@lists.yoctoproject.org> escreveu (ter=C3=A7a, 3/02/2026 =C3=A0(=
s) 16:29):

> Hello,
>
> On Thu, 2026-01-22 at 09:22 -0800, Khem Raj via lists.yoctoproject.org
> wrote:
>
>
>
> On Thu, Jan 22, 2026 at 9:05=E2=80=AFAM Ross Burton via lists.yoctoprojec=
t.org
> <ross.burton=3Darm.com@lists.yoctoproject.org> wrote:
>
> On 22 Jan 2026, at 09:33, Thomas Perrot via lists.yoctoproject.org
> <thomas.perrot=3Dbootlin.com@lists.yoctoproject.org> wrote:
> >
> > Hi,
> >
> > Currently, OP-TEE support is maintained in the meta-arm layer. However,
> > OP-TEE is now being adopted by non-ARM platforms as well, notably RISC-
> > V.
> >
> > Given this broader adoption, would it make sense to move the OP-TEE
> > recipes from meta-arm to oe-core?
> >
> > I'd like to hear the community's thoughts on this.
>
> Copying in the meta-arm list.
>
> My immediate thought on this is =E2=80=9Cwould the riscv machines actuall=
y use the
> same recipes=E2=80=9D or is there enough forking and vendor branches happ=
ening that
> whilst in theory everyone is using OP-TEE, they=E2=80=99re not all using =
the _same_
> optee.
>
> I=E2=80=99m not against moving genuinely shared recipes somewhere common,=
 but I do
> think verifying this will actually happen is important.
>
> meta-arm tends to have several versions of optee at once for good reason=
=E2=80=A6
> (currently one, but about to be two)
>
>
>
> I think its a good idea, but Ross's point is good too. If optee is forked
> for every architecture that can not be a good thing. However, if we can g=
et
> qemuarm64 and qemuriscv64 based machines use an upstream version reliably=
,
> we might be able to even help upstream to keep things sane
> atleast for emulated machine architecture, similar to u-boot.
>
>
>
> I agree with this approach. It's worth noting that OP-TEE upstream alread=
y
> runs their test suite (xtest) on QEMU. This gives us confidence that the
> upstream version works reliably on emulated machines.
>
> Starting with qemuarm64 and qemuriscv64 support in oe-core using upstream
> OP-TEE would be a reasonable first step, leaving vendor-specific versions
> and hardware-specific configurations in their respective layers.
>
> Kind regards,
> Thomas Perrot
>
> Ross
>
>
>
>
>
>
> --
>
> Thomas Perrot, Bootlin
> Embedded Linux and kernel engineeringhttps://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#66212):
> https://lists.yoctoproject.org/g/yocto/message/66212
> Mute This Topic: https://lists.yoctoproject.org/mt/117397331/5052612
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ebc116064e523eb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<div><br></div><div>Could this proposal be sent =
to the OE-core mailing list? It&#39;s probably a bit late for the next LTS,=
 but it doesn&#39;t hurt to try.</div><div><br></div><div>Jose</div></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Thomas Perrot via <a href=3D"http://lists.yoctoproject.org"=
>lists.yoctoproject.org</a> &lt;thomas.perrot=3D<a href=3D"mailto:bootlin.c=
om@lists.yoctoproject.org">bootlin.com@lists.yoctoproject.org</a>&gt; escre=
veu (ter=C3=A7a, 3/02/2026 =C3=A0(s) 16:29):<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div class=3D"msg2835133647391530009"><div><di=
v>Hello,</div><div><br>On Thu, 2026-01-22 at 09:22 -0800, Khem Raj via <a h=
ref=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.=
org</a> wrote:</div><blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:2px solid rgb(114,159,207);padding-left:1ex"><div dir=3D"l=
tr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Jan 22, 2026 at 9:05=E2=80=AFAM Ross Burto=
n via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoc=
toproject.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.yoctopr=
oject.org" target=3D"_blank">arm.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:2px solid rgb(114,159,207);padding-left:1ex"><div>On 22 Jan 2026, at =
09:33, Thomas Perrot via <a href=3D"http://lists.yoctoproject.org" rel=3D"n=
oreferrer" target=3D"_blank">lists.yoctoproject.org</a> &lt;thomas.perrot=
=3D<a href=3D"mailto:bootlin.com@lists.yoctoproject.org" target=3D"_blank">=
bootlin.com@lists.yoctoproject.org</a>&gt; wrote:<br>&gt; <br>&gt; Hi,<br>&=
gt; <br>&gt; Currently, OP-TEE support is maintained in the meta-arm layer.=
 However,<br>&gt; OP-TEE is now being adopted by non-ARM platforms as well,=
 notably RISC-<br>&gt; V.<br>&gt; <br>&gt; Given this broader adoption, wou=
ld it make sense to move the OP-TEE<br>&gt; recipes from meta-arm to oe-cor=
e?<br>&gt; <br>&gt; I&#39;d like to hear the community&#39;s thoughts on th=
is.<br></div><div><br>Copying in the meta-arm list.<br></div><div><br>My im=
mediate thought on this is =E2=80=9Cwould the riscv machines actually use t=
he same recipes=E2=80=9D or is there enough forking and vendor branches hap=
pening that whilst in theory everyone is using OP-TEE, they=E2=80=99re not =
all using the _same_ optee.<br></div><div><br>I=E2=80=99m not against movin=
g genuinely shared recipes somewhere common, but I do think verifying this =
will actually happen is important.<br></div><div><br>meta-arm tends to have=
 several versions of optee at once for good reason=E2=80=A6 (currently one,=
 but about to be two)<br></div><div><br></div><div><br></div></blockquote><=
div><br></div><div>I think its=C2=A0a good idea, but Ross&#39;s point is go=
od too. If optee is forked for every architecture that can not be a good th=
ing. However, if we can get</div><div>qemuarm64 and qemuriscv64 based machi=
nes use an upstream version reliably, we might be able to even help upstrea=
m to keep things sane</div><div>atleast for emulated=C2=A0machine=C2=A0arch=
itecture, similar to u-boot.</div><div>=C2=A0</div></div></div></blockquote=
><div><br></div><div><div>I agree with this approach. It&#39;s worth noting=
 that OP-TEE upstream already runs their test suite (xtest) on QEMU. This g=
ives us confidence that the upstream version works reliably on emulated mac=
hines.                                                         </div><div><=
br></div><div>                                                             =
                                                                           =
                                                                           =
                                                                           =
                                </div><div>  Starting with qemuarm64 and qe=
muriscv64 support in oe-core using upstream OP-TEE would be a reasonable fi=
rst step, leaving vendor-specific versions and hardware-specific configurat=
ions in their respective layers.<br></div></div><div><br>Kind regards,<br>T=
homas Perrot<br><br></div><blockquote type=3D"cite" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:2px solid rgb(114,159,207);padding-left:1ex"><div di=
r=3D"ltr"><div class=3D"gmail_quote"><blockquote type=3D"cite" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:2px solid rgb(114,159,207);padding-left:1=
ex"><div>Ross<br></div><div><br></div><div><br></div></blockquote></div></d=
iv><div><br></div><div><br></div><div><br></div></blockquote><div><br></div=
><div><span><pre>-- <br></pre><pre>Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
<a href=3D"https://bootlin.com" target=3D"_blank">https://bootlin.com</a>

</pre></span></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#66212): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/66212" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/yocto/message/66212</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117397331/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117397331/5052612</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/un=
sub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quare=
sma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</d=
iv></div></div>

--000000000000ebc116064e523eb0--

