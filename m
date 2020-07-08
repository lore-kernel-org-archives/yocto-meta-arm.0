Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web12.7351.1594202247142209944
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 02:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WLCeH50y;
 spf=pass (domain: linaro.org, ip: 209.85.219.175, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f175.google.com with SMTP id 133so4733936ybu.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Jul 2020 02:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=or0I8c3uLnpvIrjfxrLLVERujreSoiifyOywa80232Y=;
        b=WLCeH50yIkSdoOF+6dNHawzQVmwvM9uzjbkV7RbiQWJBlkALkLCwrwkVgs+fxoIMrr
         RdiBizutDmXkw4B3ehxoGwzAwOwtvW5M1dU7yUO2nN42E5NeWoyJuPFuwixI2bbDbP9h
         If5jyZGgKBvNCt/HvpxBOKHROL7Qupfd0EEuuGUa5Oqtw7Bnjjt10w9Kymfg+CjkEAnk
         bfwvgh2gGJW5t0QrtqD3x6zjFqnraol9aFmsHJVrgunBdj1JWksLVLa3ckEHU5qu0Atd
         XGTfqCj13Vd3gupMB1l5DYzK0wSOfbGWC23JJQeITFncBSZuALKKqFy6ohjU1HwZzUoB
         i9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=or0I8c3uLnpvIrjfxrLLVERujreSoiifyOywa80232Y=;
        b=CYwT8z1NhjVb3dneGUNIo3cLF9wbUZVtANfknh4hcy/umTabe3OHCZ/CAaBIyVR3Os
         IXOIncr3zK3BFMmvoOeZq+q0EoJ9jloM0FbM6GfdowMCBIn7fCO+fLE8tYdi0KGFBvs4
         7VHxGhJAnmnuRQNS20VYd9yAaAFrN2LUsA5UnqeIxjpIIzBM90Srs6S9biguYpReXpmW
         XlX/fR3Fmo4WpGR1ZpYmGQZtgPZCFcme17CrFh/41i5nLkazhZfu3fcw3t/ebQRj2KDQ
         YDGhEYnEZn/PKHldopHZxHn3E2xeZlQizaEC6H68XUV4Fku2h64MgGHPds9JTP6VnUK+
         11ag==
X-Gm-Message-State: AOAM530lpxtrFe2b2Oby4rAbHJAUbOmALlBhwqvRZ4n9nMw4fdkgF7qj
	Zd1CZ6RiZslXg8ZvqMxhT1UFPqZDi57Ofoe85n3V5Q==
X-Google-Smtp-Source: ABdhPJyrKmb0BwilirJP7PCb9gzj5JQHSu20eoRX9GMWA3YbDKfPEuDFt2fVejz3MFoWAz1n5hyLwmF5UeuxIvsEAyo=
X-Received: by 2002:a25:8392:: with SMTP id t18mr82266471ybk.397.1594202246066;
 Wed, 08 Jul 2020 02:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200704154301.15546-1-jon.mason@arm.com>
In-Reply-To: <20200704154301.15546-1-jon.mason@arm.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 8 Jul 2020 11:57:15 +0200
Message-ID: <CAP71Wjxp9P1T-gKehWz-eio7JD4H8_DhdvorEtiEf37L49cY2A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: yocto-check-layer fixes
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="00000000000093c99105a9eb2247"

--00000000000093c99105a9eb2247
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 6, 2020 at 11:39 PM Jon Mason <jon.mason@arm.com> wrote:

> Changes necessary to get yocto-check-layer to pass
>
> Change-Id: Ie9ea5047ab1344d14a585552277fdbd6b2bc48ab
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm-bsp/README.md                                     | 1 +
>  .../recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend  | 3 ++-
>  .../recipes-kernel/linux/linux-yocto-arm-platforms.inc     | 7 ++++++-
>  meta-arm/README.md                                         | 1 +
>  4 files changed, 10 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arm-bsp/README.md
>  create mode 100644 meta-arm/README.md
>
> diff --git a/meta-arm-bsp/README.md b/meta-arm-bsp/README.md
> new file mode 100644
> index 0000000..490ddca
> --- /dev/null
> +++ b/meta-arm-bsp/README.md
> @@ -0,0 +1 @@
> +See ../README.md
> diff --git
> a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> index 8b5120f..2c5f61a 100644
> --- a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> +++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> @@ -3,5 +3,6 @@
>  #
>  # Enable second network interface on startup
>  #
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files/juno:"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>

hmm. don't these changes impact the metadata with or without this layer
added? How can it pass the check-layer script?


> diff --git
> a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
> b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
> index 4d20a91..3ddebb9 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
> @@ -8,7 +8,12 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
>
>  # Arm platforms kmeta
> -SRC_URI +=
> "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
> +SRC_URI_KMETA =
> "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
> +SRC_URI_append_foundation-armv8 = " ${SRC_URI_KMETA}"
> +SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
> +SRC_URI_append_juno = " ${SRC_URI_KMETA}"
> +SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
> +SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
>
>  #
>  # FVP FOUNDATION KMACHINE
> diff --git a/meta-arm/README.md b/meta-arm/README.md
> new file mode 100644
> index 0000000..490ddca
> --- /dev/null
> +++ b/meta-arm/README.md
> @@ -0,0 +1 @@
> +See ../README.md
> --
> 2.17.1
>
> 
>

--00000000000093c99105a9eb2247
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 6, 2020 at 11:39 PM Jon M=
ason &lt;<a href=3D"mailto:jon.mason@arm.com">jon.mason@arm.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Changes nece=
ssary to get yocto-check-layer to pass<br>
<br>
Change-Id: Ie9ea5047ab1344d14a585552277fdbd6b2bc48ab<br>
Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com" target=
=3D"_blank">jon.mason@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-arm-bsp/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 1 +<br>
=C2=A0.../recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend=C2=A0 | 3 =
++-<br>
=C2=A0.../recipes-kernel/linux/linux-yocto-arm-platforms.inc=C2=A0 =C2=A0 =
=
=C2=A0| 7 ++++++-<br>
=C2=A0meta-arm/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A04 files changed, 10 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-arm-bsp/README.md<br>
=C2=A0create mode 100644 meta-arm/README.md<br>
<br>
diff --git a/meta-arm-bsp/README.md b/meta-arm-bsp/README.md<br>
new file mode 100644<br>
index 0000000..490ddca<br>
--- /dev/null<br>
+++ b/meta-arm-bsp/README.md<br>
@@ -0,0 +1 @@<br>
+See ../README.md<br>
diff --git a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bba=
ppend b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend<=
br>
index 8b5120f..2c5f61a 100644<br>
--- a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend<b=
r>
+++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend<b=
r>
@@ -3,5 +3,6 @@<br>
=C2=A0#<br>
=C2=A0# Enable second network interface on startup<br>
=C2=A0#<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
-FILESEXTRAPATHS_prepend_juno :=3D &quot;${THISDIR}/files/juno:&quot;<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files:&quot;<br></blockquot=
e><div><br></div><div>hmm. don&#39;t these changes impact the metadata with=
 or without this layer added? How can it pass the check-layer script?</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.i=
nc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc<br>
index 4d20a91..3ddebb9 100644<br>
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc<br>
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc<br>
@@ -8,7 +8,12 @@<br>
=C2=A0FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}:${THISDIR}/files:&quot=
;<br>
<br>
=C2=A0# Arm platforms kmeta<br>
-SRC_URI +=3D &quot;file://arm-platforms-kmeta;type=3Dkmeta;name=3Darm-pla=
tforms-kmeta;destsuffix=3Darm-platforms-kmeta&quot;<br>
+SRC_URI_KMETA =3D &quot;file://arm-platforms-kmeta;type=3Dkmeta;name=3Dar=
m-platforms-kmeta;destsuffix=3Darm-platforms-kmeta&quot;<br>
+SRC_URI_append_foundation-armv8 =3D &quot; ${SRC_URI_KMETA}&quot;<br>
+SRC_URI_append_fvp-base =3D &quot; ${SRC_URI_KMETA}&quot;<br>
+SRC_URI_append_juno =3D &quot; ${SRC_URI_KMETA}&quot;<br>
+SRC_URI_append_gem5-arm64 =3D &quot; ${SRC_URI_KMETA}&quot;<br>
+SRCREV_arm-platforms-kmeta =3D &quot;6147e82375aa9df8f2a162d42ea6406c79c8=
54c5&quot;<br>
<br>
=C2=A0#<br>
=C2=A0# FVP FOUNDATION KMACHINE<br>
diff --git a/meta-arm/README.md b/meta-arm/README.md<br>
new file mode 100644<br>
index 0000000..490ddca<br>
--- /dev/null<br>
+++ b/meta-arm/README.md<br>
@@ -0,0 +1 @@<br>
+See ../README.md<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000093c99105a9eb2247--
