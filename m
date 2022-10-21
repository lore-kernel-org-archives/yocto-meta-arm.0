Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0F0FA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:22:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11826.1666369365791208339
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 09:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABC3D1063;
	Fri, 21 Oct 2022 09:22:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF78E3F792;
	Fri, 21 Oct 2022 09:22:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/hafnium: add missing Upstream-Status
Date: Fri, 21 Oct 2022 17:22:43 +0100
Message-Id: <20221021162243.1410088-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 16:22:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3996

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../hafnium/hafnium/0001-define-_Noreturn-if-needed.patch        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-i=
f-needed.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noretu=
rn-if-needed.patch
index 6f61177a..7c6a8b2a 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-neede=
d.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-neede=
d.patch
@@ -10,6 +10,7 @@ Fixes
 noreturn void panic(const char *fmt, ...);
 ^
=20
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
 ---
--=20
2.34.1


