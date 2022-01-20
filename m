Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90447C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 19:12:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.618.1642705944962089168
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 11:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64B2311B3
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 11:12:24 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8E403F774
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 11:12:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/secure-partitions: add missing Signed-off-by tags
 to patches
Date: Thu, 20 Jan 2022 19:12:21 +0000
Message-Id: <20220120191221.1955545-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120191221.1955545-1-ross.burton@arm.com>
References: <20220120191221.1955545-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 19:12:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2884

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0004-Update-mm-comm-buffer-region-in-dts-file.patch         | 2 +-
 .../secure-partitions/0005-Configure-NV-storage-macro.patch     | 2 +-
 .../secure-partitions/0006-Use-device-region.patch              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0004-Update-mm-comm-buffer-region-in-dts-file.patch b/meta-arm-bsp/r=
ecipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-bu=
ffer-region-in-dts-file.patch
index 4636af13..a91355c0 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/00=
04-Update-mm-comm-buffer-region-in-dts-file.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/00=
04-Update-mm-comm-buffer-region-in-dts-file.patch
@@ -1,5 +1,5 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
-Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
=20
 From 1f75194e884a1795c3523f41dc0912dc5068e525 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0005-Configure-NV-storage-macro.patch b/meta-arm-bsp/recipes-securit=
y/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patc=
h
index 524054b8..bdf71e68 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/00=
05-Configure-NV-storage-macro.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/00=
05-Configure-NV-storage-macro.patch
@@ -1,5 +1,5 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
-Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
=20
 From 634b8e09e9c072b41dfe92e4ca08a685cac9e998 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0006-Use-device-region.patch b/meta-arm-bsp/recipes-security/trusted=
-services/secure-partitions/0006-Use-device-region.patch
index a6d444e9..7087850b 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/00=
06-Use-device-region.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/00=
06-Use-device-region.patch
@@ -1,5 +1,5 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
-Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
=20
 From 6bb7e118c15c97d4554a0a7f6d3fc8e9792ca65c Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
--=20
2.25.1


