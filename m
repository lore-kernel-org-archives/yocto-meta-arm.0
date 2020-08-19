Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.43])
 by mx.groups.io with SMTP id smtpd.web10.87619.1597841972387183114
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Aug 2020 05:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=J9/Q+nOE;
 spf=pass (domain: arm.com, ip: 40.107.5.43, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HhJ0c+Ectvjq2OSLMHF0cSAmcbrsffIXTURGnOLlYM=;
 b=J9/Q+nOElwVptzSmRNY4vnnNZtviERAXW5u8VLejyD2oIQ0foAHZPVF6R04M6W6ituMJC9JSJeMmHZfF/xApm2FMiR3GIod4XPiIQeVXfUSDFkn3zzLQHh3bMrhqpTIBYL1P47QT+lj4PtZM+Z4vZ/49PeCKbKvrLMpCpJRpa28=
Received: from AM6PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:20b:f0::29)
 by HE1PR0801MB1785.eurprd08.prod.outlook.com (2603:10a6:3:81::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 12:59:29 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::ae) by AM6PR04CA0052.outlook.office365.com
 (2603:10a6:20b:f0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Wed, 19 Aug 2020 12:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 12:59:29 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Wed, 19 Aug 2020 12:59:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f89edc5c39c7988f
X-CR-MTA-TID: 64aa7808
Received: from c82aceb3b54b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BB657458-C521-4FCD-B1A6-F5CCBD2B391F.1;
	Wed, 19 Aug 2020 12:59:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c82aceb3b54b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Aug 2020 12:59:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6MUAVZ67TcQ+clYdkYdu/q7etg71eXxnXhkRC+wC1bcjHcs6DesTzeUpCvORZNQGxcUtDurPTSkjABUCqv8dOARAB0wa+16lueJ7cLCRiCaFIX+Tglj89nqfW8eRMfRKbgFwBdbZCd/dcmBcbEjSTXUl0Vsrox9lVkfwNo+uh7eUUCHxaeXdRk6XurB3q9w0Xwiwh9XoFoUEneVaAw08xEsK5++jYouhkvXYuZLazMUF/WLEGqpbRYtTsmTcaiBs5TS8orMT1qpe1eA8d9wX/7iKOUVpiR7YRaRn0BN5qv25vlwKKII9EN1bfMBUhbFkTLTOXvCPqHp4vdmJGCbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HhJ0c+Ectvjq2OSLMHF0cSAmcbrsffIXTURGnOLlYM=;
 b=KO6pNmVulB1oY0jCDBfCka6DWRK8jxbjxrypcPMXx37RTEtJj/9l0b2OjvFW7dh35WZIkTRtIfjsJHZ0f0pcnLSW6C95hyJrJ8AKlbQ1xAZiURFHeR9UYweB/SfG2R4ciz4+M27DN88r2WV1NoDtsG4q2MmoNYXy0GnUMrn3elgavbEMuh0ORSNpYCDuQI++ZaLNAkLV5Th6BwuoVqcCmAcqvRrNoAAmcPO6NgOjn4VeLk873KNlYZxJ+yxzjxIjpDe1gUbVMkLhp9rLNnfsH3MSJ2wYnoPmeWWsAVf4oP5e5IcSkzEh+C+7qloy/jKhrqWa1/bc/L3VDYnlxbdDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HhJ0c+Ectvjq2OSLMHF0cSAmcbrsffIXTURGnOLlYM=;
 b=J9/Q+nOElwVptzSmRNY4vnnNZtviERAXW5u8VLejyD2oIQ0foAHZPVF6R04M6W6ituMJC9JSJeMmHZfF/xApm2FMiR3GIod4XPiIQeVXfUSDFkn3zzLQHh3bMrhqpTIBYL1P47QT+lj4PtZM+Z4vZ/49PeCKbKvrLMpCpJRpa28=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM4PR08MB2690.eurprd08.prod.outlook.com (2603:10a6:205:5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Wed, 19 Aug
 2020 12:59:16 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 12:59:16 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: Correct documentation errors
Date: Wed, 19 Aug 2020 08:59:04 -0400
Message-Id: <20200819125904.23179-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819125904.23179-1-jon.mason@arm.com>
References: <20200819125904.23179-1-jon.mason@arm.com>
X-ClientProxiedBy: DM6PR14CA0041.namprd14.prod.outlook.com
 (2603:10b6:5:18f::18) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by DM6PR14CA0041.namprd14.prod.outlook.com (2603:10b6:5:18f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 12:59:14 +0000
Received: by vm (sSMTP sendmail emulation); Wed, 19 Aug 2020 08:59:10 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9739798-e0d2-459e-f0a0-08d8443fb594
X-MS-TrafficTypeDiagnostic: AM4PR08MB2690:|HE1PR0801MB1785:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB178531060D682DD8B0B88454F05D0@HE1PR0801MB1785.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HRo+IJxcRRBuDVJeJq53Cw7qEXnbw5Eoix6nfZQ9YlNbK1oeJtVLgrs/5hn86Eg4yQVO4Fh+0E4bS8Z7p0CqpDnAwO6kFSBrkuusfFpfQYxJWd1n2AGyRm+1ey7CYQCAa+OQhgmFEeXTyHDMrPfcfzACYXrkNeiI9QYMiqUoWFVYj2CgoEbeSlsX5EOBcRE/5BBiDNIZUFZx7I9lsBS4v7Pd9PlzdhHbdi1C7i/Y+XxFooa58xeTH14AJfeE6tGqZ9fOYgGBlckiSTIiPjzcqvaLBH4LF4CkaUtxFPxTDOqoNBpPOfJo/lCDDLPJ3owhE751vTYnPyLskHp0A8dYxA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(83380400001)(44832011)(52116002)(6916009)(1076003)(19627235002)(36756003)(426003)(4326008)(8676002)(2616005)(316002)(86362001)(26005)(5660300002)(186003)(8936002)(42186006)(66556008)(66946007)(2906002)(66476007)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 F+cxY8q7EQ21K5ImYnshO3HiYMxqswJo+QoGiqReY0PHPTIEoZiR2rO55VuRM+HcXDO/opao0n5jl4PlGAfEzbZf0vegI4X98KHtpR6MwjD6vMlCB4/fvPU4KvttA7InvzOf6nRgwWefUQcR23FYl3XBJW7xBIXrg3Lp5bBQ7Ut1Z14FrXG7vuXn95SYnhjMG8b22qpgf2ZYiOMLGZ4qOHaV0TJmzSP8BPxwRbLMJh87Cysel7jJSOzQPDXiJSr681xfmtUgtWq2dF6DdJRmMYlcZlOHdLkrrhuGiBeCDIn3+cmwd7k8Q9YMCW1qdT+JQ5tejXKiH39EswqKaTxNa9UK6KcK812h7HbShpJPeiGqcTgCM2c9Ipf37rom4O0QW6ur8uF2RXKH3gnfPU/E/IgUi0YVLz12C8ttc8iJlOsEwfWebAOyw2EE6Y+FNVanQBcmGyQU/Q/o3B71S0W/Sz+PKKPAPZuorCPpZWIA/G6uS+st3XEuyovoQj7/VA8DwOazBS+OL9lc8GZO+wnHmgd1QWP3WyGf14yUQSTeXWsfg9Wb0IEtXBGY3YHNKOSBxaKK8Ht4sMhogiBgKSD+eg2mEY8iSOkYjkI+qjEQJlEATj3iCxdjsls00XVaurQ73Ai0E7AWGyebs59FhjOlxQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2690
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2384b90f-63f1-4721-8023-08d8443fad63
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NxAeSjtm0SOn7hA/vE7whMKsfPEpABzw43escnilTpT/OIGe6W9IH0MA0edIBPSum2wKO9PTUZ8tbsn7kxwWxwuJxhHB4QNC3T/AgwPCDQa6+dtZP4qbc1c5AaJNpUKVLRWRFX48vgicsLXSIQmL9+KwxHA9F49stS/gLSQmpCC54hDY+F3f5OGgWEJFBKZmeQX3XN8i3D0XI/IrYRwvU0H7jIqK60HBaIJdkEMyjg5PS4dmpZHuThhqZ7RCHH5RZPm3ycL/UKHGaTbNOySq+i8qj/10yAfxPGaPaPEbDZ2DPEXDVs3KWQIFEX/SwcgbtCO81gHvFMv4pRiDx54NLGUYaduwSGvroXM0N26qtcbWN4UmLjAdJuMcv7vvtp+zUfmONau68S/BtyWADSz/2Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966005)(8936002)(44832011)(82310400002)(81166007)(86362001)(4326008)(19627235002)(6916009)(70586007)(42186006)(1076003)(82740400003)(356005)(70206006)(26005)(6666004)(36756003)(316002)(36906005)(83380400001)(2616005)(186003)(2906002)(5660300002)(47076004)(426003)(478600001)(336012)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 12:59:29.1921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9739798-e0d2-459e-f0a0-08d8443fb594
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1785
Content-Type: text/plain

Documentation for FVP and Foundation is incorrect in names and missing a
field.

Change-Id: I58de54e9d0883671166102e657f53cfad14a2cba
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/documentation/foundation-armv8.md | 3 ++-
 meta-arm-bsp/documentation/fvp-base.md         | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bsp/documentation/foundation-armv8.md
index 1097550..7e73da5 100644
--- a/meta-arm-bsp/documentation/foundation-armv8.md
+++ b/meta-arm-bsp/documentation/foundation-armv8.md
@@ -30,9 +30,10 @@ Once done, do the following to build and run an image:
 ```
 bash$ ./Foundation_Platform --cores=4 --no-sve --gicv3 \
          --data=${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.bin@0x0 \
+         --data=${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin@0x8000000 \
          --data=${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
          --data=${YOCTO_DEPLOY_IMGS_DIR}/foundation-v8-gicv3-psci.dtb@0x83000000 \
-         --block-device=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-foundation-armv8.disk.img \
+         --block-device=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-foundation-armv8.disk.img
 ```
 
 If you have built a configuration without a ramdisk, you can use the following
diff --git a/meta-arm-bsp/documentation/fvp-base.md b/meta-arm-bsp/documentation/fvp-base.md
index 0936c19..58604e1 100644
--- a/meta-arm-bsp/documentation/fvp-base.md
+++ b/meta-arm-bsp/documentation/fvp-base.md
@@ -34,7 +34,7 @@ bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=1 \
          -C bp.flashloader0.fname=${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin \
          --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
          --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/fvp-base-gicv3-psci-custom.dtb@0x83000000 \
-         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-foundation-armv8.disk.img \
+         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fvp-base.disk.img
 ```
 
 
-- 
2.17.1

