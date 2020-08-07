Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.46])
 by mx.groups.io with SMTP id smtpd.web12.5198.1596804143354921948
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 05:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4q3S4A9G;
 spf=pass (domain: arm.com, ip: 40.107.0.46, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXhpTqucPCdVsc+MP9sV8bNs9U38CIZ78A2MouStoNc=;
 b=4q3S4A9GGbHz1TBatTT/Z1z5rSMAQ/puIngl6Vvpb0WZO1j+u7mCFPoo2Fp5dS332xsr4/VBjLAyewo9qpepbHLF+6/WJHXs0/GCPMfqXjgCglyYjhVrgqpnOrqCfxh1vW4oWcPTv5aiCcqkGpHp6gHRbSNPxVTe685xXhHzqcU=
Received: from AM6PR01CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::34) by PR3PR08MB5817.eurprd08.prod.outlook.com
 (2603:10a6:102:82::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 12:42:20 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::15) by AM6PR01CA0057.outlook.office365.com
 (2603:10a6:20b:e0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Fri, 7 Aug 2020 12:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 12:42:20 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Fri, 07 Aug 2020 12:42:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a7526d7abc638b9
X-CR-MTA-TID: 64aa7808
Received: from f044bc1d6e8e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D76C2B5D-9420-4181-90C1-DE8FC914D0D7.1;
	Fri, 07 Aug 2020 12:42:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f044bc1d6e8e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 12:42:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyz3j9VFWDwD1fUecpMpoOPM3TsFAi0bEJj44g99REx8MTY4Vxo9MGlIxAAwj2VqPDOLMzssxYvAo9ft5HmbLN34kVRC7Q8RuZisG35cp6cG16+ZbPBfRcCzG5XAWlEqvWUys/yXC/KkH+8acKDV6Hyfr6KvrfwEsrZ+y/dLXZGKuaaUzZB+PIf9ZFAXNIDlBMZk+9XkuyMvJ6axcuHJG3D2fCZndg5ogFteqzGlNZUko+QjrO2CD5tIqsjuzN8Uf7n3MwDSG6maCbfIwpM4+vtkZWlOjEO89i+0Xu3PuthTCqKbv8B4oOUm6iMLP1z/J5D/JLiVv+AwC/lhqf16Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXhpTqucPCdVsc+MP9sV8bNs9U38CIZ78A2MouStoNc=;
 b=fVDZ8hVyRfvdpATt2bhpV/a+dAYpkYQdNwS2kKeoG1J9KssBsqfNnYuTDLlxhB/bYVl+k6zVBVGBcuQ5mr1NmwSos3mogPjHq1DxCbSo+CgkwZ8aO9dwaLKLOzEa9ttSgAfsCiC9eXzPTtRRlUlXn9YbKXnYhXv4NcNml0CXJn9n8f60w6RHsbmJFaLzlrYqneQ+KTRgA0JxXPqUfM5zrkOJ4TrLTNkDj5neGvXQbTk5UafhZ4R9mNthFG29/AQVSKRK2OJjA3eiqz+fSLXVS/R6jn0WLUNEYQTfqZKr55hNx9M+IhjvMtR1Fhh7u9gj2sO//JGyRFoF7TYwIBTuwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXhpTqucPCdVsc+MP9sV8bNs9U38CIZ78A2MouStoNc=;
 b=4q3S4A9GGbHz1TBatTT/Z1z5rSMAQ/puIngl6Vvpb0WZO1j+u7mCFPoo2Fp5dS332xsr4/VBjLAyewo9qpepbHLF+6/WJHXs0/GCPMfqXjgCglyYjhVrgqpnOrqCfxh1vW4oWcPTv5aiCcqkGpHp6gHRbSNPxVTe685xXhHzqcU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB5175.eurprd08.prod.outlook.com (2603:10a6:20b:ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 7 Aug
 2020 12:42:13 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 12:42:13 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 1/9] arm-bsp/external-system: add external system recipe
Date: Fri,  7 Aug 2020 13:41:47 +0100
Message-Id: <20200807124155.24198-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
References: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0401CA0043.namprd04.prod.outlook.com
 (2603:10b6:803:2a::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0401CA0043.namprd04.prod.outlook.com (2603:10b6:803:2a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 12:42:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 964f4eb4-cdab-4297-e63e-08d83acf5330
X-MS-TrafficTypeDiagnostic: AM6PR08MB5175:|PR3PR08MB5817:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5817D08806293C14AF3E6126FD490@PR3PR08MB5817.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RCGWj+2Bo7KIUlek+ILMFfhhuCtXA7GjrSE6tS/+ms3bBBrHyC1afHSE3URIDl54mhGYaFhwrcMujm6KX37ZuA7z92okt8HViZW9YrnVLYjzq+amzpxBtsOwR4RrzmHX+S7BN2m1c+Kx94O5Rf6/IExXAiSEVy8Pt01tEWvz8ckbOWabGaHsFmM2vryO+auyTGe36A66ZiXm4lE3/Tr9njHipkdP4KB0FUlm4Ej3v7HEgUn9M+LwYHSd0J0O0+Q9mvmEexUujKKpPf17mwyOr9hAHqQLhP6m6psfCo/BnQhpLgCtOXO8mbfawLN8tsQMzeI5kP76kwMRZ9M/MBdOZfkKxaQENGan1DflVAxegw/IJGQnWCzIj86yuKN0k28RkLaZ5GD9Q0bNHq8W2cAxIA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(8676002)(2906002)(83380400001)(6916009)(26005)(9686003)(186003)(16526019)(956004)(2616005)(8936002)(478600001)(6666004)(316002)(66476007)(4326008)(52116002)(7696005)(6486002)(5660300002)(86362001)(1076003)(36756003)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 iwUMYxAD7YH7C1QK0Zc+PpGHv2ZCX9RZ+mkKgeSFFjT0MEUase4mYAVbuk4nUWzGIHm9/STKI8kuJQTYboDeMZJOa+jLY29C9IIadFN3UMP4AGBYGPlyY3W5/L/5FSe2Tp5CvuO0o2uFgK3Jv0mUF7rcuKlbvHPUMgT80ouLXAsZ1P7h0D1qY567afZbmVCsXylEZDHHIsOBsGw1/Aa/If2gLk531ucSW0y0JmsGvUkJEoro3Vjy3FyWGZ7tYfr9a4ynZrmr3uT7VYovRdP7v5hmQ9Ujl/uTZN1rUANEzEM5aRbDX1rXMRT65/g+mKp3VJ6eUjZ3Si/O9Nz1rq8ZeHF1yKKHCdgYT1FuknWmaihSzLzTSdsucYCp6jENvgMkOVyo1rEi7BP9ZZBqkC99mr/v/YEYBFmaIsLLEC08J3jTtJKV7SPasf29PEpJ2okjlGGZagdwWoYPAo0wZnZX4YTFJXTC964udhYxNhbzFdRTWfl2foxuHIAlgivwOVWLexlscWSElMDKG13HsEVEoLHkmt09va9+4hjLbQCPJuq3ohA0sUN2kAqG4h9OqFtz6NIcd69X1Y4BtXKCNGD94mtgscMFbNPTgm2oS01AQ03YatBaz6XFUSCVxHZjJVwDiDIsjw4rHYMUIrOaQy7fnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5175
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	79f4c1ac-368c-4806-97fd-08d83acf4ece
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	glzVyHaZghVXTghALyBYu9kgPvWHDgefgLNjmJqIrUVGllNFTYApSqe+3vtrncHiQywSp94g0GruoQveW8Fcv75mf8SkmojaJy9iDxNe+3GX2EothJFgqvv531g7a8mrXukuQ4EPOQ9jEVvkP6jtsK9P5OBZ78fmCs8BSE5Pl0wlhTQa6fk5u+56mOmPz3RhZXOGjMGHYywfDW6EBLnUhzGJYVd/oiAx7OqqfJb1Ja5rUCrXlawiZSX6+MJ12q8EzHmYMLYcFdFU5wzQ2foSD5kfaxm4zM/Mq3L5ks/4jdQnCjnCb5/49vEd0UxexTwsdga5uCx8HUC+p5o43oAYhYTAZWIeBNcktHB7wBShH5gPw2GmGT+AUdGJef8eHudSx8GwXeyLv7O1TFfPQ8xy7C9dH7+kdsLY1cc3by5Ny86xaZ20jTW/Qp8PzGmdzixenxGbHhJj6o0xKWQIz/TRdbBpAyoVLIRXJ8sF1to2bUI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966005)(2616005)(7696005)(4326008)(82310400002)(8676002)(9686003)(82740400003)(8936002)(336012)(956004)(16526019)(83380400001)(81166007)(356005)(186003)(47076004)(6666004)(26005)(6486002)(5660300002)(478600001)(70586007)(6916009)(70206006)(36906005)(1076003)(316002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:42:20.0730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 964f4eb4-cdab-4297-e63e-08d83acf5330
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5817
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
