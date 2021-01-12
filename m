Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.54])
 by mx.groups.io with SMTP id smtpd.web08.10567.1610464873125820807
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eg6Z0WsN;
 spf=pass (domain: arm.com, ip: 40.107.6.54, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF5AwtuQle0B56mh06MMqRh/kt0I00JPLi24V3rxWDI=;
 b=eg6Z0WsN+ZM1OnLIGEv3Onr8BiwaFOKhKCSOVGlzKzrxP4PNpDpwYtFPPy/SGB2FDymoaq6QWG6J6lSrLNt7xMP9l1XliVMQ4/EYAnVw6lCXkaDCX12YYMjiFgnHcNCck+aQu0rPUt6uKBMUpb4j3dP12DLklNnMhKaqfzkZRxw=
Received: from DBBPR09CA0024.eurprd09.prod.outlook.com (2603:10a6:10:c0::36)
 by DB8PR08MB5212.eurprd08.prod.outlook.com (2603:10a6:10:bf::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Tue, 12 Jan
 2021 15:21:09 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::1c) by DBBPR09CA0024.outlook.office365.com
 (2603:10a6:10:c0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:09 +0000
Received: ("Tessian outbound e989e14f9207:v71"); Tue, 12 Jan 2021 15:21:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8bdb09e45ad41033
X-CR-MTA-TID: 64aa7808
Received: from 3c030c8d71ef.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DF4A485F-C1E4-4C1E-8B92-64536A9AB573.1;
	Tue, 12 Jan 2021 15:21:04 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c030c8d71ef.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibFOsaxKuH3U2Qx53Ts5hQQquzySvCZ+CMm63dssV/+aaOvsLu0QuPybmTsFQ0a5a+xwy5xe8VASzWkd4na4GuQpNI7HI5GyrgZme94VpiAb0XFaGpynCYgjUthgNN7KKxlUmyR0wac721XQbs90MQ0MZ5KsovEfYli87gcUlhR9MgmPlEXdhlYz4WLxdTOE0dT4/kqLCdpCBQ4vg+MDx2cZsn8tnCdXugTnvWo/gE/ZWVvAVXbuMdOEYjQIX0+DrVYMJESazbvskHVAtGf3K2gMHubzGS5OXZpXY5O44ulO/E32fGVvaqZU8gM+2HlltYTPMVqCZlDVsxxo6gKSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF5AwtuQle0B56mh06MMqRh/kt0I00JPLi24V3rxWDI=;
 b=j+BxnBFT5TbAq4DUqmnAHgtFumPXr/ZCH9C2nab/1/aYYwXMa8iAdD7Lpw6LKghWL0ve+Ce1ZjPitva++Mg7uCFNEa27I1gLvFHvMkOTOyrBIJbLu6SMNgC2Vd/ZSIvnOqoMWqW95PSIkufZMXk5cbhL46ZhMlxkzOogBtn4CYds53LvWzU1Jz9DOfuSAqcQbySNy5eK7L2QVlm0GYJPEmpBo2JSUMZWmFuCX/KSgjmatFSJvtXeEO8gBVtGTLB60usigxsfiZVZJrED1NYLcITYjpShyR/3Wk/tLneC9BZRZtrtlzieK1Ro2tTXcWcR5hl+++0LlRCP1QCtYLvN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF5AwtuQle0B56mh06MMqRh/kt0I00JPLi24V3rxWDI=;
 b=eg6Z0WsN+ZM1OnLIGEv3Onr8BiwaFOKhKCSOVGlzKzrxP4PNpDpwYtFPPy/SGB2FDymoaq6QWG6J6lSrLNt7xMP9l1XliVMQ4/EYAnVw6lCXkaDCX12YYMjiFgnHcNCck+aQu0rPUt6uKBMUpb4j3dP12DLklNnMhKaqfzkZRxw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VI1PR08MB3053.eurprd08.prod.outlook.com (2603:10a6:803:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 15:21:03 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:03 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 04/10] arm-bsp/tc0: Add support for optee
Date: Tue, 12 Jan 2021 15:20:43 +0000
Message-ID: <20210112152049.3436645-4-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c08c911b-80de-4236-a985-08d8b70db076
X-MS-TrafficTypeDiagnostic: VI1PR08MB3053:|DB8PR08MB5212:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB52127F1B7FC89B364D91BBA3FBAA0@DB8PR08MB5212.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mgL8kC93AoIV9HwGAQgd2dMk3mPgPUlZ+JgEl6+mNSrE8X7IKR1Fm2OVtutys1oOObtMoi51b9dar7OxTwlwBDjiDbaqBjqHg03+mWiYZxVP2jP4s4u8xAbQ6m6C3flBmQeh1tbgTUtIEhFhVLjxw5Kv5w1M6E+yxm2gdQ4Zc9kjpKU8a0OCwbYCSiD5zvdHwcKeg9RXgbR1PvkBdXafbekL0HNWBeIKa0kg5EDzyNUP6M7NzMegxbaUOrNBDvvvY9ZncbBX6f/a25Dw4VJ+nsUfv9DXa1PSzZjNJsm89FX5MF5tmo9/ee9PHxqBI9KK2Ct3K1DEGAYbSTgcs/+hskTRP1z3aY5tzUvXf3GMuD01/DVlxsvby4Q1Lnb8jrtlhjie3mADF5gu2Gqc1DQrXA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(66946007)(1076003)(36756003)(6666004)(16526019)(66476007)(83380400001)(44832011)(186003)(5660300002)(8676002)(4326008)(7696005)(52116002)(2906002)(66556008)(8936002)(2616005)(956004)(6486002)(26005)(6916009)(478600001)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+jZwmXnH36bXHKvB92XXedS/MgsU2+QISxnpXbKwzysbGOM3WVG/lv9IDPE3?=
 =?us-ascii?Q?LdmgYQ+uzt6D0lCixbBech2s1PYuoLesjeFw/7oaT/jb1N0YXmHYk6Xqo7zv?=
 =?us-ascii?Q?/VLQe+lcIBsJbwyf/zSauQL9bnfcBxnrF5QqJrJRLw/Js97GhQdMP7dpYoaD?=
 =?us-ascii?Q?xtLFrW5a7OY+rIPFUtdTyOfSq29cX1hjTOjaFNvBQAL1O7F/ClaTZlCHSSjI?=
 =?us-ascii?Q?AenIdaZd93PXCY4ZKVqg2q1tje+wbteR9q7oRxuAni1idh5KU20mV+n9k7Px?=
 =?us-ascii?Q?BUfdT43G4WgA5+z4524cNknH5tYGsiASBxOwkc9AWAtkVIRC7RWPgnNle4bk?=
 =?us-ascii?Q?6hAcNBcS9BQf4n2tLWP5gqphL9TlBzlcIpJml9B6UdoezYB21Om5IZEkyVo/?=
 =?us-ascii?Q?l71UGPuZlmYApNT6/zB9lI9q1JmV0VZbx/u6HkkR8+e7/BxsSRIrhAcKoUVH?=
 =?us-ascii?Q?0RLezMQiPWMQsvIwePq8zb1yajvQ9mjAjamTCtq2JR5IGPnY8PgTBAp+6eM0?=
 =?us-ascii?Q?lQPGEgE+G3ulmRJgDZBa0+wmjkMYuUU9woYPNQe7nLwsjy42CNjQL7KVrv00?=
 =?us-ascii?Q?nWyC5sN69HWC4kw3D9dSqYDX455U4xevokoXrP7K0hsTMqfz1SDjtatcIzDZ?=
 =?us-ascii?Q?Wr0VFBcRkJxJKJt/UeCU3fC7MM61GCvO2dF1MrVj9hOErRVXqHpVgQyKA9Sr?=
 =?us-ascii?Q?dnzv4Dk7fR4shoaxlMJeot8GBwrP1NiWSY4r0q4wNWuZLbPCPxE1rLFUeqPc?=
 =?us-ascii?Q?7UdhLvwqo5vKDA7bRdOiO5R0DuePjP2Gl5lnm4zgUIGuaRaOc7rmYHAjx3GU?=
 =?us-ascii?Q?VQ7vEfNcwbTuMUAjxhr5cWGc9aAQHgN2cb9wrv6EO8iLY4kdDWQ579lBjlRU?=
 =?us-ascii?Q?SVzzk36szcPaeYRez9B4Mrre7hhKAbOZoJFe3CNdZM2afpnAPJ49GI6PoD9O?=
 =?us-ascii?Q?nle1KG1w1r6gUqEyew/DvYOjnFRLjcGyXwBPQikiw3bb+1eMVEakurXuQL9t?=
 =?us-ascii?Q?Sxq9?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3053
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	71ff447e-1c40-4bad-032e-08d8b70dac8c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m0Bhc2yCRCa3/yNE9Yc9VWFV2CKX8l7TwoqQ0TgH9OTJ1E+9agGfsoi1xvMEcAcd6leXUna+yCVY4APGNWaBo4p1MMjKYX4eMpKPYWYfynPYIX3LxNinl0ZdALCSLUi0NJykT+jgDPA2bKNcAYEK92P8i+DfwEpG6s+qEQDiG3eWi9wbLD2J/B13lWPBjfzJU2d16uW9p7iJhUvgXwRXyxvkWFr8FIuIyS1DrtcD04/hSzW4g7Awv3Gvk0kTTqzAo106NV3nwNGjCVUEw49pDDkjpYcL7wFedh3zTIWWv0Q7hILcXMbjSfJxJ+UvVXnkiLbgYXJiqWkn+UkCNib9QIEeOyWuBSGI8kuRDDi+wa/hkEe87TEtmrZE52viA0q/OvuTE+Md3jncupNW8oOIbzG+nVHjAjYzSg8PzeIZnhrTVw0mmgj1hKedD93qv+2zggzN6cZGze/NM3FvP3+Ul58pG6YsMnhTh+2LOjaXI8NOzsaDunSPgtl1db7znx7p
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(396003)(346002)(46966006)(956004)(8936002)(336012)(2616005)(186003)(44832011)(316002)(6666004)(356005)(36756003)(8676002)(5660300002)(82740400003)(26005)(7696005)(47076005)(82310400003)(16526019)(6916009)(6486002)(70586007)(70206006)(4326008)(478600001)(1076003)(2906002)(86362001)(34020700004)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:09.5879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c08c911b-80de-4236-a985-08d8b70db076
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5212
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This patch adds optee-os, optee-client, optee-test support in tc0 bsp.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I65f795b7ec2b4def4778b286b2f744b06b177157
---
 .../recipes-security/optee/optee-client-tc0.inc  |  5 +++++
 .../optee/optee-client_3.11.0.bbappend           |  6 ++++++
 .../recipes-security/optee/optee-os-tc0.inc      | 16 ++++++++++++++++
 .../optee/optee-os_3.11.0.bbappend               |  6 ++++++
 .../recipes-security/optee/optee-test-tc0.inc    | 14 ++++++++++++++
 .../optee/optee-test_3.11.0.bbappend             |  6 ++++++
 6 files changed, 53 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-client-tc0.in=
c
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_3.11.0=
.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.11.0.bba=
ppend
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.11.0.b=
bappend

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc b/met=
a-arm-bsp/recipes-security/optee/optee-client-tc0.inc
new file mode 100644
index 0000000..8b13386
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
@@ -0,0 +1,5 @@
+# TC0 specific configuration
+
+# Intermediate SHA with 3.11 baseline version
+SRCREV =3D "3f44b870299514ad8c6b7dee776eb2994d9c1cd4"
+PV =3D "3.11.0+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.11.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-client_3.11.0.bbappend
new file mode 100644
index 0000000..fa4fd69
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-client_3.11.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_CLIENT_REQUIRE ?=3D ""
+MACHINE_OPTEE_CLIENT_REQUIRE_tc0 =3D "optee-client-tc0.inc"
+
+require ${MACHINE_OPTEE_CLIENT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/meta-ar=
m-bsp/recipes-security/optee/optee-os-tc0.inc
new file mode 100644
index 0000000..a700daf
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
@@ -0,0 +1,16 @@
+# TC0 specific configuration
+
+# Intermediate SHA with 3.11 baseline version
+SRCREV =3D "3284d935bc7e7bf7abfb5b19394a387d975d6dd4"
+PV =3D "3.11.0+git${SRCPV}"
+
+# This is incorporated into the SRCREV above
+SRC_URI_remove =3D " \
+    file://0001-libutils-provide-empty-__getauxval-implementation.patch \
+    file://0002-link.mk-implement-support-for-libnames-after-libgcc-.patch=
 \
+    file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch=
 \
+"
+
+COMPATIBLE_MACHINE =3D "tc0"
+
+OPTEEMACHINE =3D "totalcompute-tc0"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.11.0.bbappend b=
/meta-arm-bsp/recipes-security/optee/optee-os_3.11.0.bbappend
new file mode 100644
index 0000000..7b96a4d
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.11.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_REQUIRE ?=3D ""
+MACHINE_OPTEE_OS_REQUIRE_tc0 =3D "optee-os-tc0.inc"
+
+require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc b/meta-=
arm-bsp/recipes-security/optee/optee-test-tc0.inc
new file mode 100644
index 0000000..cca5076
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test-tc0.inc
@@ -0,0 +1,14 @@
+# TC0 specific configuration
+
+# Intermediate SHA with 3.11 baseline version
+SRCREV =3D "b35df64954ef96e09c0d5573014f4d1432dbc92f"
+PV =3D "3.11.0+git${SRCPV}"
+
+# This is incorporated into the SRCREV above
+SRC_URI_remove =3D " \
+    file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
+    file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \
+    file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
+"
+
+COMPATIBLE_MACHINE =3D "tc0"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.11.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-test_3.11.0.bbappend
new file mode 100644
index 0000000..4fd1cde
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.11.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
+MACHINE_OPTEE_TEST_REQUIRE_tc0 =3D "optee-test-tc0.inc"
+
+require ${MACHINE_OPTEE_TEST_REQUIRE}
--=20
2.29.2

