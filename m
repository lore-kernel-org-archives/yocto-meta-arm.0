Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06E0E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:35:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20267.1736256909382295093
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 05:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42F4E15A1;
	Tue,  7 Jan 2025 05:35:37 -0800 (PST)
Received: from PW05BKJD.arm.com (PW05BKJD.arm.com [10.1.38.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CB8F3F673;
	Tue,  7 Jan 2025 05:35:08 -0800 (PST)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 1/1] arm-bsp/linux-yocto: corstone1000: Update to version 6.12
Date: Tue,  7 Jan 2025 13:34:54 +0000
Message-Id: <20250107133454.29502-2-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107133454.29502-1-ali.oezaslan@arm.com>
References: <20250107133454.29502-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Jan 2025 13:35:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6312

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

* Set Linux kernel preferred version for Corstone-1000 to 6.12.
* Update version listed in Corstone-1000 user guide documentation.
* Remove Linux kernel version 6.10 recipe as was only used by Corstone-10=
00.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../documentation/corstone1000/user-guide.rst |  2 +-
 .../recipes-kernel/linux/linux-yocto_6.10.bb  | 42 -------------------
 3 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.10.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 791b17de..df2a6044 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -34,7 +34,7 @@ IMAGE_CMD:wic[vardeps] +=3D "GRUB_LINUX_APPEND"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "6.10.%"
+PREFERRED_VERSION_linux-yocto ?=3D "6.12.%"
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPE:firmware =3D "Image.gz"
 # add FF-A support in the kernel
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 0c7b2fd1..e1e68f56 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -150,7 +150,7 @@ The provided distribution is based on `BusyBox <https=
://www.busybox.net/>`__ and
 +-----------+-----------------------------------------------------------=
-----------------------------------+
 | bbappend  | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-kernel/linux/li=
nux-yocto_%.bbappend``             |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
-| Recipe    | ``$WORKSPACE/poky/meta/recipes-kernel/linux/linux-yocto_6.=
10.bb``                            |
+| Recipe    | ``$WORKSPACE/poky/meta/recipes-kernel/linux/linux-yocto_6.=
12.bb``                            |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
 | defconfig | ``$WORKSPACE/meta-arm/meta-arm-bsp/recipes-kernel/linux/fi=
les/corstone1000/defconfig``       |
 +-----------+-----------------------------------------------------------=
-----------------------------------+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.10.bb b/meta=
-arm-bsp/recipes-kernel/linux/linux-yocto_6.10.bb
deleted file mode 100644
index 921ff836..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.10.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-KBRANCH ?=3D "v6.10/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# CVE exclusions
-include recipes-kernel/linux/cve-exclusion.inc
-include recipes-kernel/linux/cve-exclusion_6.10.inc
-
-SRCREV_machine ?=3D "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?=3D "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
-
-# set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
-# get the <version>/base branch, which is pure upstream -stable, and the=
 same
-# meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
-# normal PREFERRED_VERSION settings.
-BBCLASSEXTEND =3D "devupstream:target"
-SRCREV_machine:class-devupstream ?=3D "47c2f92131c47a37ea0e3d8e1a4e4c82a=
9b473d4"
-PN:class-devupstream =3D "linux-yocto-upstream"
-KBRANCH:class-devupstream =3D "v6.10/base"
-
-SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH};protocol=3Dhttps \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.10;destsuffix=3D${KMETA};protocol=3Dhttps"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
-LINUX_VERSION ?=3D "6.10.14"
-
-PV =3D "${LINUX_VERSION}+git"
-
-KMETA =3D "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL =3D "1"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
-KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", ""=
, d)}"
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("KERNEL_DEBUG", "True"=
, " features/reproducibility/reproducibility.scc features/debug/debug-btf=
.scc", "", d)}"
-# libteam ptests from meta-oe needs it
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/net/team/team.scc", "", d)}"
-# openl2tp tests from meta-networking needs it
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " cgl/cfg/net/l2tp.scc", "", d)}"
--=20
2.34.1


