Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1249.1588219833811457844
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 21:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB08940C2F;
	Thu, 30 Apr 2020 04:10:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJ1_65Sn7sx0; Thu, 30 Apr 2020 04:10:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A111A40A9E;
	Thu, 30 Apr 2020 04:10:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BF726172BDF;
	Thu, 30 Apr 2020 00:10:30 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/4] tcmode-external-arm: drop unnecessary CPPFLAGS and LDFLAGS adjustments
Date: Thu, 30 Apr 2020 00:10:25 -0400
Message-Id: <1588219828-34791-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

These were there from the very beginning and they were used as crutches to
prop up the build by pointing directly to the external toolchain location,
in case early versions of external-arm-toolchain missed staging/packaging
something from there.

First of all, it is unnecessary to adjust CPPFLAGS and LDFLAGS in this way,
as external-arm-toolchain is supposed to stage everything needed from the
toolchain in internal sysroot.

And second, these settings can be harmful and conflict with component's own
CPPFLAGS/LDFLAGS. For example, OpenCV 4.1 fails to link internal libraries
because of incorrect -Wl,-rpath-link passed down the build.

After dropping these, I was able to verify that everything still builds,
including BSP, Wayland/Weston, Qt5, gstreamer, OpenCV, etc for Aarch64 and
Armv7a platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 8ddaf53..9171380 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -44,8 +44,6 @@ PREFERRED_PROVIDER_glibc-thread-db = "external-arm-toolchain"
 PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
 PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
-TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include "
-TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib "
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
 
-- 
2.7.4

