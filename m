Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE89FA373E
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:24:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11970.1666369481142780908
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 09:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 050A51FB;
	Fri, 21 Oct 2022 09:24:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50DD63F792;
	Fri, 21 Oct 2022 09:24:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-bsp/hafnium: add missing Upstream-Status
Date: Fri, 21 Oct 2022 17:24:33 +0100
Message-Id: <20221021162434.1559393-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 16:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3997

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../hafnium/files/tc/0003-tc-increase-heap-pages.patch           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-h=
eap-pages.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-incre=
ase-heap-pages.patch
index e8670738..dfec5d83 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap-pag=
es.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap-pag=
es.patch
@@ -3,6 +3,7 @@ From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.co=
m>
 Date: Fri, 29 Apr 2022 20:07:50 +0100
 Subject: [PATCH] tc: increase heap pages
=20
+Upstream-Status: Pending
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 ---
  /BUILD.gn | 2 +-
--=20
2.34.1


