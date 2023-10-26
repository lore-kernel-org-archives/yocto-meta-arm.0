Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372D9C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:19:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.204747.1698337194667405770
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 09:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4A962F4;
	Thu, 26 Oct 2023 09:20:35 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 96CFB3F64C;
	Thu, 26 Oct 2023 09:19:53 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-m: update the upstream status of the out-of-tree patches
Date: Thu, 26 Oct 2023 17:19:47 +0100
Message-Id: <20231026161947.2463621-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231026161947.2463621-1-emekcan.aras@arm.com>
References: <20231026161947.2463621-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 16:19:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5183

From: Emekcan Aras <emekcan.aras@arm.com>

Updates the status of the patches on the trusted-firmware-m for
corstone1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...1-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch | 2 +-
 .../0002-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch     | 2 +-
 ...3-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch | 2 +-
 .../0005-Platform-corstone1000-add-unique-firmware-GUID.patch   | 2 +-
 .../0006-Platform-Corstone1000-Enable-Signed-Capsule.patch      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-=
corstone1000-Increase-BL2-size-in-flash-lay.patch
index 98dabbe9..4f00ea28 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Platform: corstone1000: Increase BL2 siz=
e in flash layout
 Increases BL2 size to align with the flash page size in corstone1000.
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24103]
=20
 ---
  platform/ext/target/arm/corstone1000/partition/flash_layout.h | 2 +-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-Corstone=
1000-Increase-BL2_DATA_SIZE.patch
index d348d02d..6bbd66fd 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
@@ -7,7 +7,7 @@ Increases BL2_DATA_SIZE to accommodate the changes in
 metadata_write/read.
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24103]
=20
 ---
  platform/ext/target/arm/corstone1000/partition/region_defs.h | 3 ++-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-=
Corstone1000-Calculate-the-new-CRC32-value-.patch
index bf7aba8d..7a07c0c1 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
@@ -12,7 +12,7 @@ update since the tfm bl1 does not sync metadata and nv =
counters in OTP during
 the boot anymore.
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24104/7]
=20
 ---
  .../arm/corstone1000/fw_update_agent/fwu_agent.c       | 10 +++++++---
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-Platform-corstone1000-add-unique-firmware-GUID.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corsto=
ne1000-add-unique-firmware-GUID.patch
index 2f5ba04b..e4eba624 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-corstone1000-add-unique-firmware-GUID.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-corstone1000-add-unique-firmware-GUID.patch
@@ -5,8 +5,8 @@ Subject: [PATCH] Platform corstone1000 add unique firmwar=
e GUID
=20
 Add unique Corstone-1000 firmware GUID
=20
-Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24132/3]
 ---
  .../target/arm/corstone1000/fw_update_agent/fwu_agent.c   | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-Corstone1000-Enable-Signed-Capsule.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-Corstone1=
000-Enable-Signed-Capsule.patch
index 49c336de..f805a44d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Enable-Signed-Capsule.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Enable-Signed-Capsule.patch
@@ -7,7 +7,7 @@ Enables signed capsule update and adjusts the necessary s=
tructs (fmp_payload_hea
 , image_auth, etc.) to comply with the new capsule generation tool (mkef=
icapsule).
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/24131/3]
 ---
  .../fw_update_agent/uefi_capsule_parser.c     | 25 +++++++++++--------
  .../fw_update_agent/uefi_capsule_parser.h     |  2 ++
--=20
2.25.1


