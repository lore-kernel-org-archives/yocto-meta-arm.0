Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web10.9925.1628699676935792493
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 09:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yohwIdmC;
 spf=pass (domain: arm.com, ip: 40.107.21.84, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+DIlFO2VLF/MFCG23n7By6AQW4kxP/cKX7Nm4hWDt0=;
 b=yohwIdmCva6XEhZyHuMlscOi8YM4pGV7kjKXsrfaZzmQ1bfvLhvCCtk48nzQ0WbUq47KdcKVPnbtjAJb4udu1B/I3J9OyEQuESwnn4R8yAsLEtRC5Z+0p1zYJ6thTdHWw1twx4EueFLEg8gPbULDQ4qhV+4+3l34vSq39rQxGgo=
Received: from AM6P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::20)
 by DB7PR08MB3322.eurprd08.prod.outlook.com (2603:10a6:5:26::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 16:34:32 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::cd) by AM6P195CA0007.outlook.office365.com
 (2603:10a6:209:81::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 16:34:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 16:34:31 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103"); Wed, 11 Aug 2021 16:34:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ec5533ca0475d18
X-CR-MTA-TID: 64aa7808
Received: from 808d5876ed25.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7F8D0CB1-B075-4CDC-8CC5-60C89249C552.1;
	Wed, 11 Aug 2021 16:34:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 808d5876ed25.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Aug 2021 16:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fm3p529tFJbORQJvJDPqYPaY5a7Cs3AuDoSpVy+qMdLmyv2Jo8ZKkLblnBznkcamr2KYSOPC401/Xfir6iwEcclOeVy6qzHCDbKxXPyPZ9Slp9jTfSNBAJGFr0e9QJGlxRz8JfWbs2dX6nAwtHuCh9R5oClNj+rL2Btp2yVJP+HN4wnVorZOhWEiyQxw+3vAeIj/q7TEAHmmnhBmt/T5nDnmbVSAT4glf4vXz2NAzieFMyGm4hCWIbpZ9Na7bWnHyOlX4WSkLTpgMbHbg8y3OUu9mVjqbvGzom/7zrWu14pXKNfUJG3Zta+bi4rAzkfJvC8M6CcnCSuj5S/1OFWL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+DIlFO2VLF/MFCG23n7By6AQW4kxP/cKX7Nm4hWDt0=;
 b=kvx5QOHFlPQ7CYMn9QHyo6rIso+t4LBKCQexQ4trApJvYZbDqfaBxMwdHEwHGd6vVX1lQYbJw+A1l15aAUh8vVfHV7KXIZJrnZ4PdLKmlutbII9gpyjrZSPp0tedxBCfUur2v7eZd3N2eJ3rzf+1Pe13lcfiiLpWy8apb8ZFTxH1WFg628LbdmAftW+i1Iqwy0uKMdW93JHVgQ3CPz+gcVL07+7YggHHiZKrEgJaHuE4OL1sC2x7ebcIoyTYOkR7mTwQvp6Pc2OmD9E7q0/vo0DtRok3FAbyUpm7/KoGqqqBud4wiQ1HF9aLCnPFZ7sdX30lEvW9EisTGk4fHCyiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+DIlFO2VLF/MFCG23n7By6AQW4kxP/cKX7Nm4hWDt0=;
 b=yohwIdmCva6XEhZyHuMlscOi8YM4pGV7kjKXsrfaZzmQ1bfvLhvCCtk48nzQ0WbUq47KdcKVPnbtjAJb4udu1B/I3J9OyEQuESwnn4R8yAsLEtRC5Z+0p1zYJ6thTdHWw1twx4EueFLEg8gPbULDQ4qhV+4+3l34vSq39rQxGgo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6885.eurprd08.prod.outlook.com (2603:10a6:20b:394::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 16:34:23 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433%4]) with mapi id 15.20.4394.017; Wed, 11 Aug 2021
 16:34:22 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH 1/2] arm-autonomy/xenguest-network: add missing new override syntax
Date: Wed, 11 Aug 2021 17:34:10 +0100
Message-Id: <f860b4f7cf2d5518dab05c4e0773d9057f216753.1628699576.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::35) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.53) by LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend Transport; Wed, 11 Aug 2021 16:34:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a9abf22-1f5b-4e79-0522-08d95ce5e5b1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6885:|DB7PR08MB3322:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3322EC33224AD6D707B0732292F89@DB7PR08MB3322.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rYlQZNDJZX+n0sJrUdkHDZ/Ovx9jlQpqZNj+8Y2mXct3xuBF9Nqh8U+JBQqDeBTOfoNJF2uhepgcXT+JxMEdc9UsTcyFsNhaSquQiRoVgOWBsSQwX1ncQy7yWJ5VxZsWt9dEcvM2+FkY25CRCaoDBbJAKd13UZbGIyK4XaAuvIQbbAx4WgKZ6c8Ze/gIuapJtpS8CndtF8xTXvOMsa3deZZd6OyNBzDOxjxEqteN86TSnTtryO2sRCbUEyi1KiUHhakeVzu/1dBtYoZukKynY7KPuzjvzI9M1bWXwJkDfjb7XD5RlsNFqRo4cTeIDKIvbY66xvytz8sqCpVOaNfjzVqqtJ5Mg9fKF0/v7jCSbqZEnC3bsCIuxVi6kv6/bTctHddtnQluisF9ffcjB72h09+9Cd5Reo/n0P21bGV6uGmvNG012A3sKN3pQWPIprkm1kDr9nkbYyvXJqjj8hnTqtXZB1IdBTqkgma4i7Zb8nTFxH2lrUcXQr0aFVmVFF/0uylklJcDekGd9m8QU3W5+nVQozl2g92TbmIOjjqnOpVXoNQslqcNpONstZjDTMYteJmGAs0yuzjL8eBSRriJEQ2IhzjPs2/yudtHav/02FjKSZnafv9ChYV7GXJKabtVZopcwEg5vZ6imsNS1F3CleyzuvXW1C1qp6qj6fztOIvWbsYCQc+g8r4RajSFTF+f5+6kbs31/FWDmbAx3YI2Wg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(366004)(136003)(5660300002)(2906002)(86362001)(44832011)(2616005)(6486002)(8936002)(7696005)(66476007)(52116002)(8676002)(66946007)(66556008)(956004)(26005)(478600001)(83380400001)(36756003)(6916009)(38100700002)(38350700002)(186003)(4326008)(316002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?bJdIgr6TE7vJv0SCuxEN/4tosM13SxwrvkUj2IB0Kc8wi172w4uZrbVrTFuM?=
 =?us-ascii?Q?sAeA3TZ5TkTBEywowXRUb7zaUKPleHqzb4ooswb8rSBaNtIRRMpMrJfVq2U+?=
 =?us-ascii?Q?QD/GgXz1Dem7gjQFTemZjvRVy1a6j9pk+ndMA6I5tbgTPtxJrrmlpkIapgjr?=
 =?us-ascii?Q?1dlp3qBW+I/+SmTUTgSvo8AYspzx0WqpLuyeoXCpoZiC7qANWjKDQMN+pjh5?=
 =?us-ascii?Q?Q4tuTtfjKbqWfpIm2cokz9DwGK0BK37n8CO3FgP1JLGDnjSY7W1MiaZMeV+v?=
 =?us-ascii?Q?e8gfrMNHIblrKDComya0A8V2SN7w/D3yZKIb3yBpCEZqww3uITpWJt2nccmu?=
 =?us-ascii?Q?bkhfCG12E3StFk0nssrVofIR7h2S7EKJe8PYSDsXvAtV/wBpPo5kEwxDl/56?=
 =?us-ascii?Q?KBEDuDXN7td1RAa1nVGl3HgwTCT2KRGM11Qe0b1AQzeJ/UtxSCJ3zZxRxx+E?=
 =?us-ascii?Q?2luFA1PWvTV5KNSs6PhjQcBRJo9AdVqKI+7kFyHKQgSytp4Ol/ncjmXunV34?=
 =?us-ascii?Q?GXqqUz+hqIvi0uTpvTv/nRP00MCtxMFjfBmp9bwg4TDEwMPc3du2ELGsOyi4?=
 =?us-ascii?Q?42g55aW+inqI0ja5/WNawEY3oqSMDEq7lDG8ZtYI8EA4R2CMPe5UmI89KAyD?=
 =?us-ascii?Q?e6G4wbRDu3R07ugXp7yd2rXr2jHvO/YfXGVj9TjD3C6myhZJd7T21VuQoH4t?=
 =?us-ascii?Q?yPF8Juy6rL6vm87R2+Ltbe7EZOk1BhwJhAJ5G5ex5hw2s1EhZSGrMVIeNUIx?=
 =?us-ascii?Q?sWpgSQHaQmSBLlKtMWPNyc/LPlvzW6bK7wPWR80xYJh2lYglvAFNHJo0FA8w?=
 =?us-ascii?Q?oWeK1WOkepUUcKZlqz0ceZAW++j0kM6XZtxQZQSwR8YCeSlzLn5ZTXHR3nDy?=
 =?us-ascii?Q?FYjzzjokQ7eit0zOgSqr2DDPce1hNvNngIAbN9hyuzLRFRHMFybsDyU+FIvh?=
 =?us-ascii?Q?dx4eyIQ1JhNsrdoKZuLMo5A/ibvtZs8/pU+SswisJ5Ny0Ph5JHsQrdGPo9qe?=
 =?us-ascii?Q?lDAUHWlHYabecsrreYGseYuvaer13tmJXfepy2k4KIIwoKpd7JpCvNsf9SDf?=
 =?us-ascii?Q?gmsGBwxvyGl4U56ckpgJ5SpYuKCZtKApH+p9C5dIPAxh/OeIUWPfJBe4X2LB?=
 =?us-ascii?Q?53gyilcnamKDXzY6fdGam1kUQCm+xKfYvP/3coJrFwlmTP25ag6O5QVORCCL?=
 =?us-ascii?Q?7VW4ZEUbHhX2WWMoF+gnb6mUjti1fExUb9d9PZmFXwJ686o6BOf/4AFuVkAD?=
 =?us-ascii?Q?mMMXH5jQByowHHXBLodwFFhBWjn3YdCC8v7NsYemr+gVFP3qVhsBypyUvzuP?=
 =?us-ascii?Q?MfzvRggpROsZL9TYWiCoq0Gg?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6885
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35fcdf5a-c9a3-4203-5db0-08d95ce5e01e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WO0xqoXsZyqAtK+sGj0O+tVkWDLEqAmqu99y60fk4Nz/IpQ1hcH3Zs82cwrHYnWIm9smgVa/W2Z+4ubEFjIs9TUxxwRyi5x0BaugGKIFWIZ1LqjTFlyY2X3PoiBw3hJ70M3YJY5RFFh85uwyvAaG8XY5b44FEh9U+W579tbMdYu71ghqrbTqNcSm0EeBheGCThA7IETyXDfoqVLzsLsv+KfvAZ/2bT6bKxTxI7SRhxKetqUswHxX7xXwvlEAP2OWAurLYJ6QbPzDJe9nJegko0Qgdt0HZEARSr2gkfd4EZYHjgTvNa1p2gEw/LGak/3qX8pfp7Nrjs09mMuTIXRDZ1sQxybcmGNxTtL0zkJAP/DC5YMD7jOREasE/yyA6sXYOYmcIfXY8i/RFg/2mEJpNFubK3jYsZtyIwUti+tRHKBHeJ9Xppxyay6I20lJD4OwnGePTOFD3OM/5F8b8nxVD0HgKk1ef+u5fOTLI5Lx7ZMImwwgHbshpF4AgFRSUG1v71KJFGQJbgKActvvm9lVXXsjvpIr82J3SL/BSZ9rkqi6jg8jVNSH0VmW6xNNPF6JmQ/3rcWux5f7xjY/Pg88uEin8PPQGE/G6qRmnWsSR5JvXuNLqgqUn7qPRRneS8BPuJ0k/gazjXXmb6fk7U/FUrCWC9cfFkB7DOiSjb/EhyHKoTO/Wwcw1/2qqXb/rXtrLhyiZSFr2nJKYOvC+pICkw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(136003)(36840700001)(46966006)(356005)(956004)(6916009)(2616005)(2906002)(6486002)(83380400001)(86362001)(81166007)(8936002)(82310400003)(70206006)(70586007)(5660300002)(478600001)(26005)(4326008)(8676002)(7696005)(186003)(82740400003)(316002)(36860700001)(44832011)(336012)(47076005)(36756003)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 16:34:31.9276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9abf22-1f5b-4e79-0522-08d95ce5e5b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3322
Content-Type: text/plain

From: Kamil Dziezyk <kamil.dziezyk@arm.com>

Issue-Id: SCM-3027
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: Idf757266faf655527179b0d23a0ff8bafc90ff2f
---
 .../recipes-extended/xenguest/xenguest-network.bb             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
index 66c6f26..31a06ad 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
@@ -54,7 +54,7 @@ do_install() {
        > ${WORKDIR}/network-bridge.sh
     install -d -m 755 ${D}${sysconfdir}/init.d
     install -m 755 ${WORKDIR}/xenguest-network-bridge \
-        ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}}
+        ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME:${PN}}
     install -d -m 755 ${D}${sysconfdir}/network/interfaces.d
     install -m 755 ${WORKDIR}/xenguest-network-bridge.cfg \
         ${D}${sysconfdir}/network/interfaces.d/.
@@ -92,5 +92,5 @@ FILES:${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
 FILES:${PN} += "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.hook"
 
 FILES:${PN}-kea-dhcp4 = "${sysconfdir}/kea/kea-dhcp4.conf.original"
-FILES:${PN}-kea-dhcp4 += "${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}-kea-dhcp4}"
+FILES:${PN}-kea-dhcp4 += "${sysconfdir}/init.d/${INITSCRIPT_NAME:${PN}-kea-dhcp4}"
 FILES:${PN}-kea-dhcp4 += "${sysconfdir}/xenguest/init.post/xenguest-network-init-post.sh"
-- 
2.17.1

