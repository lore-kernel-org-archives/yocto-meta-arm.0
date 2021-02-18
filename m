Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.70])
 by mx.groups.io with SMTP id smtpd.web12.9240.1613664607522133904
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 08:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KD+fBNd2;
 spf=pass (domain: arm.com, ip: 40.107.8.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYeGxV1vvj/z+HxH27FRK3c4jyJhuZXmxmep6BVvAkE=;
 b=KD+fBNd27maaVOMZzz3vfJ+vS6TQN4s6HemrkXkx+MWh1RizZvrFn3rDXY2JKhKPTWwZEhr/aN2Bv4u7vPnSfFk1iVvXG9n63JJbMVzw2PxLSmdZJC8EZO9Ap8idaSCcLXnopFafGrVD2mtfDWpryktko5gh0UvjaT2YqmKfRTY=
Received: from DB7PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:10:36::34)
 by VI1PR08MB4479.eurprd08.prod.outlook.com (2603:10a6:803:fc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 18 Feb
 2021 16:10:01 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::3d) by DB7PR05CA0021.outlook.office365.com
 (2603:10a6:10:36::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 16:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 16:10:01 +0000
Received: ("Tessian outbound e7cb4a6f0881:v71"); Thu, 18 Feb 2021 16:10:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac34fd9060e78b7d
X-CR-MTA-TID: 64aa7808
Received: from cb4a55dc633a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 34C39BE4-38CC-466A-9D1B-0786BA15B9F5.1;
	Thu, 18 Feb 2021 16:09:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb4a55dc633a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Feb 2021 16:09:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDEgXW4WK0GnjtxHfoodAP8aCM74pfLL2bGk90EfnThQcBfe0W/EAiS8itHkn3uLJFPMcZVRMIsBU2Hj9iO4tMtsZfhlZUWWkvHr9NT7ZcD8YysAI8+oabAtYN3vYwLOG4aZkDqLXwXhUFl7R6r8XbEZAlhUKueUPDubFtXI9F8A41Gdp86rdGq4iRgIBh9GlavYy9+AOh+u6UpiUgXujqW1uEijutFgsvsjCMvYuhLHPPKfAZGOX6b3cLr2PDe5W7utgJN1KGICO2baddqIComUNEn/Os90s6hJZWzBTFM+D2gkMH4HeQ+GjyJaEuC1m7Xh+/JN4+hGcPim5m38lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYeGxV1vvj/z+HxH27FRK3c4jyJhuZXmxmep6BVvAkE=;
 b=XK8pWp6sGEZdBG5/ivhRI9tK7n6wVPIZJviDy+asYYXE7gIO8CXySETB3EYehr5attwiA5mOCnPtPAMW8HZaJ079FamOAersnOfiRwH3g9aXynL0UH0zOBE69/mJn8+fBwjLZU2J4B0FDqCKINS9K3JgfY9Kxbnd6KGQ90VjBz5jWHeHCrwUJXWcR8GsryY60jluO5A/eRo+aJJNL1gD4CIIOK40j5QImK28oaECzNOAW0HWgbnHaHMyOOzRWJnaMvjbX7GsOBbyNpDhMb/e2F0YsaggHoDIRcdkLVIjXJFUo5Gd52j7FNZAX7eiKlG60yRLl5VoYOJ3AfAA6uxD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYeGxV1vvj/z+HxH27FRK3c4jyJhuZXmxmep6BVvAkE=;
 b=KD+fBNd27maaVOMZzz3vfJ+vS6TQN4s6HemrkXkx+MWh1RizZvrFn3rDXY2JKhKPTWwZEhr/aN2Bv4u7vPnSfFk1iVvXG9n63JJbMVzw2PxLSmdZJC8EZO9Ap8idaSCcLXnopFafGrVD2mtfDWpryktko5gh0UvjaT2YqmKfRTY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5318.eurprd08.prod.outlook.com (2603:10a6:20b:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 16:09:44 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3846.039; Thu, 18 Feb 2021
 16:09:44 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 1/2] arm-autonomy: Fix XenStore initialisation for host kernels < 5.10.13
Date: Thu, 18 Feb 2021 16:09:29 +0000
Message-Id: <c8089ef6374d54f9946ad3e0081806ee4d8caeb5.1613664505.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: PN0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::20) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by PN0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 16:09:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6bb3292-bf79-44a3-d7bf-08d8d427a52a
X-MS-TrafficTypeDiagnostic: AM7PR08MB5318:|VI1PR08MB4479:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB44796949D2E6D2C3FF93302C92859@VI1PR08MB4479.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 u0B+Z/tSbIPH65czUPgdVYlsrnwZrDSwJVVUHNuNNYDYyj9IKO8XTQO+gXS8NUiDzx62ZyDR+jZW12zR8aqTf8cSQWaFryB1LVR43YlG5XYrMMc0eFsKryhdZTzK1qfeqFagDASVIU3SUxdwVoYEqBQpAhjEciTNbYyGrYeKsw1fAU+29jRdfb6ZyhEfPfMeULXwo0Qa0gkPH/7zrdxvH127XocvVOunuc4kcW3Zwv8p3tvR5NYgOWZap6zYBAUdKktdQgBLvCnhYoKyPVF5bZmtCRTLZYnl58e6qQwz90gcL4n7Ek2xA0//9sKfGcPBjv9XC5g2jA7d9qDyimK/IGpPCPLMlECZ4uoXmK6ORNwcemVJPQKkYfHdGa8MAu2EZRQNBq/WZ1eAWTFw5hy787hd9CFfdWfJS6Ze4lpMEF3rMh6vtlnmhK03TlSx+cCflWh0X6BCskJWNK/Vsv+UANeVAFuXSpuGAmV6l90DeOkZM3Oips0XXrslMfyIBRJSiuYJWTxzMK94J//eiM26WeWQDyV1sm1lcvon1PNKB9YTz9Gk0aW1PK/P0eX1/LiF0THQXggvszW1KWsSNZr4GGrmvdVQRm6OsWs+JucgHtk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(4326008)(66476007)(2906002)(36756003)(66556008)(8936002)(6486002)(5660300002)(6916009)(16526019)(52116002)(186003)(26005)(7696005)(478600001)(2616005)(8676002)(956004)(86362001)(44832011)(966005)(6666004)(316002)(66946007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?othXXZZX5ktGvQT/UWIUACjEpY5j9EENOxMTVSDUslpCUZ2DsOs0bPYt3zTz?=
 =?us-ascii?Q?PiiP/TkSviTMbR3CTku1n8eb/JKLHKT+lWMyDurgzvp5G9IPnZQcQ2CsIvU8?=
 =?us-ascii?Q?y0FAzB7BAmQdfv7NZw75LRQxEpPv6n++ZzEOnl0WLHJD/YihpwTY7JR1ugOK?=
 =?us-ascii?Q?2lBNK4bhEB2UcyQ9Tv0WSNmIrn2V+0vRrIO2BeuvjK/2zWbTGvOyHO71x86R?=
 =?us-ascii?Q?ZXM321yENPFK2qetxjfq0xfZZO6IR+Ob0FcUNJD5vEw7rswFjFp82azZw4d3?=
 =?us-ascii?Q?e9ceCQe3au1jU3Vekz8BSD1WXPLfVTfRxgxfmWLt+BTThKGSZLzYrLtYdVru?=
 =?us-ascii?Q?/3e1JHu9fy7dJj0qerpuC8w7dTaZE21Y4pyxeXNOiZrYtcDYauNv5ZfLD9Ur?=
 =?us-ascii?Q?MpdOi9wwFx6bXrL7t3xZ9mHW/1bCOCUZ7DlwobiVpJJyRJzlNT6g9iydIfBV?=
 =?us-ascii?Q?kUAesl4SonB/+Xc+OKr2vEQJA3oMUFULlvxli2eHAihzqADTEE3anLpUuPfR?=
 =?us-ascii?Q?ctb04ubW6c6rG7fw3rVJwCaNZu6LVDaW6sWLss5MtrgErHrIXHmZwL+MDWct?=
 =?us-ascii?Q?qlyXRzRDuWx4p15Ov/wkfa6tyKzwj3/KMuQgDPf1UpaaSYeZTixxiLUodvQg?=
 =?us-ascii?Q?VogasNa1+6ltqOzZqMP4RfmmSidUXLi13gfZ5hRNR7Cf0KNMY9cv2d1lvwYe?=
 =?us-ascii?Q?vpJhZSKn4ONks5QAowx0qBHdGSuetkVU/x/+BFY+BgYD/Lv9xZNO3BbJVPIr?=
 =?us-ascii?Q?/qvusqyXlSYEd9AQZr3Fu7nhdtiGySOdmBpLtuvGM/2pIjZWZgQtoOKP/5Tz?=
 =?us-ascii?Q?dR3Erz77KE8DdRtnbL2c0GglF/8lQoKusCGtdoYVb2lz94pzQYyYYysX/YHx?=
 =?us-ascii?Q?VFg9TrtMIANmyOduzhy9aie5ASWO/YKGXyDZ7TsJToV6RfUOc78E4Ur7szQX?=
 =?us-ascii?Q?4HuGj/W3v9LkBkDrroouIuuEy7syxAo8u/O/uACW3rkYmnqGEnhejCu6GxsL?=
 =?us-ascii?Q?0gmwZY59/753hZsUQ8U59kEyB4AtBQjQ/awSSNLw80Od+o0L7Vp36PbqjHaP?=
 =?us-ascii?Q?hi4dUmBHAo4sAkCCaQACv1U9el5BykQvEQecB0os5qJWyQFK7LnszHbpvjSP?=
 =?us-ascii?Q?gz0paEeE37/ppwFD8DRA6PBtJoKtJuCF6gtbLrz+5uNa+naiUEBh5LvbitC7?=
 =?us-ascii?Q?7Hs58bQkaVk4UTITTH9oyAy8iaRf7E0p0nxrfWMXsSvM0uKirUpbpUgy71FR?=
 =?us-ascii?Q?/zn5Zf2QhUgCsW+SuAJSsy0CiNeSusgMUeoL8zgsZMukqz1njAkgKvgSr2wU?=
 =?us-ascii?Q?QjI3wN6gDXRE1YB1a4WMbDw7?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5318
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31b92e24-83f2-4e2a-2aca-08d8d4279aa6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TJUlYrdBIfNgcgjI6rNimix23Fv18VHGkVz7EYeFqO+x8lYxsXgkfzHyL/MalUZVO7KC0NdFrtv8EafDnfwzy09bz/kMTflfTNNNOty5I1WPcSQVw2roN5tr/YxL9DxYVqgKpAdzoV8N9MzQreJ+Do8MwYgny8iDeX4NAo3HgSrIFnfe9hRlfScsx7CCjezkGKbJffGkqfxey+sNMeEs7zhxTBioZ8VNPpLnrE2EJirPnKLJ99jnywaE8KYGi1/cEZScQH3IPKNkHpclsU1jHbPd/ksNDoZylWRl8TFHNw/NvgU1qsnfIfMZJ1kMWY66U+F2RzgPS1lckFpPIHIPkEVv2Wk1LnHtD+lLY607qUsCibsqsqOWr0EKmI2Ao/QZ1dEtfGXhu8XdQiBUiggzbXAasWnrd7w7T6VdjT6ZUxmUcFBmxQA6TWBkuemGkxVpWdMSgXs+MnSkqr9w8q3B7rPKyLO0tHD30Sv+0c3PvK70Bie4tsE63Jeyj0d7PcoEAQBovgjm+p05ibmMMhXeidf74ws8Xr+RLUbFWEIXz7aVpEU6SSNY+BB+q3NzWL9BsXDpOgov/wQPLHzf0UDXAHIASwPOJKdF3+AkFGWd2Xly0k0llus5k851mlgbK0Kh/qhGvaFew9KEyowop5di6jkN+uWpLaa1KW9abX2pCg2zHPswJXcNYyclWbxRfqr1XbA9ATHOpGWiU7B4QDxpDpIu8gCCZQ45e2tNBv+QB3w=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(46966006)(956004)(6666004)(81166007)(82740400003)(44832011)(26005)(83380400001)(8936002)(86362001)(186003)(2906002)(36756003)(36860700001)(7696005)(4326008)(47076005)(2616005)(336012)(82310400003)(16526019)(478600001)(6916009)(8676002)(70206006)(356005)(966005)(6486002)(70586007)(5660300002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 16:10:01.2721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bb3292-bf79-44a3-d7bf-08d8d427a52a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4479
Content-Type: text/plain

The arm-autonomy-host kernels older than 5.10.13 need to backport the
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
Change-Id: I1a38e22084161fb4b6028ef12443707cc566d56e
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
index 89c9fce..e14ea96 100644
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
+    if kernelVersion and LooseVersion(kernelVersion) < '5.10.13' \
+       and pn != 'linux-libc-headers' \
+       and not pn.startswith('linux-linaro-arm') \
+       and oe.utils.any_distro_features(d, "arm-autonomy-host"):
+        d.appendVar('SRC_URI', ' file://files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch' )
 }
-- 
2.17.1

