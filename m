Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0BDC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 12:19:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10019.1646309968331182963
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 04:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC8101424
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Mar 2022 04:19:26 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9734F3F70D
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Mar 2022 04:19:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/linux-yocto: fix patch status for the CS1K patch
Date: Thu,  3 Mar 2022 12:19:24 +0000
Message-Id: <20220303121924.901718-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 12:19:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3097

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...01-arm64-Correct-wrong-label-in-macro-__init_el2_gicv3.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-ar=
m64-Correct-wrong-label-in-macro-__init_el2_gicv3.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone1000/0001-arm64-Correct-wrong-label-in-m=
acro-__init_el2_gicv3.patch
index 1d205ade..4442e36c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-arm64-Cor=
rect-wrong-label-in-macro-__init_el2_gicv3.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-arm64-Cor=
rect-wrong-label-in-macro-__init_el2_gicv3.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Submitted
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
=20
 From 5bad687c47aa1958042e34695824da44cf28d6ff Mon Sep 17 00:00:00 2001
--=20
2.25.1


