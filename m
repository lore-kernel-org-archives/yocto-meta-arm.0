Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1413.1602691131652762837
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 08:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6892040BD1;
	Wed, 14 Oct 2020 15:58:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CWMx9rEcBEQZ; Wed, 14 Oct 2020 15:58:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4089440B66;
	Wed, 14 Oct 2020 15:58:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 910FA174495; Wed, 14 Oct 2020 11:58:48 -0400 (EDT)
Date: Wed, 14 Oct 2020 11:58:48 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Brett Warren <brett.warren@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/6] optee: upgraded recipes to 3.10
Message-ID: <20201014155848.GS19155@denix.org>
References: <8kyH.1602675228543077329.RykC@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <8kyH.1602675228543077329.RykC@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Maybe passing --find-copies-harder would yield a smaller and more readable=
=20
patch (i.e. diff between 3.8 and 3.10)?

Also, are there any details on backward compatibility needs to preserve 3.=
8?

Thanks.

--=20
Denys


On Wed, Oct 14, 2020 at 04:33:48AM -0700, Brett Warren wrote:
> The optee recipes were upgraded due to issues booting with 3.8
> on qemuarm64-secureboot, which were resolved by the upgrade.
> The 3.8 recipes are retained for backwards compatibility.
>=20
> optee-test and optee-examples were modified to pass a sysroot
> to the LIBGCC_LOCATE_CFLAGS parameter, to ensure proper location
> of the libgcc library.
>=20
> Recipes have been renamed to reflect their current version.
> As this makes the PV variables redundent, these have been removed.
>=20
> Change-Id: Iacaba02d64570a790d5cc20eca8be58246e39019
> Signed-off-by: Brett Warren <brett.warren@arm.com>
> ---
> .../optee/optee-client_3.10.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
| 59 +++++++++++++
> ...ee-client_git.bb =3D> optee-client_3.8.0.bb} |=A0 2 -
> .../optee/optee-examples_3.10.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 52=
 ++++++++++++
> ...xamples_git.bb =3D> optee-examples_3.8.0.bb} |=A0 3 +-
> .../recipes-security/optee/optee-os_3.10.0.bb | 83 +++++++++++++++++++
> .../{optee-os_git.bb =3D> optee-os_3.8.0.bb}=A0=A0=A0 |=A0 2 -
> .../optee/optee-test_3.10.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=
=A0 | 55 ++++++++++++
> ...{optee-test_git.bb =3D> optee-test_3.8.0.bb} |=A0 3 +-
> 8 files changed, 251 insertions(+), 8 deletions(-)
> create mode 100644 meta-arm/recipes-security/optee/optee-client_3.10.0.b=
b
> rename meta-arm/recipes-security/optee/{optee-client_git.bb =3D> optee-c=
lient_3.8.0.bb} (98%)
> create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.10.0=
.bb
> rename meta-arm/recipes-security/optee/{optee-examples_git.bb =3D> optee=
-examples_3.8.0.bb} (95%)
> create mode 100644 meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> rename meta-arm/recipes-security/optee/{optee-os_git.bb =3D> optee-os_3.=
8.0.bb} (98%)
> create mode 100644 meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> rename meta-arm/recipes-security/optee/{optee-test_git.bb =3D> optee-tes=
t_3.8.0.bb} (96%)
>=20
> diff --git a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/me=
ta-arm/recipes-security/optee/optee-client_3.10.0.bb
> new file mode 100644
> index 0000000..cbd3b93
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "OP-TEE Client API"
> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Normal W=
orld Client side of the TEE"
> +HOMEPAGE =3D "https://www.op-tee.org/"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a=
60a743e5b"
> +
> +require optee.inc
> +
> +inherit python3native systemd update-rc.d
> +
> +SRCREV =3D "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
> +SRC_URI =3D " \
> +=A0=A0=A0 git://github.com/OP-TEE/optee_client.git \
> +=A0=A0=A0 file://tee-supplicant.service \
> +=A0=A0=A0 file://tee-supplicant.sh \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
> +
> +EXTRA_OEMAKE =3D "O=3D${B}"
> +
> +do_compile() {
> +=A0=A0=A0 cd ${S}
> +=A0=A0=A0 oe_runmake
> +}
> +do_compile[cleandirs] =3D "${B}"
> +
> +do_install() {
> +=A0=A0=A0 cd ${S}
> +=A0=A0=A0 oe_runmake install
> +
> +=A0=A0=A0 install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant ${D}=
${sbindir}/tee-supplicant
> +
> +=A0=A0=A0 install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}$=
{libdir}/libteec.so.1.0
> +=A0=A0=A0 ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
> +=A0=A0=A0 ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
> +
> +=A0=A0=A0 install -d ${D}${includedir}
> +=A0=A0=A0 install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedi=
r}
> +
> +=A0=A0=A0 install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${=
systemd_system_unitdir}/tee-supplicant.service
> +
> +=A0=A0=A0 install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysco=
nfdir}/init.d/tee-supplicant
> +
> +=A0=A0=A0 sed -i -e s:@sysconfdir@:${sysconfdir}:g \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -e s:@sbindir@:${sbindir}:g \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ${D}${systemd_system_unitdir}/t=
ee-supplicant.service \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ${D}${sysconfdir}/init.d/tee-su=
pplicant
> +}
> +
> +SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
> +
> +INITSCRIPT_PACKAGES =3D "${PN}"
> +
> +INITSCRIPT_NAME_${PN} =3D "tee-supplicant"
> +INITSCRIPT_PARAMS_${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."
> +
> diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-=
arm/recipes-security/optee/optee-client_3.8.0.bb
> similarity index 98%
> rename from meta-arm/recipes-security/optee/optee-client_git.bb
> rename to meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> index 5dbbfe9..d43ebf4 100644
> --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> @@ -5,8 +5,6 @@ HOMEPAGE =3D "https://www.op-tee.org/"
> LICENSE =3D "BSD"
> LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a6=
0a743e5b"
>=20
> -PV =3D "3.8.0+git${SRCPV}"
> -
> require optee.inc
>=20
> inherit python3native systemd update-rc.d
> diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/=
meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> new file mode 100644
> index 0000000..4a7db10
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> @@ -0,0 +1,52 @@
> +SUMMARY =3D "OP-TEE examples"
> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Sample A=
pplications"
> +HOMEPAGE =3D "https://github.com/linaro-swg/optee_examples"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381dafc=
453d70c30"
> +
> +DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
> +
> +inherit python3native
> +
> +require optee.inc
> +
> +SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0001-make-Pass-ldflags-during-lin=
k.patch \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> +SRCREV =3D "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
> +
> +OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
> +TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
> +TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
> +
> +EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OPTEE_CLIENT_EXPORT=3D=
${OPTEE_CLIENT_EXPORT} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TEEC_EXPORT=3D${TEEC_E=
XPORT} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HOST_CROSS_COMPILE=3D$=
{TARGET_PREFIX} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TA_CROSS_COMPILE=3D${T=
ARGET_PREFIX} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIBGCC_LOCATE_CFLAGS=
=3D--sysroot=3D${STAGING_DIR_HOST} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V=3D1 \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OUTPUT_DIR=3D${B} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> +
> +do_compile() {
> +=A0=A0=A0 cd ${S}
> +=A0=A0=A0 oe_runmake
> +}
> +do_compile[cleandirs] =3D "${B}"
> +
> +do_install () {
> +=A0=A0=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
> +=A0=A0=A0 mkdir -p ${D}${bindir}
> +=A0=A0=A0 install -D -p -m0755 ${B}/ca/* ${D}${bindir}
> +=A0=A0=A0 install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/opt=
ee_armtz
> +}
> +
> +FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
> +
> +# Imports machine specific configs from staging to build
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/met=
a-arm/recipes-security/optee/optee-examples_3.8.0.bb
> similarity index 95%
> rename from meta-arm/recipes-security/optee/optee-examples_git.bb
> rename to meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> index 71be593..7ed3dfa 100644
> --- a/meta-arm/recipes-security/optee/optee-examples_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> @@ -5,8 +5,6 @@ HOMEPAGE =3D "https://github.com/linaro-swg/optee_exampl=
es"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381dafc4=
53d70c30"
>=20
> -PV =3D "3.8.0+git${SRCPV}"
> -
> DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
>=20
> inherit python3native
> @@ -30,6 +28,7 @@ EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} =
\
> TEEC_EXPORT=3D${TEEC_EXPORT} \
> HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
> TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIBGCC_LOCATE_CFLAGS=
=3D--sysroot=3D${STAGING_DIR_HOST} \
> V=3D1 \
> OUTPUT_DIR=3D${B} \
> "
> diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-a=
rm/recipes-security/optee/optee-os_3.10.0.bb
> new file mode 100644
> index 0000000..369e011
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> @@ -0,0 +1,83 @@
> +SUMMARY =3D "OP-TEE Trusted OS"
> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted =
side of the TEE"
> +HOMEPAGE =3D "https://www.op-tee.org/"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4a=
ee55ec173"
> +
> +inherit deploy python3native
> +require optee.inc
> +
> +DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native p=
ython3-pyelftools-native"
> +
> +SRCREV =3D "d1c635434c55b7d75eadf471bde04926bd1e50a7"
> +SRC_URI =3D " \
> +=A0=A0=A0 git://github.com/OP-TEE/optee_os.git \
> +=A0=A0=A0 file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
> +
> +OPTEEMACHINE ?=3D "${MACHINE}"
> +OPTEEMACHINE_aarch64_qemuall ?=3D "vexpress-qemu_armv8a"
> +OPTEE_ARCH =3D "null"
> +OPTEE_ARCH_armv7a =3D "arm32"
> +OPTEE_ARCH_aarch64 =3D "arm64"
> +OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
> +
> +EXTRA_OEMAKE =3D " \
> +=A0=A0=A0 PLATFORM=3D${OPTEEMACHINE} \
> +=A0=A0=A0 CFG_${OPTEE_CORE}_core=3Dy \
> +=A0=A0=A0 CROSS_COMPILE_core=3D${HOST_PREFIX} \
> +=A0=A0=A0 CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \
> +=A0=A0=A0 NOWERROR=3D1 \
> +=A0=A0=A0 V=3D1 \
> +=A0=A0=A0 ta-targets=3Dta_${OPTEE_ARCH} \
> +=A0=A0=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \
> +=A0=A0=A0 O=3D${B} \
> +"
> +
> +CFLAGS[unexport] =3D "1"
> +LDFLAGS[unexport] =3D "1"
> +CPPFLAGS[unexport] =3D "1"
> +AS[unexport] =3D "1"
> +LD[unexport] =3D "1"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +=A0=A0=A0 cd ${S}
> +=A0=A0=A0 oe_runmake all CFG_TEE_TA_LOG_LEVEL=3D0
> +}
> +do_compile[cleandirs] =3D "${B}"
> +
> +do_install() {
> +=A0=A0=A0 #install core in firmware
> +=A0=A0=A0 install -d ${D}${nonarch_base_libdir}/firmware/
> +=A0=A0=A0 install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/fir=
mware/
> +
> +=A0=A0=A0 #install TA devkit
> +=A0=A0=A0 install -d ${D}${includedir}/optee/export-user_ta/
> +=A0=A0=A0 for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> +=A0=A0=A0=A0=A0=A0=A0 cp -aR $f ${D}${includedir}/optee/export-user_ta/
> +=A0=A0=A0 done
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +do_deploy() {
> +=A0=A0=A0 install -d ${DEPLOYDIR}/optee
> +=A0=A0=A0 install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOY=
DIR}/optee/
> +}
> +
> +addtask deploy before do_build after do_install
> +
> +SYSROOT_DIRS +=3D "${nonarch_base_libdir}/firmware"
> +
> +FILES_${PN} =3D "${nonarch_base_libdir}/firmware/"
> +FILES_${PN}-dev =3D "${includedir}/optee/"
> +
> +INSANE_SKIP_${PN}-dev =3D "staticdev"
> +
> +INHIBIT_PACKAGE_STRIP =3D "1"
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/=
recipes-security/optee/optee-os_3.8.0.bb
> similarity index 98%
> rename from meta-arm/recipes-security/optee/optee-os_git.bb
> rename to meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> index deeb515..0001271 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> @@ -5,8 +5,6 @@ HOMEPAGE =3D "https://www.op-tee.org/"
> LICENSE =3D "BSD"
> LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4ae=
e55ec173"
>=20
> -PV =3D "3.8.0+git${SRCPV}"
> -
> inherit deploy python3native
> require optee.inc
>=20
> diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta=
-arm/recipes-security/optee/optee-test_3.10.0.bb
> new file mode 100644
> index 0000000..96e612a
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> @@ -0,0 +1,55 @@
> +SUMMARY =3D "OP-TEE sanity testsuite"
> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Test sui=
te"
> +HOMEPAGE =3D "https://www.op-tee.org/"
> +
> +LICENSE =3D "BSD & GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab894=
0aab1315a4fa"
> +
> +inherit python3native
> +require optee.inc
> +
> +DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
> +
> +SRCREV =3D "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
> +SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0001-host-xtest-Adjust-order-of-i=
ncluding-compiler.h.patch \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
> +
> +OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
> +TEEC_EXPORT=A0=A0=A0=A0=A0=A0=A0=A0 =3D "${STAGING_DIR_HOST}${prefix}"
> +TA_DEV_KIT_DIR=A0=A0=A0=A0=A0 =3D "${STAGING_INCDIR}/optee/export-user_=
ta"
> +
> +EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OPTEE_CLIENT_EXPORT=3D=
${OPTEE_CLIENT_EXPORT} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TEEC_EXPORT=3D${TEEC_E=
XPORT} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CROSS_COMPILE_HOST=3D$=
{TARGET_PREFIX} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CROSS_COMPILE_TA=3D${T=
ARGET_PREFIX} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIBGCC_LOCATE_CFLAGS=
=3D--sysroot=3D${STAGING_DIR_HOST} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V=3D1 \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 O=3D${B} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> +
> +do_compile() {
> +=A0=A0=A0 cd ${S}
> +=A0=A0=A0 # Top level makefile doesn't seem to handle parallel make gra=
cefully
> +=A0=A0=A0 oe_runmake xtest
> +=A0=A0=A0 oe_runmake ta
> +}
> +do_compile[cleandirs] =3D "${B}"
> +
> +do_install () {
> +=A0=A0=A0 install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest
> +
> +=A0=A0=A0 # install path should match the value set in optee-client/tee=
-supplicant
> +=A0=A0=A0 # default TEEC_LOAD_PATH is /lib
> +=A0=A0=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
> +=A0=A0=A0 install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir=
}/optee_armtz/
> +}
> +
> +FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
> +
> +# Imports machine specific configs from staging to build
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-ar=
m/recipes-security/optee/optee-test_3.8.0.bb
> similarity index 96%
> rename from meta-arm/recipes-security/optee/optee-test_git.bb
> rename to meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> index 957286c..65e6cd1 100644
> --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> @@ -10,8 +10,6 @@ require optee.inc
>=20
> DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
>=20
> -PV =3D "3.8.0+git${SRCPV}"
> -
> SRCREV =3D "30481e381cb4285706e7516853495a7699c93b2c"
> SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
> file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
> @@ -29,6 +27,7 @@ EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} =
\
> TEEC_EXPORT=3D${TEEC_EXPORT} \
> CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
> CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIBGCC_LOCATE_CFLAGS=
=3D--sysroot=3D${STAGING_DIR_HOST} \
> V=3D1 \
> O=3D${B} \
> "
> --
> 2.17.1

>=20
>=20
>=20

