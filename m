Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A7EC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 07:38:30 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.19579.1680161905192654201
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 00:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=V4nnCYJB;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id ay14so13147938uab.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 00:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680161904; x=1682753904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bsRiOLZUmfrDgim2sizGBKBM5Dxeu586pFxxnhRO+v8=;
        b=V4nnCYJBjME7YKNkkY/68sXYvzQnHYXeXYqaoTHu3bJM82QHuutSY7cOR82S3k/7Wm
         gP7nYFYs2sqglk8cpSlyR/OZpHWBe/SZ3EWAQM2XPhCoT/yF5Ql8kf+SJdqcK+UB1jSX
         1sk/U15ZUN1lVf3hjCg5ll5lbGDVSRjLiowsZL68nQF229297+BqH06Iott2r7a+K2TJ
         VRz1/4ThdqTE6LUz77bPJdNGkUvntP33fnwd7ovKw0139BYjf9bsee+8xlVMj3TbFVSb
         s6f1OOz9oEju2MSNKjz21i7BmXoO+xVLPgPNIsjSNar5LSmXDs4ONCSnybMypHZlxBy/
         8Mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680161904; x=1682753904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsRiOLZUmfrDgim2sizGBKBM5Dxeu586pFxxnhRO+v8=;
        b=RciR7Zpst1zttw5t6zUdbqaQ4owxCvpaBxpOWi55FZSzdogQ8JRKCw0GFb2IZShnjB
         yCfeZ+9umBZloONunoRb+bu+ERjQEkwfRaCokaQP2mLpITXtu8VFnQcwR9GX6TSnaeJG
         Z204/2znNfKoklgRPq8KjJVHW9/asVfRAEa/BWrRTWk11pSI72fq2jahpO0g8Enskk91
         gGNGQMpeSwdGF9wwc2hALwtecYQbZtxi53sgMFEhKj7vM7YdKXgaS00mRPxr9CPLmeaZ
         qadAZOoGkaCK126pCVKu3cRB2Ko6xOG+UVBWRZVO8PcJYhHBmibxIxcxz0+C/zpfnjCn
         FBoA==
X-Gm-Message-State: AAQBX9dhD5m5zxToSwgd0vkUcBukU7jJpXjkeso3VClQGJND1h+DwbmX
	z19xMhaSCZttUoPV7KNQAuTB1/2N+v7wmC+X/y0=
X-Google-Smtp-Source: AKy350bvK/RTdEU2OnYOQJO/982KGFlvkusOZJyCNFSzmeKIutdCDEyiAz4sj0uqaaAUJmSDJCPreigbtLSVYmOaLi4=
X-Received: by 2002:ab0:6ecb:0:b0:68b:9eed:1c7d with SMTP id
 c11-20020ab06ecb000000b0068b9eed1c7dmr19130953uav.0.1680161904030; Thu, 30
 Mar 2023 00:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230329161613.812217-1-rui.silva@linaro.org> <CANPvuR=mFEJ-03fo5JZcW-+oyKH5i+hzf+Jm4E3r37uxeRRgTQ@mail.gmail.com>
 <m31ql7xtb2.fsf@gmail.com> <CANPvuRnZRdJkuW213b2Pvxp3+HNfxyRwPsP81S8SAQj6=fi6tw@mail.gmail.com>
 <m3y1neww0e.fsf@gmail.com>
In-Reply-To: <m3y1neww0e.fsf@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 30 Mar 2023 08:38:13 +0100
Message-ID: <CANPvuRkqeK+ztNCPquaYmZtk0byUx6wiuDzqb1pD6DGbV3K5vQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/optee: bump corstone1000 to v3.20
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000074793005f8192d6f"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 07:38:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4510

--00000000000074793005f8192d6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rui Miguel Silva <rui.silva@linaro.org> escreveu no dia quinta, 30/03/2023
=C3=A0(s) 08:15:

> Hi Jose,
>
> Jose Quaresma <quaresma.jose@gmail.com> writes:
>
> > Hi,
> >
> > Reply directly to Rui but not for the mailing list so forward it.
>
> Sorry about that.
>

no problem! I was the one who forgot to forward to the mailing list.


>
> >
> > Rui Miguel Silva <rui.silva@linaro.org> escreveu no dia quarta,
> 29/03/2023
> > =C3=A0(s) 20:15:
> >
> >> Oi Jose,
> >>
> >> Thanks for the review.
> >>
> >> Jose Quaresma <quaresma.jose@gmail.com> writes:
> >>
> >> > Hi Rui,
> >> >
> >> > Rui Miguel Silva <rui.silva@linaro.org> escreveu no dia quarta,
> >> 29/03/2023
> >> > =C3=A0(s) 17:15:
> >> >
> >> >> Bump the preferred corstone1000 to v3.20, drop patch
> >> >> that is already included in this version.
> >> >> Create the 3.20 bbappend and remove the entry in 3.18 bbappend.
> >> >>
> >> >> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> >> >> ---
> >> >>  .../conf/machine/include/corstone1000.inc     |  2 +-
> >> >>  .../0004-Handle-logging-syscall.patch         | 33
> -------------------
> >> >>  .../optee/optee-os-corstone1000-common.inc    |  8 -----
> >> >>  .../optee/optee-os_3.18.0.bbappend            |  1 -
> >> >>  .../optee/optee-os_3.20.0.bbappend            |  6 ++++
> >> >>  5 files changed, 7 insertions(+), 43 deletions(-)
> >> >>  delete mode 100644
> >> >>
> >>
> meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Hand=
le-logging-syscall.patch
> >> >>  create mode 100644
> >> >> meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
> >> >>
> >> >> diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc
> >> >> b/meta-arm-bsp/conf/machine/include/corstone1000.inc
> >> >> index 7f25cd54455f..3915d18b5627 100644
> >> >> --- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
> >> >> +++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
> >> >> @@ -34,7 +34,7 @@ UBOOT_ARCH =3D "arm"
> >> >>  UBOOT_EXTLINUX =3D "0"
> >> >>
> >> >>  #optee
> >> >> -PREFERRED_VERSION_optee-os ?=3D "3.18.%"
> >> >> +PREFERRED_VERSION_optee-os ?=3D "3.20.%"
> >> >>  PREFERRED_VERSION_optee-client ?=3D "3.18.%"
> >> >>  EXTRA_IMAGEDEPENDS +=3D "optee-os"
> >> >>  OPTEE_ARCH =3D "arm64"
> >> >> diff --git
> >> >>
> >>
> a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Ha=
ndle-logging-syscall.patch
> >> >>
> >>
> b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Ha=
ndle-logging-syscall.patch
> >> >> deleted file mode 100644
> >> >> index 356be9e04f9e..000000000000
> >> >> ---
> >> >>
> >>
> a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Ha=
ndle-logging-syscall.patch
> >> >> +++ /dev/null
> >> >> @@ -1,33 +0,0 @@
> >> >> -Upstream-Status: Pending [Not submitted to upstream yet]
> >> >> -Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
> >> >> -
> >> >> -From b3fde6c2e1a950214f760ab9f194f3a6572292a8 Mon Sep 17 00:00:00
> 2001
> >> >> -From: Balint Dobszay <balint.dobszay@arm.com>
> >> >> -Date: Fri, 15 Jul 2022 13:45:54 +0200
> >> >> -Subject: [PATCH] Handle logging syscall
> >> >> -
> >> >> -Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
> >> >> -Change-Id: Ib8151cc9c66aea8bcc8fe8b1ecdc3f9f9c5f14e4
> >> >> -
> >> >> -%% original patch: 0004-Handle-logging-syscall.patch
> >> >> -
> >> >> -diff --git a/core/arch/arm/kernel/spmc_sp_handler.c
> >> >> b/core/arch/arm/kernel/spmc_sp_handler.c
> >> >> -index e0fa0aa6..c7a45387 100644
> >> >> ---- a/core/arch/arm/kernel/spmc_sp_handler.c
> >> >> -+++ b/core/arch/arm/kernel/spmc_sp_handler.c
> >> >> -@@ -1004,6 +1004,12 @@ void spmc_sp_msg_handler(struct
> thread_smc_args
> >> >> *args,
> >> >> -                       ffa_mem_reclaim(args, caller_sp);
> >> >> -                       sp_enter(args, caller_sp);
> >> >> -                       break;
> >> >> -+              case 0xdeadbeef:
> >> >> -+                      ts_push_current_session(&caller_sp->ts_sess=
);
> >> >> -+                      IMSG("%s", (char *)args->a1);
> >> >> -+                      ts_pop_current_session();
> >> >> -+                      sp_enter(args, caller_sp);
> >> >> -+                      break;
> >> >> -               default:
> >> >> -                       EMSG("Unhandled FFA function ID %#"PRIx32,
> >> >> -                            (uint32_t)args->a0);
> >> >> ---
> >> >> -2.17.1
> >> >> -
> >> >> diff --git
> >> >>
> a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
> >> >>
> b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
> >> >> index 71b5ee62b902..30f99666626c 100644
> >> >> ---
> >> a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
> >> >> +++
> >> b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
> >> >> @@ -1,15 +1,7 @@
> >> >> -SRCREV =3D "42f6617108fa43712652ef52f9d5b4ec5b2665f8"
> >> >> -PV =3D "3.18.0+git${SRCPV}"
> >> >> -
> >> >>  SRC_URI:remove =3D " \
> >> >>
> file://0003-core-link-add-no-warn-rwx-segments.patch
> >> \
> >> >>                   "
> >> >>
> >> >> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/corstone10=
00:"
> >> >> -SRC_URI:append =3D " \
> >> >> -                  file://0004-Handle-logging-syscall.patch \
> >> >> -                 "
> >> >> -
> >> >>  COMPATIBLE_MACHINE =3D "corstone1000"
> >> >>
> >> >>  OPTEEMACHINE =3D "corstone1000"
> >> >> diff --git
> >> a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
> >> >> b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
> >> >> index 4b03985ac97a..bc933dd54c48 100644
> >> >> --- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
> >> >> +++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
> >> >> @@ -3,6 +3,5 @@
> >> >>  MACHINE_OPTEE_OS_REQUIRE ?=3D ""
> >> >>  MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
> >> >>  MACHINE_OPTEE_OS_REQUIRE:tc =3D "optee-os-tc.inc"
> >> >> -MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D
> >> "optee-os-corstone1000-common.inc"
> >> >>
> >> >>  require ${MACHINE_OPTEE_OS_REQUIRE}
> >> >> diff --git
> >> a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
> >> >> b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
> >> >> new file mode 100644
> >> >> index 000000000000..e732c80f880b
> >> >> --- /dev/null
> >> >> +++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
> >> >> @@ -0,0 +1,6 @@
> >> >> +# Machine specific configurations
> >> >> +
> >> >> +MACHINE_OPTEE_OS_REQUIRE ?=3D ""
> >> >> +MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D
> >> "optee-os-corstone1000-common.inc"
> >> >> +
> >> >> +require ${MACHINE_OPTEE_OS_REQUIRE}
> >> >>
> >> >
> >> > This will generate a bitbake parse error for other machines than
> >> > corstone1000.
> >> >
> >> > Jose
> >>
> >> This pattern is used all over meta-arm/meta-arm-bsp, I see what you ar=
e
> >> saying, that: require "" throws a bitbake error. But I guess that ever=
y
> >> machine needs a require for specifying optee_os platform configuration
> >> and details.
> >>
> >
> > I think the issue is because now with the optee-os_3.20 bbappend the
> n1sdp
> > and the tc override don't apply
> > so the MACHINE_OPTEE_OS_REQUIRE can be blank which will trigger the
> parsing
> > error.
>
> But doesn't n1sdp and tc use the 3.18 bbappend? Here in the CI it is not
> failing to build for that platforms.
>

I have misunderstood that to use the 3.20 bbappend, the machine needs to be
the corstone1000
because of the preferred version in
meta-arm-bsp/conf/machine/include/corstone1000.inc.
So the MACHINE_OPTEE_OS_REQUIRE will never be empty.

 Sorry for the noise.
Jose


>
> Cheers,
>    Rui
>
> >
> > Jose
> >
> >
> >>
> >> @Ross, @Jon am I missing something here?
> >>
> >> Cheers,
> >>   Rui
> >> >
> >> >
> >> >> --
> >> >> 2.34.1
> >> >>
> >> >>
> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> Links: You receive all messages sent to this group.
> >> >> View/Reply Online (#4506):
> >> >> https://lists.yoctoproject.org/g/meta-arm/message/4506
> >> >> Mute This Topic: https://lists.yoctoproject.org/mt/97932156/5052612
> >> >> Group Owner: meta-arm+owner@lists.yoctoproject.org
> >> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> >> >> quaresma.jose@gmail.com]
> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >>
> >> >>
> >> >
> >> > --
> >> > Best regards,
> >> >
> >> > Jos=C3=A9 Quaresma
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000074793005f8192d6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Rui Miguel Silva &lt;<a href=3D"mailt=
o:rui.silva@linaro.org">rui.silva@linaro.org</a>&gt; escreveu no dia quinta=
, 30/03/2023 =C3=A0(s) 08:15:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Jose,<br>
<br>
Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_bla=
nk">quaresma.jose@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; Reply directly to Rui but not for the mailing list so forward it.<br>
<br>
Sorry about that.<br></blockquote><div><br>no problem! I was the one who fo=
rgot to forward to the mailing list.<br>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Rui Miguel Silva &lt;<a href=3D"mailto:rui.silva@linaro.org" target=3D=
"_blank">rui.silva@linaro.org</a>&gt; escreveu no dia quarta, 29/03/2023<br=
>
&gt; =C3=A0(s) 20:15:<br>
&gt;<br>
&gt;&gt; Oi Jose,<br>
&gt;&gt;<br>
&gt;&gt; Thanks for the review.<br>
&gt;&gt;<br>
&gt;&gt; Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" targe=
t=3D"_blank">quaresma.jose@gmail.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Hi Rui,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Rui Miguel Silva &lt;<a href=3D"mailto:rui.silva@linaro.org" =
target=3D"_blank">rui.silva@linaro.org</a>&gt; escreveu no dia quarta,<br>
&gt;&gt; 29/03/2023<br>
&gt;&gt; &gt; =C3=A0(s) 17:15:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; Bump the preferred corstone1000 to v3.20, drop patch<br>
&gt;&gt; &gt;&gt; that is already included in this version.<br>
&gt;&gt; &gt;&gt; Create the 3.20 bbappend and remove the entry in 3.18 bba=
ppend.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Rui Miguel Silva &lt;<a href=3D"mailto:rui=
.silva@linaro.org" target=3D"_blank">rui.silva@linaro.org</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 .../conf/machine/include/corstone1000.inc=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 .../0004-Handle-logging-syscall.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 33 -------------------<br>
&gt;&gt; &gt;&gt;=C2=A0 .../optee/optee-os-corstone1000-common.inc=C2=A0 =
=C2=A0 |=C2=A0 8 -----<br>
&gt;&gt; &gt;&gt;=C2=A0 .../optee/optee-os_3.18.0.bbappend=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt;&gt; &gt;&gt;=C2=A0 .../optee/optee-os_3.20.0.bbappend=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++<br>
&gt;&gt; &gt;&gt;=C2=A0 5 files changed, 7 insertions(+), 43 deletions(-)<b=
r>
&gt;&gt; &gt;&gt;=C2=A0 delete mode 100644<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/00=
04-Handle-logging-syscall.patch<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644<br>
&gt;&gt; &gt;&gt; meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbapp=
end<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta-arm-bsp/conf/machine/include/corstone10=
00.inc<br>
&gt;&gt; &gt;&gt; b/meta-arm-bsp/conf/machine/include/corstone1000.inc<br>
&gt;&gt; &gt;&gt; index 7f25cd54455f..3915d18b5627 100644<br>
&gt;&gt; &gt;&gt; --- a/meta-arm-bsp/conf/machine/include/corstone1000.inc<=
br>
&gt;&gt; &gt;&gt; +++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc<=
br>
&gt;&gt; &gt;&gt; @@ -34,7 +34,7 @@ UBOOT_ARCH =3D &quot;arm&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 UBOOT_EXTLINUX =3D &quot;0&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 #optee<br>
&gt;&gt; &gt;&gt; -PREFERRED_VERSION_optee-os ?=3D &quot;3.18.%&quot;<br>
&gt;&gt; &gt;&gt; +PREFERRED_VERSION_optee-os ?=3D &quot;3.20.%&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 PREFERRED_VERSION_optee-client ?=3D &quot;3.18.%&qu=
ot;<br>
&gt;&gt; &gt;&gt;=C2=A0 EXTRA_IMAGEDEPENDS +=3D &quot;optee-os&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 OPTEE_ARCH =3D &quot;arm64&quot;<br>
&gt;&gt; &gt;&gt; diff --git<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/=
0004-Handle-logging-syscall.patch<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/=
0004-Handle-logging-syscall.patch<br>
&gt;&gt; &gt;&gt; deleted file mode 100644<br>
&gt;&gt; &gt;&gt; index 356be9e04f9e..000000000000<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/=
0004-Handle-logging-syscall.patch<br>
&gt;&gt; &gt;&gt; +++ /dev/null<br>
&gt;&gt; &gt;&gt; @@ -1,33 +0,0 @@<br>
&gt;&gt; &gt;&gt; -Upstream-Status: Pending [Not submitted to upstream yet]=
<br>
&gt;&gt; &gt;&gt; -Signed-off-by: Vishnu Banavath &lt;<a href=3D"mailto:vis=
hnu.banavath@arm.com" target=3D"_blank">vishnu.banavath@arm.com</a>&gt;<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt; -From b3fde6c2e1a950214f760ab9f194f3a6572292a8 Mon Sep 17=
 00:00:00 2001<br>
&gt;&gt; &gt;&gt; -From: Balint Dobszay &lt;<a href=3D"mailto:balint.dobsza=
y@arm.com" target=3D"_blank">balint.dobszay@arm.com</a>&gt;<br>
&gt;&gt; &gt;&gt; -Date: Fri, 15 Jul 2022 13:45:54 +0200<br>
&gt;&gt; &gt;&gt; -Subject: [PATCH] Handle logging syscall<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt; -Signed-off-by: Balint Dobszay &lt;<a href=3D"mailto:bali=
nt.dobszay@arm.com" target=3D"_blank">balint.dobszay@arm.com</a>&gt;<br>
&gt;&gt; &gt;&gt; -Change-Id: Ib8151cc9c66aea8bcc8fe8b1ecdc3f9f9c5f14e4<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt; -%% original patch: 0004-Handle-logging-syscall.patch<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt; -diff --git a/core/arch/arm/kernel/spmc_sp_handler.c<br>
&gt;&gt; &gt;&gt; b/core/arch/arm/kernel/spmc_sp_handler.c<br>
&gt;&gt; &gt;&gt; -index e0fa0aa6..c7a45387 100644<br>
&gt;&gt; &gt;&gt; ---- a/core/arch/arm/kernel/spmc_sp_handler.c<br>
&gt;&gt; &gt;&gt; -+++ b/core/arch/arm/kernel/spmc_sp_handler.c<br>
&gt;&gt; &gt;&gt; -@@ -1004,6 +1004,12 @@ void spmc_sp_msg_handler(struct t=
hread_smc_args<br>
&gt;&gt; &gt;&gt; *args,<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ffa_mem_reclaim(args, caller_sp);<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0sp_enter(args, caller_sp);<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0=
xdeadbeef:<br>
&gt;&gt; &gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ts_push_current_session(&amp;caller_sp-&gt;ts_sess);<=
br>
&gt;&gt; &gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 IMSG(&quot;%s&quot;, (char *)args-&gt;a1);<br>
&gt;&gt; &gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ts_pop_current_session();<br>
&gt;&gt; &gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 sp_enter(args, caller_sp);<br>
&gt;&gt; &gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d=
efault:<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0EMSG(&quot;Unhandled FFA function ID %#&quot;PRI=
x32,<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uint32_t)args-&gt;a0);<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt; -2.17.1<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt; diff --git<br>
&gt;&gt; &gt;&gt; a/meta-arm-bsp/recipes-security/optee/optee-os-corstone10=
00-common.inc<br>
&gt;&gt; &gt;&gt; b/meta-arm-bsp/recipes-security/optee/optee-os-corstone10=
00-common.inc<br>
&gt;&gt; &gt;&gt; index 71b5ee62b902..30f99666626c 100644<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common=
.inc<br>
&gt;&gt; &gt;&gt; +++<br>
&gt;&gt; b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common=
.inc<br>
&gt;&gt; &gt;&gt; @@ -1,15 +1,7 @@<br>
&gt;&gt; &gt;&gt; -SRCREV =3D &quot;42f6617108fa43712652ef52f9d5b4ec5b2665f=
8&quot;<br>
&gt;&gt; &gt;&gt; -PV =3D &quot;3.18.0+git${SRCPV}&quot;<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt;=C2=A0 SRC_URI:remove =3D &quot; \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 file://0003-core-link-add-no-warn-rwx-segments.patch<br>
&gt;&gt; \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files/opte=
e-os/corstone1000:&quot;<br>
&gt;&gt; &gt;&gt; -SRC_URI:append =3D &quot; \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://0004-Handle-logging-syscall.patch \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt;=C2=A0 COMPATIBLE_MACHINE =3D &quot;corstone1000&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 OPTEEMACHINE =3D &quot;corstone1000&quot;<br>
&gt;&gt; &gt;&gt; diff --git<br>
&gt;&gt; a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend<br>
&gt;&gt; &gt;&gt; b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bba=
ppend<br>
&gt;&gt; &gt;&gt; index 4b03985ac97a..bc933dd54c48 100644<br>
&gt;&gt; &gt;&gt; --- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0=
.bbappend<br>
&gt;&gt; &gt;&gt; +++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0=
.bbappend<br>
&gt;&gt; &gt;&gt; @@ -3,6 +3,5 @@<br>
&gt;&gt; &gt;&gt;=C2=A0 MACHINE_OPTEE_OS_REQUIRE ?=3D &quot;&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D &quot;optee-os-n=
1sdp.inc&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 MACHINE_OPTEE_OS_REQUIRE:tc =3D &quot;optee-os-tc.i=
nc&quot;<br>
&gt;&gt; &gt;&gt; -MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D<br>
&gt;&gt; &quot;optee-os-corstone1000-common.inc&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 require ${MACHINE_OPTEE_OS_REQUIRE}<br>
&gt;&gt; &gt;&gt; diff --git<br>
&gt;&gt; a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend<br>
&gt;&gt; &gt;&gt; b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bba=
ppend<br>
&gt;&gt; &gt;&gt; new file mode 100644<br>
&gt;&gt; &gt;&gt; index 000000000000..e732c80f880b<br>
&gt;&gt; &gt;&gt; --- /dev/null<br>
&gt;&gt; &gt;&gt; +++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0=
.bbappend<br>
&gt;&gt; &gt;&gt; @@ -0,0 +1,6 @@<br>
&gt;&gt; &gt;&gt; +# Machine specific configurations<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +MACHINE_OPTEE_OS_REQUIRE ?=3D &quot;&quot;<br>
&gt;&gt; &gt;&gt; +MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D<br>
&gt;&gt; &quot;optee-os-corstone1000-common.inc&quot;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +require ${MACHINE_OPTEE_OS_REQUIRE}<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This will generate a bitbake parse error for other machines t=
han<br>
&gt;&gt; &gt; corstone1000.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Jose<br>
&gt;&gt;<br>
&gt;&gt; This pattern is used all over meta-arm/meta-arm-bsp, I see what yo=
u are<br>
&gt;&gt; saying, that: require &quot;&quot; throws a bitbake error. But I g=
uess that every<br>
&gt;&gt; machine needs a require for specifying optee_os platform configura=
tion<br>
&gt;&gt; and details.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I think the issue is because now with the optee-os_3.20 bbappend the n=
1sdp<br>
&gt; and the tc override don&#39;t apply<br>
&gt; so the MACHINE_OPTEE_OS_REQUIRE can be blank which will trigger the pa=
rsing<br>
&gt; error.<br>
<br>
But doesn&#39;t n1sdp and tc use the 3.18 bbappend? Here in the CI it is no=
t<br>
failing to build for that platforms.<br></blockquote><div><br>I have misund=
erstood that to use the 3.20 bbappend, the machine needs to be the corstone=
1000<br>because of the preferred version in meta-arm-bsp/conf/machine/inclu=
de/corstone1000.inc.<br><font color=3D"#333333" face=3D"Helvetica Neue, Hel=
vetica, Arial, sans-serif"><span style=3D"font-size:14px;white-space:pre-wr=
ap">So the </span></font>MACHINE_OPTEE_OS_REQUIRE=C2=A0will never be empty.=
</div><div><br>=C2=A0Sorry for the noise.</div><div><font color=3D"#333333"=
 face=3D"Helvetica Neue, Helvetica, Arial, sans-serif"><span style=3D"font-=
size:14px;white-space:pre-wrap">
Jose<br></span></font>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Cheers,<br>
=C2=A0 =C2=A0Rui<br>
<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; @Ross, @Jon am I missing something here?<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;=C2=A0 =C2=A0Rui<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.34.1<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt;&gt; View/Reply Online (#4506):<br>
&gt;&gt; &gt;&gt; <a href=3D"https://lists.yoctoproject.org/g/meta-arm/mess=
age/4506" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/g/meta-arm/message/4506</a><br>
&gt;&gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.or=
g/mt/97932156/5052612" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/mt/97932156/5052612</a><br>
&gt;&gt; &gt;&gt; Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoc=
toproject.org" target=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><=
br>
&gt;&gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/=
meta-arm/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/g/meta-arm/unsub</a> [<br>
&gt;&gt; &gt;&gt; <a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_bla=
nk">quaresma.jose@gmail.com</a>]<br>
&gt;&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Best regards,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000074793005f8192d6f--

