Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web09.67.1614710094838708341
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Mar 2021 10:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4CHTFHAR;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: richard.neill@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vrJlI5ObSiPyPQCRoVzOAqaciEJG+i0ppolPiXCd2M=;
 b=4CHTFHAR4rK5n9r6yr3+XOEg6xuaKnag6sblxxup8wPtsqcPvQ1xA38tWMDmIqoK/4Ei/tGLERoEvVwki1blGehfuHcjK4S/jBaGo0oJ+W5V1WdBgje2twPx/77T8YgaRbhlYD4ZugrUew62OKmS34Ob3ksB7iCkNAYxUtkQv30=
Received: from AM5PR0601CA0054.eurprd06.prod.outlook.com (2603:10a6:206::19)
 by AS8PR08MB6696.eurprd08.prod.outlook.com (2603:10a6:20b:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 2 Mar
 2021 18:34:47 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::3a) by AM5PR0601CA0054.outlook.office365.com
 (2603:10a6:206::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 2 Mar 2021 18:34:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Tue, 2 Mar 2021 18:34:46 +0000
Received: ("Tessian outbound f266f7758cfb:v71"); Tue, 02 Mar 2021 18:34:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e608f0964986a6c7
X-CR-MTA-TID: 64aa7808
Received: from 22ddaa8afc5e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 25A71BD3-84EE-4666-B667-B2FA28362255.1;
	Tue, 02 Mar 2021 18:34:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22ddaa8afc5e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 02 Mar 2021 18:34:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kw8awHdXiXpvzg/rZ+s5ipuwomUODH7eTX/2S//vEp1KFeNSgo6BojAsyfVUOBVEWikaNgDtH4j4tBLdnHCAVM66oHEG0kQRc5Es8k/ICAUloKCFY95yZ3O3ISSE5TxvKBcvH/vFxK6oD+Q5QX29EKkc39HIDZ9cuFbvfj8IeJKoK1NBRxSnS1U5u1oY5YYCt2kETMi3hXpF1LkOqpIk1cinEsZ4t2Ik0jKGCSIkzBGQRJEFW9Foc5aiK5rbpbyncj09C1HXJqE9ioZgOQN4JuV0mnqIPLSA8i6QJz96R6DLXmgzrRdu3fqypVSLfhRy6wntJxvIxTNclRuHxHRZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vrJlI5ObSiPyPQCRoVzOAqaciEJG+i0ppolPiXCd2M=;
 b=ks5MD40wh9Wi5AfnbU2HO4btj0/25MnuzeCL+xgCyx9l19Zm2ck5IREtsdHWLjfvrJlpEdLGggII0plzh3iAByaIvf1UJPr40FjxuwbbdL5kJske37h+ZjZoOBQpbadJsJ2/+nxpL7GwQTOw58qHizAOTJl95lLgfcA8VdM8H0S448pEhfOHWahpszyJIqSuGkYFsrnYfW3/bDTJZQyWzbObz8ilyCFl5ZnU3cFJV3AtkiteyLCbKGhHQeKjVpNvBr76CLgYA2NdZtheYZqfMOc2sZkafGiUlV9FeAAR5eKYgTDMF+sqrjPNxJwfEZGzxm4UXLUxiGE9QBIeMqaM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vrJlI5ObSiPyPQCRoVzOAqaciEJG+i0ppolPiXCd2M=;
 b=4CHTFHAR4rK5n9r6yr3+XOEg6xuaKnag6sblxxup8wPtsqcPvQ1xA38tWMDmIqoK/4Ei/tGLERoEvVwki1blGehfuHcjK4S/jBaGo0oJ+W5V1WdBgje2twPx/77T8YgaRbhlYD4ZugrUew62OKmS34Ob3ksB7iCkNAYxUtkQv30=
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 2 Mar
 2021 18:34:39 +0000
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::f90d:9550:7b5d:789d]) by AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::f90d:9550:7b5d:789d%6]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 18:34:39 +0000
From: "Richard Neill" <richard.neill@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Add Xen per-cpu address translation patch
Thread-Topic: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Add Xen
 per-cpu address translation patch
Thread-Index: AQHXD4mRc8pIReVg3kSVVQq2cNJdk6pxBJLU
Date: Tue, 2 Mar 2021 18:34:39 +0000
Message-ID: 
 <AM6PR08MB3893AF421D9A4315CC3DAF94E0999@AM6PR08MB3893.eurprd08.prod.outlook.com>
References: <166896A643C88CB7.1946@lists.yoctoproject.org>
In-Reply-To: <166896A643C88CB7.1946@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c289fdbb-ae62-45b2-cf5c-08d8dda9db0e
x-ms-traffictypediagnostic: AM6PR08MB4915:|AS8PR08MB6696:
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB669602720A97B2C3C8B599DBE0999@AS8PR08MB6696.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 N6P9LOoq54CEO8/0Cg6SMfe7uzU+7yKT9g+jVL+tf2eYfMk0Kt6+E9XYdBb6N5Cd3tgD/IQyV3adcVBgvOnZJlwtq8O4P9XybD8n5WMtWDpARkhO/v4fMcZk2cB7WBwJ1xqforlNKNp0CE/N7BVKlihcXzdbCvXwy3RfMF2fM+++OXZ3ir6IpbNTiTKaBHa3CpIqX0WHbsgJQvEwOszxuq/DbGVDU3VRxj/6j5jmBDDOqEBCDCSCYoxLzEmdSAouOgE8HpUKmwpEM07LguVQR+CNOWIpl5TbZTovOS7jdnhMUccRK5BzU+JFb8reirwDu8bS3ZOjsJnCQgCCM5arpBdIr8t+RjnbJcbYigO6YAZeYrGpROLxukzQzNAo3RzG1g8mzg8gx2iS0VRZBkV109R6NWfMlHGg+0wKRLpy7Y5LuJan5clfmKDyQ2y6NBJGBX+6ruq072jl9Rd++Nerr77To/AKmqH9e3ERLLwBrMG/PY6jef/6LdiHIUzAe6ORSKTr1uJK++BN5lBWKk/4ChVDjmrOVZ606REWIAR9fteT2sFuX3JmDaWMbug70BbfYaNapRwznfZoHYwPF+ENU6rEI4AYkUcXLp2IkicnQEI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3893.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(5660300002)(66476007)(64756008)(66946007)(66556008)(66446008)(83380400001)(966005)(478600001)(33656002)(2906002)(186003)(316002)(71200400001)(8936002)(6506007)(26005)(7696005)(8676002)(86362001)(6916009)(9686003)(76116006)(52536014)(166002)(19627405001)(55016002)(45080400002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?jvEpdYRHosqfad72DI2soK7g71c1r0DY28m4Ji2MvauoSxCUV4z4HQXnhTKZ?=
 =?us-ascii?Q?/lQghx/K+jPPaYR/h+cEnLGqUyLWd80FW7+qkZWqxVCNBJVPCYyVUFRgXCa5?=
 =?us-ascii?Q?vcvZZCo/COM/RbV3A5gn58RUa8qjs6PTmAbrzCXFlQLzz1s7EARyqgKrEssO?=
 =?us-ascii?Q?d3pjlbeuW3FhObaJ8zgQnOGqapcxFDIjgwzbzm+UobCB/utgJg5KagIiU0Yp?=
 =?us-ascii?Q?Upvqzo/YxGLhtYIJDtWQk0HP8SJcm86hh7M+NXC+uP5MhE6m3i8K4/pw0U9b?=
 =?us-ascii?Q?FztXA5uNOdDOv59sgATdmlp6U5brhDf2lTCSRGL4LiYoakT/er/uMRWeWFRY?=
 =?us-ascii?Q?AwNnlL9KhfTpKgVkroQNZsvCNGvDpRyiSEZfmYMLOaBWcHNj68UDbK8znAfL?=
 =?us-ascii?Q?8YJRWTlN9Zw50PUTkhQ8GOrxo0XPsM1q90kepTgFZfptdFwdbdn2VxG+b4/R?=
 =?us-ascii?Q?zKw4612y/HplfKdLkR3+x+wNfGPXZMwvlYS6w9TEWmwuRsQJFkVXALw+q53i?=
 =?us-ascii?Q?v3N0mkCVjiX9/i71K7k1UyRs9PZF3mSmqdkdeuCZAmpI1D7SNPXv6HSfV4NO?=
 =?us-ascii?Q?HIVHoGQDPBNxQGA0UKKWG+0dYmS/1eJug6ektNp6arr3QB8tX2O6n4iKEXg0?=
 =?us-ascii?Q?MYL0LHmLLB08DursQ72Y3x7BheK7A2afP+qQZUJLJyWeARqXtZtN17o6DOz4?=
 =?us-ascii?Q?Lmr58pFQ2Br0mkfGl9C4qcxgqjyOud4ZPh3H1wr0hwPZXZ6S18sKchg6b6MW?=
 =?us-ascii?Q?zJZ4amSdB/VgvlCuoxA6pT+cnY9zp2BZe+kCgnAG9L2+tubXrUP/JeKUwQ9L?=
 =?us-ascii?Q?kTYf13uBp7EGanp6lbEyMLBOGuSBa/RRkLi4ey5OmJCiHUkhu0gIY5E+QzWw?=
 =?us-ascii?Q?v6v+R4b6IXfkWuOX7D7oj2kluXZpOxuOup+W+RvxGUC2lTQNzZBsJyyL2z/z?=
 =?us-ascii?Q?DhZvTPQGEcdL7TnU6PVjv5fZYPzZ25GAmfGOezOlPXE912DCy93rowUtolzg?=
 =?us-ascii?Q?1OR59BGw9KDhkZOi12Jy9V7CNZ28L3sLaxAjZ5dxTFPuxHJGzZPfKiyRyvJP?=
 =?us-ascii?Q?cYNfGyeIg2p0/j+xUZ4yqLNJzait0WGEXfynGu/Reswb1GvnbV2ml0+mrKgd?=
 =?us-ascii?Q?47DfJrO/mJOozRaNz25jBweMLpe/+cxis5tsUGtg3WanZRH3OQrgc7bCwVzG?=
 =?us-ascii?Q?TeLX3pTAVjJPyM8L3cKrPmpsEZTgVlVQyHY1nwfgdCzWrxz8vO5OgLf5jjsW?=
 =?us-ascii?Q?dVk9j/3NJR9jhxrCHJq8xFQpGpsNxd55X08vNoAiPAh3floaIw5GkqXb+sKS?=
 =?us-ascii?Q?XvhvAFw4pnJpfqMLB0BAsxdS?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Richard.Neill@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8ccb3369-74c3-4f7d-7dec-08d8dda9d689
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BeU5nrbtKCi80nS59p79ZuyUe7jZ+OpVpbP3eeblnRylp20zXLSOp/kM8bSVubOrxczQvsPYP4eaqDUtQDEiPkyzpSTUWg9BUo0V94WmJm9sIkEoAW8l0BaZF4h0sG+NGGKFa2xsJiJ2XhiMrdtqG1ns9UZKQceOQb7r1SAWCQTn/AC4+F7VxYStJerkjCyAyAScEspxOjSHYmw0bKCyygODUaYxSXnnMvrwb3SzycE2auWe11ms169AElsDSqjTuY6plYbyB2yzTDSN1sljWKBjOTh1hypn21yTKiFoUnr2Ljc1mW7jQpaTjyeVGEsyJDwdWNCKpmEkh3ZzK7co6pdcf6KPUyGK98Fnjwu8lKFbfQne8+FHKrMwjVjhy6ufrQXWf/mQBrW1932UbhRixLHpHxLOFKFXLatgEsFby5g2+s5IdDPBQo76xnwAqX/XBSw0IEWX5+AzatzrUEpITBxN+T+XY7dKV/YirOh9niiuWbOAvBrjkSy7SQRh5P4hyPaJ2rC0y7ilz5ruYa6LMXqknaQ3bEjvgNL1ndiaVZCob+JV27EcbR1Wk+XTc6EjXxubyRBHVPUiSeQJ8xRqgpxiMfsM131XrAUOxN7VMKuPoiQls0Kds/ZJA6kTc+0DroeX4DrgeW7OPqJBtJw8Nd8Fv+GX2uKwyLqFmop7Q8tjkFEIWE/QJdQK+p0yVGr5FMOC0XB6CZg0sLqbON1dfFT/zpZ05+D0hcl+/r2urJw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(46966006)(2906002)(52536014)(5660300002)(82310400003)(82740400003)(83380400001)(19627405001)(6916009)(55016002)(81166007)(356005)(86362001)(9686003)(26005)(316002)(47076005)(30864003)(186003)(8936002)(7696005)(6506007)(45080400002)(36860700001)(966005)(70206006)(70586007)(166002)(33656002)(478600001)(8676002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 18:34:46.6587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c289fdbb-ae62-45b2-cf5c-08d8dda9db0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6696
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3893AF421D9A4315CC3DAF94E0999AM6PR08MB3893eurp_"

--_000_AM6PR08MB3893AF421D9A4315CC3DAF94E0999AM6PR08MB3893eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I should have prefixed this with [PATCH gatesgarth]. Please note that this =
patch is intended for merge with the gatesgarth branch.

Thanks,
Richard
________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Richard Neill via lists.yoctoproject.org <richard.neill=3Darm.com=
@lists.yoctoproject.org>
Sent: Tuesday, March 2, 2021 5:29 PM
To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Subject: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Add Xen per-cp=
u address translation patch

Adds a kernel patch to avoid Xen guest initialisation failure when converti=
ng a
virtual address to a frame number when the initial address space has a
non-contiguous physical layout.

The patch is mainlined for kernel versions >=3D 5.9, so we only apply it fo=
r
earlier versions.

Issue-Id: SCM-1910
Change-Id: Icf84535718779f91eb668d178a118c96e05f54de
Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 ...x-to-convert-percpu-address-to-gfn-c.patch | 147 ++++++++++++++++++
 .../linux/linux-arm-autonomy.inc              |  13 +-
 2 files changed, 156 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-a=
rm64-xen-Fix-to-convert-percpu-address-to-gfn-c.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xe=
n-Fix-to-convert-percpu-address-to-gfn-c.patch b/meta-arm-autonomy/recipes-=
kernel/linux/files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-=
c.patch
new file mode 100644
index 00000000..79e88d74
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xen-Fix-t=
o-convert-percpu-address-to-gfn-c.patch
@@ -0,0 +1,147 @@
+From 5a0677110b73dd3e1766f89159701bfe8ac06808 Mon Sep 17 00:00:00 2001
+From: Masami Hiramatsu <mhiramat@kernel.org>
+Date: Tue, 6 Oct 2020 15:49:31 +0900
+Subject: [PATCH] arm/arm64: xen: Fix to convert percpu address to gfn
+ correctly
+
+Use per_cpu_ptr_to_phys() instead of virt_to_phys() for per-cpu
+address conversion.
+
+In xen_starting_cpu(), per-cpu xen_vcpu_info address is converted
+to gfn by virt_to_gfn() macro. However, since the virt_to_gfn(v)
+assumes the given virtual address is in linear mapped kernel memory
+area, it can not convert the per-cpu memory if it is allocated on
+vmalloc area.
+
+This depends on CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK.
+If it is enabled, the first chunk of percpu memory is linear mapped.
+In the other case, that is allocated from vmalloc area. Moreover,
+if the first chunk of percpu has run out until allocating
+xen_vcpu_info, it will be allocated on the 2nd chunk, which is
+based on kernel memory or vmalloc memory (depends on
+CONFIG_NEED_PER_CPU_KM).
+
+Without this fix and kernel configured to use vmalloc area for
+the percpu memory, the Dom0 kernel will fail to boot with following
+errors.
+
+[    0.466172] Xen: initializing cpu0
+[    0.469601] ------------[ cut here ]------------
+[    0.474295] WARNING: CPU: 0 PID: 1 at arch/arm64/xen/../../arm/xen/enli=
ghten.c:153 xen_starting_cpu+0x160/0x180
+[    0.484435] Modules linked in:
+[    0.487565] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc4+ #4
+[    0.493895] Hardware name: Socionext Developer Box (DT)
+[    0.499194] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=3D--)
+[    0.504836] pc : xen_starting_cpu+0x160/0x180
+[    0.509263] lr : xen_starting_cpu+0xb0/0x180
+[    0.513599] sp : ffff8000116cbb60
+[    0.516984] x29: ffff8000116cbb60 x28: ffff80000abec000
+[    0.522366] x27: 0000000000000000 x26: 0000000000000000
+[    0.527754] x25: ffff80001156c000 x24: fffffdffbfcdb600
+[    0.533129] x23: 0000000000000000 x22: 0000000000000000
+[    0.538511] x21: ffff8000113a99c8 x20: ffff800010fe4f68
+[    0.543892] x19: ffff8000113a9988 x18: 0000000000000010
+[    0.549274] x17: 0000000094fe0f81 x16: 00000000deadbeef
+[    0.554655] x15: ffffffffffffffff x14: 0720072007200720
+[    0.560037] x13: 0720072007200720 x12: 0720072007200720
+[    0.565418] x11: 0720072007200720 x10: 0720072007200720
+[    0.570801] x9 : ffff8000100fbdc0 x8 : ffff800010715208
+[    0.576182] x7 : 0000000000000054 x6 : ffff00001b790f00
+[    0.581564] x5 : ffff800010bbf880 x4 : 0000000000000000
+[    0.586945] x3 : 0000000000000000 x2 : ffff80000abec000
+[    0.592327] x1 : 000000000000002f x0 : 0000800000000000
+[    0.597716] Call trace:
+[    0.600232]  xen_starting_cpu+0x160/0x180
+[    0.604309]  cpuhp_invoke_callback+0xac/0x640
+[    0.608736]  cpuhp_issue_call+0xf4/0x150
+[    0.612728]  __cpuhp_setup_state_cpuslocked+0x128/0x2c8
+[    0.618030]  __cpuhp_setup_state+0x84/0xf8
+[    0.622192]  xen_guest_init+0x324/0x364
+[    0.626097]  do_one_initcall+0x54/0x250
+[    0.630003]  kernel_init_freeable+0x12c/0x2c8
+[    0.634428]  kernel_init+0x1c/0x128
+[    0.637988]  ret_from_fork+0x10/0x18
+[    0.641635] ---[ end trace d95b5309a33f8b27 ]---
+[    0.646337] ------------[ cut here ]------------
+[    0.651005] kernel BUG at arch/arm64/xen/../../arm/xen/enlighten.c:158!
+[    0.657697] Internal error: Oops - BUG: 0 [#1] SMP
+[    0.662548] Modules linked in:
+[    0.665676] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5=
.9.0-rc4+ #4
+[    0.673398] Hardware name: Socionext Developer Box (DT)
+[    0.678695] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=3D--)
+[    0.684338] pc : xen_starting_cpu+0x178/0x180
+[    0.688765] lr : xen_starting_cpu+0x144/0x180
+[    0.693188] sp : ffff8000116cbb60
+[    0.696573] x29: ffff8000116cbb60 x28: ffff80000abec000
+[    0.701955] x27: 0000000000000000 x26: 0000000000000000
+[    0.707344] x25: ffff80001156c000 x24: fffffdffbfcdb600
+[    0.712718] x23: 0000000000000000 x22: 0000000000000000
+[    0.718107] x21: ffff8000113a99c8 x20: ffff800010fe4f68
+[    0.723481] x19: ffff8000113a9988 x18: 0000000000000010
+[    0.728863] x17: 0000000094fe0f81 x16: 00000000deadbeef
+[    0.734245] x15: ffffffffffffffff x14: 0720072007200720
+[    0.739626] x13: 0720072007200720 x12: 0720072007200720
+[    0.745008] x11: 0720072007200720 x10: 0720072007200720
+[    0.750390] x9 : ffff8000100fbdc0 x8 : ffff800010715208
+[    0.755771] x7 : 0000000000000054 x6 : ffff00001b790f00
+[    0.761153] x5 : ffff800010bbf880 x4 : 0000000000000000
+[    0.766534] x3 : 0000000000000000 x2 : 00000000deadbeef
+[    0.771916] x1 : 00000000deadbeef x0 : ffffffffffffffea
+[    0.777304] Call trace:
+[    0.779819]  xen_starting_cpu+0x178/0x180
+[    0.783898]  cpuhp_invoke_callback+0xac/0x640
+[    0.788325]  cpuhp_issue_call+0xf4/0x150
+[    0.792317]  __cpuhp_setup_state_cpuslocked+0x128/0x2c8
+[    0.797619]  __cpuhp_setup_state+0x84/0xf8
+[    0.801779]  xen_guest_init+0x324/0x364
+[    0.805683]  do_one_initcall+0x54/0x250
+[    0.809590]  kernel_init_freeable+0x12c/0x2c8
+[    0.814016]  kernel_init+0x1c/0x128
+[    0.817583]  ret_from_fork+0x10/0x18
+[    0.821226] Code: d0006980 f9427c00 cb000300 17ffffea (d4210000)
+[    0.827415] ---[ end trace d95b5309a33f8b28 ]---
+[    0.832076] Kernel panic - not syncing: Attempted to kill init! exitcod=
e=3D0x0000000b
+[    0.839815] ---[ end Kernel panic - not syncing: Attempted to kill init=
! exitcode=3D0x0000000b ]---
+
+Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
+Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
+Link: https://lore.kernel.org/r/160196697165.60224.17470743378683334995.st=
git@devnote2
+Signed-off-by: Juergen Gross <jgross@suse.com>
+
+Upstream-Status: Backport
+Signed-off-by: Richard Neill <richard.neill@arm.com>
+---
+ arch/arm/xen/enlighten.c | 2 +-
+ include/xen/arm/page.h   | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
+index e93145d72c26..a6ab3689b2f4 100644
+--- a/arch/arm/xen/enlighten.c
++++ b/arch/arm/xen/enlighten.c
+@@ -150,7 +150,7 @@ static int xen_starting_cpu(unsigned int cpu)
+        pr_info("Xen: initializing cpu%d\n", cpu);
+        vcpup =3D per_cpu_ptr(xen_vcpu_info, cpu);
+
+-      info.mfn =3D virt_to_gfn(vcpup);
++      info.mfn =3D percpu_to_gfn(vcpup);
+        info.offset =3D xen_offset_in_page(vcpup);
+
+        err =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(=
cpu),
+diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
+index 39df751d0dc4..ac1b65470563 100644
+--- a/include/xen/arm/page.h
++++ b/include/xen/arm/page.h
+@@ -83,6 +83,9 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn=
)
+        })
+ #define gfn_to_virt(m)                (__va(gfn_to_pfn(m) << XEN_PAGE_SHI=
FT))
+
++#define percpu_to_gfn(v)      \
++      (pfn_to_gfn(per_cpu_ptr_to_phys(v) >> XEN_PAGE_SHIFT))
++
+ /* Only used in PV code. But ARM guests are always HVM. */
+ static inline xmaddr_t arbitrary_virt_to_machine(void *vaddr)
+ {
+--
+2.25.1
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc =
b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 77cea965..f3653419 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -40,10 +40,6 @@ python() {
     kernelVersion =3D d.getVar('LINUX_VERSION')
     pn =3D d.getVar('PN')

-    if kernelVersion and LooseVersion(kernelVersion) < '5.10':
-        if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy=
-guest"):
-            d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setu=
p-the-runstate-info-page-if-kpti-.patch' )
-
     if kernelVersion and LooseVersion(kernelVersion) < '5.4.95' \
        and pn !=3D 'linux-libc-headers' \
        and not pn.startswith('linux-linaro-arm') \
@@ -54,4 +50,13 @@ python() {
        and pn !=3D 'linux-libc-headers' \
        and oe.utils.any_distro_features(d, "arm-autonomy-guest"):
         d.appendVar('SRC_URI', ' file://files/0001-arm-xen-Don-t-probe-xen=
bus-as-part-of-an-early-initc.patch' )
+
+    if kernelVersion and LooseVersion(kernelVersion) < '5.9' \
+       and pn !=3D 'linux-libc-headers' \
+       and oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy=
-guest"):
+        d.appendVar('SRC_URI', ' file://files/0001-arm-arm64-xen-Fix-to-co=
nvert-percpu-address-to-gfn-c.patch' )
+
+    if kernelVersion and LooseVersion(kernelVersion) < '5.10':
+        if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy=
-guest"):
+            d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setu=
p-the-runstate-info-page-if-kpti-.patch' )
 }
--
2.25.1


--_000_AM6PR08MB3893AF421D9A4315CC3DAF94E0999AM6PR08MB3893eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I should have prefixed this with [PATCH gatesgarth]. Please note that this =
patch is intended for merge with the gatesgarth branch.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Richard<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-arm@lists.yoctop=
roject.org &lt;meta-arm@lists.yoctoproject.org&gt; on behalf of Richard Nei=
ll via lists.yoctoproject.org &lt;richard.neill=3Darm.com@lists.yoctoprojec=
t.org&gt;<br>
<b>Sent:</b> Tuesday, March 2, 2021 5:29 PM<br>
<b>To:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Subject:</b> [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Add Xen=
 per-cpu address translation patch</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Adds a kernel patch to avoid Xen guest initialisat=
ion failure when converting a<br>
virtual address to a frame number when the initial address space has a<br>
non-contiguous physical layout.<br>
<br>
The patch is mainlined for kernel versions &gt;=3D 5.9, so we only apply it=
 for<br>
earlier versions.<br>
<br>
Issue-Id: SCM-1910<br>
Change-Id: Icf84535718779f91eb668d178a118c96e05f54de<br>
Signed-off-by: Richard Neill &lt;richard.neill@arm.com&gt;<br>
---<br>
&nbsp;...x-to-convert-percpu-address-to-gfn-c.patch | 147 +++++++++++++++++=
+<br>
&nbsp;.../linux/linux-arm-autonomy.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 13 +-<br>
&nbsp;2 files changed, 156 insertions(+), 4 deletions(-)<br>
&nbsp;create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-=
arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-c.patch<br>
<br>
diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xe=
n-Fix-to-convert-percpu-address-to-gfn-c.patch b/meta-arm-autonomy/recipes-=
kernel/linux/files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-=
c.patch<br>
new file mode 100644<br>
index 00000000..79e88d74<br>
--- /dev/null<br>
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-arm64-xen-Fix-t=
o-convert-percpu-address-to-gfn-c.patch<br>
@@ -0,0 +1,147 @@<br>
+From 5a0677110b73dd3e1766f89159701bfe8ac06808 Mon Sep 17 00:00:00 2001<br>
+From: Masami Hiramatsu &lt;mhiramat@kernel.org&gt;<br>
+Date: Tue, 6 Oct 2020 15:49:31 +0900<br>
+Subject: [PATCH] arm/arm64: xen: Fix to convert percpu address to gfn<br>
+ correctly<br>
+<br>
+Use per_cpu_ptr_to_phys() instead of virt_to_phys() for per-cpu<br>
+address conversion.<br>
+<br>
+In xen_starting_cpu(), per-cpu xen_vcpu_info address is converted<br>
+to gfn by virt_to_gfn() macro. However, since the virt_to_gfn(v)<br>
+assumes the given virtual address is in linear mapped kernel memory<br>
+area, it can not convert the per-cpu memory if it is allocated on<br>
+vmalloc area.<br>
+<br>
+This depends on CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK.<br>
+If it is enabled, the first chunk of percpu memory is linear mapped.<br>
+In the other case, that is allocated from vmalloc area. Moreover,<br>
+if the first chunk of percpu has run out until allocating<br>
+xen_vcpu_info, it will be allocated on the 2nd chunk, which is<br>
+based on kernel memory or vmalloc memory (depends on<br>
+CONFIG_NEED_PER_CPU_KM).<br>
+<br>
+Without this fix and kernel configured to use vmalloc area for<br>
+the percpu memory, the Dom0 kernel will fail to boot with following<br>
+errors.<br>
+<br>
+[&nbsp;&nbsp;&nbsp; 0.466172] Xen: initializing cpu0<br>
+[&nbsp;&nbsp;&nbsp; 0.469601] ------------[ cut here ]------------<br>
+[&nbsp;&nbsp;&nbsp; 0.474295] WARNING: CPU: 0 PID: 1 at arch/arm64/xen/../=
../arm/xen/enlighten.c:153 xen_starting_cpu+0x160/0x180<br>
+[&nbsp;&nbsp;&nbsp; 0.484435] Modules linked in:<br>
+[&nbsp;&nbsp;&nbsp; 0.487565] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.=
9.0-rc4+ #4<br>
+[&nbsp;&nbsp;&nbsp; 0.493895] Hardware name: Socionext Developer Box (DT)<=
br>
+[&nbsp;&nbsp;&nbsp; 0.499194] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=
=3D--)<br>
+[&nbsp;&nbsp;&nbsp; 0.504836] pc : xen_starting_cpu+0x160/0x180<br>
+[&nbsp;&nbsp;&nbsp; 0.509263] lr : xen_starting_cpu+0xb0/0x180<br>
+[&nbsp;&nbsp;&nbsp; 0.513599] sp : ffff8000116cbb60<br>
+[&nbsp;&nbsp;&nbsp; 0.516984] x29: ffff8000116cbb60 x28: ffff80000abec000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.522366] x27: 0000000000000000 x26: 0000000000000000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.527754] x25: ffff80001156c000 x24: fffffdffbfcdb600<=
br>
+[&nbsp;&nbsp;&nbsp; 0.533129] x23: 0000000000000000 x22: 0000000000000000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.538511] x21: ffff8000113a99c8 x20: ffff800010fe4f68<=
br>
+[&nbsp;&nbsp;&nbsp; 0.543892] x19: ffff8000113a9988 x18: 0000000000000010<=
br>
+[&nbsp;&nbsp;&nbsp; 0.549274] x17: 0000000094fe0f81 x16: 00000000deadbeef<=
br>
+[&nbsp;&nbsp;&nbsp; 0.554655] x15: ffffffffffffffff x14: 0720072007200720<=
br>
+[&nbsp;&nbsp;&nbsp; 0.560037] x13: 0720072007200720 x12: 0720072007200720<=
br>
+[&nbsp;&nbsp;&nbsp; 0.565418] x11: 0720072007200720 x10: 0720072007200720<=
br>
+[&nbsp;&nbsp;&nbsp; 0.570801] x9 : ffff8000100fbdc0 x8 : ffff800010715208<=
br>
+[&nbsp;&nbsp;&nbsp; 0.576182] x7 : 0000000000000054 x6 : ffff00001b790f00<=
br>
+[&nbsp;&nbsp;&nbsp; 0.581564] x5 : ffff800010bbf880 x4 : 0000000000000000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.586945] x3 : 0000000000000000 x2 : ffff80000abec000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.592327] x1 : 000000000000002f x0 : 0000800000000000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.597716] Call trace:<br>
+[&nbsp;&nbsp;&nbsp; 0.600232]&nbsp; xen_starting_cpu+0x160/0x180<br>
+[&nbsp;&nbsp;&nbsp; 0.604309]&nbsp; cpuhp_invoke_callback+0xac/0x640<br>
+[&nbsp;&nbsp;&nbsp; 0.608736]&nbsp; cpuhp_issue_call+0xf4/0x150<br>
+[&nbsp;&nbsp;&nbsp; 0.612728]&nbsp; __cpuhp_setup_state_cpuslocked+0x128/0=
x2c8<br>
+[&nbsp;&nbsp;&nbsp; 0.618030]&nbsp; __cpuhp_setup_state+0x84/0xf8<br>
+[&nbsp;&nbsp;&nbsp; 0.622192]&nbsp; xen_guest_init+0x324/0x364<br>
+[&nbsp;&nbsp;&nbsp; 0.626097]&nbsp; do_one_initcall+0x54/0x250<br>
+[&nbsp;&nbsp;&nbsp; 0.630003]&nbsp; kernel_init_freeable+0x12c/0x2c8<br>
+[&nbsp;&nbsp;&nbsp; 0.634428]&nbsp; kernel_init+0x1c/0x128<br>
+[&nbsp;&nbsp;&nbsp; 0.637988]&nbsp; ret_from_fork+0x10/0x18<br>
+[&nbsp;&nbsp;&nbsp; 0.641635] ---[ end trace d95b5309a33f8b27 ]---<br>
+[&nbsp;&nbsp;&nbsp; 0.646337] ------------[ cut here ]------------<br>
+[&nbsp;&nbsp;&nbsp; 0.651005] kernel BUG at arch/arm64/xen/../../arm/xen/e=
nlighten.c:158!<br>
+[&nbsp;&nbsp;&nbsp; 0.657697] Internal error: Oops - BUG: 0 [#1] SMP<br>
+[&nbsp;&nbsp;&nbsp; 0.662548] Modules linked in:<br>
+[&nbsp;&nbsp;&nbsp; 0.665676] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; W&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 5.9.0-rc4+ #4<br>
+[&nbsp;&nbsp;&nbsp; 0.673398] Hardware name: Socionext Developer Box (DT)<=
br>
+[&nbsp;&nbsp;&nbsp; 0.678695] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=
=3D--)<br>
+[&nbsp;&nbsp;&nbsp; 0.684338] pc : xen_starting_cpu+0x178/0x180<br>
+[&nbsp;&nbsp;&nbsp; 0.688765] lr : xen_starting_cpu+0x144/0x180<br>
+[&nbsp;&nbsp;&nbsp; 0.693188] sp : ffff8000116cbb60<br>
+[&nbsp;&nbsp;&nbsp; 0.696573] x29: ffff8000116cbb60 x28: ffff80000abec000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.701955] x27: 0000000000000000 x26: 0000000000000000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.707344] x25: ffff80001156c000 x24: fffffdffbfcdb600<=
br>
+[&nbsp;&nbsp;&nbsp; 0.712718] x23: 0000000000000000 x22: 0000000000000000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.718107] x21: ffff8000113a99c8 x20: ffff800010fe4f68<=
br>
+[&nbsp;&nbsp;&nbsp; 0.723481] x19: ffff8000113a9988 x18: 0000000000000010<=
br>
+[&nbsp;&nbsp;&nbsp; 0.728863] x17: 0000000094fe0f81 x16: 00000000deadbeef<=
br>
+[&nbsp;&nbsp;&nbsp; 0.734245] x15: ffffffffffffffff x14: 0720072007200720<=
br>
+[&nbsp;&nbsp;&nbsp; 0.739626] x13: 0720072007200720 x12: 0720072007200720<=
br>
+[&nbsp;&nbsp;&nbsp; 0.745008] x11: 0720072007200720 x10: 0720072007200720<=
br>
+[&nbsp;&nbsp;&nbsp; 0.750390] x9 : ffff8000100fbdc0 x8 : ffff800010715208<=
br>
+[&nbsp;&nbsp;&nbsp; 0.755771] x7 : 0000000000000054 x6 : ffff00001b790f00<=
br>
+[&nbsp;&nbsp;&nbsp; 0.761153] x5 : ffff800010bbf880 x4 : 0000000000000000<=
br>
+[&nbsp;&nbsp;&nbsp; 0.766534] x3 : 0000000000000000 x2 : 00000000deadbeef<=
br>
+[&nbsp;&nbsp;&nbsp; 0.771916] x1 : 00000000deadbeef x0 : ffffffffffffffea<=
br>
+[&nbsp;&nbsp;&nbsp; 0.777304] Call trace:<br>
+[&nbsp;&nbsp;&nbsp; 0.779819]&nbsp; xen_starting_cpu+0x178/0x180<br>
+[&nbsp;&nbsp;&nbsp; 0.783898]&nbsp; cpuhp_invoke_callback+0xac/0x640<br>
+[&nbsp;&nbsp;&nbsp; 0.788325]&nbsp; cpuhp_issue_call+0xf4/0x150<br>
+[&nbsp;&nbsp;&nbsp; 0.792317]&nbsp; __cpuhp_setup_state_cpuslocked+0x128/0=
x2c8<br>
+[&nbsp;&nbsp;&nbsp; 0.797619]&nbsp; __cpuhp_setup_state+0x84/0xf8<br>
+[&nbsp;&nbsp;&nbsp; 0.801779]&nbsp; xen_guest_init+0x324/0x364<br>
+[&nbsp;&nbsp;&nbsp; 0.805683]&nbsp; do_one_initcall+0x54/0x250<br>
+[&nbsp;&nbsp;&nbsp; 0.809590]&nbsp; kernel_init_freeable+0x12c/0x2c8<br>
+[&nbsp;&nbsp;&nbsp; 0.814016]&nbsp; kernel_init+0x1c/0x128<br>
+[&nbsp;&nbsp;&nbsp; 0.817583]&nbsp; ret_from_fork+0x10/0x18<br>
+[&nbsp;&nbsp;&nbsp; 0.821226] Code: d0006980 f9427c00 cb000300 17ffffea (d=
4210000)<br>
+[&nbsp;&nbsp;&nbsp; 0.827415] ---[ end trace d95b5309a33f8b28 ]---<br>
+[&nbsp;&nbsp;&nbsp; 0.832076] Kernel panic - not syncing: Attempted to kil=
l init! exitcode=3D0x0000000b<br>
+[&nbsp;&nbsp;&nbsp; 0.839815] ---[ end Kernel panic - not syncing: Attempt=
ed to kill init! exitcode=3D0x0000000b ]---<br>
+<br>
+Signed-off-by: Masami Hiramatsu &lt;mhiramat@kernel.org&gt;<br>
+Reviewed-by: Stefano Stabellini &lt;sstabellini@kernel.org&gt;<br>
+Link: <a href=3D"https://lore.kernel.org/r/160196697165.60224.174707433786=
83334995.stgit@devnote2">
https://lore.kernel.org/r/160196697165.60224.17470743378683334995.stgit@dev=
note2</a><br>
+Signed-off-by: Juergen Gross &lt;jgross@suse.com&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Richard Neill &lt;richard.neill@arm.com&gt;<br>
+---<br>
+ arch/arm/xen/enlighten.c | 2 +-<br>
+ include/xen/arm/page.h&nbsp;&nbsp; | 3 +++<br>
+ 2 files changed, 4 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c<br>
+index e93145d72c26..a6ab3689b2f4 100644<br>
+--- a/arch/arm/xen/enlighten.c<br>
++++ b/arch/arm/xen/enlighten.c<br>
+@@ -150,7 +150,7 @@ static int xen_starting_cpu(unsigned int cpu)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_info(&quot;Xen: initializing=
 cpu%d\n&quot;, cpu);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vcpup =3D per_cpu_ptr(xen_vcpu_=
info, cpu);<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.mfn =3D virt_to_gfn(vcpup);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.mfn =3D percpu_to_gfn(vcpup);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.offset =3D xen_offset_in_p=
age(vcpup);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D HYPERVISOR_vcpu_op(VCPU=
OP_register_vcpu_info, xen_vcpu_nr(cpu),<br>
+diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h<br>
+index 39df751d0dc4..ac1b65470563 100644<br>
+--- a/include/xen/arm/page.h<br>
++++ b/include/xen/arm/page.h<br>
+@@ -83,6 +83,9 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn=
)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })<br>
+ #define gfn_to_virt(m)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (__va(gfn_to_pfn(m) &lt;&lt; XEN_PA=
GE_SHIFT))<br>
+ <br>
++#define percpu_to_gfn(v)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (pfn_to_gfn(per_cpu_ptr_to_phys(v) &gt;&gt=
; XEN_PAGE_SHIFT))<br>
++<br>
+ /* Only used in PV code. But ARM guests are always HVM. */<br>
+ static inline xmaddr_t arbitrary_virt_to_machine(void *vaddr)<br>
+ {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc =
b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc<br>
index 77cea965..f3653419 100644<br>
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc<br>
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc<br>
@@ -40,10 +40,6 @@ python() {<br>
&nbsp;&nbsp;&nbsp;&nbsp; kernelVersion =3D d.getVar('LINUX_VERSION')<br>
&nbsp;&nbsp;&nbsp;&nbsp; pn =3D d.getVar('PN')<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; if kernelVersion and LooseVersion(kernelVersion) &lt; '=
5.10':<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if oe.utils.any_distro_features=
(d, &quot;arm-autonomy-host arm-autonomy-guest&quot;):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appen=
dVar('SRC_URI', ' <a href=3D"file://files/0001-xen-arm-do-not-setup-the-run=
state-info-page-if-kpti-.patch">
file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patc=
h</a>' )<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp; if kernelVersion and LooseVersion(kernelVersion) &=
lt; '5.4.95' \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and pn !=3D 'linux-libc-headers'=
 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and not pn.startswith('linux-lin=
aro-arm') \<br>
@@ -54,4 +50,13 @@ python() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and pn !=3D 'linux-libc-headers'=
 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and oe.utils.any_distro_features=
(d, &quot;arm-autonomy-guest&quot;):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appendVar('SRC_URI', ' <=
a href=3D"file://files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-=
initc.patch">
file://files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patc=
h</a>' )<br>
+<br>
+&nbsp;&nbsp;&nbsp; if kernelVersion and LooseVersion(kernelVersion) &lt; '=
5.9' \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and pn !=3D 'linux-libc-headers' \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and oe.utils.any_distro_features(d, &=
quot;arm-autonomy-host arm-autonomy-guest&quot;):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appendVar('SRC_URI', ' <a hre=
f=3D"file://files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-c=
.patch">
file://files/0001-arm-arm64-xen-Fix-to-convert-percpu-address-to-gfn-c.patc=
h</a>' )<br>
+<br>
+&nbsp;&nbsp;&nbsp; if kernelVersion and LooseVersion(kernelVersion) &lt; '=
5.10':<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if oe.utils.any_distro_features=
(d, &quot;arm-autonomy-host arm-autonomy-guest&quot;):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appen=
dVar('SRC_URI', ' <a href=3D"file://files/0001-xen-arm-do-not-setup-the-run=
state-info-page-if-kpti-.patch">
file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patc=
h</a>' )<br>
&nbsp;}<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB3893AF421D9A4315CC3DAF94E0999AM6PR08MB3893eurp_--
