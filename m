Received: from mail-yw1-f47.google.com (mail-yw1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web12.7061.1580827976964109311
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 06:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FrhHda6R;
 spf=pass (domain: linaro.org, ip: 209.85.161.47, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yw1-f47.google.com with SMTP id t141so17824811ywc.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 04 Feb 2020 06:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7LvdipWpBIUgYKQruA2sDZbRlKcLdZxeJXaCyF1BLKg=;
        b=FrhHda6RpPHdOXiq3y7DneQVKhCuw/patt1IVFa/gnqz4IuekcQrebdeoNDJfpA2x/
         C7I0yvAWD0XzQmlwKVR4Y0bKeLkFi8TP5yLeAbcr9fKpTa3jmT/LEjVlIrAJF9aFZSiJ
         2S4p6Axmr8E3oXQKoCGoMl3PtrF1HwAvDD7oxgf81ZvHZwwfIBvJKSufE+sqZszsgvSx
         LO3dqeHiN8F4JQOGqcMghpvQ4PSOKIchMUMYLJ9CNvO/IDXUOBP1k8+zVW43poUd7Vea
         tUoxNFMezRoUCBijjwL5ai/MvspEqTR/HTaN4b2W3Olt4R0Tp7GrDuXcSfU/0zfd3Kr5
         3Srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7LvdipWpBIUgYKQruA2sDZbRlKcLdZxeJXaCyF1BLKg=;
        b=E1idipNZz0fAfcbzaNFrZiDltMwNZzY0kKMGUUPLezYjTrjC1e0v9725mulh3RZSFM
         wnDVp4+Mq277SxYvyr4tyvujd6JazrqR5qXdvQXWCbcQedR3c2CiI3tcW0b8NTGvrE93
         b7Srnf87oNVCeQAqhYPhBDu8yp/fbR8k+Uc8actMphj4wj+MQJ6CGLJnu83kAEpvi499
         m1V/BahK+XOY1Gcq8yrkOUZj54rTDh/NuP8EYGJXO5LxYz24CR2EyeOn0qmEHpIxVz7v
         Ks4tKEplnTpQenF3YAoYn7AoP+gOGioWOZxXlPLxdKPhb61AZ3XOWYmDWOPt8u0n6Lbs
         hdow==
X-Gm-Message-State: APjAAAUn2t9qajP9fga88IEGY6HCseD/aKL0imCTr1xOInSDcbgIAHzu
	QFFyR/JSJXceQ26448OB3XEexuvBXB5Y0hMWOLLpwYf4
X-Google-Smtp-Source: APXvYqySnVSlurlsrjE5H6sJ5yO8n2J4xeZtLRrpwqNN78t6oT04CROmW1gZj0M/y+f1G2gvk9R6Tkeq/x61d/uKZLk=
X-Received: by 2002:a81:52d6:: with SMTP id g205mr5971389ywb.179.1580827975820;
 Tue, 04 Feb 2020 06:52:55 -0800 (PST)
MIME-Version: 1.0
References: <20200204143957.18275-1-bertrand.marquis@arm.com>
In-Reply-To: <20200204143957.18275-1-bertrand.marquis@arm.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 4 Feb 2020 15:52:44 +0100
Message-ID: <CAP71WjwytXDP69UyruLCRD7TrCSetRqP60V5qLpW323ku+f8Vg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] Optimize execution on FVP and Foundation platform
To: meta-arm@lists.yoctoproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, nd@arm.com
Content-Type: multipart/alternative; boundary="000000000000f336b2059dc131f6"

--000000000000f336b2059dc131f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 4 f=C3=A9vr. 2020 =C3=A0 15:40, Bertrand <bertrand.marquis@arm.com>=
 a =C3=A9crit :

> Add an extra partition to the disk image generated for FVP and
> Foundation platform (to be used for user data or extra usage). The
> partition is created on the hard drive but is not formated.
> Speed up running on FVP and Foundation by optimizing model parameters:
> - disable options that are already set by default
> - disable cache modelling on FVP
> - disable secure memory
> - disable real time on Foundation (prevents timeout as execution is a
> lot slower then on a real system)
>
> Change-Id: I20d613bd8b0f4cb7df87c294d45b9f718f6a8ed3


These tags should be removed.


> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  meta-arm-bsp/conf/machine/fvp-common/fvp.inc              | 5 +++++
>  .../fvp-common/files/start-foundation-armv8.sh            | 4 ++--
>  .../recipes-devtools/fvp-common/files/start-fvp-base.sh   | 8 +++-----
>  3 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> index 606ea32..6bf33f3 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> @@ -27,6 +27,11 @@ DISK_IMG_PARTITION2_SIZE =3D "2048"
>  DISK_IMG_PARTITION2_FSTYPE =3D "ext4"
>  DISK_IMG_PARTITION2_CONTENT =3D "rootfs"
>
> +# Empty third partition (8G - 2048M - 128M)
> +DISK_IMG_PARTITION3_SIZE =3D "6016"
> +DISK_IMG_PARTITION3_FSTYPE =3D ""
> +DISK_IMG_PARTITION3_CONTENT =3D ""
> +
>  SERIAL_CONSOLES =3D "115200;ttyAMA0"
>
>  PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
> diff --git
> a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.=
sh
> b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.=
sh
> index 4e45a04..ca39bee 100755
> ---
> a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.=
sh
> +++
> b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.=
sh
> @@ -40,10 +40,10 @@ DISK_FILE=3D""
>  FOUNDATION_PLAT_EXE=3D"Foundation_Platform"
>
>  # Foundation Platform arguments
> +# 4 cores
> +# gicv3 emulation (required for hardware virtualisation)
>  FOUNDATION_PLAT_ARGS=3D" \
>      --cores=3D4 \
> -    --secure-memory \
> -    --use-real-time \
>      --gicv3"
>
>  # Foundation Platform user arguments
> diff --git
> a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> index b6e237b..1d3c206 100755
> --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> +++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> @@ -38,13 +38,11 @@ DISK_FILE=3D""
>  FVPEXEC=3D"FVP_Base_RevC-2xAEMv8A"
>
>  # FVP arguments
> +# enable virtio network
> +# disable cache modelling to improve performances
>  FVPARGS=3D" \
>      -C bp.virtio_net.enabled=3D1 \
> -    -C pctl.startup=3D0.0.0.0 \
> -    -C bp.secure_memory=3D1 \
> -    -C bp.tzc_400.diagnostics=3D1 \
> -    -C cluster0.NUM_CORES=3D4 \
> -    -C cluster1.NUM_CORES=3D4"
> +    -C cache_state_modelled=3D0"
>
>  # FVP user arguments
>  EXTRA_ARGS=3D""
> --
> 2.17.1
>
>=20
>

--000000000000f336b2059dc131f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mar. 4 f=C3=A9vr. 2020 =C3=A0 15:40, Bertrand &lt;=
<a href=3D"mailto:bertrand.marquis@arm.com">bertrand.marquis@arm.com</a>&gt=
; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add an extra =
partition to the disk image generated for FVP and<br>
Foundation platform (to be used for user data or extra usage). The<br>
partition is created on the hard drive but is not formated.<br>
Speed up running on FVP and Foundation by optimizing model parameters:<br>
- disable options that are already set by default<br>
- disable cache modelling on FVP<br>
- disable secure memory<br>
- disable real time on Foundation (prevents timeout as execution is a<br>
lot slower then on a real system)<br>
<br>
Change-Id: I20d613bd8b0f4cb7df87c294d45b9f718f6a8ed3</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">These tags should be removed.=C2=A0<=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm=
.com" target=3D"_blank">bertrand.marquis@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-arm-bsp/conf/machine/fvp-common/fvp.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0.../fvp-common/files/start-foundation-armv8.sh=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0.../recipes-devtools/fvp-common/files/start-fvp-base.sh=C2=A0 =C2=A0=
| 8 +++-----<br>
=C2=A03 files changed, 10 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/c=
onf/machine/fvp-common/fvp.inc<br>
index 606ea32..6bf33f3 100644<br>
--- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc<br>
+++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc<br>
@@ -27,6 +27,11 @@ DISK_IMG_PARTITION2_SIZE =3D &quot;2048&quot;<br>
=C2=A0DISK_IMG_PARTITION2_FSTYPE =3D &quot;ext4&quot;<br>
=C2=A0DISK_IMG_PARTITION2_CONTENT =3D &quot;rootfs&quot;<br>
<br>
+# Empty third partition (8G - 2048M - 128M)<br>
+DISK_IMG_PARTITION3_SIZE =3D &quot;6016&quot;<br>
+DISK_IMG_PARTITION3_FSTYPE =3D &quot;&quot;<br>
+DISK_IMG_PARTITION3_CONTENT =3D &quot;&quot;<br>
+<br>
=C2=A0SERIAL_CONSOLES =3D &quot;115200;ttyAMA0&quot;<br>
<br>
=C2=A0PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-yocto&quot;<br>
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundati=
on-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundati=
on-armv8.sh<br>
index 4e45a04..ca39bee 100755<br>
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv=
8.sh<br>
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv=
8.sh<br>
@@ -40,10 +40,10 @@ DISK_FILE=3D&quot;&quot;<br>
=C2=A0FOUNDATION_PLAT_EXE=3D&quot;Foundation_Platform&quot;<br>
<br>
=C2=A0# Foundation Platform arguments<br>
+# 4 cores<br>
+# gicv3 emulation (required for hardware virtualisation)<br>
=C2=A0FOUNDATION_PLAT_ARGS=3D&quot; \<br>
=C2=A0 =C2=A0 =C2=A0--cores=3D4 \<br>
-=C2=A0 =C2=A0 --secure-memory \<br>
-=C2=A0 =C2=A0 --use-real-time \<br>
=C2=A0 =C2=A0 =C2=A0--gicv3&quot;<br>
<br>
=C2=A0# Foundation Platform user arguments<br>
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base=
.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh<br>
index b6e237b..1d3c206 100755<br>
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh<br>
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh<br>
@@ -38,13 +38,11 @@ DISK_FILE=3D&quot;&quot;<br>
=C2=A0FVPEXEC=3D&quot;FVP_Base_RevC-2xAEMv8A&quot;<br>
<br>
=C2=A0# FVP arguments<br>
+# enable virtio network<br>
+# disable cache modelling to improve performances<br>
=C2=A0FVPARGS=3D&quot; \<br>
=C2=A0 =C2=A0 =C2=A0-C bp.virtio_net.enabled=3D1 \<br>
-=C2=A0 =C2=A0 -C pctl.startup=3D0.0.0.0 \<br>
-=C2=A0 =C2=A0 -C bp.secure_memory=3D1 \<br>
-=C2=A0 =C2=A0 -C bp.tzc_400.diagnostics=3D1 \<br>
-=C2=A0 =C2=A0 -C cluster0.NUM_CORES=3D4 \<br>
-=C2=A0 =C2=A0 -C cluster1.NUM_CORES=3D4&quot;<br>
+=C2=A0 =C2=A0 -C cache_state_modelled=3D0&quot;<br>
<br>
=C2=A0# FVP user arguments<br>
=C2=A0EXTRA_ARGS=3D&quot;&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000f336b2059dc131f6--
