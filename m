Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B316ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 17:22:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1399.1663003338495233497
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 10:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q5EkDVjL;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62541078b7=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28CFYD3o031581
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Sep 2022 10:22:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=nmJHtLfLijQp373aoFUv3cMp5dd24tpIYqoM9368Sbo=;
 b=Q5EkDVjLImHzzj4gI/r0Hm9FZdxhmA6gh5KqCXyhywrPtHimW+qg7x0fia+WauibQhWX
 mUZabnVAKEZIujN9uHFyhQE3iPvIrrUbDoEB3RYdNqMHhztYkjduUgn7Xz+Ar9J3ePa1
 VsmgztK4YvMvnJ0YbFDHL2gbpPDDAcyT52rrBgUz6yWSYwJ11xsPKysSm6Xmf1AHUWZx
 2v9EDhNqm6gLY5QW+9fhfHL0VBNdlDnDwT1ITVHoWyvBKAQYS/Op/U/+J+uZJqYExHH2
 c1I5zErZnhTiSVQYYGJ1Sx9vjPwjUjt2frht0rX5Cly2Z+i2l0TI174GwUDCfsP10ukM Kg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jgt3ksxnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Sep 2022 10:22:17 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 12 Sep 2022 10:22:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 12 Sep 2022 10:22:17 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.209.73) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 12 Sep 2022 10:22:17 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <meta-arm@lists.yoctoproject.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-arm][PATCH 1/1] arm/packagegroup-ts-tests: fix parse error
Date: Mon, 12 Sep 2022 10:22:17 -0700
Message-ID: <20220912172217.1703643-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VSJG5AgPNgL2qtLtdeN5112E_8LF7tKO
X-Proofpoint-GUID: VSJG5AgPNgL2qtLtdeN5112E_8LF7tKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_12,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=836 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120059
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Sep 2022 17:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3770

PACKAGE_ARCH must be set before inheriting packagegroup.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-security/packagegroups/packagegroup-ts-tests.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb b/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb
index 72ba33f..b9c6507 100644
--- a/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb
+++ b/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Trusted Services test/demo linux tools"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit packagegroup
 
 COMPATIBLE_HOST = "aarch64.*-linux"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PACKAGES = "${PN} ${PN}-psa"
 
 RDEPENDS:${PN} = "\
-- 
2.25.1


