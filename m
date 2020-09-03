Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web10.11969.1599133280190888421
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 04:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6n5jV3gB;
 spf=pass (domain: arm.com, ip: 40.107.22.87, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYt50kwy1PC55UqzsKjZIXVK4B/XOBKW8+VlcNHsFtk=;
 b=6n5jV3gBZse6Q7CQX0wV3bl8jGdkOKUDdGddiZMV2B5pOIKWj9rBOZKsnSIRlYD+vKP72mRbGuqeLap4eBvUyvONNvlz8u6Elt5d20Y37TBgizSbAdAuIri1VXWzxgFX2vnYhu8x4dAkY6S25W1M+5sMbLbDzzQhwu32s/btGZo=
Received: from AM5PR0101CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::44) by AM6PR08MB3592.eurprd08.prod.outlook.com
 (2603:10a6:20b:4b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.24; Thu, 3 Sep
 2020 11:41:17 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::1e) by AM5PR0101CA0031.outlook.office365.com
 (2603:10a6:206:16::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Thu, 3 Sep 2020 11:41:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 3 Sep 2020 11:41:16 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Thu, 03 Sep 2020 11:41:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11a8a4cfbca25700
X-CR-MTA-TID: 64aa7808
Received: from 6b9ba9f64074.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D1F0AFF3-C235-4A9E-B7D6-58B23765C136.1;
	Thu, 03 Sep 2020 11:40:39 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6b9ba9f64074.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 11:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGlN7YBk/WyVH21/2LbFdoiwAn+C3ELcDtRwA2J5xD58jHn5D+pnONsUCw7YfRnVl1aJE93P6hBN4hyHHXXPzajQr/tby6ceHnC+3wViXZ0lS0dt1YXUKamWx76wMpubfpb48Rfu5v2eY1nk3WSvPChrIyVw9dsRWDT78TRO0am3Pu18iNvs4xJq5EP2EHacduWuiIYEbCuOzVIO88BQyiTx/d7JNvZlWWLWU7A4qJD0LETcJ1UsXouY+KjhGYUo51P3gb74WhOEI7KjkGCoS/G3qvQjmRGU0KEboi87Tb40NRu8jOYyAZYBL5gZTviXYktUf4LyZmhM5L8/SSCWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYt50kwy1PC55UqzsKjZIXVK4B/XOBKW8+VlcNHsFtk=;
 b=U76Eg8RGlmbFHaD6Kfef+Ixxj4zjPQOxYO1V58JYMFEbB9TunLRmrCShkPuqpmQkTN4HlVuShhy3Jm9iEPRjWfTlJFmeiirgDwatEP/ifswewgnAclx0bPtVlRVefh0j4Z7Yorfy5r4aywqGZgZlAeUQZqiPtMVMMAQHTZPI+3hCpWTmabqSa03kcZSn09497BP5HDYRJOc1jDUINjJwguX4KkJQcvDRWjrJVPRxn8JC1JMlWTWtXqkyIAkqK9gOgoLoGT5l57BHy7smfGPCPCdQgFbBSkqXyFKKJNqg5CzdiVpjfD2IeK4WfEE2CuaqBk/c80LJNLUBq3AJ4+E9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYt50kwy1PC55UqzsKjZIXVK4B/XOBKW8+VlcNHsFtk=;
 b=6n5jV3gBZse6Q7CQX0wV3bl8jGdkOKUDdGddiZMV2B5pOIKWj9rBOZKsnSIRlYD+vKP72mRbGuqeLap4eBvUyvONNvlz8u6Elt5d20Y37TBgizSbAdAuIri1VXWzxgFX2vnYhu8x4dAkY6S25W1M+5sMbLbDzzQhwu32s/btGZo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3688.eurprd08.prod.outlook.com (2603:10a6:20b:8e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 11:40:38 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 11:40:38 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/9] arm-autonomy/xen,xen-tools: Remove sdl from PACKAGECONFIG for arm-autonomy-host
Date: Thu,  3 Sep 2020 12:40:26 +0100
Message-Id: <ba4ab6efbb84510a1555e0a65f3b45e016bb55a1.1599133172.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
References: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 11:40:34 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72f35a8a-aa7a-4f84-382b-08d84ffe44e6
X-MS-TrafficTypeDiagnostic: AM6PR08MB3688:|AM6PR08MB3592:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB35922B56F8C21B5D25DCF823922C0@AM6PR08MB3592.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:350;OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GWMsTbhlUKX2KB0eM66KOMC5Y0WbVeodHnTYZHdU6T7CUz5mZ4RJFazsMvr2pOnGaahccqAfmxq979oldLo2RhULOP4kTYgb/nYcDnBxEUUME08YVHAm7SiNTkFNt6+PTOgO1FngH+HdQcoYrMQB6LHCH/ACImOKKahbjWaxh5zL14UiiTJ4eU3ag5bwVhFTowFFWRRl4bMNLM9ODADUcD6X/UJbWsYEplkDyEedJ2hYOn7zhSs7F0CCwsjjrNAl2kBwS28kPw4/3NUbUwgZzzisVg3mzqPmIY61WBkSVUVmlitIFFwPc0HwV/LzlYSjZprUTLkqmLCt9IxtAqRP3uDJenOfoGYokuxGsEtQX81+rNspi/33jHw/Myx1rq10
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(52116002)(8936002)(44832011)(6666004)(86362001)(8676002)(478600001)(36756003)(4326008)(66556008)(66476007)(66946007)(2906002)(6486002)(5660300002)(186003)(26005)(16576012)(6916009)(956004)(316002)(2616005)(142933001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 LdkSkgmi9c4/Rf52prH6D7VLGFi6MvXzuVcNjvmc62tLsW3xwxRx3mAoEm5STYZOdSWgd4IDtEVBxWQ9QQdp6zWrv0fITJEXs812m6EwDj9/C6qjUJxm3Bl3nSKuppwmzXP1sEPR+O/znMVOiYw6tDIjQXd/OGRoBoZQFVn4it3rskb6y0bpBGl4QcNib7GnfkO7MBppe4wdMTFPdZy8GHI6YujEFj+SogE1Xh8RWYb4TKm5Nfy2ZZMY5D1DJVhE7RLAoRwVN/wf/2fFbUgabQhXr+OHqIp5b8YMAtKTo75hWFOcmxXfRxnO9RUYXwB4+zPqkTbtxi5G85aoTT0vCEEY/Kre0IfPBvIWIJKAxAFQukcHWJ3Cwlbu23Pn3L/O5QqQb0IhZchsqEl437ObAz+XryWHW23+eaU6Xd6V72XQTsZ6aZd+acigBkH6PGNjIAxuBZXDWLMz1lfJCKlIiRkJ5DXOxWcnE1HPeqaZDkgfB91yM9TIcArjVbgRSbfyLu5oFfC15ZOjiQTdNnlwWqu+XHSB2A7AKAvdi7OZMA0kRC/6QS560im128F7zDsHtjqkygiKLisUmwFbhBa+kzXbNras8JDXm6JVmBwRz3DN3k8oIUxlFiuG2FzScn1HGoBmX/d6lj3yyjHhsWkRfQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3688
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	19fef402-0df3-4b56-9d49-08d84ffe2b8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oXLKcVX/CoRrH5Zy5HkFY1S28SjeMrumUOsxqc8dMZCJjInxpezus6V9RmgjbUqfojNQVV+AushTMg8xsT0Qi7WgJRsEmxvjlGQ6UuvzkBrgCqYx5xYIPWTgfL5P7wLp1XFhjfXy6CxvnZQwtxau6UHnJCi980FuvEkvx+ybuX3PnVyucoNCw4VU4gIgfgqv8nMG7S9ROJNQbwjh6zA2InioUIPRTvPO/sWanoaU3G02bN3ntzRLlV1C+HEXfoesB96tu6JTIFQaT8/LNFwyWbaBcybNP2HfvDU9zbnmTiGAu1UAb0JAHa0A3OdnpxZS8udk/3jnZayFThAHcGSqjF208mkaB7R+hHG8iOcI9yUUWQCdJ5lZqDUJI+4eI8QbpI/lVOrA0zCI6JvpO7qwWrWs3X970Izd3EDeV0tuJZo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966005)(81166007)(44832011)(956004)(86362001)(2906002)(8676002)(8936002)(2616005)(36756003)(356005)(4326008)(82740400003)(186003)(47076004)(336012)(70586007)(70206006)(6486002)(6916009)(36906005)(6666004)(478600001)(316002)(16576012)(26005)(82310400003)(5660300002)(142933001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 11:41:16.8531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f35a8a-aa7a-4f84-382b-08d84ffe44e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3592
Content-Type: text/plain

For arm-autonomy-host DISTRO_FEATURES we don't need xen and xen-tools
configured with sdl support.

Change-Id: Id7391b722ab37b8970aa4b72d4d34221fb566618
Issue-Id: SCM-889
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend | 5 +++++
 meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend       | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
index ef8eddd..45739ff 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
@@ -3,3 +3,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://0001-vif-nat-fix-hostname.patch \
             file://0002-vif-nat-fix-symlink-removal.patch \
            "
+
+PACKAGECONFIG_remove = "\
+    ${@bb.utils.contains('DISTRO_FEATURES', \
+                         'arm-autonomy-host', \
+                         'sdl', '', d)}"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
index c7f3643..9403389 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
@@ -3,3 +3,7 @@
 # its own configuration
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+PACKAGECONFIG_remove = "\
+    ${@bb.utils.contains('DISTRO_FEATURES', \
+                         'arm-autonomy-host', \
+                         'sdl', '', d)}"
-- 
2.7.4

