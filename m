Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FB4C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 19:20:51 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.14507.1647976849320356645
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 12:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=sw/NXb/g;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id a11so11372869qtb.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 12:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AK+/i95Sh2l083KWuZN2qZy1zUfeJsGD4sDh/iRRinE=;
        b=sw/NXb/gRazt5XLrges2lq9NGenE98bCNC5ui7XgJXioUSlbn+t4rAyZX0v1hIDZl0
         z7Ct5Lh9/UQX79BigunKfZxhGDN/2NFvQ6rmd8R/DO2cb9VqndpazLEeWBgc5A6MLLfp
         AuvfdUh0tWec0UsLCISpSP7o/rUL911K4T+q2ih2/nF6x/fRq3JjUSzj5RPIm9v2EuP6
         RZxXniGvl4TWHIWYgnUKgy64zaTJk0XvsUp7DZ3bUFMaI686KNdEAVYIwNRTKId0OqNg
         ohzpy+vLporjroE5VSuut5G9Q0f6tq6pt1PGBlonk33MMsGzpTKklbgVRTNp6Wm+iRVl
         CW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AK+/i95Sh2l083KWuZN2qZy1zUfeJsGD4sDh/iRRinE=;
        b=4gfIqVuuimfeIFgiYGesQpL/WXYAFSKJPwFbfBEQpfNMr67TVnOZf+s5XIhtSuRJ7K
         Nj+/MSoabZj53wZP5VqlSuVOJHeokJhm8JJV8L/+XtW2+Chdn92eze67657TVHpoO5iq
         Lbx7eV9LVjwIMHBksZ8HBnIP5QiGeaTTWevWWXGxk2FHGYzi5tQRs7u7Khr4QRh1hhL+
         tbn53dmFIEs49Wg9TxbICRmS+ssu9yZA4VbVSOz17W0HxR34z212iwbsIz4T1O3v1LAo
         m5jflOGAtujd1gZ2lDRzyZgKkm7Z2RF85qlNi0V+bqjSP2vg8lSvTOFkLasWOql1MAJ7
         Hz6A==
X-Gm-Message-State: AOAM533eolgCL3x5OlijcuooKu6XLPvszjMNLhJL6iMThM5x8TY1hOnq
	mlT+m9bE7H3saSh9RcUG5q+dJiRRF8I1OKORs7QC3A==
X-Google-Smtp-Source: 
 ABdhPJxTA7FshZWfdvNJrUte9vNj8xw+2L4t2d9N0LxvyYehHTC5zwuJfNbKaB0EQV6998EnoamR7UhUO936bNmYML8=
X-Received: by 2002:ac8:5984:0:b0:2e1:e812:f42 with SMTP id
 e4-20020ac85984000000b002e1e8120f42mr21054444qte.609.1647976848319; Tue, 22
 Mar 2022 12:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220322134327.4090222-1-jon.mason@arm.com>
 <20220322173040.GJ23554@denix.org>
In-Reply-To: <20220322173040.GJ23554@denix.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 22 Mar 2022 15:20:37 -0400
Message-ID: 
 <CAPoiz9y0MxwurDc0_mHV5_J6knjUW0AAsuyztggvuj_nFsY5cg@mail.gmail.com>
Subject: Re: [meta-arm] [RFC] arm-toolchain: upgrade toolchains to
 11.2-2002.02
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Sumit Garg <sumit.garg@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Mar 2022 19:20:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3195

After a minor change and using -M25%





diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index 838342a1c572..394ce4131b9f 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u

 HOST_ARCH=$(uname -m)
-VER="10.3-2021.07"
+VER="11.2-2022.02"

 DOWNLOAD_DIR=$1
 TOOLCHAIN_DIR=$2
@@ -15,18 +15,21 @@ if [ $HOST_ARCH = "aarch64" ]; then
        #AArch64 Linux hosted cross compilers

        #AArch32 target with hard float (arm-none-linux-gnueabihf)
-       wget -P $DOWNLOAD_DIR -nc
https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+       wget -P $DOWNLOAD_DIR -nc
https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+
+       #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
+       wget -P $DOWNLOAD_DIR -nc
https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
 elif [ $HOST_ARCH = "x86_64" ]; then
        #x86_64 Linux hosted cross compilers

        #AArch32 target with hard float (arm-linux-none-gnueabihf)
-       wget -P $DOWNLOAD_DIR -nc
https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
+       wget -P $DOWNLOAD_DIR -nc
https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz

        #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
-       wget -P $DOWNLOAD_DIR -nc
https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
+       wget -P $DOWNLOAD_DIR -nc
https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz

        #AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
-       wget -P $DOWNLOAD_DIR -nc
https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
+       wget -P $DOWNLOAD_DIR -nc
https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
 else
        echo "ERROR - Unknown build arch of $HOST_ARCH"
        exit 1
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
similarity index 61%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
index 02b5b43bdd7e..a9e6b581a50e 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
@@ -9,16 +9,16 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"

 LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
-LIC_FILES_CHKSUM:aarch64 =
"file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"
-LIC_FILES_CHKSUM:x86-64 =
"file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
+LIC_FILES_CHKSUM:aarch64 =
"file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
+LIC_FILES_CHKSUM:x86-64 =
"file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"

-PROVIDES = "virtual/aarch64-none-elf-gcc"
+PROVIDES = "virtual/${BINNAME}-gcc"

-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
-SRC_URI[gnu-a-aarch64.sha256sum] =
"768a5db41d93f48838f1c4bfeae26930df2320c09f0dfa798321082fb937955f"
-SRC_URI[gnu-a-x86_64.sha256sum] =
"6f74b1ee370caeb716688d2e467e5b44727fdc0ed56023fe5c72c0620019ecef"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
+SRC_URI[gnu-a-aarch64.sha256sum] =
"3b15725545a0211a17b63e72d4f10241f7ffbe7ce94cb9612590ceacde16992c"
+SRC_URI[gnu-a-x86_64.sha256sum] =
"b0a015a9e8cbb44ed2fe5ad755a7a7ae254d54f93df3bf47378485b0ba8b828b"

 S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"

-UPSTREAM_CHECK_URI =
"https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
+UPSTREAM_CHECK_URI =
"https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
 UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
similarity index 35%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
index ad7e81617d74..930bb5261be8 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
@@ -8,13 +8,17 @@ COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
 SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"

-LIC_FILES_CHKSUM =
"file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
+LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
+LIC_FILES_CHKSUM:aarch64 =
"file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
+LIC_FILES_CHKSUM:x86-64 =
"file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"

-PROVIDES = "virtual/arm-none-eabi-gcc"
+PROVIDES = "virtual/${BINNAME}-gcc"

-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
-SRC_URI[gnu-rm-aarch64.sha256sum] =
"f605b5f23ca898e9b8b665be208510a54a6e9fdd0fa5bfc9592002f6e7431208"
-SRC_URI[gnu-rm-x86_64.sha256sum] =
"97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-rm-${HOST_ARCH}"
+SRC_URI[gnu-rm-aarch64.sha256sum] =
"dd861d188f4061a7ef3857c948376f84ef1dfb88a32aded7c336ed7e47e60970"
+SRC_URI[gnu-rm-x86_64.sha256sum] =
"8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326"

-UPSTREAM_CHECK_URI =
"https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
-UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
+S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
+
+UPSTREAM_CHECK_URI =
"https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
+UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"













On Tue, Mar 22, 2022 at 1:30 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Mar 22, 2022 at 09:43:27AM -0400, Jon Mason wrote:
> > There is a new and unified version of the toolchains (no longer the RM
> > and A toolchain split).  Update the paths and SHAs to reflect the new
> > location.
> >
> > NOTE: with this change, the binary toolchains do not appear to work
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  ci/get-binary-toolchains                      | 13 ++++++----
> >  ...b => gcc-aarch64-none-elf_11.2-2022.02.bb} | 14 +++++------
> >  .../gcc-arm-none-eabi_10.3-2021.10.bb         | 20 ----------------
> >  .../gcc-arm-none-eabi_11.2-2022.02.bb         | 24 +++++++++++++++++++
> >  4 files changed, 39 insertions(+), 32 deletions(-)
> >  rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-aarch64-none-elf_10.3-2021.07.bb => gcc-aarch64-none-elf_11.2-2022.02.bb} (61%)
> >  delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
>
> Any chance to lower the similarity threshold to make it a diff for review,
> instead of remove/add?
>
>
> > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > index 838342a1c572..394ce4131b9f 100755
> > --- a/ci/get-binary-toolchains
> > +++ b/ci/get-binary-toolchains
> > @@ -2,7 +2,7 @@
> >  set -u
> >
> >  HOST_ARCH=$(uname -m)
> > -VER="10.3-2021.07"
> > +VER="11.2-2022.02"
> >
> >  DOWNLOAD_DIR=$1
> >  TOOLCHAIN_DIR=$2
> > @@ -15,18 +15,21 @@ if [ $HOST_ARCH = "aarch64" ]; then
> >       #AArch64 Linux hosted cross compilers
> >
> >       #AArch32 target with hard float (arm-none-linux-gnueabihf)
> > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > +
> > +     #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> >  elif [ $HOST_ARCH = "x86_64" ]; then
> >       #x86_64 Linux hosted cross compilers
> >
> >       #AArch32 target with hard float (arm-linux-none-gnueabihf)
> > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> >
> >       #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> >
> >       #AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
> > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> >  else
> >       echo "ERROR - Unknown build arch of $HOST_ARCH"
> >       exit 1
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > similarity index 61%
> > rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > index 02b5b43bdd7e..a9e6b581a50e 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > @@ -9,16 +9,16 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
> >  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> >
> >  LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > -LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"
> > -LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
> > +LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > +LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> >
> > -PROVIDES = "virtual/aarch64-none-elf-gcc"
> > +PROVIDES = "virtual/${BINNAME}-gcc"
> >
> > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > -SRC_URI[gnu-a-aarch64.sha256sum] = "768a5db41d93f48838f1c4bfeae26930df2320c09f0dfa798321082fb937955f"
> > -SRC_URI[gnu-a-x86_64.sha256sum] = "6f74b1ee370caeb716688d2e467e5b44727fdc0ed56023fe5c72c0620019ecef"
> > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > +SRC_URI[gnu-a-aarch64.sha256sum] = "3b15725545a0211a17b63e72d4f10241f7ffbe7ce94cb9612590ceacde16992c"
> > +SRC_URI[gnu-a-x86_64.sha256sum] = "b0a015a9e8cbb44ed2fe5ad755a7a7ae254d54f93df3bf47378485b0ba8b828b"
> >
> >  S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> >
> > -UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
> > +UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> >  UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > deleted file mode 100644
> > index ad7e81617d74..000000000000
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> > -# Released under the MIT license (see COPYING.MIT for the terms)
> > -
> > -require arm-binary-toolchain.inc
> > -
> > -COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> > -
> > -SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> > -LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > -
> > -LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> > -
> > -PROVIDES = "virtual/arm-none-eabi-gcc"
> > -
> > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
> > -SRC_URI[gnu-rm-aarch64.sha256sum] = "f605b5f23ca898e9b8b665be208510a54a6e9fdd0fa5bfc9592002f6e7431208"
> > -SRC_URI[gnu-rm-x86_64.sha256sum] = "97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3"
> > -
> > -UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
> > -UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > new file mode 100644
> > index 000000000000..4e9fe35789f9
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > @@ -0,0 +1,24 @@
> > +# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +require arm-binary-toolchain.inc
> > +
> > +COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> > +
> > +SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > +
> > +LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > +LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > +LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> > +
> > +PROVIDES = "virtual/${BINNAME}-gcc"
> > +
> > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-rm-${HOST_ARCH}"
> > +SRC_URI[gnu-rm-aarch64.sha256sum] = "dd861d188f4061a7ef3857c948376f84ef1dfb88a32aded7c336ed7e47e60970"
> > +SRC_URI[gnu-rm-x86_64.sha256sum] = "8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326"
> > +
> > +S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> > +
> > +UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> > +UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > --
> > 2.30.2
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

