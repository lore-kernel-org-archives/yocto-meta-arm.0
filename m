Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.61])
 by mx.groups.io with SMTP id smtpd.web11.9114.1606996938793315941
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 04:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ycOVZznU;
 spf=pass (domain: arm.com, ip: 40.107.3.61, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbh15osSkAgRs5c24tJgX2eXn2j7NvsiDoda7P18Hc0=;
 b=ycOVZznUVCjPhMhwhgh/F0ou9Ce8RAq+Y09yOtXjCd/MdMkNCWnXVmcxPAqWT52fFaIPS+vpCAP/+7+CquOh9xyAXJRtfctC93XFvWaq5o3I9gyV19geprTtaItogXp1Iu7mMsc/f6V3PzndhnHEI9YhmsqZvDjL3ZaJcmCb9B4=
Received: from AM5PR0402CA0021.eurprd04.prod.outlook.com
 (2603:10a6:203:90::31) by VI1PR08MB4542.eurprd08.prod.outlook.com
 (2603:10a6:803:fa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.21; Thu, 3 Dec
 2020 12:02:16 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::c5) by AM5PR0402CA0021.outlook.office365.com
 (2603:10a6:203:90::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 12:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:02:15 +0000
Received: ("Tessian outbound fc5cc0046d61:v71"); Thu, 03 Dec 2020 12:02:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f419c0cbb2be0e1
X-CR-MTA-TID: 64aa7808
Received: from a1f60b2684d6.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C6B2857F-EC9A-4338-A622-D1F4A0D9F2A7.1;
	Thu, 03 Dec 2020 12:01:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a1f60b2684d6.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Dec 2020 12:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWPkkkzkIHgIayz5FTAcQEJbXkbLMIrdOomdm1m4s9WfVa/M4KuEGVpytOn0sGgHp5htEtxb2t79Yaf4Vac8QLsh8Ko3toxmK1mnypL/Fos60oukRA5NaqcYO2LPdmWsvmd0nMF5Xb6+gWdeQFtbajQltuRCzbZJO90zxqLA1nqqHWbgjHWEVICjw0O6EznNMbl/WX9Wy8xvRquFrnkM1sAykA1shYZN7lGkAo2SqSVjbQYn+NyyDX4Gk2XDfplQ4DkGuRKkbXHpoAbVMJjqBJJZfB7zZtYYiulkuh4ms27D8bRgr/VN4z8MuRwv10rQv49tNI6pWHZ+UI9wg828Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbh15osSkAgRs5c24tJgX2eXn2j7NvsiDoda7P18Hc0=;
 b=bOj2eCDrh4dFy6HfZKEvykTOh0RwFBbxUW+tHnqa9ofSArhcqJV8yZDd/p2kSE6KPAIhQvDEVquCix+/MeOBxJ6M3GOI5iQ2l5twFQGZsNPux2mRhe1BTuu9hm2QX5yE9KP7fLUJGJI2on+nodhIKnj0HYjmrdnjsgU5pmFg89AyYw3wA9UaOPTjH2l5OYXdEbHrAcUuaRSmEf6s6XhcAxsL3moyxl5pf7fgdmOAzkmM7qr9s8EgN/6FmoyReNYQXH8Fmo8iEhkiMUgti2wZhiuLmoG1VOgYu+qAWYnOPStIDVzFfJTpNcx+bxPT+fL/Or5+/nuy3Per38US7F5myA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbh15osSkAgRs5c24tJgX2eXn2j7NvsiDoda7P18Hc0=;
 b=ycOVZznUVCjPhMhwhgh/F0ou9Ce8RAq+Y09yOtXjCd/MdMkNCWnXVmcxPAqWT52fFaIPS+vpCAP/+7+CquOh9xyAXJRtfctC93XFvWaq5o3I9gyV19geprTtaItogXp1Iu7mMsc/f6V3PzndhnHEI9YhmsqZvDjL3ZaJcmCb9B4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5400.eurprd08.prod.outlook.com (2603:10a6:20b:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 12:01:36 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3611.031; Thu, 3 Dec 2020
 12:01:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH 3/4] arm-autonomy/autonomy-host: add user defined partition to wic image
Date: Thu,  3 Dec 2020 11:59:23 +0000
Message-Id: <2fccfd908912d37a4faca298ddd8685bca45fe2e.1606996678.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <18d45b3d900892dde8c466d582a5027a25c21c84.1606996678.git.diego.sueiro@arm.com>
References: <18d45b3d900892dde8c466d582a5027a25c21c84.1606996678.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::13) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:01:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9a1bca24-2107-411c-7810-08d8978346c3
X-MS-TrafficTypeDiagnostic: AM7PR08MB5400:|VI1PR08MB4542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB454299E4AEFE92DA9F882E1492F20@VI1PR08MB4542.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 06hivnVYgzsVfcSIPfHOt6c5VDZPEGkymCLupzlaCzZOrKyZKvgI7GT6foPbfUSUyxcmnqpALjI53g51MoxNQLKXk0JKkVNgalAlc/tIZaihu7LeTLD/8YD44iWvSVk8dJA4Ic4ZwmCoj1cyhi/jyyloyD5eB8MpwHHKHNZG2kr0itlFkKS7Zfu8k1OsaYKVGY//oGZvpnVXhGPz9J/WcpgpJjCF5rVjY0/u0jAp8QtJQgvcyV/E5N02GO06JQDTFMmlz5UOPgXEDjwlsxVkAGJjN0Ls9zJeSSG7RXXknO+1Q+9s9rCTtn6EoyKrM/o1ug4H0f+Xj6MDoEJBVtLSrw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(2616005)(6916009)(4326008)(2906002)(8936002)(36756003)(5660300002)(7696005)(6486002)(52116002)(478600001)(66946007)(66556008)(66476007)(86362001)(8676002)(6666004)(316002)(956004)(44832011)(26005)(186003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?QDpn75DfJ1qoWiKcH/wrJVS3/et+7bBMF13RoCSLEvr89FOy4Z2mThuzDfBo?=
 =?us-ascii?Q?AU2dzE0P1oU0AedHUnS/DAjxUsf2GbFKbJ8az+r0smzo5IljCjMYvyDO/1Es?=
 =?us-ascii?Q?C+//GLrFG8Mdyt4QokmL124EfzCWyMTX8SdDSqoVSKmNWF61y4ksL5ZR1Ypm?=
 =?us-ascii?Q?UFuCHel04DoG0IYyjMPFRHPBl82LS3HPjEXytu2v7ZKrSjhoc2YtP4wbZ/nR?=
 =?us-ascii?Q?reQVfEAKd2xC3yHMW0jWiUE/v7bPyapaxYkQNxhmhq+Erlwqt0a6qY6JYJIn?=
 =?us-ascii?Q?lBeiUq0d1lxePplE8FNU3nchIWr4lBUITKH29wJM0kJL2fMRtdgzyhvp0j0z?=
 =?us-ascii?Q?sJhg110fh4vTEIKGkpe0WhgZgkXiK2sdTr98yn4BHpjKePXeWNbg01b72G6/?=
 =?us-ascii?Q?ntYcvPjT5e/821765hq4MwvDxL1Wk+X/LEtJfgFcunDNpXJj7aRZle/j0wsV?=
 =?us-ascii?Q?M1mTgg8NFjXugexLzoE828EymDjbCJsIgXgY43J2X2qxl9Q/CQgT11poKEVk?=
 =?us-ascii?Q?zCA54dckm9c5bTapS1tbrEJbwbrwJ3nvSRCKEL85sTrsK5WO10XuPcq+igAs?=
 =?us-ascii?Q?a5KiVdRJIhKlDmDbcx3ah4+kn4ciFn3d2OS1acpXqr9Lp/wc30Vvh3j767BB?=
 =?us-ascii?Q?tGx1EiySV2cZ3sLhoJME6koO8/szso27UA5C57C+dnfmsWJZX/ynwcX/eqDI?=
 =?us-ascii?Q?scFleU0NA8W8U+8MbRPW/HmjrJXKkTdJkizJoi0sm/DXynlBb0jgFAyWMRsg?=
 =?us-ascii?Q?PlAgI6mKUtCO6zMIIUxjVwWi2l4B5UuRT1UfRhvQ72lEG9joP1hWuJAPURIv?=
 =?us-ascii?Q?8xdl702kvCY9nbGbTK5rGigFRpRAnCR/E2+DWP/u6EcXuYoVejRFhb6DjHNC?=
 =?us-ascii?Q?i3hlkXnTjBKNsBKC6GsVtH1iXb1t1ZcAdphS/C8BKbGpZzwgHhNS124z4Weo?=
 =?us-ascii?Q?AtxmMWE/d+yg8OZ/6UzOyUq5roqkuJ3hYWhhmnNJDg5uQnqwgPCpPlNY9KLR?=
 =?us-ascii?Q?bzf2?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5400
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	68893d4d-54d0-401b-848f-08d897832f72
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jyWayDmJLTEMm08keWgDwJQ3IAyBoX65RmJfLtDUCtTxrB9X3TCMF4b4AQyX39T2i4kV1dMnc1Sp5lSjpqrIhcv24JN809dwQx9lgJcqxdhPc8hVaMAxC9BprLtBzRE8OYMRy8/lMGiSm+jzNXkw9bHEfnn6/uc9RbDhRkmxEv/6TyT5JwBrrKcpqobDKNmGTDTNFfzONszKHZqrMo5D6R9RUdiCkINCwczPL8enxKH+nk38zoUdK64J8vvMU/4uyel95arcyTBEPE4ERq6f1s2GVdXGmfIdaln/WXQfyYTBMcaZK0bOGxZJLdnlebjd7jmoBin7FgDQz6BGrxwN1OCKmZkFKja0ojaOE8hEPteQAF4XcX1OuhIGlkZG5xexcKM4nn0sdRM6/H24U2oXkA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(2906002)(82740400003)(8676002)(4326008)(26005)(47076004)(8936002)(16526019)(186003)(7696005)(36756003)(82310400003)(86362001)(6916009)(44832011)(5660300002)(6486002)(356005)(6666004)(316002)(956004)(81166007)(70206006)(70586007)(478600001)(336012)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 12:02:15.5321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1bca24-2107-411c-7810-08d8978346c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4542
Content-Type: text/plain

From: Kamil Dziezyk <kamil.dziezyk@arm.com>

With this patch user can define additional partition entry,
via AUTONOMY_HOST_EXTRA_PARTITION variable.

Issue-Id: SCM-1514
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: Ic103a40de44ea6cd88caa60f06033a9c678b265f
---
 .../documentation/arm-autonomy-multiconfig.md | 34 +++++++++++++++++++
 .../wic/arm-autonomy-juno-disk.wks.in         |  3 ++
 .../wic/arm-autonomy-n1sdp-efidisk.wks.in     |  3 ++
 3 files changed, 40 insertions(+)

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
index 8c33501..4f4bb74 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
@@ -159,3 +159,37 @@ and everything between `---Guest Config Start---` and
 Any copies of variables that start `MC_GUEST` must be altered to avoid
 collisions (e.g. `MC_GUEST_2_*`), and the name of the conf file must also
 be added to BBMULTICONFIG.
+
+
+Guest with provisioned disk
+----------------
+
+To add guest rootfs partition to host wic image,
+set `AUTONOMY_HOST_EXTRA_PARTITION` with proper wks partition entry, e.g:
+
+```
+AUTONOMY_HOST_EXTRA_PARTITION = "part --label provisioned-guest --source rawcopy --fstype=ext4 --ondisk sda --align 1024 \
+--sourceparams=file=${TOPDIR}/${MC_GUEST}/deploy/images/${MC_GUEST_MACHINE}/${MC_GUEST_FILENAME_PREFIX}-${MC_GUEST_MACHINE}.ext4"
+```
+
+inside host.conf file.
+
+The rest of the configuration has to be appended to guest.conf file:
+
+```
+XENGUEST_IMAGE_DISK_SIZE = "0"
+XENGUEST_IMAGE_SRC_URI_XEN_CONFIG = "file://\${TOPDIR}/path/to/rootdisk.cfg"
+XENGUEST_IMAGE_DISK_DEVICE = "_GUEST_DISK_DEVICE_"
+XENGUEST_IMAGE_ROOT = "/dev/xvda"
+IMAGE_ROOTFS_SIZE = "102400"
+IMAGE_FSTYPES = "ext4"
+```
+
+content of rootdisk.cfg"
+
+```
+disk = ["phy:_GUEST_DISK_DEVICE_,xvda,w"]
+```
+
+`_GUEST_DISK_DEVICE_` should be substituted with `/dev/sdaX`,
+according to wks file.
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in
index 5c5b24a..bfacb20 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk.wks.in
@@ -8,4 +8,7 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
 # Second partition to accomodate guests images normally populated as /dev/sda2 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
 part --label guests --source empty --ondisk sda --size="${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
 
+# Third partition is user defined entry normally populated as /dev/sda3
+${AUTONOMY_HOST_EXTRA_PARTITION}
+
 bootloader --ptable msdos
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
index ded628c..b48ec77 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
@@ -11,4 +11,7 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
 # Third partition to accomodate guests images normally populated as /dev/sda3 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
 part --label guests --source empty --ondisk sda --size="${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
 
+# Fourth partition is user defined entry normally populated as /dev/sda4
+${AUTONOMY_HOST_EXTRA_PARTITION}
+
 bootloader --ptable msdos --configfile="${GRUB_CFG_FILE}"
-- 
2.17.1

