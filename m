Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.44])
 by mx.groups.io with SMTP id smtpd.web11.4788.1625571264419016726
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 04:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KjsWxE5J;
 spf=pass (domain: arm.com, ip: 40.107.22.44, mailfrom: ben.horgan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY1HCWhlR7Wx8NAMosBxW8Xu1SJVvU+DYQ9nPEo8xS8=;
 b=KjsWxE5JNVtEtM4gUc6lRW3tXcqNTn3Ayji4AyEf+REnCoiREzmglJpHBg5frTG5haaQstIuFungii/MV2vA4a0zTv8mCu6EzGUFHifazh1KhB81OP61msSumSRtAJ6NwqpdxL3ZhmH6LP+MYdOpA++HuK37p7eLNvrIKpSsMHQ=
Received: from AM5PR1001CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::20) by AM5PR0801MB1921.eurprd08.prod.outlook.com
 (2603:10a6:203:44::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 6 Jul
 2021 11:34:22 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::2d) by AM5PR1001CA0043.outlook.office365.com
 (2603:10a6:206:15::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 11:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 11:34:21 +0000
Received: ("Tessian outbound 1763b1d84bc3:v97"); Tue, 06 Jul 2021 11:34:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7148e5fdb35c4e66
X-CR-MTA-TID: 64aa7808
Received: from 8e5a013d1906.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 19B15AB4-6D6B-45C9-843D-44B09F2C5D3B.1;
	Tue, 06 Jul 2021 11:34:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e5a013d1906.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Jul 2021 11:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndeItdOKiCnVkmHbceDHM/RfJbXgIAzFmQzcGmx+rp95rgJOnBPC9Wy52YuLENdEilCfW6BkaK18MOPXJQXcQxk4zEF4JjNW/9gvFL2lICYWReQ9KF1wwYDg8ALOgb/zf3X031e2Eb0ze3aIhCfGN9kXy0EbVxDF/2kqad0BTCKXyoD7TXJYN4tbI/365cbccgdtwFEsc6yd1+A93hgJa1PrPJu64lmizLnnmf2mu5bS0lT34WnI0iypfXc3IKU2ymm8wwnUKjRTdPVxXoBu97wO1llGUCeVCLh9Y96y13qv5TXsu+jRpTF4mfYTWY3JMKXMJMDe8mjye0w/BAsmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY1HCWhlR7Wx8NAMosBxW8Xu1SJVvU+DYQ9nPEo8xS8=;
 b=As6QGQuhgUY4WcAMi4r1itKkVGpcBq6eQCYlbz1ba1Xf4nkl4WgvKtY+x9S++aLY9Nb+WUPCea7X+YlJuo7sZO/0QGnvmdVfyujcPYflTW52DLPyFp7O0eJkuF4PxL2qi9mpWq6ekiLuYQJE/e/5ROyNhf5I58tzNawLsn3Py+FBEFxxQ0nTPzyjJDgfCG6LMIrQojiqeTkFc2+m7KrZ+Ukc3CgKUpH+a/ufGLcKMUlwAA9NG2JwtJcF/SYPshLh/Syd9qesKLUkDhRmPLNEjCl0sMbOc4KkNHk7buVW93lpkPm3H0Ah/PeW9oxbrJ6Q0jHbVtFtWf+T5zUACMLu8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY1HCWhlR7Wx8NAMosBxW8Xu1SJVvU+DYQ9nPEo8xS8=;
 b=KjsWxE5JNVtEtM4gUc6lRW3tXcqNTn3Ayji4AyEf+REnCoiREzmglJpHBg5frTG5haaQstIuFungii/MV2vA4a0zTv8mCu6EzGUFHifazh1KhB81OP61msSumSRtAJ6NwqpdxL3ZhmH6LP+MYdOpA++HuK37p7eLNvrIKpSsMHQ=
Received: from AM7PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:20b:130::29)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 11:34:11 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::d0) by AM7PR03CA0019.outlook.office365.com
 (2603:10a6:20b:130::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 11:34:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 11:34:11 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 6 Jul
 2021 11:34:08 +0000
Received: from e125437.arm.com (10.57.91.124) by mail.arm.com (10.251.24.32)
 with Microsoft SMTP Server id 15.1.2176.14 via Frontend Transport; Tue, 6 Jul
 2021 11:34:08 +0000
From: "Ben Horgan" <ben.horgan@arm.com>
To: <meta-arm@lists.yoctoproject.org>
CC: Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH] arm-toolchain/gcc-aarch64-none-elf: Fix license checksums
Date: Tue, 6 Jul 2021 12:34:02 +0100
Message-ID: <20210706113402.18696-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e521b67-f380-4e66-dde7-08d94071ffbf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:|AM5PR0801MB1921:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB1921C80A261E48BA372418C0911B9@AM5PR0801MB1921.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 M2NJkBWWR1uNvkC1Dut62DBcfSp8xdpy4ljS6KSuly1xiA5ML9t7E20Y0fCGoHP+YRnW0S5Y4cY60lB+TM6zuVpX8CVLq/AB/ikur/9lWftEXsS+///+nIzo9/ws8CVH3mpHLIdo1GC2ZNO8vccV9BDfzATMv8FQ6KXNRx1JC+KWxIO8twAdRY1dlKYMBkrOqnfiXo4P0vhWmUKRj51gs++VfB71F6Sr1OG3BKIwMW0yNemwfgVtG6aq5CXirFEzAGTS2dcIaP/OVswyR8vyiJ3592OvgOO39y5Y1vxtxpLrlP6GkIYBarrppdEXJcmCisVZlj6VUh9i5X+cUjZ/QhkAgYp8d7DIu49fskSR4s5tDC4a/gG98GjNpZTpqRwmQMw/oG48H4PxDinPhZO64pM+J1gfrTfHnJ2CCfAJQEppMLj9NnBIYnSEm83h/Daha/UCuJMEjuMvpnLsWHDVbw6h81uKdBTfftZGeSeybpVa+2iCMwhchonNQt9m2ivzBnBvPnJpXow9avMTif0QW8k9SAB4oiC2+4gHUAT1OzZvsv2HapgUtLOux9WIKwQVX+4IiFhdZ+hAgZ4bzCbAaCaq42cUbVDa0WshbNDRnMBd4YAE3lzAj/B2PfDvorgjvGk22C+UNJ8Y4CxRfcJRiTu3j0LEOFqrwyjrEAMkXH5SwKzTPswlAFIpT5/8PPcauVCW4bTU0dwnOcJIS/IEyotrQ1XXB6zcTi1sxwSYrd4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(36840700001)(46966006)(4326008)(426003)(336012)(356005)(86362001)(8936002)(26005)(5660300002)(2616005)(7696005)(6916009)(316002)(8676002)(83380400001)(478600001)(70586007)(70206006)(2906002)(44832011)(82740400003)(6666004)(47076005)(1076003)(36860700001)(82310400003)(36756003)(186003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Return-Path: Ben.Horgan@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	87b6c9e4-9c98-438c-aaca-08d94071f992
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mgrCRpj+fJGqDhj2nkatQ3HCqU7o4oOrt8kn3EVWFBUXiOe2yZdjVTjlLvqe7OCvsCGKGFjU2JlepNE1+b4pgVoo7q+EshISpFeqTbHUW+W4CFrqG1Wy/ZB/cWnAvGu/TYcal8J34lGsR0bIBsDeROABDv4O3yOkJWXYslaBaAsM6mIYPkUQAvTSNTXUVL8TsSoWXeQWyBLXh5D34jizqyQmgUtoGmdGisthIQrut2RZw4UJ+BCXBDujPdn5Mds5pd8Xug8xSZhhS5jmTX0mq8FKPJ7onz49mT9mCudPeW7zJQqVSGTue/aflUYuwSEtCaNjRca8Kd81Enzuty+bRUadu5/rT+3IuD4fPpf4Yes29nm+hZBtgxRaOGSIqNdzINqLwQKrFuAVvmvg0fgPex/PvUa93+BJMhZiTTvV8A7cG+a47TY1SyiC0KjnUXB6Z8Zpu7ip6Qgz79RBKMXtU3Ei5x7g4WBLxnH2BGMDFNU2TF2FfOFLG3NG1QL1w+kj4cHiXb1+RjTC8ZRtXOgbOodWSErXzzMIA/LGEFRY7+MfOuwRQtOennOJ62BplCkP9qGxlHfTMqUnxkLbwkndI7Rd/szLWmb5cBTY/UrzEKqSDCk9bmMIqe+lzfdXYh6lO7GAc1bkPAyXEEWLcqR4pwLnrxMuboJodtiyheljLI4+GRLrbBSKazVPLWqWgS3S47Dp4ePQwDbH+baK2mewHQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(36840700001)(26005)(2616005)(426003)(186003)(7696005)(6666004)(478600001)(83380400001)(5660300002)(316002)(2906002)(70586007)(6916009)(8936002)(44832011)(36860700001)(4326008)(8676002)(82740400003)(36756003)(336012)(1076003)(81166007)(47076005)(86362001)(70206006)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 11:34:21.5338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e521b67-f380-4e66-dde7-08d94071ffbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1921
Content-Type: text/plain

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 .../gcc-aarch64-none-elf_10.2-2020.11.bb                      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
index 5cbab9e..91caee1 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
@@ -9,8 +9,8 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
 LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
-LIC_FILES_CHKSUM_aarch64 = "file://share/doc/gcc/Copying.html;md5=1b548d9c341b3b5c82bc88551964aa60"
-LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=c1df856e21b17e58b0adbe29cacf4bd4"
+LIC_FILES_CHKSUM_aarch64 = "file://share/doc/gcc/Copying.html;md5=fdf39a58ab6e893f3d83594cef77fa05"
+LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
 
 PROVIDES = "virtual/aarch64-none-elf-gcc"
 
-- 
2.17.1

