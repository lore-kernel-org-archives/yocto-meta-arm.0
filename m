Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9E8C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 13:33:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8409.1675863236524626964
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 05:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6228B1042;
	Wed,  8 Feb 2023 05:34:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881433F703;
	Wed,  8 Feb 2023 05:33:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-bsp/linux-yocto: add 5.19 kernel recipe for N1SDP
Date: Wed,  8 Feb 2023 13:33:52 +0000
Message-Id: <20230208133353.1969816-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Feb 2023 13:33:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4372

Currently the N1SDP patches haven't been ported to 6.1 and the
port/testing isn't trivial. Until the relevant team has done the port to
6.1, carry a 5.19 kernel in meta-arm-bsp for N1SDP.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-kernel/linux/linux-yocto_5.19.bb  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb b/meta=
-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb
new file mode 100644
index 00000000..3bd4c756
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -0,0 +1,28 @@
+KBRANCH ?=3D "v5.19/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine ?=3D "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_meta ?=3D "239a6c0d3c3b046971909f1e066380465b0c331d"
+
+SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.19;destsuffix=3D${KMETA}"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+LINUX_VERSION ?=3D "5.19.17"
+
+DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
+DEPENDS +=3D "openssl-native util-linux-native"
+DEPENDS +=3D "gmp-native libmpc-native"
+
+PV =3D "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA =3D "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL =3D "1"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
+KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc", "", d)}"
--=20
2.34.1


