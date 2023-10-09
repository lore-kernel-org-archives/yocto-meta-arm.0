Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49471E95A96
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 00:51:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51070.1696812668585491026
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 08 Oct 2023 17:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C98C8C15
	for <meta-arm@lists.yoctoproject.org>; Sun,  8 Oct 2023 17:51:47 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 536FD3F5A1
	for <meta-arm@lists.yoctoproject.org>; Sun,  8 Oct 2023 17:51:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/linux-yocto: add recipe for v6.4 kernel
Date: Sun,  8 Oct 2023 19:50:57 -0500
Message-Id: <20231009005058.3858695-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Oct 2023 00:51:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5105

The v6.4 kernel is needed for some platforms in meta-arm-bsp.
Temporarily add it here to give those machines enough time to
update to the latest version.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/linux-yocto_6.4.bb   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb
new file mode 100644
index 00000000..096cc24e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -0,0 +1,37 @@
+KBRANCH ?=3D "v6.4/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_6.4.inc
+
+SRCREV_machine ?=3D "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_meta ?=3D "13efe44fe9dd2626eaf6552288ea31770ec71cf1"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the=
 same
+# meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND =3D "devupstream:target"
+SRCREV_machine:class-devupstream ?=3D "ae4e4fc35b4258626644c162a702e2bce=
2b79190"
+PN:class-devupstream =3D "linux-yocto-upstream"
+KBRANCH:class-devupstream =3D "v6.4/base"
+
+SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH};protocol=3Dhttps \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.4;destsuffix=3D${KMETA};protocol=3Dhttps"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+LINUX_VERSION ?=3D "6.4.16"
+
+PV =3D "${LINUX_VERSION}+git"
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
2.30.2


