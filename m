Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10909C433FE
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 12:37:55 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.10454.1651581472905684755
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 05:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ApVI3t0+;
 spf=pass (domain: linaro.org, ip: 209.85.216.51,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f51.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so2112113pjq.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 05:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dAghhgZ5xAww/9F7Oybw0PRA8sarvJNXG0rehqLMdCk=;
        b=ApVI3t0+Vzjckq0bO2S6h4YTPSRukbk/xkreeOipMHB4md6ifJnLoN5m0bAZPNLMkE
         fAm9FiCMoDIr/v6diGh5KSYHbKU8/lT4ZL+05iNx1UzFGXdT5Zqq+84oh46PUD9XyWtG
         8zZYRHBFoJN63TKRGaGTi4wOCJCP7voVWPjo6szgu13QLMD2u+ifU+D7kPvgqt95eHUR
         meHNg3/kgG+KOfDOJo74cWh4X5Qs+XAM3yYq9aa5ZeY/t7NYU2QxAYcUsTm5FDhQuum6
         1ynnhMSvIwma547/EuKhOpXgFQwsBngVsuzsdY4O3XBJmMp69QvHMrniyh8yQV5J49iR
         TbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dAghhgZ5xAww/9F7Oybw0PRA8sarvJNXG0rehqLMdCk=;
        b=TDdYTBEpMGgYxKMziUumlvMe7wjwzCd8f8UKaP/y0jSvGbO0x2zterPYX2YFOL7ZdQ
         umb1+1YHuK0UkpULVWpcHge7bZ7kCfK/hGzv9WvvWak4qGpgFYweR4VT64Zhk2iXLvW5
         6W1jRkETlY+RhFd+sPBPP37n4StqETG29mDQe3LzUog8TSTlOjjfzRm1RnShnka8PsGf
         VUJtYihKRExFi0WglHoStREh8CP8EWopiRSDjnCq9Sa+EIHdX5LGrcqXDIjB/8WW4FqL
         czg5RXxRE9ZtNJYV0PmDoyL+Ebp4D8KZSkaHGfX+isVVHbgBsv1X0um1JTF0iCHVjtu/
         tjmg==
X-Gm-Message-State: AOAM531LKX64mFlTY55Dn/HwGZy7JVhbl4D5skXN+eo7RDvs9bUA/bLl
	4fBt6SIvb4hE/oVjooS6noW87rDevU08iGRbH7+SUg==
X-Google-Smtp-Source: 
 ABdhPJwIfXdHZ/yC52SBrI+v9VcRWDq891Y/BN3ZyzPon2gzVzt5Xwn9SUJVFS+BVF90PWR5/Gqukd370pfqkUlJ4SQ=
X-Received: by 2002:a17:90a:c70f:b0:1bf:3e2d:6cfa with SMTP id
 o15-20020a17090ac70f00b001bf3e2d6cfamr4510233pjt.70.1651581472064; Tue, 03
 May 2022 05:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220429062142.11206-1-sumit.garg@linaro.org>
 <20220429062142.11206-2-sumit.garg@linaro.org>
 <E8668DFC-4677-4E57-BB57-A199E4FECB40@arm.com>
In-Reply-To: <E8668DFC-4677-4E57-BB57-A199E4FECB40@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 3 May 2022 18:07:41 +0530
Message-ID: 
 <CAFA6WYNyUPk4a4yXMSgtPMyoLH=Cp7vCcgk0db_w=A4Sooq_7Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] external-arm-toolchain: Add support for Arm GCC
 11.2 binary release
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 Jon Mason <Jon.Mason@arm.com>,
	"denis@denix.org" <denis@denix.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 12:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3337

Hi Ross,

On Tue, 3 May 2022 at 14:57, Ross Burton <Ross.Burton@arm.com> wrote:
>
> We might need to temporarily revert this, as the binaries contain instruc=
tions that are only available in Broadwell cores.

Okay I see. But I don't think we need a revert here since the binary
toolchain recipe isn't just tied to 11.2 but rather supports all the
prior binary toolchain releases as well. So it's just a framework
improvement which should work with the upcoming release as well.

>
> Specifically, our CI explodes, for example:

If we need our CI to stop using 11.2 then that can be reverted to use
10.3 instead via a separate patch.

-Sumit

>
> ../../micropython/py/formatfloat.c:105:5: internal compiler error: Illega=
l instruction
>   105 |     MICROPY_FLOAT_CONST(1e32), MICROPY_FLOAT_CONST(1e16), MICROPY=
_FLOAT_CONST(1e8), MICROPY_FLOAT_CONST(1e4), MICROPY_FLOAT_CONST(1e2), MICR=
OPY_FLOAT_CONST(1e1)
>       |     ^~~~~~~~~~~~~~~~~~~
> 0x1521b50 diagnostic_impl(rich_location*, diagnostic_metadata const*, int=
, char const*, __va_list_tag (*) [1], diagnostic_t)
>         ???:0
> 0x15227d6 internal_error(char const*, ...)
>         ???:0
> 0xb7838f crash_signal(int)
>         ???:0
> 0x171b592 __gmpn_mul_basecase
>         ???:0
>
> There=E2=80=99s an internal ticket and the next release will be fixed.
>
> Ross
>
> > On 29 Apr 2022, at 07:21, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Arm GCC 11.2 binary release has completely changed the way how libc was
> > packaged in earlier binary releases. So adjust do_install() accordingly
> > to support Arm GCC 11.2 as well as earlier binary releases.
> >
> > Along with this update CI as well to point at Arm GCC 11.2 binary
> > releases.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >
> > Changes in v2:
> > - None
> >
> > ci/get-binary-toolchains                      | 10 ++--
> > .../external-arm-toolchain.bb                 | 47 ++++++++-----------
> > 2 files changed, 25 insertions(+), 32 deletions(-)
> >
> > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > index 838342a..bfdd8c5 100755
> > --- a/ci/get-binary-toolchains
> > +++ b/ci/get-binary-toolchains
> > @@ -2,7 +2,7 @@
> > set -u
> >
> > HOST_ARCH=3D$(uname -m)
> > -VER=3D"10.3-2021.07"
> > +VER=3D"11.2-2022.02"
> >
> > DOWNLOAD_DIR=3D$1
> > TOOLCHAIN_DIR=3D$2
> > @@ -15,18 +15,18 @@ if [ $HOST_ARCH =3D "aarch64" ]; then
> >       #AArch64 Linux hosted cross compilers
> >
> >       #AArch32 target with hard float (arm-none-linux-gnueabihf)
> > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files=
/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabi=
hf.tar.xz
> > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files=
/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf=
.tar.xz
> > elif [ $HOST_ARCH =3D "x86_64" ]; then
> >       #x86_64 Linux hosted cross compilers
> >
> >       #AArch32 target with hard float (arm-linux-none-gnueabihf)
> > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files=
/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabi=
hf.tar.xz
> > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files=
/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf=
.tar.xz
> >
> >       #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files=
/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu=
.tar.xz
> > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files=
/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.t=
ar.xz
> >
> >       #AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
> > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files=
/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-=
gnu.tar.xz
> > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files=
/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gn=
u.tar.xz
> > else
> >       echo "ERROR - Unknown build arch of $HOST_ARCH"
> >       exit 1
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain=
/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
> > index a58eeb4..dcc8ebf 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/extern=
al-arm-toolchain.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/extern=
al-arm-toolchain.bb
> > @@ -79,29 +79,10 @@ do_install() {
> >
> >       CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downe=
rship"
> >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDI=
R}/*  ${D}${base_libdir}
> > -     if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR=
}/${EAT_TARGET_SYS} ]; then
> > -             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib=
c/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${base_libdir}
> > -     else
> > -             if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EA=
T_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> > -                     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_=
SYS}/libc/${EAT_LIBDIR}/*  ${D}${base_libdir}
> > -             else
> > -                     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_=
SYS}/libc/usr/${EAT_LIBDIR}/*.so*  ${D}${base_libdir}
> > -             fi
> > -     fi
> > -     if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LI=
BDIR}/${EAT_TARGET_SYS} ]; then
> > -             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib=
c/usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${libdir}
> > -     else
> > -             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib=
c/usr/${EAT_LIBDIR}/*  ${D}${libdir}
> > -             if [ ! -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${=
EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> > -                     rm -rf ${D}${libdir}/*.so*
> > -             fi
> > -     fi
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_=
LIBDIR}/*  ${D}${base_libdir}
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${=
EAT_LIBDIR}/*  ${D}${libdir}
> >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/sh=
are/*  ${D}${datadir}
> >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/in=
clude/*  ${D}${includedir}
> > -     if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/=
${EAT_TARGET_SYS} ]; then
> > -             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib=
c/usr/include/${EAT_TARGET_SYS}/*  ${D}${includedir}
> > -             rm -r ${D}${includedir}/${EAT_TARGET_SYS}
> > -     fi
> >
> >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* $=
{D}${includedir}
> >       if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ];=
 then
> > @@ -128,7 +109,11 @@ do_install() {
> >
> >       # fix up the copied symlinks (they are still pointing to the mult=
iarch directory)
> >       linker_name=3D"${@bb.utils.contains("TUNE_FEATURES", "aarch64", "=
ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-=
hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
> > -     ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
> > +     if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR=
}/ld-${EAT_VER_LIBC}.so ]; then
> > +             ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_=
name}
> > +     else
> > +             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib=
c/lib/${linker_name} ${D}${base_libdir}/
> > +     fi
> >       ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
> >       ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
> >       ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
> > @@ -144,6 +129,7 @@ do_install() {
> >       ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files.so
> >       ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.s=
o
> >       ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
> > +     ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc=
_debug.so
> >
> >       # remove potential .so duplicates from base_libdir
> >       # for all symlinks created above in libdir
> > @@ -164,7 +150,7 @@ do_install() {
> >       rm -f ${D}${base_libdir}/libm.so
> >
> >       # Move these completely to ${libdir} and delete duplicates in ${b=
ase_libdir}
> > -     for lib in asan atomic gfortran gomp itm lsan sanitizer stdc++ ts=
an ubsan; do
> > +     for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer st=
dc++ tsan ubsan; do
> >               if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
> >                       mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir=
}
> >               fi
> > @@ -180,6 +166,10 @@ do_install() {
> >       # Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates l=
ike lib*-${EAT_VER_LIBC}.so
> >       # Only remove them if both are regular files and are identical
> >       for i in ${D}${base_libdir}/lib*-${EAT_VER_LIBC}.so; do
> > +             if [ ! -e $i ] ; then
> > +                     continue
> > +             fi
> > +
> >               f=3D$(echo $i | sed 's/-${EAT_VER_LIBC}//')
> >               l=3D$(ls $f.*)
> >               if [ $(readlink -f $i ) =3D $l ]; then
> > @@ -217,9 +207,9 @@ do_install() {
> >       fi
> >
> >       if [ -f ${D}${base_libdir}/libc.so ];then
> > -             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib=
#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" "s# /${EAT_LIBDIR}/# =
/lib/#g" ${D}${base_libdir}/libc.so
> > +             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib=
#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}=
/# /lib/#g" ${D}${base_libdir}/libc.so
> >               if [ -f ${D}${base_libdir}/libc.so.6 ]; then
> > -                     sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/=
libc.so.6#g" "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_lib=
dir}/libc.so.6
> > +                     sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/=
libc.so.6#g" -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_=
libdir}/libc.so.6
> >               fi
> >       fi
> >
> > @@ -460,13 +450,16 @@ FILES:libgfortran-staticdev =3D "${libdir}/libgfo=
rtran.a"
> >
> > # From gcc-sanitizers.inc:
> >
> > -FILES:libasan +=3D "${libdir}/libasan.so.*"
> > +FILES:libasan +=3D "${libdir}/libasan.so.* ${libdir}/libhwasan.so.*"
> > FILES:libasan-dev +=3D "\
> >     ${libdir}/libasan_preinit.o \
> >     ${libdir}/libasan.so \
> > +    ${libdir}/libhwasan.so \
> >     ${libdir}/libasan.la \
> > "
> > -FILES:libasan-staticdev +=3D "${libdir}/libasan.a"
> > +FILES:libasan-staticdev +=3D "${libdir}/libasan.a \
> > +    ${libdir}/libhwasan.a \
> > +"
> >
> > FILES:libubsan +=3D "${libdir}/libubsan.so.*"
> > FILES:libubsan-dev +=3D "\
> > --
> > 2.25.1
> >
>

