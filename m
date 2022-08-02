Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84762C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 06:28:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3142.1659421701623640622
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 23:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RwMARZHY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52131291da=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2726O8SK027589
	for <meta-arm@lists.yoctoproject.org>; Mon, 1 Aug 2022 23:28:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ECopiRjNbFFts1Zz1LW7ufy8ZSNKFhwPuo4mI7e0lrk=;
 b=RwMARZHY9oEBeDGcANR+8js652dIZWJZzETjwogKx3sZUQQb7pornbm98tOIQUV7HP34
 o1c1rKCh96gkLVLujWesHAPh9j7ikN0CpX7wLpPPne4hsysEgUJfo0ftJOWvP3LWdc/4
 xl0d/xyUzE/ZqnqH0mpMhvbRh276i4dl6KRM7SNzCKHa2+D6iL/MDCMvcw0CRDaQlab4
 VQKdVdK3zkfadAffMz4/emIGMIjbsO17LVRhqL22kjJN6nRtnY/SkF2EVRLkdpjUEQO3
 Zx+NgpuBP49k+Z0RLr1fSLxuYNvQKGz/guv7Yfbu7zOmY1mWp5lmdKqx9Bg+yQQGMVXh Ag==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmyx4a0qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Mon, 01 Aug 2022 23:28:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Aug 2022 23:28:20 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 1 Aug 2022 23:28:20 -0700
From: <changqing.li@windriver.com>
To: <meta-arm@lists.yoctoproject.org>
Subject: [master][kirkstone][meta-arm][PATCH] optee-os.inc: support multilib
Date: Tue, 2 Aug 2022 14:28:19 +0800
Message-ID: <20220802062819.4061434-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _3SHUsm-U7o_VV5TMChXPu08L7MbNQWI
X-Proofpoint-ORIG-GUID: _3SHUsm-U7o_VV5TMChXPu08L7MbNQWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_03,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208020029
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Aug 2022 06:28:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3635

From: Changqing Li <changqing.li@windriver.com>

Run command: bitbake optee-os && bitbake lib32-optee-os
bitbake lib32-optee-os will fail with following error since
bitbake optee-os already deploy same file under the path.
RROR: lib32-optee-os-3.12.0+gitAUTOINC+3d47a131bc-r0 do_deploy: The recipe lib32-optee-os is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
  /build/tmp-glibc/deploy/images/qemuarm64/optee/tee.elf
    (matched in manifest-qemuarm64-optee-os.deploy)

Fix by deploy them to differernt dir

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index eee715f..fed5d52 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -51,8 +51,8 @@ do_install() {
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_deploy() {
-    install -d ${DEPLOYDIR}/optee
-    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/
+    install -d ${DEPLOYDIR}/${MLPREFIX}optee
+    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/${MLPREFIX}optee
 }
 
 addtask deploy before do_build after do_install
-- 
2.25.1


