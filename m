Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2B9C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:23:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11305.1699964623257908875
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 04:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 235B2C15;
	Tue, 14 Nov 2023 04:24:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5850E3F6C4;
	Tue, 14 Nov 2023 04:23:42 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/optee-os: update Upstream-Status tags
Date: Tue, 14 Nov 2023 12:23:39 +0000
Message-Id: <20231114122339.185182-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Nov 2023 12:23:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5241

From: Ross Burton <ross.burton@arm.com>

Fix some formatting, and switch Accepted to Backport.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../optee-os/corstone1000/0001-Handle-logging-syscall.patch  | 2 +-
 .../files/optee-os/n1sdp/0003-Handle-logging-syscall.patch   | 2 +-
 .../0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch           | 5 +++--
 .../0006-core-ffa-add-TOS_FW_CONFIG-handling.patch           | 5 +++--
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0001-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/opt=
ee/files/optee-os/corstone1000/0001-Handle-logging-syscall.patch
index 9c1d7816..58ba2afd 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
1-Handle-logging-syscall.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
1-Handle-logging-syscall.patch
@@ -4,7 +4,7 @@ Date: Thu, 31 Aug 2023 10:51:54 +0100
 Subject: [PATCH] Handle logging syscall
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status:  Inappropriate [Other]
+Upstream-Status: Pending [upstreamed differently in 280b6a3]
 ---
  core/arch/arm/kernel/spmc_sp_handler.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
3-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/file=
s/optee-os/n1sdp/0003-Handle-logging-syscall.patch
index 9d305adc..0955d99f 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-Handl=
e-logging-syscall.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-Handl=
e-logging-syscall.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Pending [upstreamed differently in 280b6a3]
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
=20
 From b3fde6c2e1a950214f760ab9f194f3a6572292a8 Mon Sep 17 00:00:00 2001
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-cor=
e-arm-S-EL1-SPMC-boot-ABI-update.patch b/meta-arm-bsp/recipes-security/op=
tee/optee-os-3.20.0/0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch
index 381cad9a..e6fe7168 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-core-arm-S=
-EL1-SPMC-boot-ABI-update.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-core-arm-S=
-EL1-SPMC-boot-ABI-update.patch
@@ -20,10 +20,11 @@ change in TF-A ("feat(qemu): update abi between spmd =
and spmc") [2].
     file. Used by Trusted OS (BL32), that is, OP-TEE in this case
 Link: [2] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/co=
mmit/?id=3D25ae7ad1878244f78206cc7c91f7bdbd267331a1
=20
-Upstream-Status: Accepted
-
 Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Backport [f1f431c7a92671b4fa397976d381cc5ad8adacc4]
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
 ---
  core/arch/arm/kernel/boot.c      |  8 +++++++-
  core/arch/arm/kernel/entry_a64.S | 17 ++++++++---------
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0006-cor=
e-ffa-add-TOS_FW_CONFIG-handling.patch b/meta-arm-bsp/recipes-security/op=
tee/optee-os-3.20.0/0006-core-ffa-add-TOS_FW_CONFIG-handling.patch
index 5421b10e..da0422b9 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0006-core-ffa-a=
dd-TOS_FW_CONFIG-handling.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0006-core-ffa-a=
dd-TOS_FW_CONFIG-handling.patch
@@ -9,10 +9,11 @@ This commit adds functionality to save the TOS_FW_CONFI=
G too, so we can
 retrieve it later. This is necessary for the CFG_CORE_SEL1_SPMC use
 case, because the SPMC manifest is passed in this DT.
=20
-Upstream-Status: Accepted
-
 Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
 Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
+
+Upstream-Status: Backport [809fa817ae6331d98b55f7afaa3c20f8407822e4]
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
 ---
  core/arch/arm/kernel/boot.c               | 60 ++++++++++++++++++++++-
  core/arch/arm/kernel/entry_a32.S          |  3 +-
--=20
2.34.1


