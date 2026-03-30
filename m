Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3043FB3D1F
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:54:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48395.1774868087514869522
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 03:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KKIY08KG;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D08D1C2B;
	Mon, 30 Mar 2026 03:54:41 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A03BF3F915;
	Mon, 30 Mar 2026 03:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774868087; bh=ycEXxNOR+ilZgmIZwyfyW7L5zO9Y0XLKD+TbceId5Ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KKIY08KGyO0vZK1VvbU/BAqg2eXhhfUcdpurwbfIpc7YKuTgWuLmnQF1OCyY0SXhA
	 VZJ6SNJoUFvL7FdYA/7wtnW3SOpoezehTf5jKR5LpJ0Ru8gvUaceUfRVY5FFbSVu/4
	 9ceab/dqLMPo3XIxyvzpOG9gGraAF8yRqErgs+Eo=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 3/7] arm-bsp/corstone1000: Add linux-yocto 6.19 kernel recipe
Date: Mon, 30 Mar 2026 11:43:13 +0100
Message-ID: <20260330105428.2580463-4-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330105428.2580463-1-michael.safwat@arm.com>
References: <20260330105428.2580463-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Mar 2026 10:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6984

linux-yocto does not currently ship a 6.19 recipe, so add a
meta-arm-bsp linux-yocto_6.19.bb that tracks linux-yocto-dev v6.19/base.

Pin SRCREV_machine to fixed revision to keep builds reproducible.

Update Corstone-1000 to prefer linux-yocto 6.19 and align
the user guide pointers accordingly.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../documentation/corstone1000/user-guide.rst |  2 +-
 .../recipes-kernel/linux/linux-yocto_6.19.bb  | 37 +++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.19.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 6f82c597..309fae61 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -37,7 +37,7 @@ IMAGE_CMD:wic[vardeps] +=3D "GRUB_LINUX_APPEND"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "6.18.%"
+PREFERRED_VERSION_linux-yocto ?=3D "6.19%"
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPE:firmware =3D "Image.gz"
 # add FF-A support in the kernel
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 18086d25..2a35f432 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -157,7 +157,7 @@ The provided distribution is based on `BusyBox <https=
://www.busybox.net/>`__ and
 +-----------+-----------------------------------------------------------=
-------------------------------------+
 | bbappend  | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-kernel/linux/=
linux-yocto_%.bbappend``             |
 +-----------+-----------------------------------------------------------=
-------------------------------------+
-| Recipe    | ``${WORKSPACE}/core/meta/recipes-kernel/linux/linux-yocto_=
6.18.bb``                            |
+| Recipe    | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-kernel/linux/=
linux-yocto_6.19.bb``                |
 +-----------+-----------------------------------------------------------=
-------------------------------------+
 | defconfig | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-kernel/linux/=
files/corstone1000/defconfig``       |
 +-----------+-----------------------------------------------------------=
-------------------------------------+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.19.bb b/meta=
-arm-bsp/recipes-kernel/linux/linux-yocto_6.19.bb
new file mode 100644
index 00000000..9c6d421b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.19.bb
@@ -0,0 +1,37 @@
+require recipes-kernel/linux/linux-yocto.inc
+
+# provide this .inc to set specific revisions
+include recipes-kernel/linux/linux-yocto-dev-revisions.inc
+
+KBRANCH =3D "v6.19/standard/base"
+KMETA =3D "kernel-meta"
+
+DEFAULT_PREFERENCE =3D "-1"
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_6.19.inc
+
+# linux-yocto-dev pinned to 6.19
+KBRANCH =3D "v6.19/standard/base"
+SRCREV_machine =3D "c042e9e14dd7efb27e9556c42db39425a2860572"
+SRCREV_meta =3D "6df48aa0b0d32d05614d7eda898f8d930a7600b7"
+
+SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-dev.git;name=3Dmachi=
ne;branch=3D${KBRANCH};protocol=3Dhttps \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dmaster;destsuffix=3D${KMETA};protocol=3Dhttps"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+
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

