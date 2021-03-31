Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.88])
 by mx.groups.io with SMTP id smtpd.web12.5550.1617191649933541369
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 04:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JzmoRTzX;
 spf=pass (domain: arm.com, ip: 40.107.6.88, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVHYvlSNqG6xsJkTfJUsnUDsKtGnWsITyVGOA0wO7B0=;
 b=JzmoRTzXqEdoC79nqlq9PalU9z2QbTZ9DKYci9Jgprau2FTJF4BEcjKWJGnALfKelVb4kZTVn8QiN+PPxP37FzgxmeRqRN07auwCHOd7qJHRu8w0OAWs3aLAdtvUMwCcK3eOhDoS0z9T+yBrMir9QQ9J7fx2uRP4e/Y+0Erp1mM=
Received: from AM6P191CA0081.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::22)
 by VE1PR08MB5567.eurprd08.prod.outlook.com (2603:10a6:800:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 11:54:07 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::d6) by AM6P191CA0081.outlook.office365.com
 (2603:10a6:209:8a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Wed, 31 Mar 2021 11:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 31 Mar 2021 11:54:06 +0000
Received: ("Tessian outbound dd6be0a1b101:v89"); Wed, 31 Mar 2021 11:54:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e15d66d36833b55a
X-CR-MTA-TID: 64aa7808
Received: from 1976758c219a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AC87A357-3A1D-4E86-AB5B-C23AFD508412.1;
	Wed, 31 Mar 2021 11:53:59 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1976758c219a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 31 Mar 2021 11:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLE6GMh2LSfqBYLSigJPmlKdnAz1fUnHzui+AJsQXuPHjP5ILbpX4Xiv+Ba3gFCe3S3YjxmxzVp+FjJcNirT6jpBMC/MUvoxVNaeCQD8P6NBCsrqroyMWZtDeK0V/Cnv3mzAfR7E+VqgRhBdxGwiaBMtwnGJjsQqfQc11j5Q+jxJvS1PKZPLkPZ5ndqf8cEPgH9FPub0ecUckU4f+3vH1eIlk78sXqEu/HssHkEKnf4LvQ+stA3TdkWIgmFcVjk8rTlcRr7waykzTbXR0sRJsE06r+b19LeDY+/OZzJCpKOAND7MKBu6/nolODNUM4FyhNw+HoUO5nIL54SbGOSyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVHYvlSNqG6xsJkTfJUsnUDsKtGnWsITyVGOA0wO7B0=;
 b=D1j8ubZyu6UVXdQikG03T0Ic+MBXLyy3DUZXsvjMmy+yJMT0Vj/dFIFVvI9HUUyxUbCHaPdVdfG7DM27YoX3DZ5oRBGLxQ8YrgDkvbYIcVJmko1OR0++9vQu++I+W2DZv6YyP0Crta+AFQ3mHiLEmzzpq7xBC6KaxnCNqwcYVKrU7UKvpY8Yz3JLVzdYBlSoSdxgpGkpMfoQWbKshLSL5pbd2LlNniCFkZrjx/ZwtDJqjTzm5AIYNr470sNeeSpNUsE7MmHNrmW1gacKU1wYI4MMajEtev+Me/Gh+29vzIFSNYo//eCy20jfdRsxkYIWkducnoZrKu7X46yGKo2y3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVHYvlSNqG6xsJkTfJUsnUDsKtGnWsITyVGOA0wO7B0=;
 b=JzmoRTzXqEdoC79nqlq9PalU9z2QbTZ9DKYci9Jgprau2FTJF4BEcjKWJGnALfKelVb4kZTVn8QiN+PPxP37FzgxmeRqRN07auwCHOd7qJHRu8w0OAWs3aLAdtvUMwCcK3eOhDoS0z9T+yBrMir9QQ9J7fx2uRP4e/Y+0Erp1mM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4802.eurprd08.prod.outlook.com (2603:10a6:20b:cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 31 Mar
 2021 11:53:58 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 11:53:58 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 6/6] kas: Add fvp-baser-aemv8r64 build
Date: Wed, 31 Mar 2021 12:53:47 +0100
Message-Id: <b543c41a4a79e9af167307412fc478eab13eff97.1617191477.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
References: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend Transport; Wed, 31 Mar 2021 11:53:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9622c76b-857b-41a9-41b6-08d8f43bb004
X-MS-TrafficTypeDiagnostic: AM6PR08MB4802:|VE1PR08MB5567:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5567C53D7DA7C546209BDBBD927C9@VE1PR08MB5567.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /DTBVGJ8uv/bHbYLX46bBa1vya6Divog9PgUriqXhOpXn7W1bAJBTMq/U4azfwYO5HCxZCEznvPMqGvXgVt7V+Nf+pmvmjdkslUbKVm539PALQnOsuC661MamzjteYPd2sD9rDxOx+BwpwQMwAbbVCU329jDiGC3E2oetrBCiJ57wHBFf+4yGG+HFtFYo66h8F115RAMndVph4r5QNmlIY9EViy6dXwbvh+co4/B8mB4OVgx2Jj5oqhOvP2QiOh0gXoqtCboGshngepV57gJ8lz7ZdR8TE8r+iMseCUzcQDtC4tdde2kQo/KKLO2c3DhAtLntRZmpuMEt8u332Ezn1UmiVNOvCQeaaR2Lbg9rMUIe/uk44/bstYpESsS4OzuYlVf/RVKL0DIbG6Rco266sbYmEISPI8at53iH/2AKhA3qrU48lHUfN2sJeMvK1/3UT3PRul4tJPpkdOD3Jkm1KuW5ENsCrt1iHQX1PHbBOx9JFdUBldWYAk+KUd3bDQL0ZoWtt4LmWeJw2u7qnTuU9WIcKkmbjcaWa5J+HS2EWDuD1Trgos7QjumBfrKgLRSTf1OIXAba/EFUKKbeU4bu9GscZz0Es7VuyPhJCMobsnWPQdirDd90HHPjGVHD/Em4jyBiL2u+aVVnWmQJ3aVD/vmveUZO1neePKGN78Low8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(44832011)(16526019)(8676002)(66946007)(2616005)(2906002)(5660300002)(956004)(316002)(478600001)(6666004)(66476007)(66556008)(8936002)(36756003)(4326008)(7696005)(86362001)(52116002)(4744005)(6486002)(186003)(26005)(6916009)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?ytK5rmzPJMEHlruUxBHQWWJvjGV2xHjZXCjvR5d5FE/OYTtk2xe33oA46HzR?=
 =?us-ascii?Q?lg3+czZ46WhJ4hfukCZ+G4+FAnXyn6lcHlpRwTAwODtrsVdMUapJx5iB7wzN?=
 =?us-ascii?Q?ZIpYp2JkJcUl2rV4/4oEEeYpCztv2qECO0a4nPvdM2xHQa+dwIZ98X1VOUOf?=
 =?us-ascii?Q?G1gN1CedG9pMOeShIaJoXTRY1NEJKlypwTmfxM6MEU/tGA72bLm5DYOn6wNW?=
 =?us-ascii?Q?68zJimb1MJCAIWqROKZ+WO74dVLDdqPebxoPrr6+J1y3VF3SNAdBtzEctyhn?=
 =?us-ascii?Q?eLm3SsIZcF1VCL69uMrQ+cM5yBcYpoVVtoHZEje0YONUD8nkojz5lGGcHOeD?=
 =?us-ascii?Q?UTOxbkY69DUCEm8VJiljZb3888AHCF93h1NnoEX6wHcWH26lqaxinE+YzBQP?=
 =?us-ascii?Q?nLd5MQm+z5WyqSHvk9+9SIR4pCdXcfEhrHWtIFKFuOsKjHm9j/6vTG6epout?=
 =?us-ascii?Q?B7uIR84dAYbfgcTZAxdS9R+1qmzG84eOAG5R8S1ZblsH2NB1cJEHewFps1V4?=
 =?us-ascii?Q?PCdMX2u5fJMXAX7gQZhnbTO+b9gV/IJHxrlX6E7EyGFaZPCwf4uDHTlK2dLO?=
 =?us-ascii?Q?7wSn9lNcsrPyAgz6CskFvzNOyUwjHzAhY2OkqlYmEGBy2xFzXHnEDgMh/EUO?=
 =?us-ascii?Q?rnPhjZYRKLCROupLU3K4PEis6f1PueNh09+lq6mL8DVhRhRegoXXHh2AjMGi?=
 =?us-ascii?Q?OdFgkv3I6D9n2l7svD19Ft+wX8jTH+pUArV//M+qY2zCw5XCvlrowLJ+ytQ3?=
 =?us-ascii?Q?auucRYq4mzhS89+bNvMQbG8EV/hqt9lDVmfqnCTM1t5VRD0T2uT1A3fzl02A?=
 =?us-ascii?Q?zil/Pu5z2IO+1AOAyT86hrkvG8wttxzHW67kkest7gXzqbhFyB8I6PMU3uPj?=
 =?us-ascii?Q?KG+utMTU/yE01yn6aKDLj6zENbpnxMuIjdQU04SltEC1IxvqTwu4xbTa9Llt?=
 =?us-ascii?Q?9J/YLvAHK9ciniEVcYrkjEiLMVyBQdmyjcOENfpZLcQe+zab5j0xepxlA5cK?=
 =?us-ascii?Q?pfy03xporPS+Ff3W52L+onS4UjWaRUhakl1lOqfrLPSLeT2htdWtO8GJ7gGu?=
 =?us-ascii?Q?hh9llSOMtNV/jjIQrU7BkbAPesR0NlnB6lryjcoy8geoZqK5CJSPZlWh8PbP?=
 =?us-ascii?Q?6Aw48gEJrf5QMrW8Slxi1qgfiodEWCg2x++APCNv/HW0E7lDDq39lnlEF+Xq?=
 =?us-ascii?Q?8R2GWk7tmjs7c6dy9FMgZr4r5KoFo0ds7SLJQUOA8AnEj4jRULTf5wOYNnTl?=
 =?us-ascii?Q?hfNiDtAVBTQ78xCsKf/hYRP4GYsvhLC+bO2AqKed58/cRHWAXrwB4aA1mTty?=
 =?us-ascii?Q?O78lYxz05Jf/47V921yni9MB?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4802
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9b8609bc-3e91-4f23-30cc-08d8f43bab44
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aPk7ivnRd4kWxm1BRdTMGDRr/wUPas9ePzqne9lfEtDT3cY++L6D+lZzmXq4gnFszz+iHn0zMMIBgtPXe/s2bg+eTjuyEDVvwFo53hsX1FNOZWOZNvNs37cLneXNlsIrwEoZnR+xpImK0lss716SveH7Qh2ximga0Le51KqkIj+hBfo3Iw/fpxoVWOclkKbRBUZhQp4a5dLdE9ToEBm9dZfGVWkoxd1lCKgk5MuTP4RbW3Pja6/Mi5/e/vQLufT0jRZgQT1xNVS9LCA0h1QKNG5VoCsE0luOwtIdewE7P5/HxxBX96iuZzJidsvk+lze7BGERqsAvIIGLVKOYi91yWs1qT1Ciii8d/pVCYMZv2xgm9S2C9/yb+DHhLm9lXDhjsJ2SfYefPlJ7VaPH+9yfb0DMPDCI+Fh+2VzAMCG9O52BON8IPugPi+8KO2Dr17EPSZ529swi/P6n77WZeRLrloGb464j4bmWZ4EQ9lt/LhpmaZm+Bz8+UC7/589S21PReegyp8upJK0Q04YyOMAE83KC24eSiE4OKCzMSvGK1bVMCvUjcAkPk8oNlDapegUDKGvT+5tZIKHnxGhm5E7AIW1mO+5i2aqXs4WpWJGl35K9c3iUfk/FM+chbDZESdPE76UQe0eNs6sS12hGiZAB2XaMiHl12rkG/2brQtTA8I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39830400003)(136003)(46966006)(36840700001)(956004)(36756003)(2616005)(81166007)(6916009)(2906002)(16526019)(6486002)(186003)(26005)(5660300002)(478600001)(82310400003)(356005)(6666004)(44832011)(4744005)(336012)(86362001)(7696005)(8676002)(316002)(4326008)(70206006)(8936002)(47076005)(70586007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 11:54:06.5552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9622c76b-857b-41a9-41b6-08d8f43bb004
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5567
Content-Type: text/plain

Issue-Id: SCM-2121
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I983b0a433be9087663006cce366631815759febe
---
 .gitlab-ci.yml             | 3 +++
 kas/fvp-baser-aemv8r64.yml | 7 +++++++
 2 files changed, 10 insertions(+)
 create mode 100644 kas/fvp-baser-aemv8r64.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4e247de..00f6e6f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -70,6 +70,9 @@ fvp-base-arm32:
 fvp-base-arm32/external-gcc-arm32:
   extends: .build
 
+fvp-baser-aemv8r64:
+  extends: .build
+
 gem5-arm64:
   extends: .build
 
diff --git a/kas/fvp-baser-aemv8r64.yml b/kas/fvp-baser-aemv8r64.yml
new file mode 100644
index 0000000..9e3e2de
--- /dev/null
+++ b/kas/fvp-baser-aemv8r64.yml
@@ -0,0 +1,7 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: fvp-baser-aemv8r64
+
-- 
2.17.1

