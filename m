Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DA2FA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:24:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11953.1666369481902734513
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 09:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A534D1063;
	Fri, 21 Oct 2022 09:24:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F20593F792;
	Fri, 21 Oct 2022 09:24:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp/linux-arm64-ack: fix malformed Upstream-Status tag
Date: Fri, 21 Oct 2022 17:24:34 +0100
Message-Id: <20221021162434.1559393-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021162434.1559393-1-ross.burton@arm.com>
References: <20221021162434.1559393-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 16:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3998

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../tc/0025-perf-arm-cmn-Support-new-IP-features.patch         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
25-perf-arm-cmn-Support-new-IP-features.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.15/tc/0025-perf-arm-cmn-Support-new-IP-feature=
s.patch
index fc9e5839..8c3c7c15 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0025-perf=
-arm-cmn-Support-new-IP-features.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0025-perf=
-arm-cmn-Support-new-IP-features.patch
@@ -13,7 +13,8 @@ it around as necessary, and handling (most of) the new =
choices.
 Signed-off-by: Robin Murphy <robin.murphy@arm.com>
 Link: https://lore.kernel.org/r/e58b495bcc7deec3882be4bac910ed0bf6979674=
.1638530442.git.robin.murphy@arm.com
 Signed-off-by: Will Deacon <will@kernel.org>
-Upstream-Status =3D Backport [https://lore.kernel.org/r/e58b495bcc7deec3=
882be4bac910ed0bf6979674.1638530442.git.robin.murphy@arm.com]
+
+Upstream-Status: Backport [https://lore.kernel.org/r/e58b495bcc7deec3882=
be4bac910ed0bf6979674.1638530442.git.robin.murphy@arm.com]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 ---
--=20
2.34.1


