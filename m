Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.54])
 by mx.groups.io with SMTP id smtpd.web11.3750.1588850132297644590
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 04:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vCTqLSLc;
 spf=pass (domain: arm.com, ip: 40.107.4.54, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lla/nQxT/ijiPCzBcDaqGhrwWOg9Tyx22cOKrtWAXA0=;
 b=vCTqLSLcVBlh9vJ7Q4I7zROV30rD/stgKT5mYPF8cV0x2nLRKryOzhspzKWaq1X7fohKCrQgYZC5BWej1y/ZalWUNVR2+v4Xx8f4VaxkgiRtSnIhwPkZ2l/kmB1s9vWQWBq3eIOAm0sX3h07W8R3HSppWKIGoxQXqAbTQU60eDI=
Received: from MR2P264CA0067.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::31)
 by AM4PR0802MB2258.eurprd08.prod.outlook.com (2603:10a6:200:62::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 7 May
 2020 11:15:29 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::45) by MR2P264CA0067.outlook.office365.com
 (2603:10a6:500:31::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Thu, 7 May 2020 11:15:29 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:15:28 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Thu, 07 May 2020 11:15:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1c076c6606a5419
X-CR-MTA-TID: 64aa7808
Received: from 454efd466892.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8A2479F4-D35D-472C-BA29-2373D60B6B3F.1;
	Thu, 07 May 2020 11:15:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 454efd466892.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 11:15:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAJ2hDxkoeuE/NpOpbgZJrXbb9qSubQwk9mAUK2gbEaHIT29TI474DWObxwi9cXKjvwUL8+7a3lFKL2cAE6qvllyZN8u04kItCRjJo70jZQaHdoDrXU9va7AXL8exEQjqXCPQluczVMtCBs2MIiPpVFTa4uJGm2wfbMUKbOq90vYWadUFB27rYloetMMs+ldfVdQtDUpW6I2s0MWLY0z8UjKhQq6klr+Sm4CkhRsIVzN6RO+aLvhh1HT7Jmsi+LqaYicYZ2NDS1dtFLE6ela/XySp9Ztui3UAE7c0pabMl0qzPGJKWS/f/yu9sAOewt3v51ffGB9XElj/WUpdKiwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lla/nQxT/ijiPCzBcDaqGhrwWOg9Tyx22cOKrtWAXA0=;
 b=WrDLCdOGRWd0WO3E1zhP+UA1l9ujQqOZy7i/U6eW30tf8joBocJ0QSFt6IODFJZMo3Q+8C4feZ3MIqiBXqLaF9SUR8m9CeOXWkRsBWRBzE6aLdjcb42KeFFUyYq57uuJHhXiqgt+X9Of5glCiPp5/gPBiWiQnud/zVJmJVkkepeeUj+7xymAXZsibWUoXzbaQ9UK5jmBdzdZAsXed6qQ06VSY7ghjuwPE8TcG0jq8Q49CGuT5sEcpFabhP+O76HeOIq199rAeTzVjP+0mIOF0iLybex2LgytgTda1fcI+l2e0LRRHDTLG9b4Df0sw29RkAcQrA66rLuH4IbDz/4V6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lla/nQxT/ijiPCzBcDaqGhrwWOg9Tyx22cOKrtWAXA0=;
 b=vCTqLSLcVBlh9vJ7Q4I7zROV30rD/stgKT5mYPF8cV0x2nLRKryOzhspzKWaq1X7fohKCrQgYZC5BWej1y/ZalWUNVR2+v4Xx8f4VaxkgiRtSnIhwPkZ2l/kmB1s9vWQWBq3eIOAm0sX3h07W8R3HSppWKIGoxQXqAbTQU60eDI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3482.eurprd08.prod.outlook.com (2603:10a6:10:42::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 11:15:21 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 11:15:21 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [arm-autonomy] Fix missing xen binary in deploy image
Date: Thu,  7 May 2020 12:10:39 +0100
Message-Id: <20200507111039.38588-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0380.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::32) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by LO2P265CA0380.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 11:15:21 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da4136c4-47d0-49cf-a856-08d7f277f32a
X-MS-TrafficTypeDiagnostic: DB7PR08MB3482:|AM4PR0802MB2258:
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB2258F2D4DB67A831FAE7B7579DA50@AM4PR0802MB2258.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nEKlV16q6GpYUOGcFbpB4OCtruLLUBTaIz1dom+PZw4ppRC6U5RHEaTcjW27wLU2jj66UO3htJ4a6UVJ5jLv9bVZY0d/UEPb4YG9DYckhmW7tqzMVkCi2aIgZ3ZTuQ8DXQWQ4TzE7LbIx+cY5S1/9//+vknuraCWuWutspsWSOuoA2N7YvsxqA0i+Y5qY9ywq65N+EDRogPV6RitpllH695WVrxJ6vOHyEJCA1iHgARtz48TN9k/ktIu3VaSzclUqI78y12n857kFfS1sZd+1sXxyTgCWaOEqIpUkqoNrSTgpliC/TCaLXiFteDnX2Lycje6uKTPnwjc5W5pug+gEJRr3aeCsGNjn7EAVUYfzszck9qDSgTLZlc5OevIXNwBAUgzQOmXeqhBKCxam+7hQNH++dDecVmxYm8DvFV0YsHJOzM683AOSOeBVmEfePDQdf8q6dKK2j6HjJHGMJ3X/ZeDzNej4N60gy3d2ZiaNo+914K30J4gExg8W/AmDtSt1b2jxxY/OM5wu7Y9c0NiSA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(33430700001)(66556008)(66476007)(4326008)(83290400001)(83320400001)(36756003)(44832011)(83310400001)(33440700001)(2616005)(956004)(8936002)(83300400001)(1076003)(8676002)(83280400001)(5660300002)(6916009)(86362001)(2906002)(66946007)(316002)(16526019)(26005)(186003)(6666004)(478600001)(52116002)(7696005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 oDqPQzeRFTrZa1F7ngG26jK2RRyN4A4iD6RHxKD8FExL30S7wuIJYtrE0yMKU4t5V5ewbrwPIqW8Ex84AUM7edyAkeo1wROGBj6ThXgmbVPDTDNDxfY9U2BIe+zCjtB9cweuVE1feCrg9/RZajqbs8iDoIQxtI7q6DA/yUGlPl5x7Bxy7X/KFKF0OCGLkJ4zsn920gdlqX8Ci6j9G/J+N0aW7X2B4vFFhGBLxLwobiBNyZ+oDUAJsRD1TeH2+4vbGCNmqFm044LuhaRnq5vqUAlRPybuS57JnRq6YBnllOwt/nkq7DAa2IWmG0Y4ht1meRUPOVEqAtzg0jkqjb2y5S8SIOJauDBpbQHF6MgYBtsDmPaGJPr93dxT8XebTP4GMAQL8Y2KNApztnD2gcpvek3cdE58PFPGYd+dbTdVwHdnc24avaacIXIOyBUV6T3A7xK5XDb6dhM4dNxIpgiFqwcMfJko6cTm3dUxqT6aCGOnUWT0uG/kNlhitt9w71WePFiOQbLH9m2vpf67q03pQxRPsBX6BnCdN6FvxZz8ZdVCU8bJn3tmI9TYaebIfAO5FNPSx4lPCtQi90efMj91tEOIZQGmHgFMC0Xt3IV75OR/MdVL1iTp3wQV9W4+jnvox9w9Uz9s32WjLC0YVaxOgo51tBkJzDat/vDIMCZ2TU0X4mSpaNg/x507MZCVAuaMyQvUV1IodkaK5cdhMaoTAKiWnsyWNRKOaP8ltlLsF9mCdMdZvDBIMLAvbjL9oU6anKGXadftjRqRGmSTuWup7ne9a6l0pyr8dtO5fcwFBAc=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3482
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966005)(33430700001)(2616005)(81166007)(186003)(6916009)(86362001)(36756003)(33440700001)(956004)(5660300002)(7696005)(6486002)(26005)(1076003)(47076004)(478600001)(316002)(8936002)(356005)(70586007)(36906005)(336012)(70206006)(82740400003)(82310400002)(8676002)(2906002)(16526019)(6666004)(44832011)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	74acdce3-d1d9-45f8-87fa-08d7f277eeb8
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RDZ6KVdiEmIF+R8CS48zSEKTHuUonbj0MswIM2kCj6KI/rGEwqUXvzB5Sdo3PCPCeLBTZhDn/RHeN+KhjoEe4Wb32fX5B3WL6O3K9YY/NhoZNX7yHk7B5fUcOaJYqlvX6cJAKmrqTUEXyI2DDSNGSXcweko3I1ioucXE/BidW4ipTZVDKSfJIQOURMOj02zg87iKCPTzhuutuHoftHJbPLPksd57amiAhK2lQAXqcYGmqUPyC2rjQxhCsNHnXguPeJRSgqvVrhrc4ryjT9/GAYrEuRqs1wGcjMUXxLFmg87E8XsmUaZTzXTyiD4p0o/VOEglpmLiNXwI/MOoOdrgHk5JsffxRMjKg/1E4XY9UhLT3nlvvBtytEIkNt3k5UcKHZRoDpF5hM6PGHoak/I9PvnzBYrgcrSxJ58R/AFxA6QbP3zIQBlJLJEJOGzHIeXd+ij4pU6x/eCATRr2fBhySubqj7QI0oXkekc1tMO8gW9BItTqGpVX2TGRJOyU1DKUneLkcK/js/Dg/eNBBVXGE2QPW5VkeaZIs/HD+RXLxw/Ok1MsiSNWQUnA0+/O9laCjbItp2zIcbk43crmSHWhxA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 11:15:28.9825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da4136c4-47d0-49cf-a856-08d7f277f32a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2258
Content-Type: text/plain

Change Xen package to be machine specific.
This is solving issues encountered when building 2 projects with the
same xen configuration but different machines.
In that case one of the project did not have a xen binary in the deploy
directory.

Change-Id: I2575d91b57455ab690eec9c51e07415673242c06
Issue-Id: SCM-815
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
index 92348e6..846d244 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
@@ -6,3 +6,9 @@ XEN_CONFIG_EARLY_PRINTK ??= "disable"
 
 EXTRA_OEMAKE += "${@bb.utils.contains('XEN_CONFIG_EARLY_PRINTK', 'disable', \
     '', ' CONFIG_DEBUG=y CONFIG_EARLY_PRINTK=${XEN_CONFIG_EARLY_PRINTK}',d)}"
+
+# Make Xen machine specific
+# This ensures that sstate is properly handled and that each machine can have
+# its own configuration
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
-- 
2.17.1

