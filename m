Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.2999.1585821690254901679
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 03:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pCc0sAm4;
 spf=pass (domain: linaro.org, ip: 209.85.208.195, mailfrom: peter.griffin@linaro.org)
Received: by mail-lj1-f195.google.com with SMTP id f20so2619595ljm.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Apr 2020 03:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d/wOfcqAnA/mC5P53sbxLNVw7EFZR8dGsxtm1L+8XXQ=;
        b=pCc0sAm4yxczCyhseF21XZkewpgLnaOL6eqpHo2TdJWRSGw8gZ9agmewCujCa5qurN
         Yyi9tBZB85IuUiZVhXLDYi9GQzLXJVZYkeJ2Q8KbswrqQ2jOOnnwchAmojsiiySS6no0
         adGH64ia73khyPh84oNeEtVhM8oyRE5elS7vjMTU5OeJhClg0mKPxpuFK+JDIz+9u4Oj
         /R3ORrbgfF7jdwItdoP4o/U1P0T09tJG8tfyHSGT7LSpqPh+xM3FdCAc2YnliaD8Clps
         3+J1Zbku5TFMRtx81NRoCDNsWFKHh9e4jyiLSCJ1JzuRPUgm5+P3q73xEbXI+JLqnoIf
         B+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d/wOfcqAnA/mC5P53sbxLNVw7EFZR8dGsxtm1L+8XXQ=;
        b=THFuSKWqk8jPBD5n1vbAI3mU9bumAGDWfmcyJiMzIPfLk+FkX0K4/dEVa+bQX8R3mS
         ZQZRT2glxHzYpY3cX6uyi/PxP0uaHgBiGaEQ8njukKsSYerK7HOLS1NrTdtErjZenEnE
         l1M88DTH+QbgfbMcVEfT/gCPo/HHjkaTurGFR00IDVjy5Lskhh0GnYVS3EXSThTKbT9q
         f1muOXPxkHzxOs5YoyWoiKFRxWZiyg0+cXa9nQd1QVNZB2379bTqihEN40I7aEy6fSKP
         Lt2ImY8/Ym8LmLQMDgYzdHIzQRbFmKbfwdfSbhaOQRS/bfohrH0qO7XawzH2iN8LDEom
         2BkA==
X-Gm-Message-State: AGi0Pua/3dAlx68F1l29O9cF4blo86137PJlkf7guDzVeGwNdY89Cm5A
	ChHx8zFWS5F/s+uC6A6Lqxe3yw/Aw+o8okNarEf88bzwJTc=
X-Google-Smtp-Source: APiQypL3xCc3TAFu2J7lsmDkj1q0Vr7StF7MrZO0AILIEWHxM8HdjMGJNiKJAU7tgiAENIZF0kC1CJhSc7ckDqv5M5U=
X-Received: by 2002:a2e:8e36:: with SMTP id r22mr1564157ljk.98.1585821688205;
 Thu, 02 Apr 2020 03:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <1585782786-34477-1-git-send-email-denis@denix.org> <1585782786-34477-3-git-send-email-denis@denix.org>
In-Reply-To: <1585782786-34477-3-git-send-email-denis@denix.org>
From: "Peter Griffin" <peter.griffin@linaro.org>
Date: Thu, 2 Apr 2020 11:01:17 +0100
Message-ID: <CADrjBPoCAFgEJcZPrDJ2ND2E+2-s+m7oCzT37Rbe08QFekD=GA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 3/5] optee-client: upgrade 3.7.0 -> 3,8,0, cleanup
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: multipart/alternative; boundary="00000000000067506c05a24be21e"

--00000000000067506c05a24be21e
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

On Thu, 2 Apr 2020 at 00:13, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> * Rename with _git suffix to match other optee recipes
> * Add DESCRIPTION
> * Use common HOMEPAGE
> * Use install command for header files instead of cp -a
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>

Minor nit patch subject 3,8,0, should be 3.8.0. Apart from that

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>


> ---
>  .../optee/{optee-client.bb => optee-client_git.bb}   | 20
> ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>  rename meta-arm/recipes-security/optee/{optee-client.bb =>
> optee-client_git.bb} (63%)
>
> diff --git a/meta-arm/recipes-security/optee/optee-client.bb
> b/meta-arm/recipes-security/optee/optee-client_git.bb
> similarity index 63%
> rename from meta-arm/recipes-security/optee/optee-client.bb
> rename to meta-arm/recipes-security/optee/optee-client_git.bb
> index 519683a..a25d343 100644
> --- a/meta-arm/recipes-security/optee/optee-client.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> @@ -1,18 +1,21 @@
> -SUMMARY = "OPTEE Client"
> -HOMEPAGE = "https://github.com/OP-TEE/optee_client"
> +SUMMARY = "OP-TEE Client API"
> +DESCRIPTION = "Open Portable Trusted Execution Environment - Normal World
> Client side of the TEE"
> +HOMEPAGE = "https://www.op-tee.org/"
>
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM =
> "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>
> -PV = "3.7.0+git${SRCPV}"
> +PV = "3.8.0+git${SRCPV}"
>
>  inherit python3native systemd
>
> -SRC_URI = "git://github.com/OP-TEE/optee_client.git \
> -           file://tee-supplicant.service"
> -S = "${WORKDIR}/git"
> +SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
> +SRC_URI = " \
> +    git://github.com/OP-TEE/optee_client.git \
> +    file://tee-supplicant.service \
> +"
>
> -SRCREV = "bc0ec8ce1e4dc5ae23f4737ef659338b7cd408fe"
> +S = "${WORKDIR}/git"
>
>  SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
>
> @@ -25,7 +28,8 @@ do_install() {
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
>
> -    cp -a ${S}/out/export/usr/include ${D}/usr/
> +    install -d ${D}${includedir}
> +    install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${includedir}
>
>      sed -i -e s:/etc:${sysconfdir}:g \
>             -e s:/usr/bin:${bindir}:g \
> --
> 2.7.4
>
> 
>

--00000000000067506c05a24be21e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Denys,<div><br></div></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 2 Apr 2020 =
at 00:13, Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@de=
nix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=
=3D"_blank">denys@ti.com</a>&gt;<br>
<br>
* Rename with _git suffix to match other optee recipes<br>
* Add DESCRIPTION<br>
* Use common HOMEPAGE<br>
* Use install command for header files instead of cp -a<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targe=
t=3D"_blank">denys@ti.com</a>&gt;<br></blockquote><div><br></div><div><div>=
Minor nit patch subject=C2=A03,8,0, should be=C2=A03.8.0. Apart from that</=
div><div><br></div><div>Reviewed-by: Peter Griffin &lt;<a href=3D"mailto:pe=
ter.griffin@linaro.org">peter.griffin@linaro.org</a>&gt;</div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0.../optee/{<a href=3D"http://optee-client.bb" rel=3D"noreferrer" tar=
get=3D"_blank">optee-client.bb</a> =3D&gt; <a href=3D"http://optee-client_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">optee-client_git.bb</a>}=C2=A0 =
=
=C2=A0| 20 ++++++++++++--------<br>
=C2=A01 file changed, 12 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta-arm/recipes-security/optee/{<a href=3D"http://optee-clie=
nt.bb" rel=3D"noreferrer" target=3D"_blank">optee-client.bb</a> =3D&gt; <a =
href=3D"http://optee-client_git.bb" rel=3D"noreferrer" target=3D"_blank">op=
tee-client_git.bb</a>} (63%)<br>
<br>
diff --git a/meta-arm/recipes-security/optee/<a href=3D"http://optee-clien=
t.bb" rel=3D"noreferrer" target=3D"_blank">optee-client.bb</a> b/meta-arm/r=
ecipes-security/optee/<a href=3D"http://optee-client_git.bb" rel=3D"norefer=
rer" target=3D"_blank">optee-client_git.bb</a><br>
similarity index 63%<br>
rename from meta-arm/recipes-security/optee/<a href=3D"http://optee-client=
.bb" rel=3D"noreferrer" target=3D"_blank">optee-client.bb</a><br>
rename to meta-arm/recipes-security/optee/<a href=3D"http://optee-client_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">optee-client_git.bb</a><br>
index 519683a..a25d343 100644<br>
--- a/meta-arm/recipes-security/optee/<a href=3D"http://optee-client.bb" r=
el=3D"noreferrer" target=3D"_blank">optee-client.bb</a><br>
+++ b/meta-arm/recipes-security/optee/<a href=3D"http://optee-client_git.b=
b" rel=3D"noreferrer" target=3D"_blank">optee-client_git.bb</a><br>
@@ -1,18 +1,21 @@<br>
-SUMMARY =3D &quot;OPTEE Client&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/OP-TEE/optee_client" rel=
=
=3D"noreferrer" target=3D"_blank">https://github.com/OP-TEE/optee_client</=
a>&quot;<br>
+SUMMARY =3D &quot;OP-TEE Client API&quot;<br>
+DESCRIPTION =3D &quot;Open Portable Trusted Execution Environment - Norma=
l World Client side of the TEE&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://www.op-tee.org/" rel=3D"noreferrer"=
 target=3D"_blank">https://www.op-tee.org/</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;BSD&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${S}/LICENSE;md5=3D69663ab15329855=
7a59c67a60a743e5b&quot;<br>
<br>
-PV =3D &quot;3.7.0+git${SRCPV}&quot;<br>
+PV =3D &quot;3.8.0+git${SRCPV}&quot;<br>
<br>
=C2=A0inherit python3native systemd<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/OP-TEE/optee_client.=
git" rel=3D"noreferrer" target=3D"_blank">github.com/OP-TEE/optee_client.gi=
t</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tee-supplicant.service&qu=
ot;<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
+SRCREV =3D &quot;be4fa2e36f717f03ca46e574aa66f697a897d090&quot;<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/OP-TEE/optee_client.git"=
 rel=3D"noreferrer" target=3D"_blank">github.com/OP-TEE/optee_client.git</a=
> \<br>
+=C2=A0 =C2=A0 file://tee-supplicant.service \<br>
+&quot;<br>
<br>
-SRCREV =3D &quot;bc0ec8ce1e4dc5ae23f4737ef659338b7cd408fe&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0SYSTEMD_SERVICE_${PN} =3D &quot;tee-supplicant.service&quot;<br>
<br>
@@ -25,7 +28,8 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so<br>
=C2=A0 =C2=A0 =C2=A0ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1<br>
<br>
-=C2=A0 =C2=A0 cp -a ${S}/out/export/usr/include ${D}/usr/<br>
+=C2=A0 =C2=A0 install -d ${D}${includedir}<br>
+=C2=A0 =C2=A0 install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${inc=
ludedir}<br>
<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e s:/etc:${sysconfdir}:g \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e s:/usr/bin:${bindir}:g \<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--00000000000067506c05a24be21e--
