Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.87])
 by mx.groups.io with SMTP id smtpd.web11.46138.1597070063552362895
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 07:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jKALFQzK;
 spf=pass (domain: arm.com, ip: 40.107.4.87, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSSFl1+6zkBJFAZ0xJLrkXqnsXV2Ny8wVZpvaUz9Koo=;
 b=jKALFQzKrDwojq8qAvP2qoebGd3GfGVESdS1cez7DU/ElrULJZ+kTc4au0T6SywW+d2dua4U04gMhMpIK1MmZw+U0kHqzvHhQv9qoloq2EvFlOCYS8yMmoyjfSK8pCdfHGIGE5bJV9sAzs+jQft/IQ4UENAWggXXt45ksxDfuhA=
Received: from AM6PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:f0::41)
 by AM0PR08MB3041.eurprd08.prod.outlook.com (2603:10a6:208:5c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Mon, 10 Aug
 2020 14:34:20 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::2) by AM6PR04CA0064.outlook.office365.com
 (2603:10a6:20b:f0::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Mon, 10 Aug 2020 14:34:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 14:34:20 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Mon, 10 Aug 2020 14:34:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01cb7a0392569a00
X-CR-MTA-TID: 64aa7808
Received: from 5e563382f92e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AC7DFD47-7090-47DD-8673-68B7C0328CA8.1;
	Mon, 10 Aug 2020 14:34:14 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e563382f92e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 14:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GerLe5R2QgAs6MIe9XfMSw6dOOuMM83G/S0lgiqdJP0Mqr6M2DMWvsIOnSQb7BJ9TZas18ZO3JKjE3VqLiF2NM5yKSsuiHLOyT1C8qEGTGF+81HWWyQMLTA0d1uIOwx9UVjHgaGHivkeMlhyCIZLAE2JxfqXmdaHPzE+mW6YVTH1hmzqL7sHh+SAo3pHu1gBWIqqsP4L7RSbCbL6NvYe7YoF/5zQxAVuT+DiW1P/OJMgPxcBpKygzECyu4IgkETIeyc/KmXCryLmxyXGkji5W9qFq00DvNA7i8rBtpUY8i6Fx/SsVo6HCMxVhHUxuhK/LuXmd2Ux8EoBUOFYJsL/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSSFl1+6zkBJFAZ0xJLrkXqnsXV2Ny8wVZpvaUz9Koo=;
 b=POZfqWBEKaEG86iRCBOd5pYFpjFl8vduz/Kz3HVl0y4tykFLtHKBJ4QqI6NRWohC0ATE5xnRgImWEWVGXkn/zGWhVPCYGkI7TxVOKwKu8NRhpbaqRdjnWjIqDZzlS2cyFJGUq8vYiaiCjjcSsG3qpCcJONCywY8Aqfxv29fh7YUunsPlwDNlk0yFPao1Kbit86xlSv/9h96NNNzUOy7jHiCEmp/gbqpVci2Pt0R762ceQeojRr7yBArOeFHP+0ZnoUnd0pHumzTBFx0Tj9hbWwHLwcnRcd0iPpf3DBGc2mzFQRWX+VOOsbLwBh6fKqXVorRc2Ri2kIv1T7bzDB2x8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSSFl1+6zkBJFAZ0xJLrkXqnsXV2Ny8wVZpvaUz9Koo=;
 b=jKALFQzKrDwojq8qAvP2qoebGd3GfGVESdS1cez7DU/ElrULJZ+kTc4au0T6SywW+d2dua4U04gMhMpIK1MmZw+U0kHqzvHhQv9qoloq2EvFlOCYS8yMmoyjfSK8pCdfHGIGE5bJV9sAzs+jQft/IQ4UENAWggXXt45ksxDfuhA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB3345.eurprd08.prod.outlook.com (2603:10a6:208:5c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Mon, 10 Aug
 2020 14:34:13 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 14:34:13 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: Fix missing virtual/kernel warnings for musca
Date: Mon, 10 Aug 2020 10:34:07 -0400
Message-Id: <20200810143407.12420-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN6PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:805:de::36) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN6PR05CA0023.namprd05.prod.outlook.com (2603:10b6:805:de::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Mon, 10 Aug 2020 14:34:11 +0000
Received: by vm (sSMTP sendmail emulation); Mon, 10 Aug 2020 10:34:07 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5801ce92-7d54-4dac-7e2c-08d83d3a7837
X-MS-TrafficTypeDiagnostic: AM0PR08MB3345:|AM0PR08MB3041:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3041D51AD44F60EF34027BE5F0440@AM0PR08MB3041.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CLogpC/PLPZ0xLxAa9EZ/QOG9oyxXDgGxxfZNsEbbDC3GkNZQbmSd8hVaihSaPCBYDs4QQ5T0Uk2VnDw0oHxZuWtwoxVKHeAc8hmwlMezIQ5JobJfwXdDHGSGV6KNgFmxDneX5P7hSLu4Flc/0cV4+cSOZfkSJLEvMUX59OCN5c/Xb510pEro7+rgoMWXDg3uw6fJ8BpOT9kFDujsggWRyiE6NGeV8WQ1g60yr3WY8yHW5kjPuXwb9AMsmJ3kBlPpwbm3fg9u1X36jjcDgA1thsHwliRGom4yyHCisf/UiRiONNLzJlp6E4+yTMLs7JVjlWKzPpzrFW7iLHnGNuftw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(186003)(4326008)(52116002)(5660300002)(66946007)(66476007)(86362001)(66556008)(426003)(44832011)(2616005)(42186006)(83380400001)(6916009)(2906002)(1076003)(36756003)(26005)(8936002)(8676002)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 XpuayaU0rS/kkOvQw8dUNz8IUx7zfCc70319jnZA6UdsLyQfEpUGdFg5AJPtpRKNVHVN4jtw9ExX61aiKr/F7X1WTb+e+6af4WdL2IO790W4vuh2mZkHaDkV7XUGA2wL9dCSA0X/hrYJ+FIbu9fGJbJVJMktgIsIRAxZPfWmQEDQCjPdpRSTg8R28DQ+CgXkqPKows2u199wisVtzaDgH4DG45jXhUwj2gUtLKif4BO8g03hF2cOoN3gLzEzGtVmQusQpnD6ZPjQXuCCq4pnPY0W6J/WsFTU1aiXT9ZMtUWGcbjt7+XPhSkj+2JZOEMiU6SC0+BM2KZUOXW5ywj+sXG3nrBW6vBZY/C5mGGRf0uIl6qUXBJBOusQg4Ds6LCbXshZjoZQmu2o7bJTv5i+3KMaD06sK2I4dfHcYkJcjILaHi4eWatkhWB8Jk4JQb1+oYhJYmQeL511Q8bcJjibtDDLhhfJk/48sqPGPieFxuQtZfdW0OEF5+DMN1XpRnS/gdeme0HkSwh+iFAscRrxUkwFX5Ko6LV5ygNuGASo5hmKibK8bEFB49U5wpAPv6/lOc/XVNjUhnB0GEYIF1ppmBMY1hrxJJedLRJnQkaVtUTKYR4bw7UzT1uiWLK5hdHtSxqtSkYlIxOkfuIAuQBGfg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3345
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e6c9dae0-110e-46f0-b073-08d83d3a7336
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YfItEYac2z0F3PWDpPSX9gF/3Vl0HJohZgYdATTgnkcl56SnXc593AlYfhcypFqyydFJ3d1RbZ9ez1ZqoPCQm98qQuTiAyfluXZ/+hIHn9eFzEI5bLDXoUVNjV0bGL2TEy3ll5SBK/UYsjrM9tIPP1JoKFdYjQlaqxS3Dtg5q5TJpTHn5iyHXyBSf9tHfd5Tm28baE6nthnV0gPZhDdUHsasE5+NXC4wm+vYg3IFFg3ErHkSz/i37l3YmWRKL2HyiYHp186d80B9H8yKCqPkY8YD9FsKbiA3PADnRHL40h/amzUqFfeocrm0azzueoy2QQLmAXrt9fIs9gpHHJIrBFUy21HzZ2htLZxX3wJ4zItxTIswpcfHZ43MoL6kRox9Tqa1m5R1VvrhDswcNamRzA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966005)(6916009)(86362001)(44832011)(8936002)(70586007)(478600001)(186003)(70206006)(8676002)(36756003)(47076004)(82310400002)(2906002)(83380400001)(81166007)(426003)(4326008)(82740400003)(42186006)(36906005)(336012)(26005)(316002)(1076003)(5660300002)(2616005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 14:34:20.6575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5801ce92-7d54-4dac-7e2c-08d83d3a7837
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3041
Content-Type: text/plain

When building musca s1 and b1, the many warnings are seen.  As an
example:
NOTE: Multiple providers are available for virtual/kernel (linux-dummy, linux-linaro-arm, linux-mainline, linux-stable)
Consider defining a PREFERRED_PROVIDER entry to match virtual/kernel
NOTE: Multiple providers are available for runtime kernel-base (linux-linaro-arm, linux-mainline, linux-stable)
Consider defining a PREFERRED_RPROVIDER entry to match kernel-base
NOTE: Multiple providers are available for runtime kernel-image (linux-linaro-arm, linux-mainline, linux-stable)
Consider defining a PREFERRED_RPROVIDER entry to match kernel-image
NOTE: Multiple providers are available for runtime kernel-image-zimage (linux-linaro-arm, linux-mainline, linux-stable)
Consider defining a PREFERRED_RPROVIDER entry to match kernel-image-zimage
...

Add linux-dummy as the PREFERRED_PROVIDER to the musca inc file to
silence these.

Change-Id: I80eee816b51aa028f9f2ceb03ac137f9c5f8b461
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/armv8m.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/armv8m.inc b/meta-arm-bsp/conf/machine/armv8m.inc
index e7c7ca8..0763193 100644
--- a/meta-arm-bsp/conf/machine/armv8m.inc
+++ b/meta-arm-bsp/conf/machine/armv8m.inc
@@ -3,6 +3,8 @@ DEFAULTTUNE ?= "armv8m"
 TUNEVALID[armv8m] = "Enable instructions for ARMv8-m"
 AVAILTUNES += "armv8m"
 
+PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
+
 ARMPKGARCH_tune-armv8m ?= "armv8m"
 TUNE_FEATURES_tune-armv8m = "armv8m"
 PACKAGE_EXTRA_ARCHS_tune-armv8m = "armv8m"
-- 
2.17.1

