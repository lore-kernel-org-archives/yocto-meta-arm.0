Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.68])
 by mx.groups.io with SMTP id smtpd.web11.9421.1613664949568459158
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 08:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iJLiELK6;
 spf=pass (domain: arm.com, ip: 40.107.1.68, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h9FBnolhMe3Gu7bEEsI8q6FS0FP/i3QYowh1cpZST8=;
 b=iJLiELK6pmbAFbvfuVoJo3kHJD64PYy9HdiMptFtEfBjIzVHt5EPeGz6AsG7ySTzRJXXTnuxONSNtHRE0oJiLra1yzIdwdDake2cMlCNRtnViX2K8fRyQ4kILc+e/VtRn8Fguu3L1z1WUrPi3w9jkGM049LtjtsVL1lTfMWGuqY=
Received: from DB6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::15) by
 HE1PR0801MB2012.eurprd08.prod.outlook.com (2603:10a6:3:4d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25; Thu, 18 Feb 2021 16:15:44 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::dc) by DB6P191CA0005.outlook.office365.com
 (2603:10a6:6:28::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 16:15:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 16:15:44 +0000
Received: ("Tessian outbound 2db1bbc8a1d2:v71"); Thu, 18 Feb 2021 16:15:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b861bd5760217c9a
X-CR-MTA-TID: 64aa7808
Received: from e39d3dc01dd2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AB1501CC-DC42-4BA2-A802-0EACC5EAE986.1;
	Thu, 18 Feb 2021 16:15:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e39d3dc01dd2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Feb 2021 16:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9u8yfownMhvJkpKvUR4ndo6FpZrN2j8bzig8KiiS0Kz7e89uoAw6/QKnj0y1eoUAXukHfWpuA1rg9MZd641LJJ1ef8kakhVEoF/gLV2tscZZF5qECHw+r0HkoYz/Tf5TaF7avYGNZT/juhytl44lwzwrIq+vuieQJZa/VRq/QzuLtmpPUIB9Cz7Mb2LhP4xi3oGNSQ5eZDNrcW3yBXvvNNJ1WPScehOOn+2qikRw3yFBipJ3aCAny4aNH9U4ROAGcDwe88LsnkXpe0uCtW5hWFbpIJGHFwXjchn3hbztty7vYpwKfbwNtg/OR8F6mN1UKZjJ5/PbafXKoUWZGvccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h9FBnolhMe3Gu7bEEsI8q6FS0FP/i3QYowh1cpZST8=;
 b=f0Mi+bGJ9QOmxG6jrQrwyMakJLWqBB7YuLQ+NTqWZmhgp7v9CmHjQ3TQEMTKS2y9YSZeBOT4Oz8xOMCbuKhTdAagvBfnIOArCMtoKVw/JM3piLlqDMbEiFu3Kj2YnAijQ09SX5v/N+HG6OHNAcb+zrr6bYpZmzUuUSo0NmBeVxteoM4ek31+/eZstmL2Jdr9xgLH8nHffBkdLl9d5GxSdGmvcWlkYpwbozCX7k693UioQDOOjEfVMLotgVh+8PSb02ISc+w7ljfukjePQBq61lLf2A6l8sjhmk4UEYNkjQ9V/2EhAYOcJ+8rqPjXmOCdyRq0GpAQVKStK3Sw9bWiAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h9FBnolhMe3Gu7bEEsI8q6FS0FP/i3QYowh1cpZST8=;
 b=iJLiELK6pmbAFbvfuVoJo3kHJD64PYy9HdiMptFtEfBjIzVHt5EPeGz6AsG7ySTzRJXXTnuxONSNtHRE0oJiLra1yzIdwdDake2cMlCNRtnViX2K8fRyQ4kILc+e/VtRn8Fguu3L1z1WUrPi3w9jkGM049LtjtsVL1lTfMWGuqY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB5976.eurprd08.prod.outlook.com (2603:10a6:20b:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 16:15:38 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3846.039; Thu, 18 Feb 2021
 16:15:38 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [gatesgarth 2/3] arm-autonomy: Fix XenStore initialisation for host kernels < 5.4.95
Date: Thu, 18 Feb 2021 16:15:31 +0000
Message-Id: <43108d9456db39127b1b26f0237f93bc894ae829.1613664627.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <6241cb3cdc3684df1c5b8542c4b5aa7cb44bd3e3.1613664627.git.diego.sueiro@arm.com>
References: <6241cb3cdc3684df1c5b8542c4b5aa7cb44bd3e3.1613664627.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO4P123CA0170.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::13) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.55) by LO4P123CA0170.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18a::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38 via Frontend Transport; Thu, 18 Feb 2021 16:15:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5d397d4-e79b-47e0-6e57-08d8d42871d8
X-MS-TrafficTypeDiagnostic: AS8PR08MB5976:|HE1PR0801MB2012:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB201291B6598D5A52E6F5594D92859@HE1PR0801MB2012.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +rIWEwn2FhLh6F+NhbM17/xILlsye//T9EBytb1oxR0OX/Q0oSrI4w21HJ/lSUj0H7J1e6gbx0+dDNIwzDwckq+SRxLvhUvLsjBmpSU8J4p7Q+0Itkinm3YjspDnvKGX6ZRkxciSIoiCV0wtIN75GyODtXm0xBlTuOvUqIxt+u8nF0uxlxClf386q/0Glv2ezE43g5FTQHGf/ZsDjcg24xnMowSVAeZ/65LNzOTPksAmn6LZE5Cvvzccc5H3DY5N1ruJe1spqYHORpP/B9Zx7YhyRd3CWphy6j6uLZcyzWM6QHORWFyYrxSHdR3OQzIxjKELKXSFrIijohbiCyNEZgyMSW9exNAoyAXQOIFrCyyx9gtKCrNydn3gWfGY3c55aLEMDUY/O00Zk/YolxnkSeDReAjzufxc1rnqM3aneJtlAFEsWghMH5Jnb4pezjIIwCWKMuV03xRDu4A4eYOT5bhT5D/rY3YByvROHWp8dCS7SfYu6fEj12r0MIE3EcMfK6aZPxCHDSCZrH9GsV3CTesAdo/EqoxIwkvxTcEmX+Vtnxoreyfpdve4gfffT8e7919gw8rXL7DtXR+5bP3NqQG9Ai0KludxWk7wExfxsd8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(8676002)(4326008)(66946007)(6486002)(66476007)(44832011)(186003)(966005)(52116002)(16526019)(316002)(478600001)(5660300002)(26005)(66556008)(956004)(2616005)(6916009)(8936002)(7696005)(36756003)(2906002)(83380400001)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?cB3+7AuNrvpQrNxuwYPOUTexwcyWWZFAzIuHTfZXj/sGrgp9Ba3RHMSTiD2r?=
 =?us-ascii?Q?sVeVeX5v++QHIPQdvIGpDQ45W38frE6KRyj127XGBpMIfaGoWkMjgaOPl4oS?=
 =?us-ascii?Q?/NHWCKxete1Yo4IGtRxAw59he9L7dinNqgXJipXe+kQs9p5xXqsA2mtqsE7Y?=
 =?us-ascii?Q?EBofYbki3DOrmaPjIp2FAhxUcBKwkLH1elvL/f++EUVbJbZhpKqTGX4kxvS3?=
 =?us-ascii?Q?pOYyhVSIj+ixh/EM5K0UWySQCC57dcVZe0JZpuVHAWE0jjkedDFPvv1SQ+wj?=
 =?us-ascii?Q?wUmVbrZDVVzPFpY6zXtEmvSgCi32djnBe/U+O2nI2htxQsrV9BEOrSYdbbw0?=
 =?us-ascii?Q?3Yajf8ZB4bYzhHBs6q9nZNBRPt9p3bqSrOSYYH880Ge8kuvjFiEo1bSLR4t6?=
 =?us-ascii?Q?yLalV5r3zrNFdFzPeWt+EjYmXHQqZUDXeZzG8QYXQ2NgJO8TfZ1Eco8AS74T?=
 =?us-ascii?Q?MOn62SNUqSRhu/kApeCa9C6yv8u5d+YMJ373dYiF7VYAMH8Visepi26Y4JGE?=
 =?us-ascii?Q?0b/oMogKAHU+PGz/guu6ayUsAENu/Kxa0O8qKNUSfNfxDsHf1SOmWlJ0A99k?=
 =?us-ascii?Q?tr2yJW4LoSceCwEHCa7UCgK5UNK1rpdlPrBVnFib3E/MzL11NhfSGK3wAPwf?=
 =?us-ascii?Q?6CO3wps2zXu/D8k9ZZ9+EsRaxtYrcwmA4swQsV0GR3UcLm9YFvmh2FIM04Iw?=
 =?us-ascii?Q?KblQPF3pIWDyJx2CFHSxXMnCmMC/IUUsWMD8xlCuQsqHGl9kDLsYAlstzoWR?=
 =?us-ascii?Q?3mg/XZixK6nsP8a340YH3UyOrLMSA0DTonLN6RmnSZeRybaZrJ7rg85pY82U?=
 =?us-ascii?Q?1Lk0heEBP8GyHBOMVuK608yKhRy9Zd2Bg05fyShOlLZWWMfh3msnp2JfxOEq?=
 =?us-ascii?Q?ipZfZwmDVYGMft6Vx+rOUIOTRmI1iMKBnMM27S3CPtqWGYByRXljFb2B0sGX?=
 =?us-ascii?Q?hGBqc+K5lE8bqhhxF2yR1Y7Bc08xynTLi0i2tAqyG8dGF7LATqYhavweXO5i?=
 =?us-ascii?Q?BTXYI2AJwNQRnUt3nNhd5lwaCoji0DwC/GBjvrZsfNWD/la+yYsPDgqSxs6f?=
 =?us-ascii?Q?CjVddsrBxS77eDaZi/29gikH5Ll+LX72uEdmIKBBb4bjWh4FhUWpl8BgOGeE?=
 =?us-ascii?Q?Y8hcA4nYjmn8N7P6lUQRdOeQ0gfzwNs82D7fyKOhCu+D+BBHXik7VPGr/+CN?=
 =?us-ascii?Q?caO4QX5Qs9kd5jcAH5F/GAzsAdnIj0qeGe2hUIBUm1rZSYFlHtsQy7eQSkUU?=
 =?us-ascii?Q?JtRp/5iJP4aEPcnD6gY/n0Ca6gWH6Um5TSHdcaUVtX+xsGSrYdv7gM9VTA3e?=
 =?us-ascii?Q?/FxlwS31oZp/oaHAnZGEJMcf?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5976
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	95be6292-d789-4a9d-6e9c-08d8d4286de5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QVP73U5ohamEJzW1W4g9keu90FZKGzySMt9Ppq79x92ooDwQm/4RXAc0hl1f0MzqJLUcs6Qf04lQdIIATsyPuMDNhCB/CXM7dTWT2nudvTSuW5H2nnxHBJ9te1cjQLo4UQgytbl+6Gxk9FseaymnW9xns3r4neBW3VwyYN+wNipEYiVP2Zawgti6XTgGx5/X4ZhuK3ulUSnAh3df1HyEkF8IlaVpGtACdkrk+M3DiicOxzXPCMGPYGIz6aPq0grJSVtXdZ0myt6Q3sMsyQB5ACXEBmjNaq/aK5BDtPvZZ4Ieu3VZec2JmMNBV294Mgw95cuJgdWvanFhtR8h4SRIuYOBRIaNEH/6MwR/IghDrzAWMVyuOCVQ25FCNnyzSjoGK8voOzHGe3Zam63EBR8H0Mjx7K0N11s/O8JFNx7YU9JsR6Nvg9PG2/JHH4QKL3e6a2CVF7JQY9s5goaCERoxG3IJJoT/RRMDpyy/y+XQoGBOGVJCemzQ6Mf1OF1DCRftj9RdRG1fTxICCELIu87272C/F6+h3Regot2neZsTVvwcWMLmFCxdmxPcTW3D5sWynIu4PyyNOtv/gT4PSNv5J9dLnaLy/x4B/dDpBnOVfZjgeYbxEbMifuxZgeKw7Ho9r2Yo7b2Zc0XImGNDkw4e8w8HWuU4VO5CpTETYhH9hgA67wcknZem9zBXqLAPSenSQwOd/J2qatlJw46wC/hc0tsMWW6mqF29L5z63BZX6z4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966006)(36840700001)(5660300002)(47076005)(186003)(8676002)(478600001)(44832011)(316002)(70206006)(7696005)(6916009)(2616005)(36756003)(26005)(966005)(36860700001)(70586007)(83380400001)(956004)(82740400003)(8936002)(356005)(6666004)(2906002)(4326008)(16526019)(6486002)(82310400003)(336012)(86362001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 16:15:44.6645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d397d4-e79b-47e0-6e57-08d8d42871d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2012
Content-Type: text/plain

The arm-autonomy-host kernels older than 5.4.95 need to backport the
0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch in order to be able to
use the `xl block-attach` and fix this issue:
```
xl block-attach 0 "phy:/dev/vg-xen-vda3/base" xvda w
libxl: error: libxl_xshelp.c:201:libxl__xs_read_mandatory: xenstore read failed: `/libxl/0/type': No such file or directory
libxl: warning: libxl_dom.c:52:libxl__domain_type: unable to get domain type for domid=0, assuming HVM
libxl: error: libxl_disk.c:314:device_disk_add: device already exists in xenstore
libxl: error: libxl_device.c:1407:device_addrm_aocomplete: unable to add device
```

This issue is not present in linux-linaro-arm[-rt] 5.4.0 used by N1SDP, hence
we do not apply this patch for it.

Issue-Id: SCM-2151
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Iea22c54e86db17952662faf75cae94d0ef18d4f3
---
 ...XenStore-initialisation-for-XS_LOCAL.patch | 98 +++++++++++++++++++
 .../linux/linux-arm-autonomy.inc              |  7 ++
 2 files changed, 105 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
new file mode 100644
index 0000000..5bf9b74
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
@@ -0,0 +1,98 @@
+From 5f3d54c00f1f2682cee9c590c22655b0330ffd18 Mon Sep 17 00:00:00 2001
+Message-Id: <5f3d54c00f1f2682cee9c590c22655b0330ffd18.1612780458.git.diego.sueiro@arm.com>
+From: David Woodhouse <dwmw@amazon.co.uk>
+Date: Tue, 26 Jan 2021 17:01:49 +0000
+Subject: [PATCH] xen: Fix XenStore initialisation for XS_LOCAL
+
+commit 5f46400f7a6a4fad635d5a79e2aa5a04a30ffea1 upstream.
+
+In commit 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
+I reworked the triggering of xenbus_probe().
+
+I tried to simplify things by taking out the workqueue based startup
+triggered from wake_waiting(); the somewhat poorly named xenbus IRQ
+handler.
+
+I missed the fact that in the XS_LOCAL case (Dom0 starting its own
+xenstored or xenstore-stubdom, which happens after the kernel is booted
+completely), that IRQ-based trigger is still actually needed.
+
+So... put it back, except more cleanly. By just spawning a xenbus_probe
+thread which waits on xb_waitq and runs the probe the first time it
+gets woken, just as the workqueue-based hack did.
+
+This is actually a nicer approach for *all* the back ends with different
+interrupt methods, and we can switch them all over to that without the
+complex conditions for when to trigger it. But not in -rc6. This is
+the minimal fix for the regression, although it's a step in the right
+direction instead of doing a partial revert and actually putting the
+workqueue back. It's also simpler than the workqueue.
+
+Fixes: 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
+Reported-by: Juergen Gross <jgross@suse.com>
+Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
+Reviewed-by: Juergen Gross <jgross@suse.com>
+Link: https://lore.kernel.org/r/4c9af052a6e0f6485d1de43f2c38b1461996db99.camel@infradead.org
+Signed-off-by: Juergen Gross <jgross@suse.com>
+Cc: Salvatore Bonaccorso <carnil@debian.org>
+Cc: Jason Andryuk <jandryuk@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ drivers/xen/xenbus/xenbus_probe.c | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
+index c8f0282bb649..18ffd0551b54 100644
+--- a/drivers/xen/xenbus/xenbus_probe.c
++++ b/drivers/xen/xenbus/xenbus_probe.c
+@@ -714,6 +714,23 @@ static bool xs_hvm_defer_init_for_callback(void)
+ #endif
+ }
+ 
++static int xenbus_probe_thread(void *unused)
++{
++	DEFINE_WAIT(w);
++
++	/*
++	 * We actually just want to wait for *any* trigger of xb_waitq,
++	 * and run xenbus_probe() the moment it occurs.
++	 */
++	prepare_to_wait(&xb_waitq, &w, TASK_INTERRUPTIBLE);
++	schedule();
++	finish_wait(&xb_waitq, &w);
++
++	DPRINTK("probing");
++	xenbus_probe();
++	return 0;
++}
++
+ static int __init xenbus_probe_initcall(void)
+ {
+ 	/*
+@@ -725,6 +742,20 @@ static int __init xenbus_probe_initcall(void)
+ 	     !xs_hvm_defer_init_for_callback()))
+ 		xenbus_probe();
+ 
++	/*
++	 * For XS_LOCAL, spawn a thread which will wait for xenstored
++	 * or a xenstore-stubdom to be started, then probe. It will be
++	 * triggered when communication starts happening, by waiting
++	 * on xb_waitq.
++	 */
++	if (xen_store_domain_type == XS_LOCAL) {
++		struct task_struct *probe_task;
++
++		probe_task = kthread_run(xenbus_probe_thread, NULL,
++					 "xenbus_probe");
++		if (IS_ERR(probe_task))
++			return PTR_ERR(probe_task);
++	}
+ 	return 0;
+ }
+ device_initcall(xenbus_probe_initcall);
+-- 
+2.17.1
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 89c9fce..bef56d2 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -38,8 +38,15 @@ python() {
     from distutils.version import LooseVersion
 
     kernelVersion = d.getVar('LINUX_VERSION')
+    pn = d.getVar('PN')
 
     if kernelVersion and LooseVersion(kernelVersion) < '5.10':
         if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-guest"):
             d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch' )
+
+    if kernelVersion and LooseVersion(kernelVersion) < '5.4.95' \
+       and pn != 'linux-libc-headers' \
+       and not pn.startswith('linux-linaro-arm') \
+       and oe.utils.any_distro_features(d, "arm-autonomy-host"):
+        d.appendVar('SRC_URI', ' file://files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch' )
 }
-- 
2.17.1

