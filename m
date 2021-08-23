Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.31062.1629756231368331272
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Aug 2021 15:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0961B13A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Aug 2021 15:03:50 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E533A3F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Aug 2021 15:03:49 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] gem5: re-add Xen support to 5.4 kernel
Date: Mon, 23 Aug 2021 18:03:44 -0400
Message-Id: <20210823220344.5384-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210823220344.5384-1-jon.mason@arm.com>
References: <20210823220344.5384-1-jon.mason@arm.com>

The meta-virtualization support for the 5.4 kernel was removed in favor
of the 5.10 kernel.  This file was only a versioned include of a generic
file, which can be readded in the kernel bbappend.

Change-Id: I922e847a89e9f29fc69c1f537f9da088685b3de4
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
index be570ab..480c5e2 100644
--- a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
+++ b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
@@ -1,5 +1,7 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}:${THISDIR}/files:"
 
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'recipes-kernel/linux/linux-yocto_virtualization.inc', '', d)}
+
 COMPATIBLE_MACHINE:gem5-arm64 = "gem5-arm64"
 KMACHINE:gem5-arm64 = "gem5-arm64"
 SRC_URI:append:gem5-arm64 = " file://gem5-kmeta;type=kmeta;name=gem5-kmeta;destsuffix=gem5-kmeta \
-- 
2.17.1

