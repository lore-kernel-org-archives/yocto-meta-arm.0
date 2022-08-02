Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E424C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 06:28:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3141.1659421694611068579
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 23:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mepW765G;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52131291da=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2726OnxM010450
	for <meta-arm@lists.yoctoproject.org>; Mon, 1 Aug 2022 23:28:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=do8IsbRJF4zFd7DRDhUU/1fpxVBjvvoyDOLkbspvXb0=;
 b=mepW765Gn/aq0ISlkV/T+DTK2H5Y88dO7W48dXOQfqtD2Anwi3pvfB2RKyHwk3FCJmQj
 hxl3Kb6MGd0NTvE4cuxTE+soFPoWKz1u0ygaY7j/IbDPGgT9WyoTYWXrMwbTrAkfJ61v
 2dXD12RWD4JB/334KJOlBJGdRjC7ff0oqTFgs576OKihL22yY1tDyVDqNotkSq9YbsGo
 onha0FesENufJA9uns8kbFlOOdj5BkhzSQgP9GaEFlK9tntmoq2dUUdkWU/jrunScu/o
 LV1bCMsHKIjYzX4UYjqRRnYQc5/N9bhiasu5KZu/FtE8y8SDXAdYI07s6FGMpNXgdIgO nQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hn45jsvrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Mon, 01 Aug 2022 23:28:13 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Aug 2022 23:28:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 1 Aug 2022 23:28:08 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 1 Aug 2022 23:28:08 -0700
From: <changqing.li@windriver.com>
To: <meta-arm@lists.yoctoproject.org>
Subject: [kirkstone][meta-arm][PATCH] optee.inc: update setting for OPTEE_ARCH
Date: Tue, 2 Aug 2022 14:28:07 +0800
Message-ID: <20220802062807.4039040-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XTJLjILi1GuOFcu0Xqau7BAd9xU_qvxW
X-Proofpoint-ORIG-GUID: XTJLjILi1GuOFcu0Xqau7BAd9xU_qvxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_03,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 mlxlogscore=664
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208020029
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Aug 2022 06:28:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3634

From: Changqing Li <changqing.li@windriver.com>

lib32-optee-os do_compile failed since OPTEE_ARCH is not set correctly.
In file included from lib/libutee/include/link.h:9,
                 from lib/libutee/arch/arm/tcb.c:37:
lib/libutee/include/elf.h:67:2: error: #error Unknown architecture
   67 | #error Unknown architecture
      |  ^~~~~
In file included from lib/libutee/arch/arm/tcb.c:37:
lib/libutee/include/link.h:13:9: error: unknown type name 'Elf_Addr'
   13 |         Elf_Addr dlpi_addr;                     /* module relocation base */

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-arm/recipes-security/optee/optee.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index beae366..2ad7c95 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -9,7 +9,7 @@ OPTEEMACHINE ?= "${MACHINE}"
 OPTEEMACHINE:aarch64:qemuall ?= "vexpress-qemu_armv8a"
 
 OPTEE_ARCH = "null"
-OPTEE_ARCH:armv7a = "arm32"
+OPTEE_ARCH:arm = "arm32"
 OPTEE_ARCH:aarch64 = "arm64"
 OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
 
-- 
2.25.1


