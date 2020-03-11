Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.85])
 by mx.groups.io with SMTP id smtpd.web12.5458.1583924226175999137
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 03:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nrbMBW9H;
 spf=pass (domain: arm.com, ip: 40.107.7.85, mailfrom: rui.silva@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KX3W8MjCHIaa8o0qFRfjTkNcN7ecs4yP432OhKVOU5s=;
 b=nrbMBW9HR7zJqunGDe9KOF5GT8fIbh/1TFN6MCUZyrSUB5EWpf8BAVNAbyBOvyYSAbI0qS2c4t3gatsTNb57k0nfYQfGRW1/gG+W5nHf9zphFk8KD07HdEdRA5AIOElfP5cwqRJmeEiqkD2R7H9YTjMcAgJwoA0qA+ItEBv/J8I=
Received: from DB6P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::33) by
 AM0PR08MB5012.eurprd08.prod.outlook.com (2603:10a6:208:15b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 10:57:01 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::69) by DB6P191CA0023.outlook.office365.com
 (2603:10a6:6:28::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend
 Transport; Wed, 11 Mar 2020 10:57:01 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 11 Mar 2020 10:57:01 +0000
Received: ("Tessian outbound 62d9cfe08e54:v42"); Wed, 11 Mar 2020 10:57:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1636a6cf4237c523
X-CR-MTA-TID: 64aa7808
Received: from 71c702efaaac.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 666DF2B0-6C65-42E3-9E29-A23A78CBA604.1;
	Wed, 11 Mar 2020 10:56:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71c702efaaac.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Mar 2020 10:56:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPcnC8vE92nJbRXex0goRdWQ6fnydxjk4o2xwUPSqQKltJMsdLnT5x0+uv4gMNAHgpDTC1fQO5XdK70ooB0u4sd/QoRQTqUdJDf7zab+y/SwO5cDZKaHsnmnaEP4fuBjfdfior5eGi2okjg/GoVwfUlzkBxSY2Sfm23VfOLdyvcJSHWeVGoHZSzfnemopwF0FZ0SabCAUc6Q1JsO2KN+7Qv2ksM5jmHH2UlKnway5NWJs/h2ApZZf/7H/gGUZOw0sTiSDhrKrTvYBkCq7Ihwk6zKGa9GF09ayXo3KQOxwnnsFWDSy1x5rpGo2IIFUUToN/vdkm0NrLcwrCp0tAG1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KX3W8MjCHIaa8o0qFRfjTkNcN7ecs4yP432OhKVOU5s=;
 b=Rkca0TqPl/YS9YZgNh+rb1j21j0rk4yjXIoBiH8eFz+DG52Bw8x9vhfim9+tMcMBuhAbc4j+nVVLyLNPaFORENKgspiEtVz2fW6vgasstDlcWJSmdqRrpy3pjEwKjglp83U1MXi1BXLjWuaauYiE/drrB6VOpsXg5SEYaNGU/oRE5mbjvZLxCqSExEwTRdG/3fKleh3jJ5VV3RX8W7iTbITVLqqC/GOkpgQr8/Wd5okczznqWX8yIDmPfAJPqv7kQ4U5A45lcd6UUC1Ava4MXhBdkOdahfzXBvP9/ohkJvgkJA6Z7wRl/IiyIRaR2w3BDMy52YsTyscCh2S+HwkOAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KX3W8MjCHIaa8o0qFRfjTkNcN7ecs4yP432OhKVOU5s=;
 b=nrbMBW9HR7zJqunGDe9KOF5GT8fIbh/1TFN6MCUZyrSUB5EWpf8BAVNAbyBOvyYSAbI0qS2c4t3gatsTNb57k0nfYQfGRW1/gG+W5nHf9zphFk8KD07HdEdRA5AIOElfP5cwqRJmeEiqkD2R7H9YTjMcAgJwoA0qA+ItEBv/J8I=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com (10.168.95.21) by
 HE1PR0801MB2028.eurprd08.prod.outlook.com (10.168.98.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Wed, 11 Mar 2020 10:56:54 +0000
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be]) by HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be%8]) with mapi id 15.20.2814.007; Wed, 11 Mar 2020
 10:56:54 +0000
From: rui.silva@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 0/3 RESEND] arm-bsp: add recipes to support cortex-a5 designstart
Date: Wed, 11 Mar 2020 10:56:40 +0000
Message-Id: <20200311105643.159467-1-rui.silva@arm.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::32) To HE1PR0801MB2044.eurprd08.prod.outlook.com
 (2603:10a6:3:50::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from arch-thunder.local (109.49.46.234) by MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14 via Frontend Transport; Wed, 11 Mar 2020 10:56:53 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [109.49.46.234]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c21909cd-c0d3-4ce5-9691-08d7c5aaed6e
X-MS-TrafficTypeDiagnostic: HE1PR0801MB2028:|HE1PR0801MB2028:|AM0PR08MB5012:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB5012D17696B58856403A7416EAFC0@AM0PR08MB5012.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;OLM:8273;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(199004)(4326008)(6512007)(26005)(66476007)(36756003)(52116002)(66946007)(186003)(66556008)(2906002)(478600001)(1076003)(6506007)(316002)(8676002)(81156014)(6486002)(16526019)(6666004)(86362001)(2616005)(81166006)(6916009)(956004)(8936002)(5660300002)(966005);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB2028;H:HE1PR0801MB2044.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 crIiUGanhRACRh7LB1hkrgSqaAZ4ivh/4DxEST6e+p3NIsAuouvXP8LoOWcUUE3imEelx6R7Pzi7+kDmXQ2uMA61K6KA9V+LhUMiurADxAfYYZ38cD1mbC0LgdkUbRJ4BKl3V8a19Q7q7N6Oyr5de38tVuKyDLDiBJCk4Zt4/I+Sxz+DaO+PXvLDLHGTWfZyNr6Im423EkI8xuIvLodl433CzEgLzmxYF7JYkxP3XELEj5qgxG1lug3bfS170PIaiGqpyFIg1xg34wY36zXlHGcoZ+LJuVmrXH1kiSs6cv6uwUOwpyeOfVFUEQLK64MKCyKyY/r7eqsfDO0y16q+q43vqH4HcnkH7X4sUlAcEE9VDh/eMTs4Yeb1UEZtG3FnVvwcqTdqRV5Myf7DzOcMb2iqVIx0b/h3Owbw7IvOL3qhgmjPxhW36GNCS7R69P50aKWVmvDCmLS0TdnSBNjGy6XWk8jS1fZiM8Xf8+Bz48cOJ7Td4JK0mwyQXQAvpNhKBDpr2ZjO/DQChxT981DCGg==
X-MS-Exchange-AntiSpam-MessageData: 
 DSuU69T4YCt8N1uAbpD3uPUZQ2NOmeErcuP4+U47ehjNrrGR0JoDzgi5Vc0jdEBbMKRuHUK3+0OZuH0tOprpc0gzh2bFtONPL2M4ZEnd/0YyfwwdBvyEkw+e6i9GuU16wwYcuHs5citg3Ck37GzyhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2028
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Return-Path: Rui.Silva@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(199004)(26005)(6512007)(6666004)(356004)(26826003)(6916009)(6506007)(2906002)(36756003)(4326008)(86362001)(316002)(478600001)(5660300002)(1076003)(70206006)(81156014)(186003)(8936002)(956004)(2616005)(81166006)(966005)(70586007)(8676002)(6486002)(336012)(16526019);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB5012;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	32d5c654-6c8c-4b5b-db99-08d7c5aae8c6
X-Forefront-PRVS: 0339F89554
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uHp9yUerSByhhczWneaXwCrYsIUVek1zMo83K9qch0wbS/jMPjUSwOHvPwbz5ovYEs/SzY41qC0YNzfO1KaLXpxLhXU1tMvAt+ie8Kd8JZzUPBq7J7GrP0oarBXTsO2sF+4gzqIypJcBmIRIaDnYJ2O2cjPRq1ze9VBh0xvMu2WSRgq++mP0MpWK7h/ivismy0kv4xDuaZQXwygZNn9BmnzC58wexeWFu7DZiYuOTp3TCEyzz/k66qhviwuxSrhea9Lc97XE4i2OF9wWNFuMLJw5CDWYbGZRwil3e4mImyrJK49DMwX/589FSW5vn4kmMDOwGnz0s/YpwDx8b3WMP0ZuMxAcRjw+JsCHHcrDONRCZD/kpniEM1aSI8IVo2vqxI8tocpmW5UHr/G29/3qbRXI3YCRiHRqTYI3qaVTWVpN7g26Tsh7pmDEGPHZoRjm70jJFM5gcL+a9ko3isTGiDKYoCXh4I+oQJsKMhifYrX0R38f6EUWvejruI3f4H350k3so6OLt9D1GNc3icLgdQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 10:57:01.4714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c21909cd-c0d3-4ce5-9691-08d7c5aaed6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5012
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add necessary recipes to feature equivalent to the actual
releases for the sw stack for the Cortex-A5 Designstart [0]
platform.

Cheers,
   Rui

[0]: https://developer.arm.com/ip-products/designstart/pro/cortex-a5

Rui Silva (3):
  arm-bsp: add upstream kernel inc and v5.3 recipe
  arm-bsp: u-boot: move machine patches
  arm-bsp: add support to cortex-a5 designstart

 meta-arm-bsp/conf/machine/a5ds.conf           |  25 ++
 meta-arm-bsp/documentation/a5ds.md            |  24 ++
 ...t-arm-a5ds-move-dtb-to-a-new-address.patch |  31 ++
 .../trusted-firmware-a-a5ds.inc               |  22 ++
 .../trusted-firmware-a_git.bbappend           |   7 +
 .../a5ds/0001-armv7-add-mmio-timer.patch      | 105 ++++++
 ...-arm-add-designstart-cortex-a5-board.patch | 309 ++++++++++++++++++
 .../{ =3D> juno}/u-boot_vexpress_uenv.patch     |   0
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   8 +
 .../recipes-bsp/u-boot/u-boot_2019.%.bbappend |   2 +-
 .../linux/linux-upstream-arm-platforms.inc    |  24 ++
 .../linux/linux-upstream-arm_5.3.bb           |   8 +
 12 files changed, 564 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/conf/machine/a5ds.conf
 create mode 100644 meta-arm-bsp/documentation/a5ds.md
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/=
0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-a5ds.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-a=
dd-mmio-timer.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-a=
rm-add-designstart-cortex-a5-board.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/files/{ =3D> juno}/u-boot_vexpress_=
uenv.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-pl=
atforms.inc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.=
3.bb

--
2.25.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
