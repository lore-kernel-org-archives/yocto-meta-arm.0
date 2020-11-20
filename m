Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web11.24190.1605872667310481673
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 03:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nHFr5Wr8;
 spf=pass (domain: arm.com, ip: 40.107.22.55, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNh53TaCUlG+FDVT1hrqC25usBTFgKEIv+3bV4ZRYTs=;
 b=nHFr5Wr8b/4tcDAt7gJYXGr60o+OcFMpFowwfZRMwTmvvBg913+Gjwdlq26vpV3xyPMCIEOdNJTRpKsgpulcrSW++/ZiaFFfMptZSHhxN89FVMmgp768I623JU9QHqh8Tk84wwfd91MAM/lB6/ncxGcgyH/6nlRS1Fhs0e7kXUY=
Received: from AM6PR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::48) by AM6PR08MB3861.eurprd08.prod.outlook.com
 (2603:10a6:20b:80::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Fri, 20 Nov
 2020 11:44:24 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::5d) by AM6PR01CA0071.outlook.office365.com
 (2603:10a6:20b:e0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22 via Frontend
 Transport; Fri, 20 Nov 2020 11:44:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:44:24 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Fri, 20 Nov 2020 11:44:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4c793e766df75182
X-CR-MTA-TID: 64aa7808
Received: from 135090f5d81a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F5E94D68-D510-44CE-AFAF-DBEC3F5E5141.1;
	Fri, 20 Nov 2020 11:44:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 135090f5d81a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 20 Nov 2020 11:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCFP/IOkqYSyDc8mDcgFPH0zZ1qKJkN5Cq/ZsNMK3ynAAh7BybvpUkGvN4loL2D/Ilj9JS5qatWqjruCsAIiURiBcLmuchwOnB01xnD7NMgE8bgvE7MmbYuPWJi1w75WQEXqVh+IKM7gUgNNHsq7jSqcrrH7GCZZgqLYwrAIW+k0C3xHFldP6u6v/nI4TVkyemE/rbq3nMtexb659ntjom7YgN3bP/w8LLAn/9ydXnhrcZIsptcDjwInhC/kJEUXl+holfZHk6R2W3y0RrUo6ZowscqhFM/sgFj9oZ0uH4vWCUmYF3Cm+CHPRTh0ypCad5IozpXnvK46zJsdjPHQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNh53TaCUlG+FDVT1hrqC25usBTFgKEIv+3bV4ZRYTs=;
 b=QpTi5d7z19utWUqlN/chNBTgc8jo/4ejv835y4O1Bm2F8nEd/RCOqfPMFnX7PsSvF1+WmHdaIjfpIH5aO6gRZQRqc8ZPS/lG25+npOrzAX8mVQN5L88lnQEkuSZPXC5IM7BHK5xb1L0NmRuL27iIT5gZHrGpj94RZ1cqjS2nifpHw/RwRn468uXKmJIjDfCYOA3D4COZkrYdVcOVEfeuJy/V6I8bmBqRkYGzoZwRmXWvcfWEJyCl1PJoI2thdjBDC9qgqfBBIOyNRlY9IMTC4EEztT6tH7mYyCLuMTMS0rm3nwEWmwjhKcK28urhggGqpBM+dik853adIG+1b5cTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNh53TaCUlG+FDVT1hrqC25usBTFgKEIv+3bV4ZRYTs=;
 b=nHFr5Wr8b/4tcDAt7gJYXGr60o+OcFMpFowwfZRMwTmvvBg913+Gjwdlq26vpV3xyPMCIEOdNJTRpKsgpulcrSW++/ZiaFFfMptZSHhxN89FVMmgp768I623JU9QHqh8Tk84wwfd91MAM/lB6/ncxGcgyH/6nlRS1Fhs0e7kXUY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB8PR08MB5018.eurprd08.prod.outlook.com (2603:10a6:10:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 11:44:15 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159%3]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:44:15 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/5] arm-autonomy/xenguest-mkimage: fix DISK_DEVICE setting
Date: Fri, 20 Nov 2020 12:44:00 +0100
Message-Id: <20201120114404.730-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:44:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a72c6313-558c-4aae-8901-08d88d49a0ed
X-MS-TrafficTypeDiagnostic: DB8PR08MB5018:|AM6PR08MB3861:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB386129ADDAC13CA2F35EF4C2FDFF0@AM6PR08MB3861.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:983;OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V6yCh27UQDPWS/xTxXj59cjuC2jwiBjv0Nl8rWNSgU371/SFo40cmEjdc15LpVpkhjN3n4V9KnsfTHDQoLA8iWCxkhDPRlpLTrH8DabDRFG5lGSGkD+zE8N2O8gxCMdq0P+l+u7smf9MhgQ/4G88AmQ+IyE7496MMv79fTC66K3kCjz3uSe2TDLnE//7NS75WEjOSfOTgNaKWHrfJk39tSQ68j1xuzo/dxrgyDqmFCiy3OYCRym0AC7ZeT2y7j/KmQxuHRMDiodH3A23B+L5OD6/tcFwpKlzyQPXXNdsrpY4/jExXIwu/bE0tETgVgIujuKEH6561OnaLzUrZoiNPQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(316002)(6486002)(44832011)(6916009)(83380400001)(2906002)(478600001)(186003)(956004)(26005)(16526019)(8936002)(2616005)(7696005)(5660300002)(52116002)(1076003)(66556008)(8676002)(66476007)(66946007)(86362001)(4326008)(36756003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Dgh9T5Zx9FaQp/qClmxCgUfD8lIGBO5/MSZFmCvIBjmhsNPPqOMPB+rqGAecmYYYQ/MJl/9MSxkf6izDx72MpIaN2dCB2Edxl0kTF/hEzKl7iNr2JIVBGVy/kaVo0NQUJ3cy+5jrfD2fqO9LNP1lNL4JCa9N6roKfDK+Kxs5azirQwwByGTvyYJy2Yrk6CHbgmlMPtd7k8MR1CS/Vwo5sZdaehNxvRpxOx6J7F6/e8r+lzJfUyTt+uUAeVLz8JLrMj+NgQt8lIRehqbAq7OKKG+vY/Zi8rpmuCvOgJH130VV3gcOgM2iLCfmRdtpLWBtoBR+IHo0VdU7agVqvOnMaylbHak6pk8A7ZUh5zXCnYDL6TrCSwL+7H2hliXgylXrgTmAuL8eJn1ZGSFp0CC8b6dZ6cnWNZeAKBQ66z8EFiD1HiH7f6OnWlv9pJjh3YoORxAC6oVRFDf0b396XzOFF9OFn83ioreOMxByitlg009LeuyZE28qtsnUtxE+zrLvcf72IacVWP81Lbp6fShL1/Q2JVHkjuKtDz3lt0cBNYElVahexkvk6bInWSSUQAY8azn7YUNMISjVah453ZESRqzH1fJ9r3VdRu68rzA56xhi3eGggEpZo2K8Vqdrxxdq305bVClBCH8t9L6PGHeGvuL3kCSDuZgajmI0nzQzDobB1P38V0+uT/owQlV6AcaGwXWGT/hMUHonD/OcWAtHw/avNUN1eXH3J0GzIhSDHmMDt+RMWpnCJ5hcaM78vjIjM5tVcCLtz9FfhiGwCERs8iLGMLZy9s/LD47dBu4AY4mquqK7wxBUEp3hudM9yiya9rEj/CBK2dWsfglyp74wRz1an2x5onoa7WAR3GqvmUENmUmtuDbrK9MfVBsEGYdJdyi2k+WqLdoGOtd+SXw+UA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5018
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6ca406ac-aa2d-4380-888c-08d88d499b1c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bGjE3IoNVYVlyO3++trxAQsPaTh28LItVTht+b5QIdUt2nW9h86tvyit720P7esf+0DgW09FuMVhkrUb4cPghCfGgrchd1CW/5WrOP7yaG/dpYmi70975my6nOEPeGrYtYdy/X2qpfIaeYJwFtxI0U8MdQhV5xYxzy8YoyDEpeylAaLNpA0Ei2XUtrpPWAm0a/oliOEmlaAi3pmRAMuJClRYeTT69gxGXUt17iPX1wVvXmWpcHmkk6IpNZHTdAV3+/Yy0HTOMmhqjuDkTHoaaxDyiyMyK9gXbu1gFSRGM8MoXGfBs3VWHoM1N5+Cx3APMjaHmw1pmicBfyPBMD8PMDBM1kbht4EiorK8KM2VBVotIhdM9X3XUETLYwzBU/tKJodEk2aSZnkPTQpwJubtWA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966005)(47076004)(7696005)(2906002)(44832011)(316002)(16526019)(81166007)(82310400003)(86362001)(4326008)(186003)(70586007)(356005)(478600001)(26005)(1076003)(36756003)(8936002)(6666004)(83380400001)(8676002)(82740400003)(336012)(2616005)(70206006)(6916009)(956004)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:44:24.3676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a72c6313-558c-4aae-8901-08d88d49a0ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Content-Type: text/plain

Previously '--disk-device' was set according to DISK_SIZE value,
set with '--disk-size' option, which was not quite accurate,
because disk device is more likely to be '/dev/sda2' rather than '1'.
This patch also fixes typo in help message.

Change-Id: I19aa72f3adb32cd786bb570023b6b40cfc5633bf
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../recipes-extended/xenguest/files/xenguest-mkimage          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
index a3f987a..fb321d6 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
@@ -127,7 +127,7 @@ Disk configuration
 --disk-rm-part=ID       remove partition ID from the guest disk
 --disk-add-file=SRC:DST add file SRC as disk file DST in the xenguest image.
                          DST can then be used as a partition CONTENT.
---disk--rm-file=DST     remove disk file DST from the xenguest image.
+--disk-rm-file=DST     remove disk file DST from the xenguest image.
 EOF
 }
 
@@ -746,7 +746,7 @@ for arg in "${@}"; do
                 ${IMAGE_TMPDIR}/disk.cfg
             ;;
         --disk-device=*)
-            sed -i "s/DISK_DEVICE=.*/DISK_SIZE=\"${optarg}\"/" \
+            sed -i "s@DISK_DEVICE=.*@DISK_DEVICE=\"${optarg}\"@" \
                 ${IMAGE_TMPDIR}/disk.cfg
             ;;
         --disk-add-part=*)
-- 
2.17.1

