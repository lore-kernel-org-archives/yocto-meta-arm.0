Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.74])
 by mx.groups.io with SMTP id smtpd.web11.14333.1627587237924271942
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 12:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zgzzaXGx;
 spf=pass (domain: arm.com, ip: 40.107.5.74, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6fErYpMsi/nEelzNZsfsekVRlhZbhT9uFzS0NA4t2Q=;
 b=zgzzaXGxiZcLdF20GvR85KDRbGelzlb+ZXBBfdrHbI1vEPhcxuXirOKNVdNi4RO0wpWpfRVoVSY71byz/hj31lQD42X6sHSEeZGH61gUFUk7wpqRcir9lyl616xIbfNXGSIFY2hAg+wdfEDvjepKPGZ/V+imxvYEvuAV9y9faIE=
Received: from FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::17)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 29 Jul
 2021 19:33:54 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::9c) by FR3P281CA0011.outlook.office365.com
 (2603:10a6:d10:1d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.10 via Frontend
 Transport; Thu, 29 Jul 2021 19:33:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 19:33:53 +0000
Received: ("Tessian outbound 31e6e3649d31:v100"); Thu, 29 Jul 2021 19:33:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 933693e8b61b271b
X-CR-MTA-TID: 64aa7808
Received: from 87e5f84358f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6D1753DB-B1A2-4C52-9A2C-960AF7B7B267.1;
	Thu, 29 Jul 2021 19:33:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 87e5f84358f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Jul 2021 19:33:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/LdEZLv9gCEnhO3r5tWo5GWEiSYQ9hg//ec3XLshiQVjnsV9GdCaphVvrJzuygQz/0SmuvvCbwVY15TDok3wXDNSV+WFIeudJeZSX3nJ7jpQceqXuYcPNIRAVY1icIxhRIXxjyiNxsDnXsQ+K+vBStmyeXCNS2GfzqxXka2NJuUdejPT/kaQpCRZ/tb4bgB0UuzvrlDs2wM581C8V18AUqdOwwMo106+SPPrmu6GrUf7amhjIod+WhzA3g7rUYEaFIOTW65B4913ilSZjwEnpVJsnHmys2ucbq8edRtfo2QJYatR8GLwut9bNC/HC7b63JyiN9/cbjFZvpq6JLS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6fErYpMsi/nEelzNZsfsekVRlhZbhT9uFzS0NA4t2Q=;
 b=LdxKEUWdHHmtxNbLfvMSPlmIfKmkxbNsxpqAvxU8MsVDjRIUfhV/O9/VFtx+tk8j2RHG7deAYVAyMlaJSQLsgHs/HZYn4lyzKu6Jal+k8ogLXSwn2H0EV1Fv05lCJ2wQXK9ecS4CzK3GlQh16uFn8OgrDVIBjoV28NmkW+AgVfv/hblTwnCV2Bg4RDRGB3P0TWEL4wla3FkRvhurCUwEnSidDQ1+zVKXN4RTGeWdUdetW3psbUFDgWWxFr1DySBdNpxBrC4V5HAqemMc9oqVKfvk63crAistVh0khLORMJYpFGCCLWHbUKon1uqnSDiMbl6OPR4WgPmueVQdO5nfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6fErYpMsi/nEelzNZsfsekVRlhZbhT9uFzS0NA4t2Q=;
 b=zgzzaXGxiZcLdF20GvR85KDRbGelzlb+ZXBBfdrHbI1vEPhcxuXirOKNVdNi4RO0wpWpfRVoVSY71byz/hj31lQD42X6sHSEeZGH61gUFUk7wpqRcir9lyl616xIbfNXGSIFY2hAg+wdfEDvjepKPGZ/V+imxvYEvuAV9y9faIE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Thu, 29 Jul
 2021 19:32:58 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::c583:2681:78ea:41a8]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::c583:2681:78ea:41a8%6]) with mapi id 15.20.4373.022; Thu, 29 Jul 2021
 19:32:58 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/tc0: use config fragment for kernel command line
Date: Thu, 29 Jul 2021 20:32:43 +0100
Message-Id: <20210729193243.16780-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0193.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::13) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.49) by LO2P265CA0193.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend Transport; Thu, 29 Jul 2021 19:32:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35f29fb9-01dc-4db4-1658-08d952c7ccbc
X-MS-TrafficTypeDiagnostic: VE1PR08MB5583:|PR3PR08MB5868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB586804C7AB4D5749735B21CF89EB9@PR3PR08MB5868.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KuUJWIQAOgp2NpB8e/OYFwcm/kd1C/PwFZ4KCinR2Eu87x4F1a4w7LECCxmpbImLjeUnFTO1D+X8AJQa/BqzY7F1aO9c5bjgc8HSJmQVWg+WglvSbK+DZe7drbdmwOiifa1UrihhpVNxP5H/zpQkoDPS5hvGRANrUTQQ0N6Vj3tRV+zQwCVwnqcPsZrzp+QfP+a+kw9y43/Gk/UXs4MmoemKvd/e+HKQsJ5SJv4oTzhudnp5uGbGBR4dxb++BEhya1biSnv8tf5OvrCtV0noPDyCr8OSgoIBpHsSAkadDR7+u/Wp5Xj4qwv23wZXfUufirioPS37+35CdRjtD+nekKbMOw3y1pKTejnfkqe1rFr4Bze0I9vQvqi7W59qdSpx3SeMPSSrkWTEdXHicZgneZfcD2KnOUVkrKFajsAV9b4+N1mlFOseI1wtSbm48KhzIER5W+HpW4y+ZkKjZGaAlDEnSS1EZ61Lkktqh1sBDwBdTBkrU3/ghKF16eahtYWHkUpEYY0d71vyAN+5BEUAj+wrCGfSGoMWpGL41qAzP35PpjVcRckUPqd+LZ+yVGRIdKpCm70i72fqpNzAsIBU+x1Yol5lpmJGhHjEY6V2LZfVrr8sBZ3JL8w4dUctI7Gy4HPwv6oNEKonFlXJHzp0RvzmcAh2P9Ykyd53bR8cEx+DrRY+l4zNM2UkF7SuTCvJZamul4mQ6Pn8aGLfcePjIg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39840400004)(396003)(136003)(7696005)(5660300002)(6486002)(2616005)(6916009)(6666004)(186003)(38350700002)(52116002)(316002)(8936002)(38100700002)(8676002)(4326008)(478600001)(1076003)(66556008)(26005)(956004)(2906002)(66476007)(44832011)(86362001)(36756003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?AGvz2UXcanRfcK7xMghttNR3SzA0s4wEn3+jgZBOUt6XPDRUAh2D97zj1wZ4?=
 =?us-ascii?Q?F1LQHgsZqf461cDwhA46+IDSBzd7F8dHP1ji+HXvWmq+/nq4Um9cOdqTPzbG?=
 =?us-ascii?Q?1ii6RqZtpyA26gg75aSVb/ihPJsFIMBT186dNyRWCuv/2QvRbKW6dUY6VbtR?=
 =?us-ascii?Q?lWK4sJbV31TLAyaRjCwlXwP4rGHcKNLdT8tWD9KIBxQMfL9YWeErc8JMIYDG?=
 =?us-ascii?Q?r62KRzKAkMIsYGaTloWvlEIzj1U5DwXYkSgteFphgxc5ay/eDQ7D/I9JyhGC?=
 =?us-ascii?Q?QL3VhO0YLEW8Fl9EMq9nIPvoO2ONNc26ZU0/ZmYVSgO4k7IDAw1V1eOtSe+v?=
 =?us-ascii?Q?M9K6ihMEZIkNgbKU8YFomtKpXjOiQRIF98junIJ7jOOZ+yEu5Dg4LGZDMhZr?=
 =?us-ascii?Q?03mnwWMGNLb8RkQ0nWZDv00NcTchaBqLtcLMHqC2c+/qiOChvb4wBudt5VGi?=
 =?us-ascii?Q?nstXZHsBCDWPQAfxQBbjrXtVzKXuhsAhkIvdlDZ1viqb7vNO6rG6ii3QIahQ?=
 =?us-ascii?Q?jR0grQzxBD4p3HzqkQotKEiBDQTfhAJW5HAvNESxmCRAx15PZn72QPUaLmiW?=
 =?us-ascii?Q?lfMLN7yveTw7xwwh/I44t2baK3ovYHLHLGkILblS0yRcx6gtEq1q5PETQNOE?=
 =?us-ascii?Q?PvEB1Fz7ZZkk5XkGcSzuVzF8IIPX2WGoR6cGRVcQkdzBw53k+fRQWo6LSqjr?=
 =?us-ascii?Q?Fqvl2kwWgG9QIWu6LosXpUnsapIMAHqlgLz//o1WxPrsJs5gXHDnFmGsqpvX?=
 =?us-ascii?Q?nnOSFRgrONUHDKDPIrjbV22Ln7011O5PSvaEs72hSWMSme9zYRmKU5y11lhe?=
 =?us-ascii?Q?2sno5xIRDwpyH5IvQySdG76Yi+gKHGM3P3uohtW9uxuGdIgmqfFB6ubSexgr?=
 =?us-ascii?Q?VB8AXGzQ1+CNk7IJGcuTexWWe75OQ/jSLxyer1b/mjc3QYI5Y2V8AlSpXycQ?=
 =?us-ascii?Q?wRVa2ryvm5LXkk/dA+ijzm/hyjvlBf1Rx4e79u+9XjeWHYA5hsIViZ+Ks57R?=
 =?us-ascii?Q?XxL3jLpbeg2w8JbHDgAcox4BOCZQ+7yP39iDZmGWkGkOjqlgh+yx+x3i9tU1?=
 =?us-ascii?Q?4VGWQXL/ds3qNYW1u6yBV7yfe3NX9eQt8uNhLYzTIsc/9uk3tag75Fi4pLga?=
 =?us-ascii?Q?I95jbZZBxon3gar9AnAXipWmiixMhga2JzsMg5r5Rk8jXAwKiDff4LKOS1Eo?=
 =?us-ascii?Q?c8KyRNAtm4YKbCjFtthSD99v2CIRjiXzhHoSJbNDiMhSsRRJIyycojR8ygeq?=
 =?us-ascii?Q?GDveo8YxgIJuB+pppSMHdevagKmq4F0wWuG44e9Nzm/zISyq84lTUZ47tL1t?=
 =?us-ascii?Q?j9YqLg4TlmwRaIUJsAS0U6if?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5583
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	600ce614-4835-4f07-d1ba-08d952c7abd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MXu3g3jMn/MvhsaMEawtfYcIPFKCdx6P9nzar2fDsGzqj5T04Pm7u9yklj3r1m02czt7m6UKEOWnP11AwfKO+G70EPvAGzwOaOBbRJfKPD8UUKV6/m8tXMxe4TBS148XPglOeqB71+92w5HC5UoYU9Z3zkQoz+OxPgxj+rsE0+yRT4m2xzHrePoTZST7H/WfZpx3G7+FhmUcOWhj6AJBqD5XViuC1YB++zdUEOw9DTF92i4EP7avifM1kjoZkCBZ2fInHjihc++rO1+ikmQ3Hd10h4RHVXQhFjBHL/UV449SAaJOEE6sZ8CVLWPOacFOfV5n0WUVgsvuu5bYlNGDmB8K4NkU8shG/cbKjp16+CSmPRjlCKFNMoWzO241FMpZcmE9cWMmRt3C4fij+4np0vhKxUyvfpRApu+XXahn31YG1pj84SFVCDAEYGEfTI9KuSDRGBfGShjdPKZ8LFlUw80xpGQiG3Tp0Wx5ePam6SHpoDZenL67R1gItAHYwyTogUUe7VETLuDVqFisMdBTQTw3Vq+0O50yhE1mh5I5AuOJrJJPRMU0myCqmT35ZRDNpKV3Z7GObVUgQywIMN8PCBfDqLmrMxeQbxuRoegKk1zV9nb2ADcfzaOnMCZe+0FiV9pRsBbM1Ba/W6AlSAT+7PLJPHqXiD1lwVzUknBiKnjET/KhHgALzmtaVolReaIonx+Q3sEhkGzWcM+X9kELfg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6916009)(336012)(8676002)(186003)(44832011)(5660300002)(26005)(47076005)(2616005)(2906002)(6486002)(81166007)(956004)(8936002)(1076003)(4326008)(86362001)(70206006)(508600001)(356005)(36860700001)(70586007)(6666004)(316002)(82310400003)(7696005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 19:33:53.5324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f29fb9-01dc-4db4-1658-08d952c7ccbc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
Content-Type: text/plain

Signed-off-by: Anders Dellien <anders.dellien@arm.com>
Change-Id: Iabd84ff5a07b78503e45203542aafac738c9c324
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/bootargs.cfg | 2 ++
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend         | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/bootargs.cfg

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/bootargs.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/bootargs.cfg
new file mode 100644
index 0000000..8c31602
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.07/tc0/bootargs.cfg
@@ -0,0 +1,2 @@
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttyAMA0 debug user_debug=31 earlycon=pl011,0x7ff80000 loglevel=9 androidboot.hardware=total_compute androidboot.boot_devices=1c050000.mmci ip=dhcp androidboot.selinux=permissive allow_mismatched_32bit_el0"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
index ae83e5b..ad6147f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
@@ -9,4 +9,5 @@ FILESEXTRAPATHS_prepend = "${THIS_DIR}/${BP}:"
 SRC_URI_append_tc0 = " \
     file://0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch \
     file://0002-cmd-part-Correct-error-handling.patch \
+    file://bootargs.cfg \
     "
-- 
2.17.1

