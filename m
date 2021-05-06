Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.89])
 by mx.groups.io with SMTP id smtpd.web11.1330.1620316274535350927
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 May 2021 08:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xRHWnmCg;
 spf=pass (domain: arm.com, ip: 40.107.20.89, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FXcC1+JsaKXgzyL0WyvNHuPK/wIBnPN5N8E0/eZAQU=;
 b=xRHWnmCgxFcXRukuCuFMcMoNcRPcIhTZJE6p57i3T1WtfC1u2mhJbqMTGNkpySBlYL5Nswh4DHzKmo6ArTcHZzFqjgL/WYMSZitknGi6U7hiei1xapCFoGT5P6DeXtsOqkjFUp3XWFWVGjXVYSgKDsXy92knia04nCU8kz+SQBQ=
Received: from AM6P193CA0140.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::45)
 by PAXPR08MB6895.eurprd08.prod.outlook.com (2603:10a6:102:134::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 15:51:12 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::25) by AM6P193CA0140.outlook.office365.com
 (2603:10a6:209:85::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 15:51:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 15:51:11 +0000
Received: ("Tessian outbound 9a5bb9d11315:v91"); Thu, 06 May 2021 15:51:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9009e6244e93e1f
X-CR-MTA-TID: 64aa7808
Received: from 05876351bc25.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 701386D9-BD25-4791-BC1E-0ED7D822EB63.1;
	Thu, 06 May 2021 15:51:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05876351bc25.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 May 2021 15:51:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRri8Lelc1Nif7YzMroSEB2CeKK1vhUlqPTKIfr66yyu2X4DLHipj7p1DjbFppjuaI0pnKzmaFmZtIrCUeBNl/JtblMsskdQ4uc4OAEjKL4C7lbwPcjJv1QZgGs8eVWMye/LpZRFepUcXuYt3fNDRnECgp8qJ7xJhYvCSgBntYjmx4+i52qZIcPp8fO2uDc7iggNWmpN1jxwekbmKJ6MNdFtUiK9AEDinAada49efkWB1oOHqeE6U0/k0tP8bZ1ZcJmfp6Vhq2koA0p4bM2vFWY1e12kDkM2RUM3XesIwYa/d1dX64sxZ26tQuAWwKmzWkRpzcorQpxmtlTAGP9FIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FXcC1+JsaKXgzyL0WyvNHuPK/wIBnPN5N8E0/eZAQU=;
 b=Ib7E1s+5H+ctDphQNz+gcyl3XOO4rhgzB0LRGH079pI7+SeM+dTTHrgU0zR4Iaf1PoPWQsac9nvqS6zhsW6DT1CJNUaj78Dk5fjOa7aN1/xidBKlZC9ZMjfxns0RzxXmxeTbRImcYXJ5+2Yc4WgGycBPCeTGws/zKMUUkDv7B/kLPugdJNbi0tQsXNTjGbx7zxz+LFU+Sz9S8VwInCw9Al0EOWOv8G0ouhQ60sukRHsANeujCEHYmuHGJMrGHTorW4R9HnjqmfBKde308zXEfmjLWX32hvA9hI5n+FOZDXI5optsdUal7puKDsh0qy58xlZow0ki9yf+/KTQenhf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FXcC1+JsaKXgzyL0WyvNHuPK/wIBnPN5N8E0/eZAQU=;
 b=xRHWnmCgxFcXRukuCuFMcMoNcRPcIhTZJE6p57i3T1WtfC1u2mhJbqMTGNkpySBlYL5Nswh4DHzKmo6ArTcHZzFqjgL/WYMSZitknGi6U7hiei1xapCFoGT5P6DeXtsOqkjFUp3XWFWVGjXVYSgKDsXy92knia04nCU8kz+SQBQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3654.eurprd08.prod.outlook.com (2603:10a6:20b:4d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Thu, 6 May
 2021 15:51:03 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 15:51:03 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-autonomy/sysvinit-inittab: Fix console login for host and guest
Date: Thu,  6 May 2021 16:50:57 +0100
Message-Id: <09620b591c5854bac47ece9a614178f74d44876e.1620316175.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <be74f8544e42eb50283c1e447c244f0895f5ec0d.1620316175.git.diego.sueiro@arm.com>
References: <be74f8544e42eb50283c1e447c244f0895f5ec0d.1620316175.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LO2P265CA0350.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::26) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.51) by LO2P265CA0350.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend Transport; Thu, 6 May 2021 15:51:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcc334a8-4237-4e3b-3ffa-08d910a6c5be
X-MS-TrafficTypeDiagnostic: AM6PR08MB3654:|PAXPR08MB6895:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB68959C30B9D5D9E2E532302A92589@PAXPR08MB6895.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xf+gL4rn1cEbbGaJ9hqHwR/AO/tHNj+8vWTE62Mfae0qYb+geXThEa7RIlElnfdeCxqiMboNwRs5VU883kM77JLICizCnfeMfzs0iXKwH+/dEu4r3Tkhh21FJougiUx2FZkuoHZKz0uTGQiIj5RlkoYx3twP4LC97VYQyZJHP0EzZBbuUy8gZn2bsaVxrgNneuozFl+vt/wrvH9pdXHc4s7r2JMRk0LHNbMwq0KStFoxUP4LtEtDRSPnR6FcRR/WvAXq7L4sqREmteugg5DbU3YN03PIUJXfGMZJTK4JKM+PQRf8+imqul8hG6xmUvcpDjvABz3LUPMh6IThO+N6AGZ0zmfvL6ZS/FQ5F0bViNBVDRbaRiV1Ol7DXfawwXKxBXiy85WrEsEUN/9vUFlZ1hG1N/1dd6DR7hmUxuQE+VxscT/dCBnBCzrv8TFZAAftoXQy6ocE8bN4tVI9zm8UQ0zIA5gVLgI111FluyXR5jtL4X93aPAxH9bJI5u+Y3YfD0soSxeqkqNPoACmrmuA975614g9biuMMQ0k3J/Mo90JkvkxRApTvQ3Gw/ukRMRRrCjSKpGB1WnSSXkcTVPfQu4XN+Fzgf6OcpTWiS9UNk7+g5Wgt51KUuZtdElPKxrcTMFkGWmHW9X0P8np4KRZsj/1gAcfiUVn1w2Eye0dZIY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(6916009)(5660300002)(2906002)(66476007)(66556008)(4326008)(316002)(66946007)(86362001)(36756003)(6486002)(26005)(8676002)(16526019)(83380400001)(186003)(2616005)(38100700002)(478600001)(956004)(7696005)(52116002)(38350700002)(8936002)(44832011)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?1J9pHO4hL8dxR437Ts5Qgm4p6R5SW+7Ck9qUcxCSjiv2CAPD7l/oGSgCoZHQ?=
 =?us-ascii?Q?s2r85e/FrwtSYg9skvzUx3KP5TD73A1eD2iCUSFcynZM4tZkpqKmFU37uV1M?=
 =?us-ascii?Q?vmp2vOSCwKih0GsLGBrVKTWd0NDPo375u3K0l6oO9OC9GW6c9GywHzDn4fZM?=
 =?us-ascii?Q?bojsYTchKIAJC0hNUaKV4KDdG86kG5A0JZo2gHP02gY2B8a1Bhrn2yPCOiCY?=
 =?us-ascii?Q?P3VajEUuhCtUAJ3vRf2DTJiKqk1nmZkxNN6W4ZxtylB+HlwwAipz3Hw7sb1d?=
 =?us-ascii?Q?b/TJ/TyOPS4yd3Btnl06QBnxDDgfy8IosTlLhccstxgn8RZqgl5/9rVGHYou?=
 =?us-ascii?Q?Zb8GR18/0WRyVmyWfHLIoFeoZ7jfzcPW0F6L7oVE4DlzQgLtXPB/xOgoGKRa?=
 =?us-ascii?Q?wPwT6pm2gTbXDJT/YYUyQntgsuE2gBaVcZ8V34+k7vJAOLs3QJM+MBMqw1ET?=
 =?us-ascii?Q?6DJaPOjeL50tb6CXX1MyL+N6rET68u6TPsJizjU6WQsMgvUdLywRVGNszh6K?=
 =?us-ascii?Q?b5na/+MuhaWW7EEO1CZRIQzrn3CAsozxKamWhqwBDpaCLO2pmRCu78qtd2GS?=
 =?us-ascii?Q?XwLD/phPc3L27lFWX5fCJnXKXnzuVWJ7gb4Q/zqAeK13Stymhsnvru5A52o8?=
 =?us-ascii?Q?ZsnnOuntVYC3TQqGMn89JILaDE9GGz4ktWUzIakGMnrNkKCAmOTkK1uSdSKj?=
 =?us-ascii?Q?IVcmYNqEI9tdBNiO0tOhiUVpPdvKFlHLn0bHAhhmyPrdH3tCo/qcvfBqkS69?=
 =?us-ascii?Q?1jqhLPa2Hpf+5IFDcmUbvj+wT/da9Yh9+9Pc6gXdfm6ftsv+GpSzR5cJNPST?=
 =?us-ascii?Q?n/6ZIu/z7INP7/pZ2idtlYDrQzoVSye8z6DFHrS0AkUAG67H3rVDTphh4Z7P?=
 =?us-ascii?Q?VDvzEpnjeFFjgSBe1hHnHDS10ZWSyvFOCrNJhO+N9OE8qj8PV1hhInb0cEqX?=
 =?us-ascii?Q?4GQX9AStx+sts6eX1fz9K4Ajlls7tvcLXbfXFE8EVskhXdUgXqSCtLBckhum?=
 =?us-ascii?Q?9rjpWs3zyq7NKDAEHbii0jmT5awsMjcaLlZ7BVWOsHMVrOsrwlqBJQa/ge+e?=
 =?us-ascii?Q?wmIyaAMKORDpLpCZgfVapE/GQ6eJmr6nRu8IGKYCO+J8tUCHBgsNjQE5aKwx?=
 =?us-ascii?Q?Aoj9/9N3A1iJf+cYAu04NAeySogrr+Nksx6L21/ZTACD4p9IGz6um5J2BNTu?=
 =?us-ascii?Q?LrKi1jCepvUMJWDTtI2aCuy0gEYmAyeK9BtyjXmpVwFfyoD22Ym2Hb+tGze+?=
 =?us-ascii?Q?0D7xTNCXdgSZg8JnXFbTwkfKJo0zwNdqPWO99VQh1HxCdzam4laDHwWoOyM8?=
 =?us-ascii?Q?TrkR2SRl6EAKI2D/bkxptFz6?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3654
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8809e5cc-6139-488f-5b8e-08d910a6c0ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5aMreGL7Dd8il6L7lORUL/c3rQcgPN4FuuY6dQ09xZas5IG5nGz1nUlWqXjyF/DstRDn7zquQ8BSQESQu+Smc8Xng2cRAQyiQHBMVmMz0I9pZNbRYai31XzAyRqqnToeKGt4Axe7zD464cxcfLjCceNb9sUd5EsxUPPxjX9YgnFSS07Msl04h1eBPXQ+QWvj5N0T8x2rlbNeqG9TUsnL5uTLpyRrkhQtsHsbsr9umZGv2Nod7lcnjZ83y8V3iLvwbijS9KjZMKpVKPlS4VF7+7q8ALtOnOezH1d9wqTvt9EDF4ff2mkHdrungh1T5uU30TEKbNpJo4XuoJzMWk+mqg6vbp6J/p4wxxnk8peFOzFu7GV8Ig9T8SxHja45x2GYpgzkjplCKywuFbI+/3wmc6soBg5hpb5aZGv4FYA94hk0Bf7vDp6gxsLlAKfcLuVen2zQO/4Ou94xtNS4da0Jw3kC0Rrvr5ZDQ4TVkoeq/NkaOTOVtdoG3p1XsDPULUq+uI2ntQyINO65H6oVYEqfHjvyY96UKm2jrIVte5kQULeFD+UePGBjlEJXJ9mBz3jbrIrzRKSkWxcq2AHXI6jogT3v6RBhbxB6UG06nddSdP0eFxK7qUQfmvZZWZnXt9JO07Z1Z4jrb/nwJb7gwj6f4hGQDUWH6ar32mBsLTIDYLg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(82740400003)(86362001)(316002)(16526019)(2616005)(26005)(186003)(336012)(2906002)(4326008)(81166007)(83380400001)(44832011)(8936002)(956004)(356005)(47076005)(6666004)(70586007)(8676002)(7696005)(6916009)(36756003)(36860700001)(5660300002)(478600001)(82310400003)(6486002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:51:11.6568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc334a8-4237-4e3b-3ffa-08d910a6c5be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6895
Content-Type: text/plain

In meta-virtualization master branch the sysvinit-inittab_virtualization.inc
was introduced to handle the installation of the getty-wrapper for spawing the
console login for /dev/hvc0.

Since we don't make usage of the virtualization DISTRO_FEATURES we have to
manually include the mentioned file when building with arm-autonomy-host and
arm-autonomy-guest DISTRO_FEATURES.

Also, since arm-autonomy-guest doesn't include the xen DISTRO_FEATURES we have
to manually include sysvinit-inittab_xen.inc to append the getty-wrapper entry
to /etc/inittab.

Issue-Id: SCM-2329
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I0f92565de8a9053c0541928c30b8f979757bfbca
---
 .../sysvinit/sysvinit-inittab_2.%.bbappend    | 32 +++++++++++--------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
index 7b0c647..e30e964 100644
--- a/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
+++ b/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
@@ -1,16 +1,20 @@
-# if arm-autonomy-guest is activated, we are running as a xen guest so we must
-# have a console on hvc0
-# This is normally done in meta-virtualization if xen is activated but here
-# we don't have xen activated.
-#
+# if arm-autonomy-host or arm-autonomy-guest are activated, we need to install
+# the getty-wrapper to spawn the login console on /dev/hvc0.
+# This is normally done in meta-virtualization if virtualization and xen
+# DISTRO_FEATURES are activated.
 
-SYSVINIT_ADDHVC0 = "${@bb.utils.contains('DISTRO_FEATURES', \
-    'arm-autonomy-guest', 'true', 'false', d)}"
+# In both arm-autonomy-host and arm-autonomy-guest we don't have virtualization
+# in DISTRO_FEATURE. Hence, manually include sysvinit-inittab_virtualization.inc
+# to install the getty-wrapper.
+require ${@bb.utils.contains_any('DISTRO_FEATURES', \
+                                 'arm-autonomy-host arm-autonomy-guest', \
+                                 'recipes-core/sysvinit/sysvinit-inittab_virtualization.inc', \
+                                 '', d)}
 
-do_install_append() {
-    if ${SYSVINIT_ADDHVC0}; then
-        echo "" >> ${D}${sysconfdir}/inittab
-        echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> \
-            ${D}${sysconfdir}/inittab
-    fi
-}
+# For arm-autonomy-guest we don't have xen in DISTRO_FEATURES. Hence, manually
+# include sysvinit-inittab_xen.inc to append the getty-wrapper entry to
+# /etc/inittab.
+require ${@bb.utils.contains('DISTRO_FEATURES', \
+                             'arm-autonomy-guest', \
+                             'recipes-core/sysvinit/sysvinit-inittab_xen.inc', \
+                             '', d)}
-- 
2.17.1

