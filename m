Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEF0C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 15:06:57 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.338.1652368011264198049
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 May 2022 08:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WKhEmo1b;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id w3so4820933qkb.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 May 2022 08:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5rF4Mb+E71YPGQLDR+PO9o6YYusW2o1S+lAGm5McYd0=;
        b=WKhEmo1btTbi6D/0OVU2QF1y56lXrZPVsEpgrd1KsvJUMf+cfxjdaZJhnWKOqawJBW
         gvfMgg/plmJPF7sc3NEO1CM3BKup2BEDClp2ZgA/3C6eib66SpqEYLOwN1DIjLbHGtuH
         /FIxLajYK3Ct5BKcAivk89q5Q9rSBEbZ0UpxIF+RPuuOXdadF6wyA+cneb6Q8tldnDqm
         /M6T7/RvDTn9mH6NZl70sINbx7z/sHiDuaINrL9Tzw/SsrQOvxoBR74d9YTLnfxRr32D
         +Y5sO8A1wtS6w2jliYvwRxahseYHpIGf/N4gfXyJSAur5kfbi42bafDzSErJyHsg5XF9
         /bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5rF4Mb+E71YPGQLDR+PO9o6YYusW2o1S+lAGm5McYd0=;
        b=wXrICKbjXvamImJgXePlW/I8kP77Jzj+ZPewJK5L2unPJJR1LYVuXlgxAa2cTcYyzH
         5jKK5Ds7Exg5BBNlbE6Mf0MpHP23NWZy8fH5S3tns/3VpRzTy/XWCrGVUMZd8PHcLDsY
         xVzIrUSPYe/Tfnz1YFAclr8usxnoRSJg5+yIZW1/HnNf+qT/9MRb8LGMQ3xVYWlzT89P
         2PLvgPKZEGydO/7hwaasTuvqlRlT++OGjx8SVdOr5qxXThFAT9pCo8PncfvJYlr+QPRg
         bE+zWDuIVewPn4E7Og6YPV4phPuBxj1a2Wcc0bXcBQ2okVPaU3/kRXN/xpe4h+HDWKkV
         sDfg==
X-Gm-Message-State: AOAM532kRjmyNZ9jt8/8KlcyU5PbMSz1TZqULR5CLUpfvSBuS2vcMHv1
	pnQskW4a78/l82B5tLP0fRFeKEStj4ZdDRPMbZs=
X-Google-Smtp-Source: 
 ABdhPJyGdAZJHFMFVridYBOcxUtr6KdMyFLIQW9igTJb/JUfokpMvh15EAcXl5v/QUol3IOx9N3gTD/8MTvzdHKQrY4=
X-Received: by 2002:a05:620a:294d:b0:6a0:1b26:5e26 with SMTP id
 n13-20020a05620a294d00b006a01b265e26mr191627qkp.463.1652368010003; Thu, 12
 May 2022 08:06:50 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1srinq0SbsmN+VNpc=kNdfWo61mZ4mg7hBcseAH9U8q6hQ@mail.gmail.com>
 <CAFA6WYOk3M7vV0YGFa0k+sgCz0-h7tgacvrAshvY_7h9JXH9eQ@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYOk3M7vV0YGFa0k+sgCz0-h7tgacvrAshvY_7h9JXH9eQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2022 08:06:39 -0700
Message-ID: 
 <CAMKF1sqOb702APCmJi3-7qOEf41kV9eVTUurizcdidjZRXhAMQ@mail.gmail.com>
Subject: Re: [meta-arm] World builds failing on qemuarm
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000046475305ded1e880"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 May 2022 15:06:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3390

--00000000000046475305ded1e880
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 12:07 AM Sumit Garg <sumit.garg@linaro.org> wrote:

> Hi Khem,
>
> On Tue, 10 May 2022 at 06:19, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi
> >
> > I am seeing following build failures on qemuarm ( using clang compiler )
> >
> > https://errors.yoctoproject.org/Errors/Build/145605/
> >
> > This started to happen late last week.
> >
> > Can someone look into this regression ?
> >
>
> Looking at the logs:
>
> ld.lld: error: cannot open
>
> TOPDIR/build/tmp/work/qemuarm-yoe-linux-gnueabi/optee-os-tadevkit/3.16.0-r0/recipe-sysroot/usr/lib/clang/14.0.3/lib/linux/libclang_rt.builtins-arm.a:
> No such file or directory
>
> It looks like libclang_rt.builtins-arm.a isn't being installed in the
> sysroot, can you double check clang recipes if this library is built
> and installed properly?


This has been addressed except one which is not related to compiler-rt


>
> -Sumit
>
> > Thanks
> > -Khem
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#3373):
> https://lists.yoctoproject.org/g/meta-arm/message/3373
> > Mute This Topic: https://lists.yoctoproject.org/mt/91003714/1777089
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> sumit.garg@linaro.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000046475305ded1e880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 12, 2022 at 12:07 AM Sumit Garg &lt;<a href=3D"=
mailto:sumit.garg@linaro.org">sumit.garg@linaro.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Hi Khem,<br>
<br>
On Tue, 10 May 2022 at 06:19, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; I am seeing following build failures on qemuarm ( using clang compiler=
 )<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Build/145605/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Bu=
ild/145605/</a><br>
&gt;<br>
&gt; This started to happen late last week.<br>
&gt;<br>
&gt; Can someone look into this regression ?<br>
&gt;<br>
<br>
Looking at the logs:<br>
<br>
ld.lld: error: cannot open<br>
TOPDIR/build/tmp/work/qemuarm-yoe-linux-gnueabi/optee-os-tadevkit/3.16.0-r0=
/recipe-sysroot/usr/lib/clang/14.0.3/lib/linux/libclang_rt.builtins-arm.a:<=
br>
No such file or directory<br>
<br>
It looks like libclang_rt.builtins-arm.a isn&#39;t being installed in the<b=
r>
sysroot, can you double check clang recipes if this library is built<br>
and installed properly?</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">This has been addressed except one which is not related to compiler-=
rt=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" di=
r=3D"auto"><br>
<br>
-Sumit<br>
<br>
&gt; Thanks<br>
&gt; -Khem<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#3373): <a href=3D"https://lists.yoctoproject.org/g=
/meta-arm/message/3373" rel=3D"noreferrer" target=3D"_blank">https://lists.=
yoctoproject.org/g/meta-arm/message/3373</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/91003714=
/1777089" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/91003714/1777089</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org=
" target=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsu=
b" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/me=
ta-arm/unsub</a> [<a href=3D"mailto:sumit.garg@linaro.org" target=3D"_blank=
">sumit.garg@linaro.org</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--00000000000046475305ded1e880--

