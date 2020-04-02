Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.3024.1585821776530846988
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 03:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Qkm0urdW;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: peter.griffin@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id v16so2589072ljg.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Apr 2020 03:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+3m7zMwo4C0fwv56NEIkrmXPjq5F2GAaYFIX/p8C2r4=;
        b=Qkm0urdW2KfoaQBiGSvUe/o2GuKU14nTgSo0TJr+PIQwDcp3lZX2Wmu+skLo6mxXJ6
         D63x/faVAst7LHkPaP4/Hcn8I1/wECEpepccI+BBdPq8UruabdzttCYMCKT0ecuTmKgh
         uHT9vS4H9Tubzsa2baoUi1zVRwRcrV5kGGLMX+vhWmc7m0ROE8iXQO/FqPqMUq8TAVWN
         y/LGNjoysP8cAy3nvNMKf8aiQ0Z/7BOc1Z+IvvX6bc9hOQYy1vcuMykLpu77bV0leg9S
         s6Afg3L+3KeK4TszxCY+29NKOo0rZzvQ96QH/hMTrT5Cbc0FKD4n8myeNtOmgGMm7w3x
         Y9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+3m7zMwo4C0fwv56NEIkrmXPjq5F2GAaYFIX/p8C2r4=;
        b=P9HFVdFWZU87gcJIe4PtzzbQrCMIvEH8G1kceWaiurPx7lSGUvE5Ww5sfjuEi2cJMS
         bWS6ccTUcr4Sr1sVBaCE01Q8AN8Xo5ULk42+WAHuKul8R5JxkCWNlC9887xtVQpIAEqf
         jy7ub5BJbOhJsU7ipbBVUXNTwyJS6iu7z1pWEe5VXdYPIoaoh+ubQHb2stguhqTKKNhd
         j7FVJ+MVpDf8FCZ5ewU2TX3mD5kaRjUa05OG7WDI/uRKjokrM9nh5cFrsJK2TRHOnGz1
         usn3Dt5qU6tnkPn8SW132pN8Er34kzSdPILYHphtCj8WaYCeJgLpXjGiJVmm1790KODs
         0zAQ==
X-Gm-Message-State: AGi0PuacNiB4zmpc8T8hpkH30Yy/zRvctEMbXYe6jZt4i4LUJoGUrIeP
	1HLseqeKgxTBUOT8pzU8fmBlLFpl8I/BrsA9qjcdSo77Tfg=
X-Google-Smtp-Source: APiQypIUX9khJZVOjTmNtf1Ama6o9e0Ej8f+z4l8YWYT90Th0OH1WvGj4ZYN4uq4P+glRD8bQhQP+r0k7OxiuCmOzxU=
X-Received: by 2002:a2e:9815:: with SMTP id a21mr1545948ljj.180.1585821774489;
 Thu, 02 Apr 2020 03:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <1585782786-34477-1-git-send-email-denis@denix.org> <1585782786-34477-4-git-send-email-denis@denix.org>
In-Reply-To: <1585782786-34477-4-git-send-email-denis@denix.org>
From: "Peter Griffin" <peter.griffin@linaro.org>
Date: Thu, 2 Apr 2020 11:02:43 +0100
Message-ID: <CADrjBPpRZDG5EGXhxwXq+gjcxvO695McusjkiNDhhNJLaxXQVw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/5] optee-test: upgrade 3.7.0 -> 3.8.0, cleanup
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: multipart/alternative; boundary="0000000000008bbce105a24be741"

--0000000000008bbce105a24be741
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2020 at 00:13, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> * Drop previously backported patch for Python3 support
> * Add DESCRIPTION
> * Use common HOMEPAGE
> * Depend on PyCryptodomex instead of old PyCrypto
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>


Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

---
>  .../0001-use-python3-instead-of-python.patch       | 48
> ----------------------
>  meta-arm/recipes-security/optee/optee-test_git.bb  | 15 ++++---
>  2 files changed, 7 insertions(+), 56 deletions(-)
>  delete mode 100644
> meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
>
> diff --git
> a/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
> b/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
> deleted file mode 100644
> index 20f190a..0000000
> ---
> a/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 6271160639002a2580d80b75b5397a96d56329f2 Mon Sep 17 00:00:00 2001
> -From: Scott Branden <scott.branden@broadcom.com>
> -Date: Fri, 27 Dec 2019 12:54:28 -0800
> -Subject: [PATCH] use python3 instead of python
> -
> -use python3 instead of python as python2 is EOL January 2020.
> -
> -Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> -Reviewed-by: Jerome Forissier <jerome@forissier.org>
> -Tested-by: Jerome Forissier <jerome@forissier.org> (QEMU,
> CFG_GCM_NIST_VECTORS=y)
> -Upstream-Status: Backport from v3.8.0
> ----
> - scripts/file_to_c.py       | 4 ++--
> - scripts/rsp_to_gcm_test.py | 2 +-
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/scripts/file_to_c.py b/scripts/file_to_c.py
> -index ae16f52..b4ce2a2 100755
> ---- a/scripts/file_to_c.py
> -+++ b/scripts/file_to_c.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # SPDX-License-Identifier: BSD-2-Clause
> - #
> - # Copyright (c) 2018, Linaro Limited
> -@@ -29,7 +29,7 @@ def main():
> -
> -     f.write("const uint8_t " + args.name + "[] = {\n")
> -     i = 0
> --    for x in array.array("B", inf.read()):
> -+    for x in array.array("B", map(ord, (inf.read()))):
> -         f.write("0x" + '{0:02x}'.format(x) + ",")
> -         i = i + 1
> -         if i % 8 == 0:
> -diff --git a/scripts/rsp_to_gcm_test.py b/scripts/rsp_to_gcm_test.py
> -index 0543541..e4418be 100755
> ---- a/scripts/rsp_to_gcm_test.py
> -+++ b/scripts/rsp_to_gcm_test.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> -
> - modes = {'encrypt': 0, 'decrypt': 1}
> -
> ---
> -2.7.4
> -
> diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb
> b/meta-arm/recipes-security/optee/optee-test_git.bb
> index 3f431c3..752d75d 100644
> --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_git.bb
> @@ -1,21 +1,20 @@
>  SUMMARY = "OP-TEE sanity testsuite"
> -HOMEPAGE = "https://github.com/OP-TEE/optee_test"
> +DESCRIPTION = "Open Portable Trusted Execution Environment - Test suite"
> +HOMEPAGE = "https://www.op-tee.org/"
>
>  LICENSE = "BSD & GPLv2"
>  LIC_FILES_CHKSUM =
> "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
>
>  inherit python3native
>
> -DEPENDS = "optee-client optee-os python3-pycrypto-native"
> +DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
>
> -PV = "3.7.0+git${SRCPV}"
> +PV = "3.8.0+git${SRCPV}"
>
> -SRC_URI = "git://github.com/OP-TEE/optee_test.git \
> -          file://0001-use-python3-instead-of-python.patch \
> -          "
> -S = "${WORKDIR}/git"
> +SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
> +SRC_URI = "git://github.com/OP-TEE/optee_test.git"
>
> -SRCREV = "227d6f4c40eaa6f84fe049b9e48c7b27ad7fab08"
> +S = "${WORKDIR}/git"
>
>  OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
>  TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
> --
> 2.7.4
>
> 
>

--0000000000008bbce105a24be741
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 2 Apr 2020 at 00:13, Denys Dmytri=
yenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" tar=
get=3D"_blank">denys@ti.com</a>&gt;<br>
<br>
* Drop previously backported patch for Python3 support<br>
* Add DESCRIPTION<br>
* Use common HOMEPAGE<br>
* Depend on PyCryptodomex instead of old PyCrypto<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targe=
t=3D"_blank">denys@ti.com</a>&gt;</blockquote><div><br></div><div>Reviewed-=
by: Peter Griffin &lt;<a href=3D"mailto:peter.griffin@linaro.org">peter.gri=
ffin@linaro.org</a>&gt;</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
---<br>
=C2=A0.../0001-use-python3-instead-of-python.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 48 ----------------------<br>
=C2=A0meta-arm/recipes-security/optee/<a href=3D"http://optee-test_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">optee-test_git.bb</a>=C2=A0 | 15 ++++=
---<br>
=C2=A02 files changed, 7 insertions(+), 56 deletions(-)<br>
=C2=A0delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-u=
se-python3-instead-of-python.patch<br>
<br>
diff --git a/meta-arm/recipes-security/optee/optee-test/0001-use-python3-i=
nstead-of-python.patch b/meta-arm/recipes-security/optee/optee-test/0001-us=
e-python3-instead-of-python.patch<br>
deleted file mode 100644<br>
index 20f190a..0000000<br>
--- a/meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-=
of-python.patch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-From 6271160639002a2580d80b75b5397a96d56329f2 Mon Sep 17 00:00:00 2001<br=
>
-From: Scott Branden &lt;<a href=3D"mailto:scott.branden@broadcom.com" tar=
get=3D"_blank">scott.branden@broadcom.com</a>&gt;<br>
-Date: Fri, 27 Dec 2019 12:54:28 -0800<br>
-Subject: [PATCH] use python3 instead of python<br>
-<br>
-use python3 instead of python as python2 is EOL January 2020.<br>
-<br>
-Signed-off-by: Scott Branden &lt;<a href=3D"mailto:scott.branden@broadcom=
.com" target=3D"_blank">scott.branden@broadcom.com</a>&gt;<br>
-Reviewed-by: Jerome Forissier &lt;<a href=3D"mailto:jerome@forissier.org"=
 target=3D"_blank">jerome@forissier.org</a>&gt;<br>
-Tested-by: Jerome Forissier &lt;<a href=3D"mailto:jerome@forissier.org" t=
arget=3D"_blank">jerome@forissier.org</a>&gt; (QEMU, CFG_GCM_NIST_VECTORS=
=3Dy)<br>
-Upstream-Status: Backport from v3.8.0<br>
----<br>
- scripts/file_to_c.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
- scripts/rsp_to_gcm_test.py | 2 +-<br>
- 2 files changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/scripts/file_to_c.py b/scripts/file_to_c.py<br>
-index ae16f52..b4ce2a2 100755<br>
---- a/scripts/file_to_c.py<br>
-+++ b/scripts/file_to_c.py<br>
-@@ -1,4 +1,4 @@<br>
--#!/usr/bin/env python<br>
-+#!/usr/bin/env python3<br>
- # SPDX-License-Identifier: BSD-2-Clause<br>
- #<br>
- # Copyright (c) 2018, Linaro Limited<br>
-@@ -29,7 +29,7 @@ def main():<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0f.write(&quot;const uint8_t &quot; + <a href=3D"http:=
//args.name" rel=3D"noreferrer" target=3D"_blank">args.name</a> + &quot;[] =
=
=3D {\n&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0i =3D 0<br>
--=C2=A0 =C2=A0 for x in array.array(&quot;B&quot;, inf.read()):<br>
-+=C2=A0 =C2=A0 for x in array.array(&quot;B&quot;, map(ord, (inf.read()))=
):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot;0x&quot; + &#39;{0:02x}&#=
39;.format(x) + &quot;,&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D i + 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if i % 8 =3D=3D 0:<br>
-diff --git a/scripts/rsp_to_gcm_test.py b/scripts/rsp_to_gcm_test.py<br>
-index 0543541..e4418be 100755<br>
---- a/scripts/rsp_to_gcm_test.py<br>
-+++ b/scripts/rsp_to_gcm_test.py<br>
-@@ -1,4 +1,4 @@<br>
--#!/usr/bin/env python<br>
-+#!/usr/bin/env python3<br>
- <br>
- modes =3D {&#39;encrypt&#39;: 0, &#39;decrypt&#39;: 1}<br>
- <br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta-arm/recipes-security/optee/<a href=3D"http://optee-test_=
git.bb" rel=3D"noreferrer" target=3D"_blank">optee-test_git.bb</a> b/meta-a=
rm/recipes-security/optee/<a href=3D"http://optee-test_git.bb" rel=3D"noref=
errer" target=3D"_blank">optee-test_git.bb</a><br>
index 3f431c3..752d75d 100644<br>
--- a/meta-arm/recipes-security/optee/<a href=3D"http://optee-test_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">optee-test_git.bb</a><br>
+++ b/meta-arm/recipes-security/optee/<a href=3D"http://optee-test_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">optee-test_git.bb</a><br>
@@ -1,21 +1,20 @@<br>
=C2=A0SUMMARY =3D &quot;OP-TEE sanity testsuite&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/OP-TEE/optee_test" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/OP-TEE/optee_test</a>=
&quot;<br>
+DESCRIPTION =3D &quot;Open Portable Trusted Execution Environment - Test =
suite&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://www.op-tee.org/" rel=3D"noreferrer"=
 target=3D"_blank">https://www.op-tee.org/</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;BSD &amp; GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${S}/LICENSE.md;md5=3Ddaa2bcccc666=
345ab8940aab1315a4fa&quot;<br>
<br>
=C2=A0inherit python3native<br>
<br>
-DEPENDS =3D &quot;optee-client optee-os python3-pycrypto-native&quot;<br>
+DEPENDS =3D &quot;optee-client optee-os python3-pycryptodomex-native&quot=
;<br>
<br>
-PV =3D &quot;3.7.0+git${SRCPV}&quot;<br>
+PV =3D &quot;3.8.0+git${SRCPV}&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/OP-TEE/optee_test.gi=
t" rel=3D"noreferrer" target=3D"_blank">github.com/OP-TEE/optee_test.git</a=
> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-use-python3-instead-of-pyt=
hon.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
+SRCREV =3D &quot;30481e381cb4285706e7516853495a7699c93b2c&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/OP-TEE/optee_test.gi=
t" rel=3D"noreferrer" target=3D"_blank">github.com/OP-TEE/optee_test.git</a=
>&quot;<br>
<br>
-SRCREV =3D &quot;227d6f4c40eaa6f84fe049b9e48c7b27ad7fab08&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0OPTEE_CLIENT_EXPORT =3D &quot;${STAGING_DIR_HOST}${prefix}&quot;<br>
=C2=A0TEEC_EXPORT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;${STAGING_DIR=
_HOST}${prefix}&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--0000000000008bbce105a24be741--
