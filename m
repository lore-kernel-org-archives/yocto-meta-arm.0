Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web11.50976.1606217834999762722
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 03:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rDTMYg0o;
 spf=pass (domain: arm.com, ip: 40.107.22.49, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGoyIPYwo2DWVmQtLPyjczFuGC9FWr1ns/132gSzhVY=;
 b=rDTMYg0o3L+KdIP8XkZhaOwM2tD/NDv2g0c2yBkarq6MOZdieMKd+aQ2MNlGIth9xxdjGbpy+R1M6wHb5gYRYznMdy17UAQsZbj84fKm95jc3N2r0DVqxUtGz1nPTRdK37pqlazyi2Kc+AqEfSrJk6RMsIM4Ewrcg0Sy9b7+05o=
Received: from DB7PR03CA0084.eurprd03.prod.outlook.com (2603:10a6:10:72::25)
 by VI1PR08MB5551.eurprd08.prod.outlook.com (2603:10a6:803:f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 11:37:12 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::44) by DB7PR03CA0084.outlook.office365.com
 (2603:10a6:10:72::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 11:37:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 11:37:12 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Tue, 24 Nov 2020 11:37:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5cb93d8d0accf9f7
X-CR-MTA-TID: 64aa7808
Received: from 51940ebe7f9b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A7F719B2-B3DF-43E5-80C5-D9AECE0CAE4A.1;
	Tue, 24 Nov 2020 11:36:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 51940ebe7f9b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 11:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IikYAhoICRCxtQv3IFdXkI9vr6FZvSmuz4z596E87/+yi7IaLzDSTCrNGMxlh1j4ycJ7+atvME5Y4S7zaulKcDBBVFXLf4t6olJ7kR46r08L9ksckj/rcQu5hY5mpYmYtJmLAaSI9IOtMIURfsTarQEswwhv5F8eh3Wp8eW6UvZu2qDb7vS57z05Eo317vfVPLoUdAldEOiD0DXCPLYegp3uRgF84cx/BfXhzve5EmWYoPDuyjyXEKQ6LbI9hAnS3J4UdQcN1SnpQhR4o7tGwF6xtUtXy7NwnH63HKgExdrRyvCdLfs6UbpWln1axVuDoyhnFs3Mhzj+2pzmsLuK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGoyIPYwo2DWVmQtLPyjczFuGC9FWr1ns/132gSzhVY=;
 b=kyaDtzDqXeZvm1Aa3koY8op8HvuONS/Fo+UAuZhhp8vgM4UeCNjTiyh9Bzi6ZblDcJvV1jj9nuRw+1yg9byefVBXM/CkWxuEEMjrGrD3A/VYQeiBrJqpiade8Oolj7JnY2SocKrkm8WUCkYNL2jBP8dia9QINTftenYRrwELJ+BhlqXOfnWwicRncC/YnMsddsrePrezyG3f9X9yHG5sqzgdxWcSMtEIT1hBgfqdnlDq6rX94Hc3ABGFJf5dgghm1SMLat30QT1Ug5bYlzz5CwLlCjGTvwvn3LLvEasOk8rD7UMOwauDrrijATqhNP7vylIaiUcfj1eEFZRor/STag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGoyIPYwo2DWVmQtLPyjczFuGC9FWr1ns/132gSzhVY=;
 b=rDTMYg0o3L+KdIP8XkZhaOwM2tD/NDv2g0c2yBkarq6MOZdieMKd+aQ2MNlGIth9xxdjGbpy+R1M6wHb5gYRYznMdy17UAQsZbj84fKm95jc3N2r0DVqxUtGz1nPTRdK37pqlazyi2Kc+AqEfSrJk6RMsIM4Ewrcg0Sy9b7+05o=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB6PR0801MB1878.eurprd08.prod.outlook.com (2603:10a6:4:76::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 11:36:33 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21%7]) with mapi id 15.20.3564.028; Tue, 24 Nov 2020
 11:36:33 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	lakshmi Kailasanathan <lakshmi.Kailasanathan@arm.com>
Subject: [PATCH 4/4] arm-bsp/trusted-firmware-a: fix the Corstone-500 system timer issue
Date: Tue, 24 Nov 2020 11:36:21 +0000
Message-Id: <20201124113621.3663-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124113621.3663-1-abdellatif.elkhlifi@arm.com>
References: <20201124113621.3663-1-abdellatif.elkhlifi@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 11:36:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b961926e-beed-445d-b9ab-08d8906d491e
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1878:|VI1PR08MB5551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB5551D4A07D04EF25BC46FBAAFDFB0@VI1PR08MB5551.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:576;OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lLJkxYJXebprV1hVPSu4HGsCv/VYan3mYYdZLgmqDkzwruncuaRS8XrGjc2/SHkoXKO7tg0ARqLNLK8fVqTbI55EL8zXNwdcyD/gZxq6yGo9p6U9i9OlS7bcnd7pEIZmkSiy7+5iUO8o0cu9WQc9ClxYAtk0dcjAqLysvJ+379Shsdqd/fabY3wV7CGyAleVqE/bBpoitMOWhmspyZNPAG8FEbO7wsYYmS1mlv7hdO20096c6I+7gqJf5DziXABjZF697Z+RKQU+6AM/sQ6qKUXEWZi3LfL88dD63SUzZSWzAn7LmiMjHpn0kLDhlocAWNJJBNLWsyxH3udG9psNZw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(7696005)(66476007)(52116002)(9686003)(66946007)(83380400001)(8676002)(66556008)(4326008)(8936002)(2906002)(54906003)(5660300002)(186003)(16526019)(316002)(86362001)(956004)(2616005)(478600001)(6666004)(1076003)(6486002)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 stqBR+u9pQfxHcrkewxRapR4UZ7gXKz/eJWTdvAh+dSSFB4oiCA5GUXsI6d1R/4UTbkUyyaD0iUU+SXB3B7aYIYPo8iKA8lWXXsT4WhNPk9T+LbcciNQO6I3keJWX53LqVUhBD2KY9hFn4fO0NQRRZQjbl8iknyq3Jx35Dc1LzZHGMpRwof9eLHQ94C7V8u9oFT51QPPYjLKWxE7MYfau42TbsZHgZZsnYZFvXkx8jHYXoghKo1CYQ+ltrfm41sqafnmLoSNxOQsHU6hN1ICXn+HoMnAd6UQDklFAGTNRcsqI8v5vWvFah/d87vWA1OV79ZYY5ev9Ub8e+cj8Mq1y7CYwD+AvvX4i4S/To6X/QUozW0NKDzl3xeuHwUxH1lrCAuILmvLYr8gtdLVplY9tn7CYY84KG+/rCEShFoX71r+eH6Qs5j5StJeSul2TpIE0FVQcV01fZ9UXkyKhiqSarxni3npjXxFKPBZ0uUlvJpTOBJ3g2YH8Qn0jZOLlOqQdvTdliqPFXjpkaAeVRH+lhZJT0vY9weHHpZVWzC606w0sN1fRQKKbpd6jReVoqUKlLbndrbOBkznogZyKmMirW6q9RyYDnH1SiY9S5Gqj/RtvDx/+AqD7aH9QJGU3nVNcDgDNJ8AaixsbV53neVc83vcKlgJ8pFp6Uo5qby3vo2PvM+wW6sPyEEkZjdqOzgfucy8VPgARN0+FPxdX27McnjkYfDhSVkswa05KrBKhAaVxETDr/3OjlI48FKb1yVlZLTBtJvN2uBsBAnzpwBXb/oeVBWb8Vf2TxUnc0mC68tDyqufoX7Z+sThpA/HgtcNAuWkBTNyT5QhFpIuWzwfWvjIKTlMnRkZrXczXjaU9Z/lrNcnH5RL3W0cRFEFrJLK++3PtdyCEomwC+VA2EeKLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1878
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f109a7d2-0cd6-48bb-9a0c-08d8906d318b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gUUOHkdEHX9wz1LOMLwDEDPV7H3XmoHlRDMRDJbd+E7yoRRk/I0L9nT+khtWgFHgECvNuYSUfogvsmEi+Vm6qnhgceR7rCGXEuLoClk3shqLAPajeA05SrkeBZRPe2MFjR0RuIbezj8DOYDR21aE6CJZiLwTXO6NvC8Mfu9/Ruyi7oXyZZAdmgSSbJpDUjLvhv6XrdsIdoNuG71p12jXoyn6bJtUSH2y7FqiLtJmddC/YArLm9TccfnEQTRWN7HRHmL/zAMlcRU9HUh8fZTAarD7whAOhicBVMgE/+VWnnvjK3+gQzgA38/T+uU5S1osLYudDkWPwCT9+L4l1vqh1aytnPbKdXFplequxM+LfFXF9z25A4rU8uVOe5R7090ka8usiOXwxoQciGO5Ff7PEg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(82310400003)(2906002)(956004)(36756003)(186003)(16526019)(336012)(70586007)(2616005)(86362001)(70206006)(6666004)(5660300002)(1076003)(4326008)(81166007)(6486002)(26005)(54906003)(316002)(356005)(7696005)(8936002)(82740400003)(9686003)(8676002)(47076004)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 11:37:12.5440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b961926e-beed-445d-b9ab-08d8906d491e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5551
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit applies the TF-A fix allowing to use the right FPGA system
timer clock frequency for Corstone-500.

Change-Id: Iaa09d33eb76d9b2b74cb3400897c8cc0e3c694db
Signed-off-by: lakshmi Kailasanathan <lakshmi.Kailasanathan@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...-a5ds-Fix-for-the-system-timer-issue.patch | 34 +++++++++++++++++++
 .../trusted-firmware-a_2.3.bb                 |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch
new file mode 100644
index 0000000..212eacd
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Backport [e3c152d1156af8a4b6453376454ecdceaf81704c]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From e3c152d1156af8a4b6453376454ecdceaf81704c Mon Sep 17 00:00:00 2001
+From: lakshmi Kailasanathan <lakshmi.Kailasanathan@arm.com>
+Date: Fri, 17 Apr 2020 12:52:19 +0100
+Subject: [PATCH] fdts: a5ds: Fix for the system timer issue.
+
+A5DS FPGA system timer clock frequency is 7.5Mhz.
+The dt is file updated inline with the hardware
+clock frequency.
+
+Change-Id: I3f6c2e0d4a7b293175a42cf398a8730448504af9
+Signed-off-by: lakshmi Kailasanathan <lakshmi.Kailasanathan@arm.com>
+---
+ fdts/a5ds.dts | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fdts/a5ds.dts b/fdts/a5ds.dts
+index 7334c4559..c6f5be6fa 100644
+--- a/fdts/a5ds.dts
++++ b/fdts/a5ds.dts
+@@ -128,7 +128,7 @@
+ 		#size-cells = <1>;
+ 		ranges;
+ 		reg = <0x1a040000 0x1000>;
+-		clock-frequency = <50000000>;
++		clock-frequency = <7500000>;
+ 
+ 		frame@1a050000 {
+ 			frame-number = <0>;
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
index 6c8308a..745ee70 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -12,6 +12,8 @@ SRCREV_tfa = "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
 
 LIC_FILES_CHKSUM += "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
 
+SRC_URI += "file://0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch"
+
 #
 # mbed TLS source
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
-- 
2.17.1

