Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.6063.1589243842371280683
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 17:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O2wc0aen;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id v12so13172840wrp.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 17:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lXcyi/bdHEZn1lueyqTwh6b0GEaoEO1YRRtwOMgkVxU=;
        b=O2wc0aeni2QqCqaJaMi2749NVY7aa9A96cF3C+F0o99wqmGDqngY0FcG84miLm1o5s
         iua1HTlFg9/GJhthMjfUIIkagH6TrGmZ0S4jtJAFi+pSeMFm9aOHL2n9fPOMFcCGGf0+
         DroCKU3nr7+WdNS5GeypqBsBT+YvzU7jzvtChHYSVqA2BMUX/z37F441twdcnxnhpunb
         OE7bvBpL27zikDNGfahuWcn9Tl4NnS9HBsNCw5ZWqzq5yuJuH0cs3vwQQrSsdSWwesA3
         L1Xnq1IK0A7D2vAEIHYTUlvmz6V/EbccjsdlbfGxHvHZKRsERUu4DARx38b/BetqGnVb
         9++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lXcyi/bdHEZn1lueyqTwh6b0GEaoEO1YRRtwOMgkVxU=;
        b=aKqvVNDZjF4m5pqSDlSqwzZzSAJp+DWOVBswe0cnxJUR6cxhTD2XieRCvBhs9sJpOa
         56yMVcVepHzCT+mj/GdxvnPhaSqSAur0+9RFln+477FfK7mErhny7JYxTEvB7oRisOFA
         pfx9C8amFg9ETYaayStyfageR5wrKrWD8OGzSTbtlQgDrk5DDgdL5fKEkbBHLFW/XFZ9
         TaTGs4vSq+D6MfzbrH0LmukMwp/oq+YS5niXUaFYBTg1O+g+O0pCCrZnoCzEhhTQeAJd
         cHOrxAarhshCPfNx5D1pSgEdCjiuGF2zCLHOJa1BFGUhRbN4l7bwIAGTSlFm52qhVyp9
         HKiQ==
X-Gm-Message-State: AGi0PubCpoOoUGSXbU8o/s1IqvEfCMr2GgIWbk4rYBDnU16CcPPcl8X6
	6r3ZSlCQn3MgYCIfK2hXzLrAgfViStTahiLSYG4=
X-Google-Smtp-Source: APiQypKZ/sLOZMAhMIuRWTljDB7yD5sYZ0FwxidNOLaGoxBtageDtfTO/NCPrMCm2B9aVhpNhsIa7fEA7Uqb9MPgtig=
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr22135130wro.361.1589243840763;
 Mon, 11 May 2020 17:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200512002050.11739-1-jon.mason@arm.com>
In-Reply-To: <20200512002050.11739-1-jon.mason@arm.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Mon, 11 May 2020 19:37:10 -0500
Message-ID: <CAJdd5GZ73V_zdUmkoPW=R8j6tFcXN9XgMfPt4L3tGXcB8RjkyQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] Add recipes for TF-A versions 2.2 and 2.3
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Content-Type: multipart/alternative; boundary="00000000000097196605a568aa6d"

--00000000000097196605a568aa6d
Content-Type: text/plain; charset="UTF-8"

On Mon, May 11, 2020, 7:21 PM Jon Mason <jon.mason@arm.com> wrote:

> Add basic recipes for TF-A versions 2.2 and 2.3.  Also, rearrange fields
> in the various TF-A recipes to make them uniform and move the
> do_compile_prepend to the inc file.
>
> Change-Id: I85e4ac7bdc44ed85449e40fd2c94d73bf3e7d9e8
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm-bsp/conf/machine/juno.conf           |  1 +
>  .../trusted-firmware-a/trusted-firmware-a.inc | 13 ++++++-
>  .../trusted-firmware-a_2.1.bb                 | 20 ++--------
>  .../trusted-firmware-a_2.2.bb                 | 38 +++++++++++++++++++
>  .../trusted-firmware-a_2.3.bb                 | 38 +++++++++++++++++++
>  .../trusted-firmware-a_git.bb                 | 29 ++++++--------
>  6 files changed, 103 insertions(+), 36 deletions(-)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.2.bb
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.3.bb
>
> diff --git a/meta-arm-bsp/conf/machine/juno.conf
> b/meta-arm-bsp/conf/machine/juno.conf
> index 878b6b1..898a863 100644
> --- a/meta-arm-bsp/conf/machine/juno.conf
> +++ b/meta-arm-bsp/conf/machine/juno.conf
> @@ -20,6 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
>  PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.1%"
>
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot
> firmware-image-juno"
>
> diff --git
> a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 93ca199..50a97a7 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -81,8 +81,19 @@ DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1',
> 'u-boot', '', d)}"
>  do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1',
> 'u-boot:do_deploy', '', d)}"
>  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', '
> BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
>
> -
> +# The following hack is needed to fit properly in yocto build environment
> +# TFA is forcing the host compiler and its flags in the Makefile using :=
> +# assignment for GCC and CFLAGS.
> +# To properly use the native toolchain of yocto and the right libraries
> we need
> +# to pass the proper flags to gcc. This is achieved here by creating a gcc
> +# script to force passing to gcc the right CFLAGS and LDFLAGS
>  do_compile() {
> +    # Create an host gcc build parser to ensure the proper include path
> is used
> +    mkdir -p bin
> +    echo "#!/usr/bin/env bash" > bin/gcc
> +    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >>
> bin/gcc
> +    chmod a+x bin/gcc
> +    export PATH="$PWD/bin:$PATH"
>

I didn't include this in my version because I couldn't figure out why it
was necessary. Can it be removed?

     oe_runmake ${TFA_BUILD_TARGET}
>  }
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.1.bb
> index e8933fb..4d41202 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
> @@ -1,6 +1,9 @@
>  #
>  # Trusted firmware-A 2.1
>  #
> +
> +require trusted-firmware-a.inc
> +
>  SRC_URI = "git://
> git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa
> "
>
>  # Use TF-A for version
> @@ -33,20 +36,3 @@ LIC_FILES_CHKSUM_MBEDTLS += " \
>
>  SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
>  SRC_URI[mbedtls.sha256sum] =
> "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
> -
> -require trusted-firmware-a.inc
> -
> -# The following hack is needed to fit properly in yocto build environment
> -# TFA is forcing the host compiler and its flags in the Makefile using :=
> -# assignment for GCC and CFLAGS.
> -# To properly use the native toolchain of yocto and the right libraries
> we need
> -# to pass the proper flags to gcc. This is achieved here by creating a gcc
> -# script to force passing to gcc the right CFLAGS and LDFLAGS
> -do_compile_prepend() {
> -    #Create an host gcc build parser to ensure the proper include path is
> used
> -    mkdir -p bin
> -    echo "#!/usr/bin/env bash" > bin/gcc
> -    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >>
> bin/gcc
> -    chmod a+x bin/gcc
> -    export PATH="$PWD/bin:$PATH"
> -}
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.2.bb
> new file mode 100644
> index 0000000..4d5316e
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
> @@ -0,0 +1,38 @@
> +#
> +# Trusted firmware-A 2.2
> +#
> +
> +require trusted-firmware-a.inc
> +
> +SRC_URI = "git://
> git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa
> "
> +
> +# Use TF-A for version
> +SRCREV_FORMAT = "tfa"
> +
> +# TF-A v2.2
> +SRCREV_tfa = "7192b956bde11652a835eee0724dca0e403fee90"
> +
> +S = "${WORKDIR}/git"
> +
> +LIC_FILES_CHKSUM =
> "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +
> +SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
> +SRC_URI[tfa.sha256sum] =
> "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
> +
> +#
> +# mbed TLS source
> +# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> +#
> +
> +SRC_URI_MBEDTLS = "git://
> github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls
> "
> +
> +# mbed TLS v2.16.2
> +SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
> +
> +LIC_FILES_CHKSUM_MBEDTLS += " \
> +    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
> +    "
> +
> +SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
> +SRC_URI[mbedtls.sha256sum] =
> "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_2.3.bb
> new file mode 100644
> index 0000000..bfda87b
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> @@ -0,0 +1,38 @@
> +#
> +# Trusted firmware-A 2.3
> +#
> +
> +require trusted-firmware-a.inc
> +
> +SRC_URI = "git://
> git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa
> "
> +
> +# Use TF-A for version
> +SRCREV_FORMAT = "tfa"
> +
> +# TF-A v2.3
> +SRCREV_tfa = "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
> +
> +S = "${WORKDIR}/git"
> +
> +LIC_FILES_CHKSUM =
> "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +
> +SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
> +SRC_URI[tfa.sha256sum] =
> "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
> +
> +#
> +# mbed TLS source
> +# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> +#
> +
> +SRC_URI_MBEDTLS = "git://
> github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls
> "
> +
> +# mbed TLS v2.18.1
> +SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
> +
> +LIC_FILES_CHKSUM_MBEDTLS += " \
> +    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
> +    "
> +
> +SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
> +SRC_URI[mbedtls.sha256sum] =
> "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_git.bb b/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_git.bb
> index 4bf3ae5..c443ecd 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
> @@ -9,30 +9,23 @@ DEFAULT_PREFERENCE = "-1"
>  require trusted-firmware-a.inc
>
>  SRC_URI = "git://
> git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa
> "
> +
> +# Use TF-A for version
>  SRCREV_FORMAT = "tfa"
> -LIC_FILES_CHKSUM ?=
> "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
>
> +S = "${WORKDIR}/git"
> +
> +LIC_FILES_CHKSUM =
> "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +
> +#
>  # mbed TLS source
>  # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> +#
> +
>  SRC_URI_MBEDTLS = "git://
> github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls
> "
> -LIC_FILES_CHKSUM_MBEDTLS ?= " \
> +
> +LIC_FILES_CHKSUM_MBEDTLS += " \
>      file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>      file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
>      "
>
> -S = "${WORKDIR}/git"
> -
> -# The following hack is needed to fit properly in yocto build environment
> -# TFA is forcing the host compiler and its flags in the Makefile using :=
> -# assignment for GCC and CFLAGS.
> -# To properly use the native toolchain of yocto and the right libraries
> we need
> -# to pass the proper flags to gcc. This is achieved here by creating a gcc
> -# script to force passing to gcc the right CFLAGS and LDFLAGS
> -do_compile_prepend() {
> -    # Create an host gcc build parser to ensure the proper include path
> is used
> -    mkdir -p bin
> -    echo "#!/usr/bin/env bash" > bin/gcc
> -    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >>
> bin/gcc
> -    chmod a+x bin/gcc
> -    export PATH="$PWD/bin:$PATH"
> -}
> --
> 2.17.1
>
> 
>

--00000000000097196605a568aa6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, May 11, 2020, 7:21 PM Jon Mason &lt;<a href=3D=
"mailto:jon.mason@arm.com">jon.mason@arm.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Add basic recipes for TF-A versions 2.2 and 2.3.=
=C2=A0 Also, rearrange fields<br>
in the various TF-A recipes to make them uniform and move the<br>
do_compile_prepend to the inc file.<br>
<br>
Change-Id: I85e4ac7bdc44ed85449e40fd2c94d73bf3e7d9e8<br>
Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com" target=
=3D"_blank" rel=3D"noreferrer">jon.mason@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-arm-bsp/conf/machine/juno.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0.../trusted-firmware-a/trusted-firmware-a.inc | 13 ++++++-<br>
=C2=A0.../<a href=3D"http://trusted-firmware-a_2.1.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">trusted-firmware-a_2.1.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++--------<br>
=C2=A0.../<a href=3D"http://trusted-firmware-a_2.2.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">trusted-firmware-a_2.2.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 +++++++++++++++++++<br>
=C2=A0.../<a href=3D"http://trusted-firmware-a_2.3.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">trusted-firmware-a_2.3.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 +++++++++++++++++++<br>
=C2=A0.../<a href=3D"http://trusted-firmware-a_git.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">trusted-firmware-a_git.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++++--------<br>
=C2=A06 files changed, 103 insertions(+), 36 deletions(-)<br>
=C2=A0create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/<a href=
=3D"http://trusted-firmware-a_2.2.bb" rel=3D"noreferrer noreferrer" target=
=
=3D"_blank">trusted-firmware-a_2.2.bb</a><br>
=C2=A0create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/<a href=
=3D"http://trusted-firmware-a_2.3.bb" rel=3D"noreferrer noreferrer" target=
=
=3D"_blank">trusted-firmware-a_2.3.bb</a><br>
<br>
diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machi=
ne/juno.conf<br>
index 878b6b1..898a863 100644<br>
--- a/meta-arm-bsp/conf/machine/juno.conf<br>
+++ b/meta-arm-bsp/conf/machine/juno.conf<br>
@@ -20,6 +20,7 @@ SERIAL_CONSOLES =3D &quot;115200;ttyAMA0&quot;<br>
=C2=A0# Use kernel provided by linaro (Contains support for SCMi or HDMI)<=
br>
=C2=A0PREFERRED_PROVIDER_virtual/kernel ?=3D &quot;linux-linaro-arm&quot;<=
br>
=C2=A0PREFERRED_VERSION_linux-linaro-arm ?=3D &quot;4.19%&quot;<br>
+PREFERRED_VERSION_trusted-firmware-a ?=3D &quot;2.1%&quot;<br>
<br>
=C2=A0EXTRA_IMAGEDEPENDS +=3D &quot;virtual/trusted-firmware-a u-boot firm=
ware-image-juno&quot;<br>
<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.in=
c b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
index 93ca199..50a97a7 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
@@ -81,8 +81,19 @@ DEPENDS +=3D &quot; ${@bb.utils.contains(&#39;TFA_UBOOT=
&#39;, &#39;1&#39;, &#39;u-boot&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0do_compile[depends] +=3D &quot; ${@bb.utils.contains(&#39;TFA_UBOOT&=
#39;, &#39;1&#39;, &#39;u-boot:do_deploy&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;${@bb.utils.contains(&#39;TFA_UBOOT&#39;, &#=
39;1&#39;, &#39; BL33=3D${DEPLOY_DIR_IMAGE}/u-boot.bin&#39;, &#39;&#39;,d)}=
&quot;<br>
<br>
-<br>
+# The following hack is needed to fit properly in yocto build environment=
<br>
+# TFA is forcing the host compiler and its flags in the Makefile using :=
=3D<br>
+# assignment for GCC and CFLAGS.<br>
+# To properly use the native toolchain of yocto and the right libraries w=
e need<br>
+# to pass the proper flags to gcc. This is achieved here by creating a gc=
c<br>
+# script to force passing to gcc the right CFLAGS and LDFLAGS<br>
=C2=A0do_compile() {<br>
+=C2=A0 =C2=A0 # Create an host gcc build parser to ensure the proper incl=
ude path is used<br>
+=C2=A0 =C2=A0 mkdir -p bin<br>
+=C2=A0 =C2=A0 echo &quot;#!/usr/bin/env bash&quot; &gt; bin/gcc<br>
+=C2=A0 =C2=A0 echo &quot;$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDF=
LAGS} \$@&quot; &gt;&gt; bin/gcc<br>
+=C2=A0 =C2=A0 chmod a+x bin/gcc<br>
+=C2=A0 =C2=A0 export PATH=3D&quot;$PWD/bin:$PATH&quot;<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I didn&#39;t includ=
e this in my version because I couldn&#39;t figure out why it was necessary=
. Can it be removed?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0oe_runmake ${TFA_BUILD_TARGET}<br>
=C2=A0}<br>
<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tru=
sted-firmware-a_2.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tru=
sted-firmware-a_2.1.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-a/<a hre=
f=3D"http://trusted-firmware-a_2.1.bb" rel=3D"noreferrer noreferrer" target=
=
=3D"_blank">trusted-firmware-a_2.1.bb</a><br>
index e8933fb..4d41202 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fi=
rmware-a_2.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">trusted-fi=
rmware-a_2.1.bb</a><br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fi=
rmware-a_2.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">trusted-fi=
rmware-a_2.1.bb</a><br>
@@ -1,6 +1,9 @@<br>
=C2=A0#<br>
=C2=A0# Trusted firmware-A 2.1<br>
=C2=A0#<br>
+<br>
+require trusted-firmware-a.inc<br>
+<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.trustedfirmware.org/TF=
-A/trusted-firmware-a.git;protocol=3Dhttps;name=3Dtfa" rel=3D"noreferrer no=
referrer" target=3D"_blank">git.trustedfirmware.org/TF-A/trusted-firmware-a=
.git;protocol=3Dhttps;name=3Dtfa</a>&quot;<br>
<br>
=C2=A0# Use TF-A for version<br>
@@ -33,20 +36,3 @@ LIC_FILES_CHKSUM_MBEDTLS +=3D &quot; \<br>
<br>
=C2=A0SRC_URI[mbedtls.md5sum] =3D &quot;37cdec398ae9ebdd4640df74af893c95&q=
uot;<br>
=C2=A0SRC_URI[mbedtls.sha256sum] =3D &quot;a6834fcd7b7e64b83dfaaa6ee695198=
cb5019a929b2806cb0162e049f98206a4&quot;<br>
-<br>
-require trusted-firmware-a.inc<br>
-<br>
-# The following hack is needed to fit properly in yocto build environment=
<br>
-# TFA is forcing the host compiler and its flags in the Makefile using :=
=3D<br>
-# assignment for GCC and CFLAGS.<br>
-# To properly use the native toolchain of yocto and the right libraries w=
e need<br>
-# to pass the proper flags to gcc. This is achieved here by creating a gc=
c<br>
-# script to force passing to gcc the right CFLAGS and LDFLAGS<br>
-do_compile_prepend() {<br>
-=C2=A0 =C2=A0 #Create an host gcc build parser to ensure the proper inclu=
de path is used<br>
-=C2=A0 =C2=A0 mkdir -p bin<br>
-=C2=A0 =C2=A0 echo &quot;#!/usr/bin/env bash&quot; &gt; bin/gcc<br>
-=C2=A0 =C2=A0 echo &quot;$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDF=
LAGS} \$@&quot; &gt;&gt; bin/gcc<br>
-=C2=A0 =C2=A0 chmod a+x bin/gcc<br>
-=C2=A0 =C2=A0 export PATH=3D&quot;$PWD/bin:$PATH&quot;<br>
-}<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tru=
sted-firmware-a_2.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tru=
sted-firmware-a_2.2.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-a/<a hre=
f=3D"http://trusted-firmware-a_2.2.bb" rel=3D"noreferrer noreferrer" target=
=
=3D"_blank">trusted-firmware-a_2.2.bb</a><br>
new file mode 100644<br>
index 0000000..4d5316e<br>
--- /dev/null<br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fi=
rmware-a_2.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">trusted-fi=
rmware-a_2.2.bb</a><br>
@@ -0,0 +1,38 @@<br>
+#<br>
+# Trusted firmware-A 2.2<br>
+#<br>
+<br>
+require trusted-firmware-a.inc<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.trustedfirmware.org/TF-A/tr=
usted-firmware-a.git;protocol=3Dhttps;name=3Dtfa" rel=3D"noreferrer norefer=
rer" target=3D"_blank">git.trustedfirmware.org/TF-A/trusted-firmware-a.git;=
protocol=3Dhttps;name=3Dtfa</a>&quot;<br>
+<br>
+# Use TF-A for version<br>
+SRCREV_FORMAT =3D &quot;tfa&quot;<br>
+<br>
+# TF-A v2.2<br>
+SRCREV_tfa =3D &quot;7192b956bde11652a835eee0724dca0e403fee90&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://docs/license.rst;md5=3D189505435dbcdcc8=
caa63c46fe93fa89&quot;<br>
+<br>
+SRC_URI[tfa.md5sum] =3D &quot;75c8f4958fb493d9bd7a8e5a9636ec18&quot;<br>
+SRC_URI[tfa.sha256sum] =3D &quot;7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657=
c9301686e7d8824ef575d059&quot;<br>
+<br>
+#<br>
+# mbed TLS source<br>
+# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1<br>
+#<br>
+<br>
+SRC_URI_MBEDTLS =3D &quot;git://<a href=3D"http://github.com/ARMmbed/mbed=
tls.git;name=3Dmbedtls;protocol=3Dhttps;destsuffix=3Dgit/mbedtls" rel=3D"no=
referrer noreferrer" target=3D"_blank">github.com/ARMmbed/mbedtls.git;name=
=3Dmbedtls;protocol=3Dhttps;destsuffix=3Dgit/mbedtls</a>&quot;<br>
+<br>
+# mbed TLS v2.16.2<br>
+SRCREV_mbedtls =3D &quot;d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb&quot;<b=
r>
+<br>
+LIC_FILES_CHKSUM_MBEDTLS +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854d=
dc3c6bd57 \<br>
+=C2=A0 =C2=A0 file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db90816=
7a \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+SRC_URI[mbedtls.md5sum] =3D &quot;37cdec398ae9ebdd4640df74af893c95&quot;<=
br>
+SRC_URI[mbedtls.sha256sum] =3D &quot;a6834fcd7b7e64b83dfaaa6ee695198cb501=
9a929b2806cb0162e049f98206a4&quot;<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tru=
sted-firmware-a_2.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tru=
sted-firmware-a_2.3.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-a/<a hre=
f=3D"http://trusted-firmware-a_2.3.bb" rel=3D"noreferrer noreferrer" target=
=
=3D"_blank">trusted-firmware-a_2.3.bb</a><br>
new file mode 100644<br>
index 0000000..bfda87b<br>
--- /dev/null<br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fi=
rmware-a_2.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">trusted-fi=
rmware-a_2.3.bb</a><br>
@@ -0,0 +1,38 @@<br>
+#<br>
+# Trusted firmware-A 2.3<br>
+#<br>
+<br>
+require trusted-firmware-a.inc<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.trustedfirmware.org/TF-A/tr=
usted-firmware-a.git;protocol=3Dhttps;name=3Dtfa" rel=3D"noreferrer norefer=
rer" target=3D"_blank">git.trustedfirmware.org/TF-A/trusted-firmware-a.git;=
protocol=3Dhttps;name=3Dtfa</a>&quot;<br>
+<br>
+# Use TF-A for version<br>
+SRCREV_FORMAT =3D &quot;tfa&quot;<br>
+<br>
+# TF-A v2.3<br>
+SRCREV_tfa =3D &quot;ecd27ad85f1eba29f6bf92c39dc002c85b07dad5&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://docs/license.rst;md5=3D189505435dbcdcc8=
caa63c46fe93fa89&quot;<br>
+<br>
+SRC_URI[tfa.md5sum] =3D &quot;75c8f4958fb493d9bd7a8e5a9636ec18&quot;<br>
+SRC_URI[tfa.sha256sum] =3D &quot;7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657=
c9301686e7d8824ef575d059&quot;<br>
+<br>
+#<br>
+# mbed TLS source<br>
+# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1<br>
+#<br>
+<br>
+SRC_URI_MBEDTLS =3D &quot;git://<a href=3D"http://github.com/ARMmbed/mbed=
tls.git;name=3Dmbedtls;protocol=3Dhttps;destsuffix=3Dgit/mbedtls" rel=3D"no=
referrer noreferrer" target=3D"_blank">github.com/ARMmbed/mbedtls.git;name=
=3Dmbedtls;protocol=3Dhttps;destsuffix=3Dgit/mbedtls</a>&quot;<br>
+<br>
+# mbed TLS v2.18.1<br>
+SRCREV_mbedtls =3D &quot;ca933c7e0c9e84738b168b6b0feb89af4183a60a&quot;<b=
r>
+<br>
+LIC_FILES_CHKSUM_MBEDTLS +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854d=
dc3c6bd57 \<br>
+=C2=A0 =C2=A0 file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db90816=
7a \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+SRC_URI[mbedtls.md5sum] =3D &quot;37cdec398ae9ebdd4640df74af893c95&quot;<=
br>
+SRC_URI[mbedtls.sha256sum] =3D &quot;a6834fcd7b7e64b83dfaaa6ee695198cb501=
9a929b2806cb0162e049f98206a4&quot;<br>
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://tru=
sted-firmware-a_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tru=
sted-firmware-a_git.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-a/<a hre=
f=3D"http://trusted-firmware-a_git.bb" rel=3D"noreferrer noreferrer" target=
=
=3D"_blank">trusted-firmware-a_git.bb</a><br>
index 4bf3ae5..c443ecd 100644<br>
--- a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fi=
rmware-a_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">trusted-fi=
rmware-a_git.bb</a><br>
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trusted-fi=
rmware-a_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">trusted-fi=
rmware-a_git.bb</a><br>
@@ -9,30 +9,23 @@ DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
=C2=A0require trusted-firmware-a.inc<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.trustedfirmware.org/TF=
-A/trusted-firmware-a.git;protocol=3Dhttps;name=3Dtfa" rel=3D"noreferrer no=
referrer" target=3D"_blank">git.trustedfirmware.org/TF-A/trusted-firmware-a=
.git;protocol=3Dhttps;name=3Dtfa</a>&quot;<br>
+<br>
+# Use TF-A for version<br>
=C2=A0SRCREV_FORMAT =3D &quot;tfa&quot;<br>
-LIC_FILES_CHKSUM ?=3D &quot;file://docs/license.rst;md5=3D189505435dbcdcc=
8caa63c46fe93fa89&quot;<br>
<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://docs/license.rst;md5=3D189505435dbcdcc8=
caa63c46fe93fa89&quot;<br>
+<br>
+#<br>
=C2=A0# mbed TLS source<br>
=C2=A0# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to =
1<br>
+#<br>
+<br>
=C2=A0SRC_URI_MBEDTLS =3D &quot;git://<a href=3D"http://github.com/ARMmbed=
/mbedtls.git;name=3Dmbedtls;protocol=3Dhttps;destsuffix=3Dgit/mbedtls" rel=
=3D"noreferrer noreferrer" target=3D"_blank">github.com/ARMmbed/mbedtls.gi=
t;name=3Dmbedtls;protocol=3Dhttps;destsuffix=3Dgit/mbedtls</a>&quot;<br>
-LIC_FILES_CHKSUM_MBEDTLS ?=3D &quot; \<br>
+<br>
+LIC_FILES_CHKSUM_MBEDTLS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655f=
c854ddc3c6bd57 \<br>
=C2=A0 =C2=A0 =C2=A0file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db=
908167a \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-# The following hack is needed to fit properly in yocto build environment=
<br>
-# TFA is forcing the host compiler and its flags in the Makefile using :=
=3D<br>
-# assignment for GCC and CFLAGS.<br>
-# To properly use the native toolchain of yocto and the right libraries w=
e need<br>
-# to pass the proper flags to gcc. This is achieved here by creating a gc=
c<br>
-# script to force passing to gcc the right CFLAGS and LDFLAGS<br>
-do_compile_prepend() {<br>
-=C2=A0 =C2=A0 # Create an host gcc build parser to ensure the proper incl=
ude path is used<br>
-=C2=A0 =C2=A0 mkdir -p bin<br>
-=C2=A0 =C2=A0 echo &quot;#!/usr/bin/env bash&quot; &gt; bin/gcc<br>
-=C2=A0 =C2=A0 echo &quot;$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDF=
LAGS} \$@&quot; &gt;&gt; bin/gcc<br>
-=C2=A0 =C2=A0 chmod a+x bin/gcc<br>
-=C2=A0 =C2=A0 export PATH=3D&quot;$PWD/bin:$PATH&quot;<br>
-}<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000097196605a568aa6d--
