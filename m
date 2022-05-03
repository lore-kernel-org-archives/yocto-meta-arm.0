Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282E9C433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 15:24:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.459.1651591463306015832
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 08:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D5E940BE6;
	Tue,  3 May 2022 15:24:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7pM-7bUZPdn; Tue,  3 May 2022 15:24:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 15F4640ACD;
	Tue,  3 May 2022 15:24:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C9E97174915; Tue,  3 May 2022 11:24:17 -0400 (EDT)
Date: Tue, 3 May 2022 11:24:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Jon Mason <Jon.Mason@arm.com>,
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 2/2] external-arm-toolchain: Add support for Arm GCC
 11.2 binary release
Message-ID: <20220503152417.GX9834@denix.org>
References: <20220429062142.11206-1-sumit.garg@linaro.org>
 <20220429062142.11206-2-sumit.garg@linaro.org>
 <E8668DFC-4677-4E57-BB57-A199E4FECB40@arm.com>
 <CAFA6WYNyUPk4a4yXMSgtPMyoLH=Cp7vCcgk0db_w=A4Sooq_7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: 
 <CAFA6WYNyUPk4a4yXMSgtPMyoLH=Cp7vCcgk0db_w=A4Sooq_7Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 15:24:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3341

On Tue, May 03, 2022 at 06:07:41PM +0530, Sumit Garg wrote:
> Hi Ross,
>=20
> On Tue, 3 May 2022 at 14:57, Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > We might need to temporarily revert this, as the binaries contain ins=
tructions that are only available in Broadwell cores.
>=20
> Okay I see. But I don't think we need a revert here since the binary
> toolchain recipe isn't just tied to 11.2 but rather supports all the
> prior binary toolchain releases as well. So it's just a framework
> improvement which should work with the upcoming release as well.
>=20
> >
> > Specifically, our CI explodes, for example:
>=20
> If we need our CI to stop using 11.2 then that can be reverted to use
> 10.3 instead via a separate patch.

I agree here - should probably keep the recipe update, which is=20
version-agnostic, but switch CI back to 10.3 for now. Thanks.


> > ../../micropython/py/formatfloat.c:105:5: internal compiler error: Il=
legal instruction
> >   105 |     MICROPY_FLOAT_CONST(1e32), MICROPY_FLOAT_CONST(1e16), MIC=
ROPY_FLOAT_CONST(1e8), MICROPY_FLOAT_CONST(1e4), MICROPY_FLOAT_CONST(1e2)=
, MICROPY_FLOAT_CONST(1e1)
> >       |     ^~~~~~~~~~~~~~~~~~~
> > 0x1521b50 diagnostic_impl(rich_location*, diagnostic_metadata const*,=
 int, char const*, __va_list_tag (*) [1], diagnostic_t)
> >         ???:0
> > 0x15227d6 internal_error(char const*, ...)
> >         ???:0
> > 0xb7838f crash_signal(int)
> >         ???:0
> > 0x171b592 __gmpn_mul_basecase
> >         ???:0
> >
> > There=E2=80=99s an internal ticket and the next release will be fixed=
.
> >
> > Ross
> >
> > > On 29 Apr 2022, at 07:21, Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > Arm GCC 11.2 binary release has completely changed the way how libc=
 was
> > > packaged in earlier binary releases. So adjust do_install() accordi=
ngly
> > > to support Arm GCC 11.2 as well as earlier binary releases.
> > >
> > > Along with this update CI as well to point at Arm GCC 11.2 binary
> > > releases.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >
> > > Changes in v2:
> > > - None
> > >
> > > ci/get-binary-toolchains                      | 10 ++--
> > > .../external-arm-toolchain.bb                 | 47 ++++++++--------=
---
> > > 2 files changed, 25 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > > index 838342a..bfdd8c5 100755
> > > --- a/ci/get-binary-toolchains
> > > +++ b/ci/get-binary-toolchains
> > > @@ -2,7 +2,7 @@
> > > set -u
> > >
> > > HOST_ARCH=3D$(uname -m)
> > > -VER=3D"10.3-2021.07"
> > > +VER=3D"11.2-2022.02"
> > >
> > > DOWNLOAD_DIR=3D$1
> > > TOOLCHAIN_DIR=3D$2
> > > @@ -15,18 +15,18 @@ if [ $HOST_ARCH =3D "aarch64" ]; then
> > >       #AArch64 Linux hosted cross compilers
> > >
> > >       #AArch32 target with hard float (arm-none-linux-gnueabihf)
> > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/F=
iles/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-g=
nueabihf.tar.xz
> > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/F=
iles/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnu=
eabihf.tar.xz
> > > elif [ $HOST_ARCH =3D "x86_64" ]; then
> > >       #x86_64 Linux hosted cross compilers
> > >
> > >       #AArch32 target with hard float (arm-linux-none-gnueabihf)
> > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/F=
iles/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-g=
nueabihf.tar.xz
> > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/F=
iles/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnu=
eabihf.tar.xz
> > >
> > >       #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/F=
iles/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-lin=
ux-gnu.tar.xz
> > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/F=
iles/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux=
-gnu.tar.xz
> > >
> > >       #AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
> > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/F=
iles/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-=
linux-gnu.tar.xz
> > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/F=
iles/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-li=
nux-gnu.tar.xz
> > > else
> > >       echo "ERROR - Unknown build arch of $HOST_ARCH"
> > >       exit 1
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolc=
hain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/exte=
rnal-arm-toolchain/external-arm-toolchain.bb
> > > index a58eeb4..dcc8ebf 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/ex=
ternal-arm-toolchain.bb
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/ex=
ternal-arm-toolchain.bb
> > > @@ -79,29 +79,10 @@ do_install() {
> > >
> > >       CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3D=
ownership"
> > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_L=
IBDIR}/*  ${D}${base_libdir}
> > > -     if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LI=
BDIR}/${EAT_TARGET_SYS} ]; then
> > > -             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}=
/libc/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${base_libdir}
> > > -     else
> > > -             if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/=
${EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> > > -                     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TAR=
GET_SYS}/libc/${EAT_LIBDIR}/*  ${D}${base_libdir}
> > > -             else
> > > -                     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TAR=
GET_SYS}/libc/usr/${EAT_LIBDIR}/*.so*  ${D}${base_libdir}
> > > -             fi
> > > -     fi
> > > -     if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EA=
T_LIBDIR}/${EAT_TARGET_SYS} ]; then
> > > -             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}=
/libc/usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${libdir}
> > > -     else
> > > -             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}=
/libc/usr/${EAT_LIBDIR}/*  ${D}${libdir}
> > > -             if [ ! -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib=
c/${EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> > > -                     rm -rf ${D}${libdir}/*.so*
> > > -             fi
> > > -     fi
> > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${=
EAT_LIBDIR}/*  ${D}${base_libdir}
> > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/us=
r/${EAT_LIBDIR}/*  ${D}${libdir}
> > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/us=
r/share/*  ${D}${datadir}
> > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/us=
r/include/*  ${D}${includedir}
> > > -     if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/incl=
ude/${EAT_TARGET_SYS} ]; then
> > > -             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}=
/libc/usr/include/${EAT_TARGET_SYS}/*  ${D}${includedir}
> > > -             rm -r ${D}${includedir}/${EAT_TARGET_SYS}
> > > -     fi
> > >
> > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include=
/* ${D}${includedir}
> > >       if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS=
} ]; then
> > > @@ -128,7 +109,11 @@ do_install() {
> > >
> > >       # fix up the copied symlinks (they are still pointing to the =
multiarch directory)
> > >       linker_name=3D"${@bb.utils.contains("TUNE_FEATURES", "aarch64=
", "ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconve=
ntion-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
> > > -     ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name=
}
> > > +     if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LI=
BDIR}/ld-${EAT_VER_LIBC}.so ]; then
> > > +             ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${lin=
ker_name}
> > > +     else
> > > +             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}=
/libc/lib/${linker_name} ${D}${base_libdir}/
> > > +     fi
> > >       ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
> > >       ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
> > >       ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
> > > @@ -144,6 +129,7 @@ do_install() {
> > >       ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files=
.so
> > >       ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_comp=
at.so
> > >       ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
> > > +     ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_ma=
lloc_debug.so
> > >
> > >       # remove potential .so duplicates from base_libdir
> > >       # for all symlinks created above in libdir
> > > @@ -164,7 +150,7 @@ do_install() {
> > >       rm -f ${D}${base_libdir}/libm.so
> > >
> > >       # Move these completely to ${libdir} and delete duplicates in=
 ${base_libdir}
> > > -     for lib in asan atomic gfortran gomp itm lsan sanitizer stdc+=
+ tsan ubsan; do
> > > +     for lib in asan hwasan atomic gfortran gomp itm lsan sanitize=
r stdc++ tsan ubsan; do
> > >               if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
> > >                       mv ${D}${base_libdir}/lib${lib}.spec ${D}${li=
bdir}
> > >               fi
> > > @@ -180,6 +166,10 @@ do_install() {
> > >       # Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicat=
es like lib*-${EAT_VER_LIBC}.so
> > >       # Only remove them if both are regular files and are identica=
l
> > >       for i in ${D}${base_libdir}/lib*-${EAT_VER_LIBC}.so; do
> > > +             if [ ! -e $i ] ; then
> > > +                     continue
> > > +             fi
> > > +
> > >               f=3D$(echo $i | sed 's/-${EAT_VER_LIBC}//')
> > >               l=3D$(ls $f.*)
> > >               if [ $(readlink -f $i ) =3D $l ]; then
> > > @@ -217,9 +207,9 @@ do_install() {
> > >       fi
> > >
> > >       if [ -f ${D}${base_libdir}/libc.so ];then
> > > -             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../..=
/lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" "s# /${EAT_LIBD=
IR}/# /lib/#g" ${D}${base_libdir}/libc.so
> > > +             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../..=
/lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_L=
IBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
> > >               if [ -f ${D}${base_libdir}/libc.so.6 ]; then
> > > -                     sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /=
lib/libc.so.6#g" "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${ba=
se_libdir}/libc.so.6
> > > +                     sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /=
lib/libc.so.6#g" -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}$=
{base_libdir}/libc.so.6
> > >               fi
> > >       fi
> > >
> > > @@ -460,13 +450,16 @@ FILES:libgfortran-staticdev =3D "${libdir}/li=
bgfortran.a"
> > >
> > > # From gcc-sanitizers.inc:
> > >
> > > -FILES:libasan +=3D "${libdir}/libasan.so.*"
> > > +FILES:libasan +=3D "${libdir}/libasan.so.* ${libdir}/libhwasan.so.=
*"
> > > FILES:libasan-dev +=3D "\
> > >     ${libdir}/libasan_preinit.o \
> > >     ${libdir}/libasan.so \
> > > +    ${libdir}/libhwasan.so \
> > >     ${libdir}/libasan.la \
> > > "
> > > -FILES:libasan-staticdev +=3D "${libdir}/libasan.a"
> > > +FILES:libasan-staticdev +=3D "${libdir}/libasan.a \
> > > +    ${libdir}/libhwasan.a \
> > > +"
> > >
> > > FILES:libubsan +=3D "${libdir}/libubsan.so.*"
> > > FILES:libubsan-dev +=3D "\
> > > --
> > > 2.25.1
> > >
> >
>=20

