Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web10.50417.1606217890614830810
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 03:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HNuDRqtQ;
 spf=pass (domain: arm.com, ip: 40.107.21.88, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vheKT/gIOYAELzlBMH2nXWuSUEqnaxgCAT+pV6FFQpM=;
 b=HNuDRqtQQ5IJU3uP2PHhDfNo49EnXgtXGT9eM0JNNHsKxFnEtW8KMrANHYUj7nM+eQSvyAtXppINhaXSekAvGoSlQpRXwsongHHBiIwPcS+Rhp2OVybkK58qboNuZIt1wegaEWf290RE3fO/qDuntTz+eLfdVYIEoDzLVc+GNyE=
Received: from AM6P192CA0040.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::17)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 24 Nov
 2020 11:38:07 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::35) by AM6P192CA0040.outlook.office365.com
 (2603:10a6:209:82::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 11:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 11:38:06 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Tue, 24 Nov 2020 11:38:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d5a8953483d3075
X-CR-MTA-TID: 64aa7808
Received: from 288887b00414.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 36806714-7613-4A03-80F5-C07217204703.1;
	Tue, 24 Nov 2020 11:36:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 288887b00414.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 11:36:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KazHFeKJSjCpGgTTtIHjPASBRLycd+WJv6NMcwyg6eG51frM967uAipGEpzyK003RHscOzhGN8FKbuoJjkOnxnVazaj4SaImkM4hPSoLnfYizt+W5IKo9F0KuidErBsiwCTUfscoae6a85ZXclgyErwdlxDDbvREi16ApIie8BmYJvrkDw/FIjgm10NqA6IxClIoypkZphosv68d/WovfDmqi12wGzgg/o853W0RQDDEzMA+ZW/uwhqdJBeFj3wZnLrOFWuA2opcppnTFsdRwuYZMigguEE3ZKe3Rpy2EIX5Zl91kaX1TIkG8Sx63hWcd4fvheofC9OUiuiZ093G4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vheKT/gIOYAELzlBMH2nXWuSUEqnaxgCAT+pV6FFQpM=;
 b=KM50s01clqWj5jIWrikmAx/giivb2CvwcRqvbrbCCi74HushYhDq3/Di19yfpHZMDHvUWpF3Lm52qcNNxAdlISEn3Ui8dxkoANQYPUPAVJJw+QNEkfHa4x2hye6ETKdaHdG+R3Fk7xp8ZC8DeXeXl3lVNeNCrRzqXuGYH0Y05qNX5Zsb5n/HXAMoJP/727+vdw8sBcDdZRf2+ksdP73YL5QENodYIG8S48j3/Aw0Oo5uGAm//vwrH6fHGOxSutjNtnDAk4Ao73T2q5oBHSNxc7GmfdlHoLqgsa7o9Mv9rWq9tu4/UVl48TWBFPWzl+YoPmihyeWyybLJlsM1QX9RwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vheKT/gIOYAELzlBMH2nXWuSUEqnaxgCAT+pV6FFQpM=;
 b=HNuDRqtQQ5IJU3uP2PHhDfNo49EnXgtXGT9eM0JNNHsKxFnEtW8KMrANHYUj7nM+eQSvyAtXppINhaXSekAvGoSlQpRXwsongHHBiIwPcS+Rhp2OVybkK58qboNuZIt1wegaEWf290RE3fO/qDuntTz+eLfdVYIEoDzLVc+GNyE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB6PR0801MB1878.eurprd08.prod.outlook.com (2603:10a6:4:76::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 11:36:30 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21%7]) with mapi id 15.20.3564.028; Tue, 24 Nov 2020
 11:36:30 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/4] branding CA5DS to Corstone-500
Date: Tue, 24 Nov 2020 11:36:17 +0000
Message-Id: <20201124113621.3663-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 11:36:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90a3a950-d9a7-444e-d216-08d8906d6966
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1878:|AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3621908A1DF43D6DA516D9CAFDFB0@AM6PR08MB3621.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aOnkCSNtXllJQaoVy/7obh/H/99CcZfHV5gu6v1AWxM/8Ylm2H55CB8Jwd7PebdMisjT/+oVIQyAa+zgV7Ep+YqBihGkbF0dXNbumviMjYfCT1993oLcq5XmuhIT3MTeDnwAUaRbmxzGUDfIFlTmhgOgF5VzCQzF0zyfoycPECtsBZcB3cLxQJO3+lfhZDjjmnYKzfuY8Yxv9TieFTIzEdflOfJQwDTllIjAjI+QCkPPsQj1dd8qQnwVqXWIDEgrmyYXeT3f1I4yhpYhAiam7GikdZeEDfMZ34bm17H0VrU45lIxmRObwi+8yXIm5I0H38rw+lNxIw9pirgUn+DbBbFjN5YvWBk41hrPmkzErRiwOTxC6ydCt6i6jOmTe5q4
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(7696005)(66476007)(52116002)(9686003)(66946007)(83380400001)(8676002)(66556008)(4326008)(8936002)(2906002)(5660300002)(186003)(16526019)(316002)(86362001)(956004)(2616005)(478600001)(6666004)(1076003)(6486002)(36756003)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 hF/3YvqKksp3XazShRa60f8q5XhcBA7c0D1oMjNkycAdtPXXW3cPR3CIo2uV6Il/u8iftWiLuMkXPDLDIZf516olhNyljn+tc7wxQiEiHGpuvQoveiCGBPsADpknJ/vm1vDRKeLxdXVNyt/x8FCWiTLAKIZC7myTzQ7ZRUBXbqfELQX18OR8n8guTIItoJHhWVTgiBSpsd1pPfvz6+y9ZK0LSQLcdWe598Tu861m1+NWOkBDpceRufZAzQDGhH28IKUjzAuoLi1RAuOUYc8Hu2k5JpmlnL+eyoBNnCJVykQ6XT/+lqRA6YWx01H1uA2A69VzbsuO69OPpukRF79HnWXQ7ZUqIFhit3e+Vuz/CCVFR6iefaIP482ySyUd+UibFT7BCot0WtKOx1E/TGprqrWuSBt4PZtksYNujc3kwNAiyVN14GOCmzo7QagXkn47PZFw4gQhuG42BfMErunovhxUAByX68K4sgCOw5GSFJsfAcO/Gcw6c1rvpa12uMT7UanAyFUmAmpflXPBQ6G+KsptEKLlnZ+NAsXgCPD5nplLJqsdj/QaSqfixnLOHOWyAV41QiVmql6tuQHX45eQ7Ab80ndc6YGWDO3qmzMUvokZSLX1EbsoD1fo1lazCNGj2Xt7Zhmehpwuh5F9BP5cXhJTIbWe2d3yH8OpOJfrpKU1qaqbFOG8NWIaFojGrnLkChflfasIST5l0MChzGlK3i+TA5lhMFpnI4X4yc9U+D8u9AoMdPaATLE9buzcVoozTShywS5wSylpinC61cibC/wzMNNkaf+6tNnrFxCr0GB+gwYLduEWJ3eIlWrrjitXs+VJck+Zh53AEG8AOiYwoMf0c8VhKtP23qw/A/oTkZ3Dt72aSZpsrUwjdsi/3yIBNm2Xxja4s72EvGlhnwfXUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1878
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e520ac8f-f595-4301-02f7-08d8906d2fba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C3CeqqkuGavC0T0WHNEN7CyITJqaQ8IiuyinI/9Xr1gwiXHdtbhqg2e3kBz2g/xgTa2tmovh7Afi9C0mFH6Yw/wWJQHORQczoMJyPKFkq5ZqoCoT5C/aCxuSGGc8EurS+dfNGlCVIR2ThK/RXLjadH9pwMYnpQpF2GeeS+462zhjeSWVUy9KsXZQ8oCKGbebI8stQ5liS0KwN+uY0KRD5IVw2uF0ZoCpTGwK3K71Mhsw5lW3Fn10PLHQEUERi10yzIqcVJpJoRL0ImkLZ4Jc63pNnrSq0CGesDMOX1why3YGbdclgGWZtclKFFno37xKYdqlp3DGjMVfuDGo38yoFZDs/kZmGiyNRHDKPAr4bHTRJQ1ANABgSW/AyPtYgO37TdexVTU7CDJ8QOYCdNVLa8iFaMDrZKLp8kqEu70awjk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(1076003)(2616005)(478600001)(8936002)(16526019)(70586007)(36756003)(2906002)(956004)(186003)(26005)(70206006)(336012)(6666004)(8676002)(47076004)(82310400003)(6486002)(7696005)(82740400003)(83380400001)(9686003)(86362001)(5660300002)(356005)(81166007)(4326008)(316002)(36906005)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 11:38:06.6446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a3a950-d9a7-444e-d216-08d8906d6966
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

The patchset provides the following:

- Branding CA5DS to Corstone-500.
- Upgrading the kernel to v5.3.
- Using Yocto Gatesgarth.
- Upgrading Trusted firmware A to v2.3 with a fix for the system timer issue.
- Upgrading u-boot to 2020.07 with a fix for the generic timer MMIO access issue.

Abdellatif El Khlifi (4):
  arm-bsp: branding CA5DS to Corstone-500
  arm-bsp: use forcevariable override to set Corstone-500 kernel
  arm-bsp/u-boot: enabling the generic timer for Corstone-500
  arm-bsp/trusted-firmware-a: fix the Corstone-500 system timer issue

 meta-arm-bsp/conf/machine/a5ds.conf           | 27 -----------
 meta-arm-bsp/conf/machine/corstone500.conf    | 32 +++++++++++++
 .../documentation/{a5ds.md => corstone500.md} | 12 ++---
 ...inc => trusted-firmware-a-corstone500.inc} |  4 +-
 .../trusted-firmware-a_2.3.bbappend           |  2 +-
 ...g-generic-timer-access-through-MMIO.patch} | 48 +++++++++++++------
 ...002-board-arm-add-corstone500-board.patch} | 19 ++++----
 .../u-boot/u-boot_2020.07.bbappend            |  7 +--
 .../linux/linux-arm-platforms.inc             |  5 +-
 ...-a5ds-Fix-for-the-system-timer-issue.patch | 34 +++++++++++++
 .../trusted-firmware-a_2.3.bb                 |  2 +
 11 files changed, 128 insertions(+), 64 deletions(-)
 delete mode 100644 meta-arm-bsp/conf/machine/a5ds.conf
 create mode 100644 meta-arm-bsp/conf/machine/corstone500.conf
 rename meta-arm-bsp/documentation/{a5ds.md => corstone500.md} (67%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a-a5ds.inc => trusted-firmware-a-corstone500.inc} (85%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/{a5ds/0001-armv7-add-mmio-timer.patch => corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch} (58%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/{a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch => corstone500/0002-board-arm-add-corstone500-board.patch} (96%)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch

-- 
2.17.1

