Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.2863.1589413483924036449
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 16:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pEypTPod;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id g12so30435606wmh.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 16:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LjbpbV7C1kN+sRRnJ4ezxT1p77suLRorlcaY+uuIMSc=;
        b=pEypTPodMXHFOtlb9f9WHw/BFSAlEtq2EfUpMdpczbGFLAZ/iWT/dCT2cKNBGPfX1b
         aje3WSoXS//9/EmhLtz4gblTJJ3isW8lzgRKJCM3LcwDgdh8Ajje3RRDsr6Vyfa+fdWn
         E4DDMNMQmbWT05o5HMEb8T56pzg9FDnN6M6LQXpTBqJrRgUJON77vA5TU5q1QSsJ01u1
         B4hfS2e0r1Jzu4/L6om3JszY6bm4ymX/7/oRCl90E5YskR3SjRIb2Ide/XNQAc0AjooH
         HlUQWfVPeS6+xchM96PZ7VMA508dTCDu/lGhDz3jfhHkWLee2YZkwkyK5kHGanYL75H1
         DvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LjbpbV7C1kN+sRRnJ4ezxT1p77suLRorlcaY+uuIMSc=;
        b=KDmh+jhKt6ku8naSxPtk0PR1x11Yu6WiiZAHJT7UJPDRfx8KQ0gJN5LJdDkQkNaECk
         kjwAu/3ZxNeE8WhQ38h0ZA7lgzWBW3jNZSnMxv4DjWO3AhbpJsmFcCJ5n0hlWIqnmiOp
         07ZogyRTMQd1nP3abBd1qraw738p2rKQ3oDEYxmu45qpCnWVRG8PfH7pJpJ9WXawNjRW
         sP0chqhqLNUSab4I9l2g6tsdREqhtZb/LEhnhKBSG3oqulh8gIAVekgEBXzjfah7zSy6
         JVxG+IrtadPyhMTxpBQbzFBh1L8RK/NnNIsKf/9yR9xMrkctxWGSPV0lu8hFbekObUyd
         o/DQ==
X-Gm-Message-State: AGi0PubRsAmvo6qua/NPc66d2qQjz8hwDpKgf1RIRSPgc915j8n79TXv
	mFylXqQmKFvwDFvWMFkwTunAiGw1xIdlYQTBfeY=
X-Google-Smtp-Source: APiQypKjZmVwJd4muYfA3mTyVCNNvUZNO7ZLfOKbS5hlqx5jW55eyX+zyoGyKIY7aC9NoFX44iHpWQ0KWOiSsq3sZgY=
X-Received: by 2002:a1c:2289:: with SMTP id i131mr32590915wmi.111.1589413482187;
 Wed, 13 May 2020 16:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <1589412620-56223-1-git-send-email-denis@denix.org>
In-Reply-To: <1589412620-56223-1-git-send-email-denis@denix.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Wed, 13 May 2020 18:44:32 -0500
Message-ID: <CAJdd5Gbd6Sia48u64zYNB=f0cDNcFy=-oQ-2Y60YbjS4MXy3yA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] trusted-firmware-a: support multi-board platforms
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: multipart/alternative; boundary="00000000000001cf7705a5902aa9"

--00000000000001cf7705a5902aa9
Content-Type: text/plain; charset="UTF-8"

On Wed, May 13, 2020, 6:30 PM Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> Some platforms can have multiple board configurations, passed as
> TARGET_BOARD=""
> that also becomes an extra directory level in the build output hierarchy.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 12
> ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git
> a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 4b5da7a..b88b514 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -12,6 +12,10 @@ COMPATIBLE_MACHINE ?= "invalid"
>  # Platform must be set for each machine
>  TFA_PLATFORM ?= "invalid"
>
> +# Some platforms can have multiple board configurations
> +# Leave empty for default behavior
> +TFA_BOARD ?= ""
> +
>  # Build for debug (set TFA_DEBUG to 1 to activate)
>  TFA_DEBUG ?= "0"
>
> @@ -65,6 +69,10 @@ DEPENDS_append = " dtc-native openssl-native"
>  # Add platform parameter
>  EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
>
> +# Handle TFA_BOARD parameter
> +EXTRA_OEMAKE += "${@['',
> 'TARGET_BOARD=${TFA_BOARD}'][bool(d.getVar('TFA_BOARD'))]}"
> +BUILD_DIR = "${@['${TFA_PLATFORM}',
> '${TFA_PLATFORM}/${TFA_BOARD}'][bool(d.getVar('TFA_BOARD'))]}"
>

I noticed you're doing the Boolean index trick. A little more pythonic and
IMHO easier to read would be:

 "${TFA_PLATFORM}${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"

+
>  # Handle TFA_DEBUG parameter
>  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', '
> DEBUG=${TFA_DEBUG}', '', d)}"
>
> @@ -93,9 +101,9 @@ do_compile[cleandirs] = "${B}"
>
>  do_install() {
>      if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
> -        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
> +        BUILD_PLAT=${B}/${BUILD_DIR}/debug/
>      else
> -        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
> +        BUILD_PLAT=${B}/${BUILD_DIR}/release/
>      fi
>
>      install -d -m 755 ${D}/firmware
> --
> 2.7.4
>
> 
>

--00000000000001cf7705a5902aa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, May 13, 2020, 6:30 PM Denys Dmytriyenko &lt;<a=
 href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">From: Denys Dmytriyenko &lt;<a href=3D"mailto:=
denys@ti.com" target=3D"_blank" rel=3D"noreferrer">denys@ti.com</a>&gt;<br>
<br>
Some platforms can have multiple board configurations, passed as TARGET_BO=
ARD=3D&quot;&quot;<br>
that also becomes an extra directory level in the build output hierarchy.<=
br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targe=
t=3D"_blank" rel=3D"noreferrer">denys@ti.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=C2=A0 =C2=
=A0 | 12 ++++++++++--<br>
=C2=A01 file changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.in=
c b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
index 4b5da7a..b88b514 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
@@ -12,6 +12,10 @@ COMPATIBLE_MACHINE ?=3D &quot;invalid&quot;<br>
=C2=A0# Platform must be set for each machine<br>
=C2=A0TFA_PLATFORM ?=3D &quot;invalid&quot;<br>
<br>
+# Some platforms can have multiple board configurations<br>
+# Leave empty for default behavior<br>
+TFA_BOARD ?=3D &quot;&quot;<br>
+<br>
=C2=A0# Build for debug (set TFA_DEBUG to 1 to activate)<br>
=C2=A0TFA_DEBUG ?=3D &quot;0&quot;<br>
<br>
@@ -65,6 +69,10 @@ DEPENDS_append =3D &quot; dtc-native openssl-native&quo=
t;<br>
=C2=A0# Add platform parameter<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;BUILD_BASE=3D${B} PLAT=3D${TFA_PLATFORM}&quo=
t;<br>
<br>
+# Handle TFA_BOARD parameter<br>
+EXTRA_OEMAKE +=3D &quot;${@[&#39;&#39;, &#39;TARGET_BOARD=3D${TFA_BOARD}&=
#39;][bool(d.getVar(&#39;TFA_BOARD&#39;))]}&quot;<br>
+BUILD_DIR =3D &quot;${@[&#39;${TFA_PLATFORM}&#39;, &#39;${TFA_PLATFORM}/$=
{TFA_BOARD}&#39;][bool(d.getVar(&#39;TFA_BOARD&#39;))]}&quot;<br></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I noticed you&=
#39;re doing the Boolean index trick. A little more pythonic and IMHO easie=
r to read would be:</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=
=A0&quot;${TFA_PLATFORM}${@&#39;/${TFA_BOARD}&#39; if d.getVar(&#39;TFA_BO=
ARD&#39;) else &#39;&#39;}&quot;</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
=C2=A0# Handle TFA_DEBUG parameter<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;${@bb.utils.contains(&#39;TFA_DEBUG&#39;, &#=
39;1&#39;, &#39; DEBUG=3D${TFA_DEBUG}&#39;, &#39;&#39;, d)}&quot;<br>
<br>
@@ -93,9 +101,9 @@ do_compile[cleandirs] =3D &quot;${B}&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0if ${@&quot;true&quot; if d.getVar(&#39;TFA_DEBUG&#39;=
) =3D=3D &#39;1&#39; else &quot;false&quot;}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_PLAT=3D${B}/${TFA_PLATFORM}/debug/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_PLAT=3D${B}/${BUILD_DIR}/debug/<br>
=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_PLAT=3D${B}/${TFA_PLATFORM}/release/<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_PLAT=3D${B}/${BUILD_DIR}/release/<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0install -d -m 755 ${D}/firmware<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000001cf7705a5902aa9--
