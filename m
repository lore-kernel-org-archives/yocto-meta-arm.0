Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF7EC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 10:48:32 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.83119.1718707705906708418
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 03:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lCCqK1B5;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-48c390a1054so1942128137.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 03:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718707705; x=1719312505; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LbnlufxlZeWJ4bySQzWM3QzBuD6qrCAJNROSbsHskz8=;
        b=lCCqK1B5nuH35o52mqch6HDvd/i/0R1y71xAUNpp80pAaEm6nV+OJHvRdDY7pgyHkx
         lcWHZ2o1xjuj7UuVb3DuekWdZo74LLZIoW4vuTRx3c1cTfTpEmHxrWcW3AfBpBcAxgL6
         bdJZn2YHOOa+vrcHbRCVEKV47QZSL/N9RTiDEVfzVcqAaUHgvrM9Ctcuq+Pe3mmbeqG6
         dskdopybh8R4SK1PMMT9Rt2eSb3fhAm41LJgrnrNM1CfsLpg+mz2fqG+ATVp7f48cjTa
         q8sXc7l3QQm29+LA7Wrba854r/V1gTBugSjZpKqDDoceaMxZeky2sLU0aycQ9y3D3Jfu
         i5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718707705; x=1719312505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbnlufxlZeWJ4bySQzWM3QzBuD6qrCAJNROSbsHskz8=;
        b=EX+sWoU7/7FExqA5tSYshoUh22muFwcDCtz+P1BRqZD20MNT+GXE8tuIj0DEZMc/3C
         ADFzPirJRa38DhhUQ5Jz/nvNPH83bxU+SRahVzpTr52Cr7yJ9YyCGjjixr7wFp/xVy/B
         dHEWhjG4AR2GoH7W+wEOeb57KlNt4mRburrk794qIDyoM0gw/AkSc5RkepKrljBfvBjh
         NCMQWZCOrn4nB5jrrjtbvDU2ldvupwTbTAuWR9f/mw+dWlCvazlJcvUXjFXSd+T0Dp26
         /rYJMtCw/LZvvm/XS1VEw48D+VuLO+8owwtfZYW62ls/CebvddM8uM8jMsWdycrtfscF
         Z4HQ==
X-Gm-Message-State: AOJu0YydTISLtLQHE3bFQSbqDmN0gRkNIwvbIpUm2Xl10sV4eczGLAFE
	4ngg1sR8V8EEpjVmI6z63xwkUy3e3xbuoKz74yOAepzUuZ9ilOms9SEXQavim+Oltr3Hlarxaxv
	vV7eWXL3A1DeukknrwrTk3Uyky/k=
X-Google-Smtp-Source: AGHT+IE5UxeBEu4XjcFrmCOjcOS8v0bcHSVcDNiiyui/pF7hvpJf8WyYN2hrkQNUT179eiUfPBdpsCQBIJaj431GQxo=
X-Received: by 2002:a05:6102:274d:b0:48c:33c7:822e with SMTP id
 ada2fe7eead31-48dae3cc507mr12562422137.26.1718707704764; Tue, 18 Jun 2024
 03:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240618100757.819376-1-harsimransingh.tungal@arm.com> <20240618100757.819376-6-harsimransingh.tungal@arm.com>
In-Reply-To: <20240618100757.819376-6-harsimransingh.tungal@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 18 Jun 2024 11:48:13 +0100
Message-ID: <CANPvuRkH8giPY1=L8WdRspK=tZ08iLNF3pPztzn9KS=opA2JRA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 5/5] ci,arm-bsp: corstone1000: New
 MACHINE_FEATURES for Corstone-1000 FVP multicore
To: harsimransingh.tungal@arm.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000037216b061b27d2f8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 10:48:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5816

--00000000000037216b061b27d2f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Harsimran,

Harsimran Singh via lists.yoctoproject.org <harsimransingh.tungal=3D
arm.com@lists.yoctoproject.org> escreveu (ter=C3=A7a, 18/06/2024 =C3=A0(s) =
11:08):

> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
>
> Introduce `corstone1000_fvp_smp` as a value of the `MACHINE_FEATURES`
> variable to support Corstone-1000 FVP Symmetric Multiprocessing.
>
> A new YAML file is created to add this new machine only for the FVP
> variant of the target platform.
>
> The multicore feature is enabled in TrustedFirmware-A,
> TrustedFirmware-M, and OP-TEE based on this machine feature.
>
> Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> ---
>  kas/corstone1000-fvp-multicore.yml                        | 8 ++++++++
>  .../trusted-firmware-a-corstone1000.inc                   | 1 +
>  .../trusted-firmware-m-corstone1000.inc                   | 1 +
>  .../optee/optee-os-corstone1000-common.inc                | 2 ++
>  4 files changed, 12 insertions(+)
>  create mode 100644 kas/corstone1000-fvp-multicore.yml
>
> diff --git a/kas/corstone1000-fvp-multicore.yml
> b/kas/corstone1000-fvp-multicore.yml
> new file mode 100644
> index 00000000..d806bb11
> --- /dev/null
> +++ b/kas/corstone1000-fvp-multicore.yml
> @@ -0,0 +1,8 @@
> +# yaml-language-server: $schema=3D
> https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
> +
> +header:
> +  version: 14
> +
> +local_conf_header:
> +  fvp-multicore: |
> +    MACHINE_FEATURES +=3D "corstone1000_fvp_smp"
> diff --git
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone=
1000.inc
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone=
1000.inc
> index b19e52aa..0e57b0b7 100644
> ---
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone=
1000.inc
> +++
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone=
1000.inc
> @@ -55,3 +55,4 @@ EXTRA_OEMAKE:append =3D " \
>
>  BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmware/tee-pager_v2.bi=
n \
>                          FVP_USE_GIC_DRIVER=3DFVP_GICV2 \
>                          "
> +EXTRA_OEMAKE:append:corstone1000-fvp =3D
> "${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000_fvp_smp',
> 'ENABLE_MULTICORE=3D1', '', d)}"
>

I believe an extra space is missing there more properly in the '
ENABLE_MULTICORE=3D1'

Jose


> diff --git
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone=
1000.inc
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone=
1000.inc
> index b362461e..4777251d 100644
> ---
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone=
1000.inc
> +++
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone=
1000.inc
> @@ -10,6 +10,7 @@ TFM_DEBUG =3D "1"
>  TFM_PLATFORM_IS_FVP ?=3D "FALSE"
>  EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
>  EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
> +EXTRA_OECMAKE:append:corstone1000-fvp =3D "
> -DENABLE_MULTICORE=3D${@bb.utils.contains('MACHINE_FEATURES',
> 'corstone1000_fvp_smp', 'TRUE', 'FALSE', d)}"
>
>  SRC_URI +=3D " \
>
>  file://0001-arm-trusted-firmware-m-disable-address-warnings-into.patch \
> diff --git
> a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
> b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
> index 4f4ed12a..1cc0335c 100644
> --- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
> +++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
> @@ -17,3 +17,5 @@ EXTRA_OEMAKE +=3D " CFG_TEE_BENCHMARK=3Dn"
>  EXTRA_OEMAKE +=3D " CFG_CORE_SEL1_SPMC=3Dy CFG_CORE_FFA=3Dy"
>
>  EXTRA_OEMAKE +=3D " CFG_WITH_SP=3Dy"
> +
> +EXTRA_OEMAKE:append:corstone1000-fvp =3D
> "${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000_fvp_smp',
> 'CFG_TEE_CORE_NB_CORE=3D4', '', d)}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5815):
> https://lists.yoctoproject.org/g/meta-arm/message/5815
> Mute This Topic: https://lists.yoctoproject.org/mt/106738007/5052612
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000037216b061b27d2f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Harsimran,</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Harsimran Singh via <a href=3D"http://li=
sts.yoctoproject.org">lists.yoctoproject.org</a> &lt;harsimransingh.tungal=
=3D<a href=3D"mailto:arm.com@lists.yoctoproject.org">arm.com@lists.yoctopro=
ject.org</a>&gt; escreveu (ter=C3=A7a, 18/06/2024 =C3=A0(s) 11:08):<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">From: Harsimran Singh T=
ungal &lt;<a href=3D"mailto:harsimransingh.tungal@arm.com" target=3D"_blank=
">harsimransingh.tungal@arm.com</a>&gt;<br>
<br>
Introduce `corstone1000_fvp_smp` as a value of the `MACHINE_FEATURES`<br>
variable to support Corstone-1000 FVP Symmetric Multiprocessing.<br>
<br>
A new YAML file is created to add this new machine only for the FVP<br>
variant of the target platform.<br>
<br>
The multicore feature is enabled in TrustedFirmware-A,<br>
TrustedFirmware-M, and OP-TEE based on this machine feature.<br>
<br>
Signed-off-by: Harsimran Singh Tungal &lt;<a href=3D"mailto:harsimransingh.=
tungal@arm.com" target=3D"_blank">harsimransingh.tungal@arm.com</a>&gt;<br>
---<br>
=C2=A0kas/corstone1000-fvp-multicore.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 ++++++++<br>
=C2=A0.../trusted-firmware-a-corstone1000.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0.../trusted-firmware-m-corstone1000.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0.../optee/optee-os-corstone1000-common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A04 files changed, 12 insertions(+)<br>
=C2=A0create mode 100644 kas/corstone1000-fvp-multicore.yml<br>
<br>
diff --git a/kas/corstone1000-fvp-multicore.yml b/kas/corstone1000-fvp-mult=
icore.yml<br>
new file mode 100644<br>
index 00000000..d806bb11<br>
--- /dev/null<br>
+++ b/kas/corstone1000-fvp-multicore.yml<br>
@@ -0,0 +1,8 @@<br>
+# yaml-language-server: $schema=3D<a href=3D"https://raw.githubusercontent=
.com/siemens/kas/master/kas/schema-kas.json" rel=3D"noreferrer" target=3D"_=
blank">https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.=
json</a><br>
+<br>
+header:<br>
+=C2=A0 version: 14<br>
+<br>
+local_conf_header:<br>
+=C2=A0 fvp-multicore: |<br>
+=C2=A0 =C2=A0 MACHINE_FEATURES +=3D &quot;corstone1000_fvp_smp&quot;<br>
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-corstone1000.inc<br>
index b19e52aa..0e57b0b7 100644<br>
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corsto=
ne1000.inc<br>
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corsto=
ne1000.inc<br>
@@ -55,3 +55,4 @@ EXTRA_OEMAKE:append =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmware/t=
ee-pager_v2.bin \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0FVP_USE_GIC_DRIVER=3DFVP_GICV2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;<br>
+EXTRA_OEMAKE:append:corstone1000-fvp =3D &quot;${@bb.utils.contains(&#39;M=
ACHINE_FEATURES&#39;, &#39;corstone1000_fvp_smp&#39;, &#39;ENABLE_MULTICORE=
=3D1&#39;, &#39;&#39;, d)}&quot;<br></blockquote><div><br>I believe=C2=A0an=
=C2=A0extra space is missing there=C2=A0more properly in the &#39; ENABLE_M=
ULTICORE=3D1&#39;<br><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-fir=
mware-m-corstone1000.inc<br>
index b362461e..4777251d 100644<br>
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corsto=
ne1000.inc<br>
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corsto=
ne1000.inc<br>
@@ -10,6 +10,7 @@ TFM_DEBUG =3D &quot;1&quot;<br>
=C2=A0TFM_PLATFORM_IS_FVP ?=3D &quot;FALSE&quot;<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}&q=
uot;<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF&quot=
;<br>
+EXTRA_OECMAKE:append:corstone1000-fvp =3D &quot; -DENABLE_MULTICORE=3D${@b=
b.utils.contains(&#39;MACHINE_FEATURES&#39;, &#39;corstone1000_fvp_smp&#39;=
, &#39;TRUE&#39;, &#39;FALSE&#39;, d)}&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-arm-trusted-fir=
mware-m-disable-address-warnings-into.patch \<br>
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.i=
nc<br>
index 4f4ed12a..1cc0335c 100644<br>
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc<=
br>
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc<=
br>
@@ -17,3 +17,5 @@ EXTRA_OEMAKE +=3D &quot; CFG_TEE_BENCHMARK=3Dn&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot; CFG_CORE_SEL1_SPMC=3Dy CFG_CORE_FFA=3Dy&quot=
;<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot; CFG_WITH_SP=3Dy&quot;<br>
+<br>
+EXTRA_OEMAKE:append:corstone1000-fvp =3D &quot;${@bb.utils.contains(&#39;M=
ACHINE_FEATURES&#39;, &#39;corstone1000_fvp_smp&#39;, &#39;CFG_TEE_CORE_NB_=
CORE=3D4&#39;, &#39;&#39;, d)}&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#5815): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/5815" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-arm/message/5815</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/106738007/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/106738007/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ar=
m/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">q=
uaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000037216b061b27d2f8--

