Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.54])
 by mx.groups.io with SMTP id smtpd.web12.2749.1596792382533161831
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 02:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oJ5umPWC;
 spf=pass (domain: arm.com, ip: 40.107.8.54, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXhpTqucPCdVsc+MP9sV8bNs9U38CIZ78A2MouStoNc=;
 b=oJ5umPWC+p3zGcE+2p40mbRanlI12m9+EklHrtfgnccyflqoduLC5LhfUaQy3j+n/sC3idtsZvuXFbnqoPnNMXXNZBAjCRRLuYJjSAxZ6mbkdNEmICdVD7dLlwNSjDBzuSJJ9DGhQUPkzSr8gNdgMuYWk56yFvvoegrzsMg1HSU=
Received: from MRXP264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::16)
 by VI1PR08MB3422.eurprd08.prod.outlook.com (2603:10a6:803:7d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:19 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::5b) by MRXP264CA0004.outlook.office365.com
 (2603:10a6:500:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 09:26:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 09:26:18 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 07 Aug 2020 09:26:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a355d2e135014d8
X-CR-MTA-TID: 64aa7808
Received: from 5223cd33ac78.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 32303B5A-0128-45A4-85FE-786251E49DEF.1;
	Fri, 07 Aug 2020 09:26:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5223cd33ac78.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 09:26:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwNsqEQ37mIBlt0kQsr9NRXe0+/AgB1FC+gZLUWoPlALrhQG5oyMfTJJSwNPo4U8jSnXMhdkTaoG/1bMd2SgEGbyXxIV3NiWkYQLE/nBuTj3MqPcc4h2L53tf2ihuH25eYvDthHil8ATWVM4ARVJDx3aAcg84EcsuxaUeOJ8O5jQy8RWmw0ZcTh8Hi/XmFwGWDi+RDAj/zlRieOCB9hscUSKHofrG3ckYwO1YLYNNGf2CwyACmju+a+q1YQAC5d7efPy7PXfXHfMWM4kTnC0IfEHb3X/Fi+1aEl1AtT5oWljvR9KHWmxvf5ZWJCYZVM3E4CpFpk+ULFXsMsxwDCvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXhpTqucPCdVsc+MP9sV8bNs9U38CIZ78A2MouStoNc=;
 b=NOhUaMehPXRlyG2AJIUEL5m4X4hWVAN34hmjIDzd5HTx/rx0+p6EEA6nhK9OHTIDX4y87yZOuxoALlJg1ruykjTU58RbI75wjqzxo5moCKugCVIMf4vV4lox+NLA/OnpSJZZzW2Qh2Uq++e3DvqzuQNSaW9jZPmCYoIeMNbc7RE2gMeltZXolmyRxBEFD0Lhxc9BUwhJXIDP3IJOJpJMEwm0g/F1ggP2hbB94cUlflw3UZjiH+726poMrLl+lvdFvjcnAHiQ3eUude+rZ6Um59HG9mzZCoBMN0seQqM7AO4pSg4mck2GG0k6fUsduwHVF/FU2R1vy+ZEn1cxnpu4fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXhpTqucPCdVsc+MP9sV8bNs9U38CIZ78A2MouStoNc=;
 b=oJ5umPWC+p3zGcE+2p40mbRanlI12m9+EklHrtfgnccyflqoduLC5LhfUaQy3j+n/sC3idtsZvuXFbnqoPnNMXXNZBAjCRRLuYJjSAxZ6mbkdNEmICdVD7dLlwNSjDBzuSJJ9DGhQUPkzSr8gNdgMuYWk56yFvvoegrzsMg1HSU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4705.eurprd08.prod.outlook.com (2603:10a6:20b:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:12 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:26:12 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 1/9] arm-bsp/external-system: add external system recipe
Date: Fri,  7 Aug 2020 10:25:45 +0100
Message-Id: <20200807092553.18876-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
References: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Fri, 7 Aug 2020 09:26:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cb24c859-c019-4e87-3a7f-08d83ab3f110
X-MS-TrafficTypeDiagnostic: AM6PR08MB4705:|VI1PR08MB3422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB34220877C992E187C7B0CC44FD490@VI1PR08MB3422.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5q/mu+Tje6BRgtVhn1FPiyDhAtSGF2BRfGs7HmCiC+9DPYvYzgFhHEPspYENWl4K7bVtzbSPM2BoFQpZtZPTO09M7aHXCcAqKdcBcgo+yjWBBYqoxBoU48dYXAmMXPkLxSCu8LoUY/JylolZfeZ8iiWVHb8C+STewQp+ymNlEwk9Z5YaGDFk89UDojsw+XQHaZRRs8OhWdhiI/ZbFX7SQq2LEFSNCCAGC9f5gj8KAKtgKY2L+9ZKsX6EI0SRb1ePBGaEMcNIPWJ6U3laiVD9hz9f8ZNcyLcuIgBdN+Squs5VlHlUOWK16WVWfqZvjh3vYUuFdw/Oh5xk/u/w8PA4LOC7/cHIQBUjIEyrXi8ko2vzXrjaXekFDqogn3UidSbSNh+zFzH5B7wy8GPx8p+/1Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(83380400001)(4326008)(9686003)(6666004)(86362001)(6916009)(8936002)(6486002)(956004)(2616005)(7696005)(16526019)(52116002)(186003)(1076003)(2906002)(26005)(66476007)(66556008)(66946007)(316002)(36756003)(5660300002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 psRvfJKF6/Wibd06isbwJhOeJT3Ct50H3ugcDQ18JMn+r72ocdLfXievbVCC2VgvZ5UQ7/LJomRqmBJ+FLT6eZh42w6s+xBUur7GhfVY+ByBldsw7t3b+6m0H6EqUXoz4iGcWV4k5vJwlcL/Na9lDzWi+R1Awrr3RzWS9bCy1/QSESqV9WUBxWBZoF+xxfOJT3yZ335hD5+lDZYgdc1PTQOR/UOt9hBtlOtVbJxM36sT/RRviZ1886nxbHYaQP1nVrnBQ3XiuEfigggf/7+I78QNZb5HNdGGEnRUTnwmePFzrveavxCQn0pbCuEODs7Noaj3/XO1pI8eisQb2wOE8K0Lsz7qzTDZSRlkz9mPKq2TLgFVK/WbvJzgN+iw1z9bsHscI4wVmZrYgLOz4t7cW3oXin5HU8KuPrSwaqyNXmI6ZS91sSD3gApDzL/xM+CPIovCD95u5bh2IrByH17JvdbtzNgxP8GMM5H5DABcRNtNdiCJoIa7JQy0upYRJOiCF4qiCfG/a9xbpe/yDiDh3pJwWt2nco39D9tjyIpgB5KX7r8w09w3R/XPipdNwH3akvonxDAFzJfwm0snjWpAslBzSr4DXTqH8pOg/S/2jxeC0q9KEBHCAvqhjCJmXK40X/mEODkBK0hJgM4O2AxfOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4705
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5f925b8d-845f-48bf-deff-08d83ab3ecc0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JpPRuCyVbXyTDcHr2OpAIrqCPee786MZ3Psrruxvkj0bbEkTMGF4g8k4WkO2jq/WQqQUSqxj5prwhUHpIL2j5oC35UltvCZxBR7mXwXtN98gHZ33HXjcVee2qtiYOghYc1DlzlXEezfJjFBbzf9AALIevuYiHl/c6Zi81J4xGx4KiWzgGsh1xD+s2QUKqnwfDfKz+uPEro3PaHsRM6nmFRe8uMqeMNHumQHEFGDI/Iz/OD12uMXGjNsQQm5ycYMZH/ayxAh3DyMGXgx6RCRH9cFe4TRUYfSQ5p3vEd2q6ojmogkIDVPOm+IFS7GX+9Du04QN0ymvpQYqeBYh3oGm+riTJJGZi0HZrHyL83eLLHkpbsgoYZlYuiAu0Y8EtR6hkwluMokZupxkFNfYTdErZdmXRRU5OHI+VyNTg+sNM7weyQVQpBwq05ZNbQ3pGKt5kwcTcoIdIAuKCErF6MldO4Bj/murymrQCc3LbGfYk40=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(36756003)(956004)(2906002)(82310400002)(5660300002)(83380400001)(186003)(356005)(81166007)(16526019)(2616005)(336012)(6486002)(82740400003)(6666004)(26005)(47076004)(70206006)(4326008)(478600001)(36906005)(9686003)(8936002)(70586007)(316002)(8676002)(1076003)(6916009)(7696005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:26:18.9715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb24c859-c019-4e87-3a7f-08d83ab3f110
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3422
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Rui Miguel Silva <rui.silva@arm.com>

Add recipe that allows building the external system firmware.

The external system is a Cortex-M3 platform provided by the partners
and intended to implement the sensor/realtime part of the IoT system.

Change-Id: I271eafcc90e44efb8090f8b2cc1c8acfd15eb929
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
---
 .../external-system/external-system_0.1.0.bb  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-syste=
m_0.1.0.bb

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0=
.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
new file mode 100644
index 0000000..0aab8ad
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -0,0 +1,45 @@
+SUMMARY =3D "External system Cortex-M3 Firmware"
+DESCRIPTION =3D "Firmware to be loaded and run in External System Harness =
in\
+               support to the main application CPU."
+HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/external-sy=
stem.git"
+DEPENDS =3D "coreutils-native gcc-arm-none-eabi-native"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe988=
d9a0"
+
+SRC_URI =3D "gitsm://git.linaro.org/landing-teams/working/arm/external-sys=
tem.git;protocol=3Dhttps;branch=3Dmaster"
+SRCREV =3D "41ef76951c5119729c1ea305406f74776da90866"
+PV .=3D "~git${SRCPV}"
+
+COMPATIBLE_MACHINE =3D ""
+
+# PRODUCT is passed to the Makefile to specify the platform to be used
+PRODUCT =3D ""
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+
+LDFLAGS[unexport] =3D "1"
+
+do_compile() {
+    oe_runmake -C ${S} V=3Dy \
+        BUILD_PATH=3D${B} \
+        PRODUCT=3D${PRODUCT} \
+        CROSS_COMPILE=3Darm-none-eabi- \
+        all
+}
+
+do_compile[cleandirs] =3D "${B}"
+
+do_install() {
+    install -D -p -m 0644 ${B}/product/${PRODUCT}/firmware/release/bin/fir=
mware.bin ${D}/firmware/es_flashfw.bin
+}
+
+FILES_${PN} =3D "/firmware"
+SYSROOT_DIRS +=3D "/firmware"
+
+inherit deploy
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
