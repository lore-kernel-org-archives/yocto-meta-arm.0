Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8D1C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 19:50:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3465.1679341812368827720
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 12:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98988AD7;
	Mon, 20 Mar 2023 12:50:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B6DC3F766;
	Mon, 20 Mar 2023 12:50:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/linux-arm64-ack: update Upstream-Status tags
Date: Mon, 20 Mar 2023 19:50:09 +0000
Message-Id: <20230320195009.790018-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Mar 2023 19:50:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4493

Manually check every patch that was marked as Pending and update the
patches which are actually backports.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...3-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch | 2 +-
 .../tc/0004-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch      | 2 +-
 ...6-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch | 2 +-
 .../tc/0008-tee-add-sec_world_id-to-struct-tee_shm.patch        | 2 +-
 .../tc/0009-optee-simplify-optee_release.patch                  | 2 +-
 .../tc/0010-optee-refactor-driver-with-internal-callbacks.patch | 2 +-
 .../linux-arm64-ack-5.15/tc/0011-optee-isolate-smc-abi.patch    | 2 +-
 .../linux-arm64-ack-5.15/tc/0012-optee-add-FF-A-support.patch   | 2 +-
 .../tc/0014-optee-Fix-spelling-mistake-reclain-reclaim.patch    | 2 +-
 .../tc/0015-optee-fix-kfree-NULL-pointer.patch                  | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
03-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0003-firmware-arm_ffa-Fi=
x-uuid-argument-passed-to-ffa_par.patch
index fa7c2ef0..e6e1c00e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0003-firm=
ware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0003-firm=
ware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 03/40] firmware: arm_ffa: Fix uuid argume=
nt passed to
=20
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Ib2749ec3e02da5bb6d835f7dbf2d608c41fad1f2
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [f3c45c045e25ed52461829d2ce07954f72b6ad15]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/firmware/arm_ffa/driver.c | 2 +-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
04-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-arm64-ack-5.15/tc/0004-firmware-arm_ffa-Add-ffa_dev_ge=
t_drvdata.patch
index 752a94b1..6e118231 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0004-firm=
ware-arm_ffa-Add-ffa_dev_get_drvdata.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0004-firm=
ware-arm_ffa-Add-ffa_dev_get_drvdata.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 04/40] firmware: arm_ffa: Add ffa_dev_get=
_drvdata
=20
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Icd09d686cab9922563b1deda5276307ea5d94923
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [498af8d1678ae2351218337b47bbf3cb0fc16821]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  include/linux/arm_ffa.h | 7 ++++++-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
06-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0006-firmware-arm_ffa-Fi=
x-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
index fccf3466..5f076ebd 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0006-firm=
ware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0006-firm=
ware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
@@ -12,7 +12,7 @@ check for this return code.
=20
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: I7ef44742d53a9e75d8587d1213be98a1352f16d4
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [987756f67dee237ec35f3b249ab1ae25260c5340]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/firmware/arm_ffa/driver.c | 12 ++++++++----
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
08-tee-add-sec_world_id-to-struct-tee_shm.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.15/tc/0008-tee-add-sec_world_id-to-struct-te=
e_shm.patch
index fd5bc792..2a22b103 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0008-tee-=
add-sec_world_id-to-struct-tee_shm.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0008-tee-=
add-sec_world_id-to-struct-tee_shm.patch
@@ -9,7 +9,7 @@ secure world.
=20
 Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [9028b2463c1ea96f51c3ba53e2479346019ff6ad]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  include/linux/tee_drv.h | 7 ++++++-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
09-optee-simplify-optee_release.patch b/meta-arm-bsp/recipes-kernel/linux=
/linux-arm64-ack-5.15/tc/0009-optee-simplify-optee_release.patch
index aaf96e8e..32e05eda 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0009-opte=
e-simplify-optee_release.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0009-opte=
e-simplify-optee_release.patch
@@ -11,7 +11,7 @@ A separate optee_release_supp() is added for the suppli=
cant device.
=20
 Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [c0ab6db39a908d86ed44e8a5632548e2ec1b4dca]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/tee/optee/call.c          | 31 ++++++++++-------
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
10-optee-refactor-driver-with-internal-callbacks.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-arm64-ack-5.15/tc/0010-optee-refactor-driver-with=
-internal-callbacks.patch
index cc6863c7..8dfb68dc 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0010-opte=
e-refactor-driver-with-internal-callbacks.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0010-opte=
e-refactor-driver-with-internal-callbacks.patch
@@ -16,7 +16,7 @@ possible from the present driver.
=20
 Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [4602c5842f649da2fbd2cea3560af750cfbd59e3]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/tee/optee/call.c          |  86 +++++++++--------
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
11-optee-isolate-smc-abi.patch b/meta-arm-bsp/recipes-kernel/linux/linux-=
arm64-ack-5.15/tc/0011-optee-isolate-smc-abi.patch
index c2ac12a2..15270bb1 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0011-opte=
e-isolate-smc-abi.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0011-opte=
e-isolate-smc-abi.patch
@@ -22,7 +22,7 @@ matter of reorganizing the code.
=20
 Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [c51a564a5b48355f30309b84cdffe3f96d1ae0d3]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/tee/optee/Makefile        |    4 +-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
12-optee-add-FF-A-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux=
-arm64-ack-5.15/tc/0012-optee-add-FF-A-support.patch
index 089d1b6a..14d89d5c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0012-opte=
e-add-FF-A-support.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0012-opte=
e-add-FF-A-support.patch
@@ -16,7 +16,7 @@ enabled.
 [1] https://developer.arm.com/documentation/den0077/latest
 Acked-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [4615e5a34b95e0d81467f6d2176f19a5d184cb5d]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/tee/optee/Makefile        |   1 +
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
14-optee-Fix-spelling-mistake-reclain-reclaim.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.15/tc/0014-optee-Fix-spelling-mistake-re=
clain-reclaim.patch
index 78b5d418..3409d66b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0014-opte=
e-Fix-spelling-mistake-reclain-reclaim.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0014-opte=
e-Fix-spelling-mistake-reclain-reclaim.patch
@@ -10,7 +10,7 @@ Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
 Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
 [jw: added a fixes]
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [1b73a9e4986a4e9065bacf1e5ab2dfda17b54161]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/tee/optee/ffa_abi.c | 4 ++--
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
15-optee-fix-kfree-NULL-pointer.patch b/meta-arm-bsp/recipes-kernel/linux=
/linux-arm64-ack-5.15/tc/0015-optee-fix-kfree-NULL-pointer.patch
index 60b6bf25..090ff3be 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0015-opte=
e-fix-kfree-NULL-pointer.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0015-opte=
e-fix-kfree-NULL-pointer.patch
@@ -15,7 +15,7 @@ Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
 Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
 [jw: removed the redundant braces]
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [c23ca66a4dadb6f050dc57358bc8d57a747c35bf]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/tee/optee/ffa_abi.c | 7 +++----
--=20
2.34.1


