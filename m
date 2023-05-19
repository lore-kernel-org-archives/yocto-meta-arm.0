Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AAAC77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23141.1684495468593153818
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22C761FB;
	Fri, 19 May 2023 04:25:13 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79AD03F762;
	Fri, 19 May 2023 04:24:27 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: [PATCH 07/16] optee-os: enable SPMC test
Date: Fri, 19 May 2023 13:23:51 +0200
Message-Id: <20230519112400.340-7-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4671

Add ta-devkit and optee-test. Change configuration to enable building
and deploying OP-TEE SPMC tests.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../arm-ffa-user/arm-ffa-user_5.0.1.bb        | 14 +++--
 .../optee/optee-os-tadevkit_3.2%.bbappend     |  4 ++
 .../optee/optee-os-ts-3.18.inc                | 54 +++++++++++++++++++
 .../recipes-security/optee/optee-os-ts.inc    | 10 +++-
 .../optee/optee-os_3.1%.bbappend              |  5 ++
 ...e-os_%.bbappend =3D> optee-os_3.2%.bbappend} |  0
 .../optee/optee-test_3.2%.bbappend            |  7 +++
 .../trusted-services/ts-sp-common.inc         |  4 +-
 .../ts-sp-spm-test-common.inc                 |  7 +++
 .../trusted-services/ts-sp-spm-test1_git.bb   |  5 ++
 .../trusted-services/ts-sp-spm-test2_git.bb   |  6 +++
 .../trusted-services/ts-sp-spm-test3_git.bb   |  6 +++
 .../trusted-services/ts-uuid.inc              |  3 ++
 13 files changed, 118 insertions(+), 7 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.2=
%.bbappend
 create mode 100644 meta-arm/recipes-security/optee/optee-os-ts-3.18.inc
 create mode 100644 meta-arm/recipes-security/optee/optee-os_3.1%.bbappen=
d
 rename meta-arm/recipes-security/optee/{optee-os_%.bbappend =3D> optee-o=
s_3.2%.bbappend} (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.2%.bbapp=
end
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-spm-=
test-common.inc
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-spm-=
test1_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-spm-=
test2_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-spm-=
test3_git.bb

diff --git a/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb b=
/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb
index 1261fa41..726a65bb 100644
--- a/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb
+++ b/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb
@@ -18,10 +18,16 @@ COMPATIBLE_HOST =3D "(arm|aarch64).*-linux"
 KERNEL_MODULE_AUTOLOAD +=3D "arm-ffa-user"
 KERNEL_MODULE_PROBECONF +=3D "arm-ffa-user"
=20
-# This debugfs driver is used only by uefi-test for testing SmmGW SP
-# UUIDs =3D SMM Gateway SP
-FFA-USER-UUID-LIST ?=3D "ed32d533-99e6-4209-9cc0-2d72cdd998a7"
-module_conf_arm-ffa-user =3D "options arm-ffa-user uuid_str_list=3D${FFA=
-USER-UUID-LIST}"
+# SMM Gateway SP
+UUID_LIST =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway'=
, \
+                                  'ed32d533-99e6-4209-9cc0-2d72cdd998a7'=
, '' , d)}"
+# SPMC Tests SPs
+UUID_LIST:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-sp=
mc-test', \
+                                  ',5c9edbc3-7b3a-4367-9f83-7c191ae86a37=
,7817164c-c40c-4d1a-867a-9bb2278cf41a,23eb0100-e32a-4497-9052-2f11e584afa=
6', '' , d)}"
+
+FFA_USER_UUID_LIST ?=3D "${@d.getVar('UUID_LIST').strip(',')}"
+
+module_conf_arm-ffa-user =3D "options arm-ffa-user uuid_str_list=3D${FFA=
_USER_UUID_LIST}"
=20
 do_install:append() {
     install -d ${D}${includedir}
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.2%.bbapp=
end b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.2%.bbappend
new file mode 100644
index 00000000..a9732e4c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.2%.bbappend
@@ -0,0 +1,4 @@
+# Include extra headers needed by SPMC tests to TA DEVKIT.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os-ts-3.18.inc b/meta-=
arm/recipes-security/optee/optee-os-ts-3.18.inc
new file mode 100644
index 00000000..4dffc46d
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-ts-3.18.inc
@@ -0,0 +1,54 @@
+# Include Trusted Services SPs accordingly to defined machine features
+
+# Please notice that OPTEE will load SPs in the order listed in this fil=
e.
+# If an SP requires another SP to be already loaded it must be listed lo=
wer.
+
+# TS SPs UUIDs definitions
+require recipes-security/trusted-services/ts-uuid.inc
+
+TS_ENV =3D "opteesp"
+TS_BIN =3D "${RECIPE_SYSROOT}/usr/${TS_ENV}/bin"
+
+# ITS SP
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', =
\
+                                        ' ts-sp-its', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', =
\
+                                        ' ${TS_BIN}/${ITS_UUID}.stripped=
.elf', '', d)}"
+
+# Storage SP
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storag=
e', \
+                                        ' ts-sp-storage', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storag=
e', \
+                                        ' ${TS_BIN}/${STORAGE_UUID}.stri=
pped.elf', '', d)}"
+
+# Crypto SP.
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto=
', \
+                                        ' ts-sp-crypto', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto=
', \
+                                        ' ${TS_BIN}/${CRYPTO_UUID}.strip=
ped.elf', '', d)}"
+
+# Attestation SP
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attest=
ation', \
+                                        ' ts-sp-attestation', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attest=
ation', \
+                                        ' ${TS_BIN}/${ATTESTATION_UUID}.=
stripped.elf', '', d)}"
+
+# Env-test SP
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-te=
st', \
+                                        ' ts-sp-env-test', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-te=
st', \
+                                        ' ${TS_BIN}/${ENV_TEST_UUID}.str=
ipped.elf', '', d)}"
+
+# SE-Proxy SP
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-pro=
xy', \
+                                        ' ts-sp-se-proxy', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-pro=
xy', \
+                                        ' ${TS_BIN}/${SE_PROXY_UUID}.str=
ipped.elf', '', d)}"
+
+# SMM Gateway
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-ga=
teway', \
+                                        ' ts-sp-smm-gateway', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-ga=
teway', \
+                                        ' ${TS_BIN}/${SMM_GATEWAY_UUID}.=
stripped.elf', '', d)}"
+
+EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', ' C=
FG_MAP_EXT_DT_SECURE=3Dy CFG_SECURE_PARTITION=3Dy SP_PATHS=3D"${SP_PATHS}=
" ', d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/r=
ecipes-security/optee/optee-os-ts.inc
index 73b8c14f..057dde25 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -51,4 +51,12 @@ DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEA=
TURES', 'ts-smm-gateway', \
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-ga=
teway', \
                                         ' ${TS_BIN}/${SMM_GATEWAY_UUID}.=
stripped.elf', '', d)}"
=20
-EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', ' C=
FG_SECURE_PARTITION=3Dy SP_PATHS=3D"${SP_PATHS}" ', d)}"
+# SPM test SPs
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
+                                        ' ts-sp-spm-test1 ts-sp-spm-test=
2 ts-sp-spm-test3', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
+                                        ' ${TS_BIN}/${SPM_TEST1_UUID}.st=
ripped.elf ${TS_BIN}/${SPM_TEST2_UUID}.stripped.elf ${TS_BIN}/${SPM_TEST3=
_UUID}.stripped.elf', '', d)}"
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
+
+EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', ' C=
FG_MAP_EXT_DT_SECURE=3Dy CFG_SECURE_PARTITION=3Dy SP_PATHS=3D"${SP_PATHS}=
" ', d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.1%.bbappend b/met=
a-arm/recipes-security/optee/optee-os_3.1%.bbappend
new file mode 100644
index 00000000..2ff1b834
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_3.1%.bbappend
@@ -0,0 +1,5 @@
+# Include Trusted Services Secure Partitions
+require optee-os-ts-3.18.inc
+
+# Conditionally include platform specific Trusted Services related OPTEE=
 build parameters
+EXTRA_OEMAKE:append:qemuarm64-secureboot =3D "${@oe.utils.conditional('S=
P_PATHS', '', '', ' CFG_CORE_HEAP_SIZE=3D131072 CFG_TEE_BENCHMARK=3Dn CFG=
_TEE_CORE_LOG_LEVEL=3D4 CFG_CORE_SEL1_SPMC=3Dy ', d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_%.bbappend b/meta-a=
rm/recipes-security/optee/optee-os_3.2%.bbappend
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os_%.bbappend
rename to meta-arm/recipes-security/optee/optee-os_3.2%.bbappend
diff --git a/meta-arm/recipes-security/optee/optee-test_3.2%.bbappend b/m=
eta-arm/recipes-security/optee/optee-test_3.2%.bbappend
new file mode 100644
index 00000000..c052774c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.2%.bbappend
@@ -0,0 +1,7 @@
+# Include ffa_spmc test group if the SPMC test is enabled.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy CFG_SECURE_=
PARTITION=3Dy', '' , d)}"
+
+RDEPENDS:${PN} +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
+                                              ' arm-ffa-user', '' , d)}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc =
b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index 75ddab37..3d756015 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -17,8 +17,8 @@ do_install:append() {
     dtc -I dts -O dtb -o ${D}${TS_INSTALL}/manifest/${SP_UUID}.dtb ${SP_=
DTS_FILE}
=20
     # We do not need libs and headers
-    rm -r --one-file-system ${D}${TS_INSTALL}/lib
-    rm -r --one-file-system ${D}${TS_INSTALL}/include
+    rm -rf --one-file-system ${D}${TS_INSTALL}/lib
+    rm -rf --one-file-system ${D}${TS_INSTALL}/include
 }
=20
 # Use Yocto debug prefix maps for compiling assembler.
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-co=
mmon.inc b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-comm=
on.inc
new file mode 100644
index 00000000..e357629b
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.in=
c
@@ -0,0 +1,7 @@
+DESCRIPTION =3D "Trusted Services SPMC test SPs"
+
+require ts-sp-common.inc
+
+SP_UUID =3D "${SPM_TEST${SP_INDEX}_UUID}"
+SP_DTS_FILE ?=3D "${D}${TS_INSTALL}/manifest/${SP_UUID}.dts"
+OECMAKE_SOURCEPATH=3D"${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_g=
it.bb b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb
new file mode 100644
index 00000000..4cbb970b
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb
@@ -0,0 +1,5 @@
+DESCRIPTION =3D "Trusted Services SPMC test SP1"
+
+SP_INDEX=3D"1"
+
+require ts-sp-spm-test-common.inc
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_g=
it.bb b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb
new file mode 100644
index 00000000..e6fb822b
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb
@@ -0,0 +1,6 @@
+DESCRIPTION =3D "Trusted Services SPMC test SP2"
+
+SP_INDEX=3D"2"
+
+require ts-sp-spm-test-common.inc
+
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_g=
it.bb b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb
new file mode 100644
index 00000000..ad3ee76e
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb
@@ -0,0 +1,6 @@
+DESCRIPTION =3D "Trusted Services SPMC test SP3"
+
+SP_INDEX=3D"3"
+
+require ts-sp-spm-test-common.inc
+
diff --git a/meta-arm/recipes-security/trusted-services/ts-uuid.inc b/met=
a-arm/recipes-security/trusted-services/ts-uuid.inc
index 7a39f733..c18ec5d7 100644
--- a/meta-arm/recipes-security/trusted-services/ts-uuid.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-uuid.inc
@@ -7,3 +7,6 @@ ITS_UUID         =3D "dc1eef48-b17a-4ccf-ac8b-dfcff7711b1=
4"
 SE_PROXY_UUID    =3D "46bb39d1-b4d9-45b5-88ff-040027dab249"
 SMM_GATEWAY_UUID =3D "ed32d533-99e6-4209-9cc0-2d72cdd998a7"
 STORAGE_UUID     =3D "751bf801-3dde-4768-a514-0f10aeed1790"
+SPM_TEST1_UUID   =3D "5c9edbc3-7b3a-4367-9f83-7c191ae86a37"
+SPM_TEST2_UUID   =3D "7817164c-c40c-4d1a-867a-9bb2278cf41a"
+SPM_TEST3_UUID   =3D "23eb0100-e32a-4497-9052-2f11e584afa6"
\ No newline at end of file
--=20
2.39.1.windows.1


