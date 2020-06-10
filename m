Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.46])
 by mx.groups.io with SMTP id smtpd.web12.88.1591805339992643960
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 09:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UUG3hSu4;
 spf=pass (domain: arm.com, ip: 40.107.22.46, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIe6r/8wAWpVXev8hNjC4rUjC7193MzkxCldSHc811I=;
 b=UUG3hSu4PVSmnjmhKGcSmQiOQdgwfGvT0wZ5XJr6r9VdScdOG1HX1izUA5SrP32Lr7oy9Pkn98CoeCWPkWsUgeQlPp5KsK3CO9YBT1btm+WPrtgk3jA3T2U3BGbLFjdlxvAC+mt6uqzcL/pjldmw842dE4Hez2d2rlRg813vWSg=
Received: from MR2P264CA0092.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::32)
 by AM6PR08MB4152.eurprd08.prod.outlook.com (2603:10a6:20b:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Wed, 10 Jun
 2020 16:08:57 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::b0) by MR2P264CA0092.outlook.office365.com
 (2603:10a6:500:32::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Wed, 10 Jun 2020 16:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 16:08:57 +0000
Received: ("Tessian outbound 56dbe829191e:v59"); Wed, 10 Jun 2020 16:08:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0040304719cbeb2c
X-CR-MTA-TID: 64aa7808
Received: from eb0f2146f54b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 70804C2B-E0B8-4D53-9C15-58C88107748B.1;
	Wed, 10 Jun 2020 16:08:51 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb0f2146f54b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 10 Jun 2020 16:08:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsJs+UQrUTs/c26E8oDkRK1c1IYn+MGkNsEdnIyrtEjoFzoVimAm+NyOVswmA2QZd6lh9hJY/BwSv4pRbwDnQXugrmW5Cx09/kRCDtYTTagj6ABYLtV6ZUEbeoxHIDnPJebyxiUN3PGSiqJDzTcrP/LMvQzxlleePAlcH8+a5zYIo+UZ2/SI09yoM2bjUGG6HJMKm6Sp/K/Eo1K7tZpuiYeIJJXOe7ZvZE4d2qbzdViTBxTq+nUQW2GEZ7wJej7iGsseJ63XemYZWA8I8D5X1hkWssglFnp+PG3vGQY41kxrYbvYKoBJDVKCAsn5JSGV7LV4Vch8G11I5ElpD15bKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIe6r/8wAWpVXev8hNjC4rUjC7193MzkxCldSHc811I=;
 b=Zvxa015qrxWHmqbVcy7XRSG22/x1HnivD2gkXd8dowfhpEX9fUxCfNs43HZMUnAlXtpwnD58auHpqeeaYMtXxZfhoNkWz2et9Pby1aGFduvuM8WQG+X5CLuZIMu/l1aWVPFYWGcEHh4NezhwKuDy33gNTqVgia4I5+PZglyLGUinyETEfD1sqK21jLz5jxFhWu8OI7ER6TuvnVaRs+M8uRLXYyfMvUrMZwoNxgrKK88Dmo+4SlCZ5Alhmf+yTtJ9OngxZYdQLGlWFv5qd4V4d6Q+zHwJIF5OKVzdQik00S6HxHIwJQhziP+6+vR4ydYB+2whX4lfeTtzuMR6Kfs1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIe6r/8wAWpVXev8hNjC4rUjC7193MzkxCldSHc811I=;
 b=UUG3hSu4PVSmnjmhKGcSmQiOQdgwfGvT0wZ5XJr6r9VdScdOG1HX1izUA5SrP32Lr7oy9Pkn98CoeCWPkWsUgeQlPp5KsK3CO9YBT1btm+WPrtgk3jA3T2U3BGbLFjdlxvAC+mt6uqzcL/pjldmw842dE4Hez2d2rlRg813vWSg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5305.eurprd08.prod.outlook.com (2603:10a6:10:112::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 16:08:50 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 16:08:50 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp: Build UEFI EDK2 firmware for N1SDP
Date: Wed, 10 Jun 2020 17:08:41 +0100
Message-Id: <20200610160841.9949-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::32) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sudpau01.cambridge.arm.com (217.140.106.53) by LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Wed, 10 Jun 2020 16:08:50 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0626bea4-a161-4180-5b8e-08d80d589499
X-MS-TrafficTypeDiagnostic: DB8PR08MB5305:|AM6PR08MB4152:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB41528C471F71613DA7D0122DFA830@AM6PR08MB4152.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:220;OLM:220;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2+vMd3EH82XLdh5JxukcMl/6jadzq4eI3kgg3dYznFKAy/EpkkojGniITvTP7nokZ0OOCZ3Siwh0fMTtrjlmIt0P7noC3J+3JmuyA7L0RwRwOK5i4W1xGjAZ/qpAqTdV7G4Dmam7W4qsi3Qe76jpgUqAYFIexcrYbOTurt0kCDY1kqmgpcS+rK1BZbyWzFp5I/0UcZRdYrHYeeYLlgboIfS8nYa0M5cGDE5HooMtAZLtSwng64O1GfRG3CChkHRiFyl7q4gjCmF1disGFm0SpV+9hIlJrCAJfJbuMVli4Kn+6fQFo9oSS4t7RJlnBkspI+ZwwXStyc0VntMNeliIrYjylpxqvyTStCGbyKwto+bkvl4k5fcPgehu4zyLm5or/G69EfKFTtCDtYXCJfU8Zw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(83380400001)(6916009)(66556008)(66476007)(26005)(186003)(52116002)(7696005)(2616005)(66946007)(956004)(86362001)(316002)(2906002)(16526019)(478600001)(4326008)(6486002)(36756003)(8936002)(5660300002)(1076003)(6666004)(8676002)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 kLoKUZtRMFPHCKJ0k9p6Vj1ejG+O84sFL4JjGXCaTnoJ8ou9oMegsTIb1FtG9Yxp6CrWjGIWc5/qi5NHqQRtcEN+ebVJ01tR5bkw5/EZfLJxFEkw8l+XQ2//Ovk/5YMIFA7HXjNQo7w0QLg/Q3ampdzz/rhyGy0GbqiurT4OuzjZI8XYqNpmrbXuHiBJrN26TCcfXmR+a9UJwnlVHic0eBXkfGuVRb2l7ibtffkIp5gOCgDnRhSEeF7bXy5ZHvB3j2+ezNK9oaYwGIUNYipu41H9mRKYQ7/vCk241IzMRqLjwXtAwwyL6rTPHR7qssvh2Z0wptohVOvNMX1zFZY/buIA3bYhM124AJQzQffp5/aBzuQiw/3FU54UOf4+h6oF2l0/P4MMS3PmtjH6egMa79M0Pj7KLVWbkI/Lpys66X4k2kSy9DMy2sgQObl2l++murCEvR7SJ6VuXMjQuMn4q4rjkUR4LhfhJO1Ljn2O4VmPJoXblEx0DRZmRfh1Zaom
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5305
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966005)(316002)(1076003)(36756003)(47076004)(36906005)(2616005)(82740400003)(83380400001)(5660300002)(6486002)(2906002)(956004)(336012)(478600001)(81166007)(6666004)(70586007)(82310400002)(356005)(16526019)(86362001)(8936002)(186003)(4326008)(7696005)(8676002)(70206006)(6916009)(26005)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ca6dd4cd-1349-4c98-13ae-08d80d58903e
X-Forefront-PRVS: 0430FA5CB7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ldZd8ZPQJ2Ux/GJzfSoa9RiSCO9zXOwu7WmY1WV7lO9mA2Yee4o/5XMYVDtk6ypoVX0MdtVFwA3A2/zlKDe81zDaFNBcT8fB8n6HCMMS+3S3EqeRJuH4TGR4e0wrIw53kE63b+1UTEfb03aM+0D4QJ5x3c/H2roCs48/cuDb4cqvH9/SWTU/wMDOiRGJsIPZBjAoxcNNRmTI3HyXi5/gueFLafqQ5PNQ2w4Is9XjuWn8IkDhDZP9dHTT0rC06LU2/JsMwoDoVFYFQbaw/+2+bWhG7ZXjNO8SJK5pTKGrALlk3K62SN1qWfvbAxsFX3fqpOuS27fY6THX8HtBKthTSDDuYgu/8KwYdQMXM3DMJT4OZOJAvsFbgLrZG5XaeMl/P10GD14Afu6KvqzgOYXwhP/m4I74oEXHceFGaui65AYPQcvt/+3mUEI1PPCeQadD
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 16:08:57.2197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0626bea4-a161-4180-5b8e-08d80d589499
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4152
Content-Type: text/plain

- Add bbappend recipe to configure N1SDP specifics
- Enable UEFI EDK2 firmware build for N1SDP.
- Update machine conf to add dependency
  for EDK2 firmware components

Change-Id: I89d41c176f31bce6f1df7f3b3a7cd624b46c05e1
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  3 +++
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  | 19 +++++++++++++++++++
 .../uefi/edk2-firmware_git.bbappend           |  7 +++++++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 133fb89..20eaf27 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -27,3 +27,6 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
+
+#UEFI EDK2 firmware
+EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
new file mode 100644
index 0000000..c8fc70a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -0,0 +1,19 @@
+SRC_URI = "\
+    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=${S}/edk2;nobranch=1 \
+    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=${S}/edk2/edk2-platforms;nobranch=1 \
+"
+
+# TAGS and commit ID as per N1SDP-2020.03.26 release
+SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
+SRCREV_edk2-platforms = "b6bfc4417ff13168d69c4cbf2338f62c89c82dfd"
+
+# N1SDP specific EDK2 configurations
+EDK2_BUILD_RELEASE = "0"
+EDK2_PLATFORM      = "n1sdp"
+EDK2_PLATFORM_DSC  = "N1SdpPkg/N1SdpPlatform.dsc"
+EDK2_BIN_NAME      = "BL33_AP_UEFI.fd"
+EDK2_ARCH          = "AARCH64"
+
+COMPATIBLE_MACHINE = "n1sdp"
+
+PV ?= "201908+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
new file mode 100644
index 0000000..dfebd87
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
@@ -0,0 +1,7 @@
+# Include machine specific configurations for UEFI EDK2
+
+MACHINE_EDK2_REQUIRE ?= ""
+
+MACHINE_EDK2_REQUIRE_n1sdp = "edk2-firmware-n1sdp.inc"
+
+require ${MACHINE_EDK2_REQUIRE}
-- 
2.17.1

