Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99D0C3DA4A
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 12:45:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7798.1722689097650644531
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 03 Aug 2024 05:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79817DA7;
	Sat,  3 Aug 2024 05:45:22 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.12.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93F323F766;
	Sat,  3 Aug 2024 05:44:55 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-a: corstone1000: update upstream statuses
Date: Sat,  3 Aug 2024 14:44:45 +0200
Message-Id: <20240803124445.379152-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 03 Aug 2024 12:45:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5951

From: Bence Balogh <bence.balogh@arm.com>

The patches with Pending status were submitted to the upstream TF-A
repo.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../0002-fix-corstone1000-pass-spsr-value-explicitly.patch      | 2 +-
 ...03-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch | 2 +-
 ...4-fix-corstone1000-clean-the-cache-and-disable-interru.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-fix-corstone1000-pass-spsr-value-explicitly.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-a/files/corstone1000/0002-fix-corstone1000-p=
ass-spsr-value-explicitly.patch
index 4a08abb6..276d095d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-fix-corstone1000-pass-spsr-value-explicitly.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-fix-corstone1000-pass-spsr-value-explicitly.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] fix(corstone1000): pass spsr value expli=
citly
 Passes spsr value for BL32 (OPTEE) explicitly between different boot
 stages.
=20
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/30116/2]
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 ---
  .../corstone1000/common/corstone1000_bl2_mem_params_desc.c     | 3 ++-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-fix-corsto=
ne1000-remove-unused-NS_SHARED_RAM-region.patch
index 60282048..f9a0c116 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch
@@ -9,7 +9,7 @@ for BL32 image, this patch removes NS_SHARED_RAM region w=
hich is not currently u
 corstone1000 platform.
=20
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/30117/2]
 ---
  .../corstone1000/common/corstone1000_plat.c   |  1 -
  .../common/include/platform_def.h             | 19 +------------------
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0004-fix-corstone1000-clean-the-cache-and-disable-interru.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corst=
one1000-clean-the-cache-and-disable-interru.patch
index a45b6577..e92cb5f9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004=
-fix-corstone1000-clean-the-cache-and-disable-interru.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004=
-fix-corstone1000-clean-the-cache-and-disable-interru.patch
@@ -9,7 +9,7 @@ before the reset. This causes a race condition especially=
 in FVP after reset.
 This adds proper sequence before resetting the platform.
=20
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/30118/2]
 ---
  plat/arm/board/corstone1000/common/corstone1000_pm.c | 9 +++++++++
  1 file changed, 9 insertions(+)
--=20
2.25.1


