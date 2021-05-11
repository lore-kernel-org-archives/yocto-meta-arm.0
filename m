Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web12.562.1620746902547792738
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 May 2021 08:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=dC38rHHv;
 spf=permerror, err=parse error for token &{10 18 _spf4.garmin.com}: limit exceeded (domain: garmin.com, ip: 205.220.165.212, mailfrom: joshua.watt@garmin.com)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14BFJsF1001266
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 May 2021 10:28:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pps1; bh=tyAugtDZEHj8PbvWsiY1YjuTZ06qiGQtNyKc4UZV/Nk=;
 b=dC38rHHvT3Vlk56AYN0fApVVWfmXtbeuc1ABu10b7C+vbADpTsgbC/gr5FqtpEl6wXhw
 riQE4bQ9GNnmOj/qYA1NezG5nCN8bpnUizaIJZkvokw9DcBjKO3yvoxwA7+pv4buV4mk
 t10R5f9OLQbJQli8mKjoQ0lkOY7qbA6wk4gDblQjFGKE0+cndG16KGUMCCVhFAfo/UX0
 yQzuYohRl3M0PxXAdZPAC7/5lf49Z37XG/4GnUwCw6HVNTouadCPJBwm5w0s/qsnTsnE
 AjrhxSfscpadSaAzLBg0Ni2UU34cEapwSpjar+5T8ykd7uYGe0guIQxOWxlBNkxjUsao tw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-000eb902.pphosted.com with ESMTP id 38f8t9a284-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 May 2021 10:28:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QymvnPpo+y2pKfjxlLT+63ct9zzIGGG01T0BeQkabnZDUQL+ZXv0+j8AfoBWqwByccdLB0UxiStwtXdORV1hGlFrhluxZAliV+r73DxkOi0D3Gk+u70bOIqqTKPpUFh7TS1syWuwsBKtI7FQ7ngpKwewuZ/DZslMg3u1mlrd5V+lhe7TPHxG/WQZmOJl0LU2xpQJAg1VTuy/XGXVNOZKwHnuZ2tUUfP2N6zNClGzMBRVHKTzVkVnIyDvS4mCBrWhDZ6AF6xxJ7Q+L823YIQMMyZCeojI16EvaAjGyzYmmu0EGkrncvLhUA2W50xph2zCdqONWSYLR27t9OWrdk5QSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyAugtDZEHj8PbvWsiY1YjuTZ06qiGQtNyKc4UZV/Nk=;
 b=E+p/hSPlwoQ3QLJ2avV3SMaWOR/gi4UVRbV18RALCtNG4Dis5l1yMKMdCMV+wPsYUoOFixMyJG9qydcXStTu01bFPeMiovc0bWmck85tzF99W6Ram1v3AKRpQPqHVsOGKgykApa5JmxlyKHsrONoLLWSKE40xVgnFQzn2FRyBCM5s0r/RYQ6YqNSriL6pdzdBR+RIsxCjNM1qZEvJ5gmrgGWA87YoGlOoJEgm3+uZfLgjpfBKtqQTzhJY1O8wy9dtCO3Gs7UDCkzqp1de+9If24Eih2ZCHbGq3Oszwu1Ukj1LqPuFk2YqvkUkUtSiPFIjg3Vynaz1VkxAQvvOhkCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyAugtDZEHj8PbvWsiY1YjuTZ06qiGQtNyKc4UZV/Nk=;
 b=vqHI4arGHtsdSmsALj2WW9P7KVcEw2Ply3JmxIquBkfOkKwVUaHJ8wPrts7bryaTm4bX2ywByW+6c2+rsjU3nPmN7xxQRvDcoWAdllhPsRqIO2Q73tJbpgD+8ZUC6eqEUxMD4agU2JJCMx07jtnb+b83Gi2ztUoDJ1hV86FAoRh7BaZa7TXcfznVIa8jRd9TW8RiK7keYrI3u1HidiI4zWyxTDxaGcOtL/nHC+2ISOv0GF91Cxgvh8O9onKwyotjBj5X/pv8V1jcrR+b/O9e7xl/LOWB9O7IF2nF4bl+x0SjheUn45jlteX3PwG8xZtFhlwSUCLC+oQIujTq6anRoA==
Received: from CO2PR04CA0117.namprd04.prod.outlook.com (2603:10b6:104:7::19)
 by BL0PR04MB6482.namprd04.prod.outlook.com (2603:10b6:208:1cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 15:28:20 +0000
Received: from MW2NAM10FT026.eop-nam10.prod.protection.outlook.com
 (2603:10b6:104:7:cafe::27) by CO2PR04CA0117.outlook.office365.com
 (2603:10b6:104:7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Tue, 11 May 2021 15:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; lists.yoctoproject.org; dkim=none (message not
 signed) header.d=none;lists.yoctoproject.org; dmarc=pass action=none
 header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
 MW2NAM10FT026.mail.protection.outlook.com (10.13.155.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 15:28:19 +0000
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
 olawpa-edge2.garmin.com (10.60.4.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 11 May 2021 10:28:15 -0500
Received: from OLAWPA-EXMB2.ad.garmin.com (10.5.144.24) by
 OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.4; Tue, 11 May 2021 10:28:18 -0500
Received: from localhost.localdomain (10.5.84.15) by smtp.garmin.com
 (10.5.144.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P256) id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 10:28:18 -0500
From: "Joshua Watt" <Joshua.Watt@garmin.com>
To: <meta-arm@lists.yoctoproject.org>
CC: Timothy Mertz <timothy.mertz@garmin.com>,
        Joshua Watt
	<Joshua.Watt@garmin.com>
Subject: [PATCH] external-arm-sdk-toolchain: Fix parsing error with INCOMPATIBLE_LICENSE
Date: Tue, 11 May 2021 10:28:10 -0500
Message-ID: <20210511152810.20394-1-Joshua.Watt@garmin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9379f0f3-97e5-47e3-dfb6-08d914916810
X-MS-TrafficTypeDiagnostic: BL0PR04MB6482:
X-Microsoft-Antispam-PRVS: 
	<BL0PR04MB6482F8EAD53AC827DE0BAD2A99539@BL0PR04MB6482.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:308;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SAZFy2/fYJ5u7dwKtuM4qBtNWRvWZCGRhWOD6UXjYnsaGCn99A+Aw+yRaQRTqbwjC7IOBmeGwbWGf9+yduFVy8mGtA8HOz31o2TrsCyHX2hoTuurgMiOOdf4hD0619S7PkHr0O4NzftG+jyCl/oiq5IVKGTBUplVlxREf+n5Wftniq1rOd/nzR0d9ckeuCeilRzs+Bu3FLWZ5BWii/e2rlB8qGKM/T1RL0v0teuGbvVagN2vcTO/LOe+RnAaAfcK3lLM5k8GmESxGRbB4SfgKC8vrlGL3fZP+Ga/rWWuZVchRng+EiOPyqbBjacSrPfRcdLURCLfAKsXa7q/Xp4xuAcig8h9OQQADkQHlVGFgGhtIb6LaURl9/ISrwF48hwq/Yn3IUNRtDXuaEX3SZSgy5ZS0tX/1cm5M0Bg1zo+Q7+XY/Q9nbABhL2dIq+1M1XVPkorg6goMq6/jsyyTJRygSpmdPL2/EoH/3iRR401AIojhAuOdMuc9/Bp4w2lBzDXOXzBZBdPRmdUTHC4szoiioEn24k31PdDXlt22EX9zTxrMYMi3TDnm/cfInBK36ICWIZH4gUn0A1pq2l/X8LTGmtKQgCw1C3/dQUo9D/bihuQEclEHhOEhFfi59/NJfZwaC8YD7jDAVIY7G5rqFffsZz8tHl/HjDBYD6/eCgliYs=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(136003)(39860400002)(376002)(396003)(346002)(46966006)(36840700001)(54906003)(2906002)(47076005)(7636003)(6666004)(356005)(1076003)(186003)(82740400003)(36860700001)(82310400003)(4326008)(6916009)(8936002)(5660300002)(2616005)(336012)(26005)(36756003)(478600001)(86362001)(8676002)(70206006)(316002)(426003)(2876002)(107886003)(70586007);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 15:28:19.6846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9379f0f3-97e5-47e3-dfb6-08d914916810
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM10FT026.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6482
X-Proofpoint-ORIG-GUID: kJvTnB5xsJKsR8syVIi2_sVOrIqVAx1s
X-Proofpoint-GUID: kJvTnB5xsJKsR8syVIi2_sVOrIqVAx1s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-11_02:2021-05-11,2021-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxlogscore=882 impostorscore=0 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105110112
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Timothy Mertz <timothy.mertz@garmin.com>

This change defines EAD_GDB_LICENSE and EAT_BFD_LICENSE in license.inc
and is required by external-arm-sdk-toolchain.

This change fixes parsing error that occurs when INCOMPATIBLE_LICENSE =
"GPLv3".

Signed-off-by: Timothy Mertz <timothy.mertz@garmin.com>
Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
---
 .../external-arm-toolchain/external-arm-sdk-toolchain.bb        | 2 ++
 .../recipes-devtools/external-arm-toolchain/license.inc         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
index 3f12b4d..59957ff 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
@@ -1,5 +1,7 @@
 inherit cross-canadian
 
+require license.inc
+
 PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
 BPN = "external-arm-sdk-toolchain"
 PV = "${EAT_VER_MAIN}"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
index b6ee42c..6e3d039 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
@@ -1,6 +1,8 @@
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 & LGPLv2.1 & LGPLv2"
 
+EAT_BFD_LICENSE = "GPL-3.0"
 EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+EAT_GDB_LICENSE = "GPL-3.0"
 EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
 
 LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
-- 
2.31.1

