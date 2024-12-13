Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6988E77182
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:56:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18947.1734105372672314620
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 07:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B92B1595
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 07:56:40 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E16FF3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 07:56:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/linux-yocto: add temporary 6.10 recipe
Date: Fri, 13 Dec 2024 15:56:08 +0000
Message-ID: <20241213155608.726466-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213155608.726466-1-ross.burton@arm.com>
References: <20241213155608.726466-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 15:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6289

oe-core has removed 6.10, so until corstone1000 has upgraded to 6.12 add
it temporarily to meta-arm-bsp.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-kernel/linux/linux-yocto_6.10.bb  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.10.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.10.bb b/meta=
-arm-bsp/recipes-kernel/linux/linux-yocto_6.10.bb
new file mode 100644
index 00000000..921ff836
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -0,0 +1,42 @@
+KBRANCH ?=3D "v6.10/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_6.10.inc
+
+SRCREV_machine ?=3D "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_meta ?=3D "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the=
 same
+# meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND =3D "devupstream:target"
+SRCREV_machine:class-devupstream ?=3D "47c2f92131c47a37ea0e3d8e1a4e4c82a=
9b473d4"
+PN:class-devupstream =3D "linux-yocto-upstream"
+KBRANCH:class-devupstream =3D "v6.10/base"
+
+SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH};protocol=3Dhttps \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.10;destsuffix=3D${KMETA};protocol=3Dhttps"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+LINUX_VERSION ?=3D "6.10.14"
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
est", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", ""=
, d)}"
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("KERNEL_DEBUG", "True"=
, " features/reproducibility/reproducibility.scc features/debug/debug-btf=
.scc", "", d)}"
+# libteam ptests from meta-oe needs it
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/net/team/team.scc", "", d)}"
+# openl2tp tests from meta-networking needs it
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " cgl/cfg/net/l2tp.scc", "", d)}"
--=20
2.43.0


