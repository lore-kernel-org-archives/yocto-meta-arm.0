Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05353C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 18:56:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3606.1711133761405102329
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Mar 2024 11:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33190C15
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Mar 2024 11:56:35 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC50A3F67D
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Mar 2024 11:56:00 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/sbsa-acs: remove unreferenced patch
Date: Fri, 22 Mar 2024 14:55:59 -0400
Message-Id: <20240322185600.11647-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Mar 2024 18:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5483

A patch was not removed when sbsa-acs was updated.  Remove and everyone
is now happy.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...x-for-mismatch-in-function-prototype.patch | 31 -------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-misma=
tch-in-function-prototype.patch

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-mismatch-in-=
function-prototype.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-fo=
r-mismatch-in-function-prototype.patch
deleted file mode 100644
index 0babf2fc01bb..000000000000
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-mismatch-in-functio=
n-prototype.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 42cc39fdea21177e82b6cec138c06726242673f7 Mon Sep 17 00:00:00 2001
-From: Srikar Josyula <srikar.josyula@arm.com>
-Date: Tue, 25 Jul 2023 12:55:04 +0530
-Subject: [PATCH] Fix for mismatch in function prototype
-
- - Mismatch between function prototype and definition
-   causing build failure with GCC 13.1.1
- - Fixed the function prototype for val_get_exerciser_err_info
-
-Signed-off-by: Srikar Josyula <srikar.josyula@arm.com>
-
-Upstream-Status: Backport
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
----
- val/include/sbsa_avs_exerciser.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/val/include/sbsa_avs_exerciser.h b/val/include/sbsa_avs_exe=
rciser.h
-index 4b2c62b089f5..7c0e3d0fb58f 100644
---- a/val/include/sbsa_avs_exerciser.h
-+++ b/val/include/sbsa_avs_exerciser.h
-@@ -118,7 +118,7 @@ uint32_t val_exerciser_ops(EXERCISER_OPS ops, uint64=
_t param, uint32_t instance)
- uint32_t val_exerciser_get_data(EXERCISER_DATA_TYPE type, exerciser_dat=
a_t *data, uint32_t instance);
- uint32_t val_exerciser_execute_tests(uint32_t level);
- uint32_t val_exerciser_get_bdf(uint32_t instance);
--uint32_t val_get_exerciser_err_info(uint32_t type);
-+uint32_t val_get_exerciser_err_info(EXERCISER_ERROR_CODE type);
-=20
- uint32_t e001_entry(void);
- uint32_t e002_entry(void);
--=20
2.39.3 (Apple Git-146)


