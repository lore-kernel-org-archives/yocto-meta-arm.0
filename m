Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01DFC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 13:57:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78653.1752501471949402572
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 06:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E223E1BC0
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 06:57:41 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6DBB3F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 06:57:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/arch-armv*: Add basic tunes for newly added ARM ISAs
Date: Mon, 14 Jul 2025 09:57:40 -0400
Message-Id: <20250714135740.56280-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 13:57:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6610

Add some basic tunes for the newly added Arm architectures in GCC.
These will need to be further fleshed out before submitting this to OE
Core, but should be sufficient to use for machines that need them in the
interim.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/arm/arch-armv8-7a.inc     | 14 ++++++++++++++
 .../conf/machine/include/arm/arch-armv8-8a.inc     | 14 ++++++++++++++
 .../conf/machine/include/arm/arch-armv8-9a.inc     | 14 ++++++++++++++
 .../conf/machine/include/arm/arch-armv9-1a.inc     | 13 +++++++++++++
 .../conf/machine/include/arm/arch-armv9-2a.inc     | 13 +++++++++++++
 .../conf/machine/include/arm/arch-armv9-3a.inc     | 13 +++++++++++++
 .../conf/machine/include/arm/arch-armv9-4a.inc     | 13 +++++++++++++
 .../conf/machine/include/arm/arch-armv9-5a.inc     | 13 +++++++++++++
 8 files changed, 107 insertions(+)
 create mode 100644 meta-arm/conf/machine/include/arm/arch-armv8-7a.inc
 create mode 100644 meta-arm/conf/machine/include/arm/arch-armv8-8a.inc
 create mode 100644 meta-arm/conf/machine/include/arm/arch-armv8-9a.inc
 create mode 100644 meta-arm/conf/machine/include/arm/arch-armv9-1a.inc
 create mode 100644 meta-arm/conf/machine/include/arm/arch-armv9-2a.inc
 create mode 100644 meta-arm/conf/machine/include/arm/arch-armv9-3a.inc
 create mode 100644 meta-arm/conf/machine/include/arm/arch-armv9-4a.inc
 create mode 100644 meta-arm/conf/machine/include/arm/arch-armv9-5a.inc

diff --git a/meta-arm/conf/machine/include/arm/arch-armv8-7a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv8-7a.inc
new file mode 100644
index 000000000000..6039baca3568
--- /dev/null
+++ b/meta-arm/conf/machine/include/arm/arch-armv8-7a.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?=3D "armv8-7a"
+
+TUNEVALID[armv8-7a] =3D "Enable instructions for ARMv8.7-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-7a'=
, ' -march=3Darmv8.7-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-7a',=
 'armv8-7a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES +=3D "armv8-7a"
+ARMPKGARCH:tune-armv8-7a                    ?=3D "armv8-7a"
+TUNE_FEATURES:tune-armv8-7a                  =3D "aarch64 armv8-7a"
+PACKAGE_EXTRA_ARCHS:tune-armv8-7a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-7a"
+BASE_LIB:tune-armv8-7a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv8-8a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv8-8a.inc
new file mode 100644
index 000000000000..5694330a1d22
--- /dev/null
+++ b/meta-arm/conf/machine/include/arm/arch-armv8-8a.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?=3D "armv8-8a"
+
+TUNEVALID[armv8-8a] =3D "Enable instructions for ARMv8.8-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-8a'=
, ' -march=3Darmv8.8-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-8a',=
 'armv8-8a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES +=3D "armv8-8a"
+ARMPKGARCH:tune-armv8-8a                    ?=3D "armv8-8a"
+TUNE_FEATURES:tune-armv8-8a                  =3D "aarch64 armv8-8a"
+PACKAGE_EXTRA_ARCHS:tune-armv8-8a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-8a"
+BASE_LIB:tune-armv8-8a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv8-9a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv8-9a.inc
new file mode 100644
index 000000000000..9c79658d3077
--- /dev/null
+++ b/meta-arm/conf/machine/include/arm/arch-armv8-9a.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?=3D "armv8-9a"
+
+TUNEVALID[armv8-9a] =3D "Enable instructions for ARMv8.9-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-9a'=
, ' -march=3Darmv8.9-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-9a',=
 'armv8-9a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES +=3D "armv8-9a"
+ARMPKGARCH:tune-armv8-9a                    ?=3D "armv8-9a"
+TUNE_FEATURES:tune-armv8-9a                  =3D "aarch64 armv8-9a"
+PACKAGE_EXTRA_ARCHS:tune-armv8-9a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-9a"
+BASE_LIB:tune-armv8-9a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-1a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-1a.inc
new file mode 100644
index 000000000000..c42b5c00a9e4
--- /dev/null
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-1a.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?=3D "armv9-1a"
+
+TUNEVALID[armv9-1a] =3D "Enable instructions for ARMv9.1-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-1a'=
, ' -march=3Darmv9.1-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-1a',=
 'armv9-1a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv9a.inc
+
+AVAILTUNES                                  +=3D "armv9-1a"
+ARMPKGARCH:tune-armv9-1a                    ?=3D "armv9-1a"
+TUNE_FEATURES:tune-armv9-1a                  =3D "aarch64 armv9-1a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-1a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-1a"
+BASE_LIB:tune-armv9-1a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-2a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-2a.inc
new file mode 100644
index 000000000000..211dac527f85
--- /dev/null
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-2a.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?=3D "armv9-2a"
+
+TUNEVALID[armv9-2a] =3D "Enable instructions for ARMv9.2-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-2a'=
, ' -march=3Darmv9.2-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-2a',=
 'armv9-2a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv9a.inc
+
+AVAILTUNES                                  +=3D "armv9-2a"
+ARMPKGARCH:tune-armv9-2a                    ?=3D "armv9-2a"
+TUNE_FEATURES:tune-armv9-2a                  =3D "aarch64 armv9-2a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-2a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-2a"
+BASE_LIB:tune-armv9-2a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-3a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-3a.inc
new file mode 100644
index 000000000000..bdd8bb95388a
--- /dev/null
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-3a.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?=3D "armv9-3a"
+
+TUNEVALID[armv9-3a] =3D "Enable instructions for ARMv9.3-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-3a'=
, ' -march=3Darmv9.3-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-3a',=
 'armv9-3a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv9a.inc
+
+AVAILTUNES                                  +=3D "armv9-3a"
+ARMPKGARCH:tune-armv9-3a                    ?=3D "armv9-3a"
+TUNE_FEATURES:tune-armv9-3a                  =3D "aarch64 armv9-3a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-3a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-3a"
+BASE_LIB:tune-armv9-3a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-4a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-4a.inc
new file mode 100644
index 000000000000..88c907c85d14
--- /dev/null
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-4a.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?=3D "armv9-4a"
+
+TUNEVALID[armv9-4a] =3D "Enable instructions for ARMv9.4-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-4a'=
, ' -march=3Darmv9.4-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-4a',=
 'armv9-4a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv9a.inc
+
+AVAILTUNES                                  +=3D "armv9-4a"
+ARMPKGARCH:tune-armv9-4a                    ?=3D "armv9-4a"
+TUNE_FEATURES:tune-armv9-4a                  =3D "aarch64 armv9-4a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-4a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-4a"
+BASE_LIB:tune-armv9-4a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-5a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-5a.inc
new file mode 100644
index 000000000000..7202418b5dce
--- /dev/null
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-5a.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?=3D "armv9-5a"
+
+TUNEVALID[armv9-5a] =3D "Enable instructions for ARMv9.5-a"
+TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-5a'=
, ' -march=3Darmv9.5-a', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-5a',=
 'armv9-5a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv9a.inc
+
+AVAILTUNES                                  +=3D "armv9-5a"
+ARMPKGARCH:tune-armv9-5a                    ?=3D "armv9-5a"
+TUNE_FEATURES:tune-armv9-5a                  =3D "aarch64 armv9-5a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-5a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-5a"
+BASE_LIB:tune-armv9-5a                       =3D "lib64"
--=20
2.39.5 (Apple Git-154)


