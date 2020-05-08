Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.79])
 by mx.groups.io with SMTP id smtpd.web10.394.1588955675218084427
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 09:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=04whIvQO;
 spf=pass (domain: arm.com, ip: 40.107.5.79, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Sr7/2mLhTAQt50AudaB+4i5/076YSJCSgN+K2U7HhU=;
 b=04whIvQOxRzaN08St/HPmbaM+XYZzm/C6OzBIMyaCyzr1KliAcH3S6TCEs0fjHX9aXXeAyoUuTwQLC/DlWBIYBqBBTTjs/Y0bL2M0ajx4CD22OU333DkBeMlnEts++HNBil/OFc+I45iRKeBPApuZCUBAD1yxIG9u/vxB6+Nv+c=
Received: from AM5PR0601CA0043.eurprd06.prod.outlook.com
 (2603:10a6:203:68::29) by VI1SPR00MB01.eurprd08.prod.outlook.com
 (2603:10a6:801:4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Fri, 8 May
 2020 16:34:32 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::13) by AM5PR0601CA0043.outlook.office365.com
 (2603:10a6:203:68::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Fri, 8 May 2020 16:34:32 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 16:34:31 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Fri, 08 May 2020 16:34:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56949b814957bb1c
X-CR-MTA-TID: 64aa7808
Received: from 21fbc336ee7d.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4F20C07F-7899-4496-91ED-241C23147318.1;
	Fri, 08 May 2020 16:34:26 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21fbc336ee7d.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 16:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Znfhq0yIgBul1PwR7cNH2tO6ruR+CqAB9MGxMhI5b96w5XNW7ulpmg8Sn2QzGvPqaoNeGRDTUsItQxAh5gUvGZTaCQW9nPeRrXGozrAijnlniIvjsQwn57HfzXkRuu2QuyHBz779d2J2DoI9jUftrXhcOVWxLFjb+0s5NbDu/tWp+Rao6Z3+Ae5l4bigk6N+AFoNHqP0J2/u7WpOwkeyUe2puqworDebPWUgLnbaNKHWtIeR7dH15N3FUTcNgRB5+VucafwLJOt4sA8GwzXbyYjia+ZmJ2m/p/LUF8Xi5kBN/31ZmrIbLUTkzIyGug4W2ocrtRvcTPaKL4RkRwoKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Sr7/2mLhTAQt50AudaB+4i5/076YSJCSgN+K2U7HhU=;
 b=arv9RIr7jgjNJXGmRGScdQmGaYC3f5pmpoHrNLlfRbUknZW4UnQDMf/5JC3lcCOe+c9fgwg+dggSxSFn/ne0ji9podf37ZSBbSkVl3rcKEg5lTUxFpi5HlPa4nJw1XLgzZeqdK7/N9YxBXE79OAN022i/S7lFFeqTvl+BK+tIUx70tPttqPEjp633OK5UZ01rtuZHfWpjkmVl1Jgr413qSo1+VOGGji6jTpweY2ZcJnyWbr0pscwdygAHRwzOER9qbPqdSCJZrtp0G7X8TRLLx0Yjug/W0ZwEFwLvEI8vYa57L8hlqM93oPa8pLEWDfIm+XiBJNkEij9FG+pCu1tSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Sr7/2mLhTAQt50AudaB+4i5/076YSJCSgN+K2U7HhU=;
 b=04whIvQOxRzaN08St/HPmbaM+XYZzm/C6OzBIMyaCyzr1KliAcH3S6TCEs0fjHX9aXXeAyoUuTwQLC/DlWBIYBqBBTTjs/Y0bL2M0ajx4CD22OU333DkBeMlnEts++HNBil/OFc+I45iRKeBPApuZCUBAD1yxIG9u/vxB6+Nv+c=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30; Fri, 8 May
 2020 16:34:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 16:34:24 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/4] arm-bsp: Introduce ARM N1SDP platform
Date: Fri,  8 May 2020 17:34:01 +0100
Message-Id: <20200508163403.5987-3-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508163403.5987-1-bertrand.marquis@arm.com>
References: <20200508163403.5987-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30 via Frontend Transport; Fri, 8 May 2020 16:34:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 99d5fcd2-9bf7-4b5e-f0f1-08d7f36dafaa
X-MS-TrafficTypeDiagnostic: DB7PR08MB3484:|VI1SPR00MB01:
X-Microsoft-Antispam-PRVS: 
	<VI1SPR00MB015F356699DF694193F3F39DA20@VI1SPR00MB01.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;OLM:1284;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UFVoTK0rV4LW+ZJdxr9dmEVEientbAUBRvp6eyc1husVC5C/DLC13dmviA5lZgC1O2vMKbaXXIx3dL8NHRPACVi7oGJ4rObL4Lp0SDB2b0GFvTZIzef3cdhsk3CaXBRUYziyf67RQ2UBbKwr+tNV0+GoxsYBsZhPeqrF5cJpNiBE4FGuHdpZAoPU8Zo6CTSL9Tlw3GUx6fhjUkwmezhTeU73KWukwuNfbnzCUz2FJZhM76Q5sQ4Oo+3j+jzAD0qSA6xKSu6+N6zuqtsPy7CK37845heZ5pM04gWg3ORsn62zqOjMR5z9CHtwoILSkppXykkun4ClI5Zp1Vpe9h9EGlEtxN0LpTz9xlOu8p6LIML5fIYgJWXbjrgFscOc/KyE4BTJ3J/afG24dqKFySKi6UdOEcWkBcyAmWwpBzpE9A3ufd1jDKOvpYPZVR16wY4DoSMsKRR5beMy2+jakX1e+Xk4PzY6zZhXRnkBgQqQBr6UAeyCCuLtlA0D6CMWVw1ZjbX1YlIsq6BmLHNtCMFJP4zHAHtBPua5nuvblt9csqA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(33430700001)(7696005)(52116002)(5660300002)(2616005)(6916009)(26005)(4326008)(66946007)(16526019)(44832011)(316002)(1076003)(36756003)(6486002)(186003)(956004)(83320400001)(8936002)(83280400001)(478600001)(83310400001)(8676002)(2906002)(6666004)(66476007)(33440700001)(86362001)(66556008)(83290400001)(83300400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 nIbsURT5BV+jcjphjCOpoWur+2nx29scGJ+GUm4tIIYLnLsTiq4puGgYwnomCogXrLoUOjitV1w14vpSF3rMVkWQ4TeycyycIjPex/w6wMFU+5qnTkuhqCh4jOgAwR+9VhfgXi077mTNWPAyflPop3CCcPjGj77Ace+aD3tPRWgkvQohdMmB/PBr6Etnfb5OsIV9cC3H4G5DeGMqi+FBnBWtk1Cx/MvQfXH1lp1SI/JPHS4ApcGjXqFktoBfG/6iW03neft5Vlh/edygLkYxbJy6r71Q+yV8sGttrrjKgxTI3YKIkZ4V8WK1HM8xyH5zRbHiEv434S6C7n7aYXZ74m+50IemFkUCeIe2yX7dnl/qu36jkQfkew4JAUElKLMWTPAYW26JbNlZrInzbi3Zev7zrcer1YnbTtIOedvSruFQTMoI57pNEEj+naMmgN2U/VywlQr8jQiiU/Fop+yBeU86ahywKs9JYBJ65ZfYTwJdWSfvDD46EPwZP54xrxZ9
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3484
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(33430700001)(2616005)(336012)(16526019)(86362001)(4326008)(26005)(8676002)(44832011)(2906002)(82740400003)(186003)(6916009)(6666004)(81166007)(36756003)(478600001)(5660300002)(7696005)(356005)(1076003)(8936002)(70586007)(956004)(316002)(6486002)(70206006)(82310400002)(36906005)(47076004)(33440700001)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17eb2d8d-e361-427d-14ae-08d7f36daabc
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uQnZyHxslkA3YH72C5X+jwHlpLYoLMpMwcRU6KVGYUllnJH+QC1ZKkWeMIJGFrCbbV46aaRmfzMDAWIKc6ElbJjVh7N2w+5BA0KCm9N6vAtIrYtKnR8AImMog6iU1/mptyPbDr3aw9MrBEV52X0vDMiAYKLlH0nWxe067soH3J4IdFQdX5zleaUUSFZx6Nz9ZBNjALyEm3bUp/jdsiSipQaxLMST7yJtesnskv79CaKH+rFRGUrLeltnYKnDodQddUUjcFl+gIM4TRuoF/edLtM1w8KHsegHhEIrAYYISGwwzKwRP9vo5rN/ZR6RHyXcu6ntAoLkVnIKiFsL/lc3rB8uT8yw2HlcUfZ+ttC70Nzaqs6ok3lRtW4GCjs6zPXF6qqDRkaXPMyNYMDamapgmOWUgzxar3LW++OpHlkhbxnLFA3PAdRG6ZddWiqj9IvBxIjeck6lRlVMLsua6UtXi/t7mlVdT/gGH7dkS5YsiEgV4SjXG0QNrPku5VqeH0NINunnOYsDaG91O0/I6Qer+tBVYKGPRGRXWm/aElHsEEKHadPQ4b6MOns8+fS3KHUs/gBSxqYBxB8YNeWdNYiOlkZizsQbxrb/f/hwLfItTBk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 16:34:31.9880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d5fcd2-9bf7-4b5e-f0f1-08d7f36dafaa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1SPR00MB01
Content-Type: text/plain

From: Khasim Syed Mohammed <khasim.mohammed@arm.com>

- Add support for N1SDP platform.
- Build Linux 5.4 from linaro tree for N1SDP platform.

Issue-Id: PLATFORMS-3134

Change-Id: I12e5169da9c2bab946eb7e49fe6cc7bbb07d182b
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/n1sdp.conf

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
new file mode 100644
index 0000000..fbe135c
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -0,0 +1,19 @@
+# Configuration for Arm N1SDP development board
+
+#@TYPE: Machine
+#@NAME: N1SDP machine
+#@DESCRIPTION: Machine configuration for N1SDP
+
+TUNE_FEATURES = "aarch64"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+KERNEL_IMAGETYPE = "Image"
+
+IMAGE_FSTYPES += "tar.bz2 ext4"
+
+SERIAL_CONSOLES = "115200;ttyAMA0"
+
+# Use kernel provided by linaro (Contains support for SCMi or HDMI)
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
+PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
-- 
2.17.1

