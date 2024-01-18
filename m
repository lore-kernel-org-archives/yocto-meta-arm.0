Return-Path: <vikas.katariya@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC01C47DD6
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 17:05:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18560.1705597498650305691
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jan 2024 09:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vikas.katariya@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 923581042;
	Thu, 18 Jan 2024 09:05:43 -0800 (PST)
Received: from e125904.cambridge.arm.com (e125904.cambridge.arm.com [10.1.199.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC5513F5A1;
	Thu, 18 Jan 2024 09:04:56 -0800 (PST)
From: vikas.katariya@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vikas Katariya <vikas.katariya@arm.com>
Subject: [PATCH 2/2] arm-bsp/linux-yocto: Remove EOL Linux yocto kernel 6.5
Date: Thu, 18 Jan 2024 17:04:45 +0000
Message-Id: <20240118170445.564619-3-vikas.katariya@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118170445.564619-1-vikas.katariya@arm.com>
References: <20240118170445.564619-1-vikas.katariya@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jan 2024 17:05:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5343

From: Vikas Katariya <vikas.katariya@arm.com>

Since there are no platforms using this version, this reciepe can
be removed.

Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>
---
 .../recipes-kernel/linux/linux-yocto_6.5.bb   | 37 -------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.5.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.5.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_6.5.bb
deleted file mode 100644
index a5cc5461..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.5.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-KBRANCH ?=3D "v6.5/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# CVE exclusions
-include recipes-kernel/linux/cve-exclusion.inc
-include recipes-kernel/linux/cve-exclusion_6.5.inc
-
-SRCREV_machine ?=3D "e53dc7514de7d2fbe0f80547a50c0542928e2d11"
-SRCREV_meta ?=3D "3b1f87ec237ec3ad9acffb3d75c55efe958085dc"
-
-# set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
-# get the <version>/base branch, which is pure upstream -stable, and the=
 same
-# meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
-# normal PREFERRED_VERSION settings.
-BBCLASSEXTEND =3D "devupstream:target"
-SRCREV_machine:class-devupstream ?=3D "4631960b4700dd53f5cebb4f7055fd00c=
cd556ce"
-PN:class-devupstream =3D "linux-yocto-upstream"
-KBRANCH:class-devupstream =3D "v6.5/base"
-
-SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH};protocol=3Dhttps \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.5;destsuffix=3D${KMETA};protocol=3Dhttps"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
-LINUX_VERSION ?=3D "6.5.13"
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
est", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc", "", d)}"
--=20
2.25.1


