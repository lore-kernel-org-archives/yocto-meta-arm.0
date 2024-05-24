Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DFCC41513
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:34:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4013.1716579287936855215
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iul2ir6U;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44OJYlMT126436
	for <meta-arm@lists.yoctoproject.org>; Fri, 24 May 2024 14:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716579287;
	bh=njNEGd/g5qFduB6ApKBf/F5Y5h3FonHcc7iV8Zm0MKA=;
	h=From:To:Subject:Date;
	b=iul2ir6Uvu/aP+8yHCl5M+LZcRTV+0+otO/eSv+RuzlzIEOzeak634YZqryyISIWh
	 2BacJgPOOcQ4EQttEuxwdAACepwJE0gjEtI2106A6M52I2OHTbjasvoNSOFlIoSnUs
	 334o3jLqQFX92nDcbQHDQ8C3ivbAv0oBUproe6ok=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44OJYljN094267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arm@lists.yoctoproject.org>; Fri, 24 May 2024 14:34:47 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 May 2024 14:34:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 May 2024 14:34:46 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44OJYkFl038560
	for <meta-arm@lists.yoctoproject.org>; Fri, 24 May 2024 14:34:46 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sAagg-0004yD-M0
	for meta-arm@lists.yoctoproject.org; Fri, 24 May 2024 14:34:46 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <meta-arm@lists.yoctoproject.org>
Subject: [meta-arm][PATCH] test-pacbti: Use UNPACKDIR
Date: Fri, 24 May 2024 14:34:46 -0500
Message-ID: <20240524193446.19066-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 May 2024 19:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5766

Fix parsing recipes error:

  Parsing recipes...
  ERROR: meta-arm/recipes-test/pacbti/test-pacbti.bb: Using S = ${WORKDIR} is no longer supported
  ERROR: Parsing halted due to errors, see error messages above

There was a change in oe-core [1] and was further discussed here [2].

[1]  https://git.openembedded.org/openembedded-core/commit/?h=master&id=32cba1cc916ad530c5e6630a927e74ca6f06289b
[2] https://lists.openembedded.org/g/openembedded-architecture/message/2007

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arm/recipes-test/pacbti/test-pacbti.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-test/pacbti/test-pacbti.bb b/meta-arm/recipes-test/pacbti/test-pacbti.bb
index 331c5854..b0ce1988 100644
--- a/meta-arm/recipes-test/pacbti/test-pacbti.bb
+++ b/meta-arm/recipes-test/pacbti/test-pacbti.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://pacbti.c;beginline=2;endline=2;md5=6ec41034e04432ee37
 
 SRC_URI = "file://pacbti.c"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile() {
     # Compile with -zforce-bti with fatal warnings, so the link fails if PAC/BTI
-- 
2.17.1


