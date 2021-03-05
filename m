Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web08.13286.1614957442618541386
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 07:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8HVxZFHs;
 spf=pass (domain: arm.com, ip: 40.107.8.81, mailfrom: richard.neill@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdjV8aWJ4X1GPvzkdQenAMU76KOvzpV56NmyKbsduHg=;
 b=8HVxZFHsKP0PNRL16ofalLnFgudnEiLyx+e4x6XCQhZJPSLp4igMAMXSUGxhv/8Us7YG7tz8ZFHTenqjJLlWQzXoTYqDi9wREkWX4VJsnij8fr4VVN49CFHO7n0p8pjT61+E3JSG7ACrikPzElLEvYGPF30ujUNiRWdAJoVLLNQ=
Received: from DB6PR07CA0184.eurprd07.prod.outlook.com (2603:10a6:6:42::14) by
 DB6PR0801MB2007.eurprd08.prod.outlook.com (2603:10a6:4:78::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.28; Fri, 5 Mar 2021 15:17:19 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::28) by DB6PR07CA0184.outlook.office365.com
 (2603:10a6:6:42::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.16 via Frontend
 Transport; Fri, 5 Mar 2021 15:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 15:17:19 +0000
Received: ("Tessian outbound dd71fb35fd76:v71"); Fri, 05 Mar 2021 15:17:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1650b9d8cc3e3a7f
X-CR-MTA-TID: 64aa7808
Received: from 7c2800a92161.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D2535658-0622-461C-ABED-771208200B01.1;
	Fri, 05 Mar 2021 15:17:13 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c2800a92161.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 05 Mar 2021 15:17:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpoxwLDlBHGNKoGLVawR75lR1A9W0SR4cVhVxfJdMdgCh0UJ0fCvvp5Y/HwYHS4rF+Y60kpuNGaDXoGR7wKqhbqUGkaPHjKySDfznLwSKWqAeyw8ND+XKehuf+NGtZoN/GkvP+P+k6XW0vkZ4fgUEn6BEowQyIbaQPJkiZbtmcQweeR7kllLnI5j86Ub7M5EmUJgym/UrejO6PdbBe6Sp0SEBqOW6goaTHfQjVQA4IbW2EnWFe2ab434e7RE3ug2POZDp2l+qXA7bor8eeOwSQChW1EakP/EyJX2W6fCNb/GszyiSBf2RRZMosrc1VRqI2mgVgkuUxOdSK05ikNwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdjV8aWJ4X1GPvzkdQenAMU76KOvzpV56NmyKbsduHg=;
 b=hwngIZ/8y+X5xDF/TO4eVJdHrj8vtwUbTU9Tx0dtMu5+AWjE0NEuxkcuwwGB+wOYSsKRNKv4vwz5K5UjY8ECpLYaJlKvLnrd2PHOyYT2wzbc9MdS4p14s3ATyn0gzZ1u1FQi2eqbu2sQmb5zTX5f/bZOBEBItMD2scQioOVstxS1malVrnV4+XTlRq6go08OOMzpocU4fqbgkyisXFajzGb4ONEkyM4kc4gHfOLg7ESv/+DUnzOs19VIqxbNZpS45H9O49za327dYidlRqxQCsrhNDVhPSqIB+qxEeJPS7ievG3PB2lqKAKkyk7SV43nNZMlnoa5CtBlIGce3+SOIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdjV8aWJ4X1GPvzkdQenAMU76KOvzpV56NmyKbsduHg=;
 b=8HVxZFHsKP0PNRL16ofalLnFgudnEiLyx+e4x6XCQhZJPSLp4igMAMXSUGxhv/8Us7YG7tz8ZFHTenqjJLlWQzXoTYqDi9wREkWX4VJsnij8fr4VVN49CFHO7n0p8pjT61+E3JSG7ACrikPzElLEvYGPF30ujUNiRWdAJoVLLNQ=
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 by AM6PR08MB4788.eurprd08.prod.outlook.com (2603:10a6:20b:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 15:17:10 +0000
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::f90d:9550:7b5d:789d]) by AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::f90d:9550:7b5d:789d%6]) with mapi id 15.20.3890.032; Fri, 5 Mar 2021
 15:17:09 +0000
From: "Richard Neill" <richard.neill@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xen: remove patches that have been mainlined in xen 4.14.1
Thread-Topic: [meta-arm] [PATCH] arm-autonomy/xen: remove patches that have
 been mainlined in xen 4.14.1
Thread-Index: AQHXEdJQgB/eEzE7CkyrHyyJ4sj6C6p1gQYk
Date: Fri, 5 Mar 2021 15:17:09 +0000
Message-ID: 
 <AM6PR08MB389327750222C43F43F92382E0969@AM6PR08MB3893.eurprd08.prod.outlook.com>
References: <16697B13F55429F4.22430@lists.yoctoproject.org>
In-Reply-To: <16697B13F55429F4.22430@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae57c071-a5ee-43e9-5c9f-08d8dfe9c4a3
x-ms-traffictypediagnostic: AM6PR08MB4788:|DB6PR0801MB2007:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB2007F2B4CB039A6381EFBA73E0969@DB6PR0801MB2007.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XIwHUk8tGj2yX71R3mAJE8YRSM+69t+V8DuKyWz2nvJ+ZN30cXeU3dOEwk5QQjKn2xoGHoDPXUMgpHEnPxLjXx+7++t3ulnRCa7Nh80Tyd/VB41hHtrjqZ7nsCbuIpl7/U1nmMxQV/bHV0ZN30drvkpwhfV7dk/foL04AsfStfmM9v83uS+kROVf8hRFb5PyX2p+VPpnfAMdFe4qefo69a/6v3juIN8nYKwz0evKAZpWAovjPkPvsRkFRZIot8RVqFQFtM8M20qzPHG4J9rfEb9DshHIgceGNfl5LMYu/xa8TBAczxuqUzvCrcio3SeeCQE6+FGyfwmfhLUHdw3jcFRh/pxtNiEJ5wOcoBtYjHCvQ+KJViuUYLEGHGFFob61lw76gDF+YjXfYQ6kHR66HftD0es5dl8+DF00O8m6gsHiwIAY7qO9HdykdkTCZVYTBGfWgvOUhTat9ZSwVdMzdABGJ9aJfyoIDixahcHwAcMmpmRllxqYDsfaRoX3hVThJn0H/+6dZmgYiUExfLSc8g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3893.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(55016002)(76116006)(66556008)(64756008)(8936002)(186003)(83380400001)(6916009)(66946007)(52536014)(66446008)(7696005)(66476007)(9686003)(2906002)(33656002)(316002)(478600001)(30864003)(26005)(5660300002)(86362001)(71200400001)(19627405001)(6506007)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?yj96eNIdljs/AyCIBX1HE4Un+vkVk4U3ShHh5//PtEopigKWToY9RQN9ExWM?=
 =?us-ascii?Q?h7RqTnjYcRUmEgu1WapBsoPxjjsn6uHJt131jyNCcaEKE8SihjfvrqQeNsKF?=
 =?us-ascii?Q?aPsIVDMOAt7yN+rSCm5crMbYZrZTFL0v7/TPmCrKqpxzDRIhODIpDKXHnmq7?=
 =?us-ascii?Q?qPQsWFHD24XqmZEOMPZeducQcSYYN6qPDbB0wJPwNpfsAkmXVe1X9RU8LiTz?=
 =?us-ascii?Q?bMc0z8LErMOR0J/HzcqMJiozp9yRMXRV/Xq2VlJAiCs3SgJMQhJ1QCoplFdP?=
 =?us-ascii?Q?l4odKly6v8tUJeb1S0D9ketQBBlogoyfKBlTEMIg2LPmrPXUFeL+UdZJPqWu?=
 =?us-ascii?Q?YuHYxkbOWF7hhKXp4NfPaBNQ20Qv2UMeWjtcYcaGme7U7pgYU5qViQnX39YJ?=
 =?us-ascii?Q?gnWPm0DxdjLhlnzPXlQwwp9c8UC9+ZKWLp/552SzglYmd5ED7SGrU1Lu6J5G?=
 =?us-ascii?Q?rhYJNA3GkBBRquGv2HeqW6sKo+14metNewYdL4c2dVK1gUAZktDKCCKJq/++?=
 =?us-ascii?Q?mzEs3+dsFkR22HR/jR108nbHkpFLE+VidEOzfVgDSlowpZlOaFGZt2y64YH4?=
 =?us-ascii?Q?lTfYNGDKSpUJlVE84uQ+cUD4FgKXjFzzT2BNIlYxUHexeYhvp3KBR6jT+sfr?=
 =?us-ascii?Q?MxLcdC+jEvDX74Vu349XXpICyH4/5hgfzIAoLa9as3JbMFKAtEMWSxC6mpqS?=
 =?us-ascii?Q?YNIr08C25ST53NP7IhhsChUvu7yCXOlt5v/ortzXQ5UK37g3NlGNupexjjsK?=
 =?us-ascii?Q?UaDNH4Z4CiMEalPvc4Ou9NeudqsgOZt+gGJgQwJFOKUX2aRFm/N/Ige9zz8f?=
 =?us-ascii?Q?LxKL8uo+IQl577gluNVhMb8+Z3OQ2TGZPwE6BTpvcoiulPBQ7mgzHGCQWTQs?=
 =?us-ascii?Q?KYuSHxgcQXmE6sVDWMKj44BbGQYU/k/6XChyLT1k/apwLX/E7NNFvpN3ioTk?=
 =?us-ascii?Q?m2jfreaYDfWCfvVl5vmw7g8pLSjJrvIL8+xlctH5pDDGJwQZz7dyngpxyNuw?=
 =?us-ascii?Q?u64PeChHyAgVZEosbmy8Y5mJckX0TVo2+Dx/Gw9VZ1eLl932DdQKi6ovBsHC?=
 =?us-ascii?Q?RSbJgdybpu06Cxpe+NVHIVpCIPESA8kWAcMuAabeKKf7CWg/bvKOzUi37+lp?=
 =?us-ascii?Q?PiHZ8GnguLVgLkocdxLwo1NRerVNfYt3Hq+yKGh1euQW9tuB3O2L23AyePyE?=
 =?us-ascii?Q?UPimFxZCiRsGEXIqAlPnRGM4YU+VOEeCibi97HNmTstVydMGNsz1A3Rzh46h?=
 =?us-ascii?Q?2FytlB0AZijoPSn+TzlVg2Dt3ORpVgn+I5PzDaEZ8b3ix3h2+D/vLnb/D62m?=
 =?us-ascii?Q?0HruxTcnjS3xttoq8WaQMaNH?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4788
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Richard.Neill@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0975e763-cf87-41ac-76f1-08d8dfe9bef3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BP6HWcjR6uIJ5H+GVYSwnEeZCS/T4Ra0nIIWz94l5YwzERsnLILEED9WRGV+IQAzrU4ZlpE+43rZziyQAS7PcisFIJp/YJYiy09tbC9yeMVQg6FoXDwL3yM/jZ8UcW6iHyBr74W0Ji6iBr9IG0nGXy1Vz+lF1kzbSnEHI7BrIqCqOCMZwrRFXDZMax6C3bJMNI8PMzrIqkqrIEDnKy05P290KfZeTeGvK34mE+YtBLmcawk7aTGeI7U3qNZ+FTtSb2qTZOYF0RDIokw4zl/b4zF/XgMEi8E89Ytu0AJqXBsZ7Qm/cgL/LAcQORMPYQb1yLJjLlnxH/ybLJ7OKVcc9gzfFqqLuogcN9dNyKVa6d/+hx06zbL4oOlVY4labZH5Us86EwGtGpGUJceJEfAvC9r41QPsPsdRu755nZusYc+AjN6l0epyQVmGepNxaha7SFVAptVTtthy88B83H+zJRyHkxM9TEwwVuFZEGYXGPYn6vta3A1PN5aj5W3WARNMFLy3CUSnKfLHX4VLfathZEJwPE3UEBmU93f7b8zrFeGVLdCdOQfVJ1z86luBPgqjiXZ8iUwzR0DHkchlmV6FFhh8Q/jQY89+HuwckhFt0ZptScyS1V1wRVrPVhjV8z1Ea7GEvL8wO355Lm5RdS6VDXpAx1IRh5dVNKeeNrsr9y0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(83380400001)(478600001)(356005)(47076005)(2906002)(82740400003)(8936002)(30864003)(19627405001)(8676002)(26005)(6506007)(36860700001)(86362001)(52536014)(81166007)(336012)(19627235002)(70586007)(5660300002)(7696005)(316002)(70206006)(33656002)(186003)(82310400003)(6916009)(55016002)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 15:17:19.2249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae57c071-a5ee-43e9-5c9f-08d8dfe9c4a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2007
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB389327750222C43F43F92382E0969AM6PR08MB3893eurp_"

--_000_AM6PR08MB389327750222C43F43F92382E0969AM6PR08MB3893eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch should also be backported to the gatesgarth branch, please.

Thanks,
Richard
________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Richard Neill via lists.yoctoproject.org <richard.neill=3Darm.com=
@lists.yoctoproject.org>
Sent: Friday, March 5, 2021 3:15 PM
To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Subject: [meta-arm] [PATCH] arm-autonomy/xen: remove patches that have been=
 mainlined in xen 4.14.1

Remove the 4 patches from recipes-extended/xen/xen_4.14.bbappend that
have been integrated in xen 4.14.1

Issue-Id: SCM-2133
Signed-off-by: Richard Neill <richard.neill@arm.com>
Change-Id: If38262d17699794eb600b11e131c168ed4de4391
---
 ...Neoverse-N1-processor-identification.patch | 40 ---------------
 ...sages-for-unknown-FP-SIMD-implement.patch} |  0
 ...ble-CPU-Erratum-1165522-for-Neoverse.patch | 42 ---------------
 ...ilicon-errata.txt-with-the-Neovers-A.patch | 35 -------------
 ...N1-A76-A75-FP-registers-in-vCPU-cont.patch | 51 -------------------
 .../recipes-extended/xen/xen_4.14.bbappend    |  6 +--
 6 files changed, 1 insertion(+), 173 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-ar=
m-Add-Neoverse-N1-processor-identification.patch
 rename meta-arm-autonomy/recipes-extended/xen/xen-4.14/{0005-xen-arm-Throw=
-messages-for-unknown-FP-SIMD-implement.patch =3D> 0001-xen-arm-Throw-messa=
ges-for-unknown-FP-SIMD-implement.patch} (100%)
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xe=
n-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xe=
n-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xe=
n-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch

diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-N=
eoverse-N1-processor-identification.patch b/meta-arm-autonomy/recipes-exten=
ded/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
deleted file mode 100644
index df5e73e..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse=
-N1-processor-identification.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3b418b33265402aab0cb1bf2b745a25724bae2d8 Mon Sep 17 00:00:00 2001
-Message-Id: <3b418b33265402aab0cb1bf2b745a25724bae2d8.1602684880.git.diego=
.sueiro@arm.com>
-From: Bertrand Marquis <bertrand.marquis@arm.com>
-Date: Tue, 18 Aug 2020 14:47:38 +0100
-Subject: [PATCH] arm: Add Neoverse N1 processor identification
-
-Add MIDR and CPU part numbers for Neoverse N1
-
-Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Acked-by: Julien Grall <jgrall@amazon.com>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- xen/include/asm-arm/processor.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/process=
or.h
-index aa642e3..3ca67f8 100644
---- a/xen/include/asm-arm/processor.h
-+++ b/xen/include/asm-arm/processor.h
-@@ -58,6 +58,7 @@
- #define ARM_CPU_PART_CORTEX_A73     0xD09
- #define ARM_CPU_PART_CORTEX_A75     0xD0A
- #define ARM_CPU_PART_CORTEX_A76     0xD0B
-+#define ARM_CPU_PART_NEOVERSE_N1    0xD0C
-
- #define MIDR_CORTEX_A12 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A12)
- #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A17)
-@@ -68,6 +69,7 @@
- #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A73)
- #define MIDR_CORTEX_A75 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A75)
- #define MIDR_CORTEX_A76 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A76)
-+#define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEO=
VERSE_N1)
-
- /* MPIDR Multiprocessor Affinity Register */
- #define _MPIDR_UP           (30)
---
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-T=
hrow-messages-for-unknown-FP-SIMD-implement.patch b/meta-arm-autonomy/recip=
es-extended/xen/xen-4.14/0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-im=
plement.patch
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Th=
row-messages-for-unknown-FP-SIMD-implement.patch
rename to meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-xen-arm-Thro=
w-messages-for-unknown-FP-SIMD-implement.patch
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-E=
nable-CPU-Erratum-1165522-for-Neoverse.patch b/meta-arm-autonomy/recipes-ex=
tended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.pa=
tch
deleted file mode 100644
index 0ac4049..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-C=
PU-Erratum-1165522-for-Neoverse.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c Mon Sep 17 00:00:00 2001
-Message-Id: <858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c.1602684183.git.diego=
.sueiro@arm.com>
-From: Bertrand Marquis <bertrand.marquis@arm.com>
-Date: Tue, 18 Aug 2020 14:47:39 +0100
-Subject: [PATCH] xen/arm: Enable CPU Erratum 1165522 for Neoverse
-
-Enable CPU erratum of Speculative AT on the Neoverse N1 processor
-versions r0p0 to r2p0.
-Also Fix Cortex A76 Erratum string which had a wrong errata number.
-
-Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Acked-by: Julien Grall <jgrall@amazon.com>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- xen/arch/arm/cpuerrata.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
-index 0248893..6c09017 100644
---- a/xen/arch/arm/cpuerrata.c
-+++ b/xen/arch/arm/cpuerrata.c
-@@ -477,8 +477,14 @@ static const struct arm_cpu_capabilities arm_errata[]=
 =3D {
-     },
- #endif
-     {
-+        /* Neoverse r0p0 - r2p0 */
-+        .desc =3D "ARM erratum 1165522",
-+        .capability =3D ARM64_WORKAROUND_AT_SPECULATE,
-+        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 2 << MIDR_VARIANT_SHIFT),
-+    },
-+    {
-         /* Cortex-A76 r0p0 - r2p0 */
--        .desc =3D "ARM erratum 116522",
-+        .desc =3D "ARM erratum 1165522",
-         .capability =3D ARM64_WORKAROUND_AT_SPECULATE,
-         MIDR_RANGE(MIDR_CORTEX_A76, 0, 2 << MIDR_VARIANT_SHIFT),
-     },
---
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-U=
pdate-silicon-errata.txt-with-the-Neovers-A.patch b/meta-arm-autonomy/recip=
es-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Ne=
overs-A.patch
deleted file mode 100644
index 24b52f0..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-s=
ilicon-errata.txt-with-the-Neovers-A.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1814a626fb5811184eda64fe22f0055df4600211 Mon Sep 17 00:00:00 2001
-Message-Id: <1814a626fb5811184eda64fe22f0055df4600211.1602684203.git.diego=
.sueiro@arm.com>
-From: Julien Grall <jgrall@amazon.com>
-Date: Tue, 25 Aug 2020 18:38:10 +0100
-Subject: [PATCH] xen/arm: Update silicon-errata.txt with the Neovers AT
- erratum
-
-Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
-added a new erratum but forgot to update silicon-errata.txt.
-
-Update the file accordingly to keep track of errata workaround in Xen.
-
-Signed-off-by: Julien Grall <jgrall@amazon.com>
-Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Acked-by: Stefano Stabellini <sstabellini@kernel.org>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- docs/misc/arm/silicon-errata.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-erra=
ta.txt
-index 11e5a9d..e15d092 100644
---- a/docs/misc/arm/silicon-errata.txt
-+++ b/docs/misc/arm/silicon-errata.txt
-@@ -51,4 +51,5 @@ stable hypervisors.
- | ARM            | Cortex-A57      | #1319537        | N/A               =
      |
- | ARM            | Cortex-A72      | #1319367        | N/A               =
      |
- | ARM            | Cortex-A76      | #1165522        | N/A               =
      |
-+| ARM            | Neoverse-N1     | #1165522        | N/A
- | ARM            | MMU-500         | #842869         | N/A               =
      |
---
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-M=
issing-N1-A76-A75-FP-registers-in-vCPU-cont.patch b/meta-arm-autonomy/recip=
es-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vC=
PU-cont.patch
deleted file mode 100644
index 673c63a..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-=
N1-A76-A75-FP-registers-in-vCPU-cont.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 968bb86d04913f52d7678a842474f2a674a8b23e Mon Sep 17 00:00:00 2001
-Message-Id: <968bb86d04913f52d7678a842474f2a674a8b23e.1602683678.git.diego=
.sueiro@arm.com>
-From: Wei Chen <wei.chen@arm.com>
-Date: Fri, 28 Aug 2020 02:34:03 +0000
-Subject: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
- switch
-
-Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
-FP/SIMD or not. But currently, these two MACROs only consider value 0
-of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
-that support FP/SIMD and half-precision floating-point arithmetic, the
-ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).
-For these CPUs, xen will treat them as no FP/SIMD support, the
-vfp_save/restore_state will not take effect.
-
-From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
-basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
-this case, on N1/A76/A75 platforms, Xen will always miss the floating
-pointer registers save/restore. If different vCPUs are running on the
-same pCPU, the floating pointer registers will be corrupted randomly.
-
-This patch fixes Xen on these new cores.
-
-Signed-off-by: Wei Chen <wei.chen@arm.com>
-Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Reviewed-by: Julien Grall <jgrall@amazon.com>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- xen/include/asm-arm/cpufeature.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufea=
ture.h
-index 674beb0..10878ea 100644
---- a/xen/include/asm-arm/cpufeature.h
-+++ b/xen/include/asm-arm/cpufeature.h
-@@ -13,8 +13,8 @@
- #define cpu_has_el2_64    (boot_cpu_feature64(el2) >=3D 1)
- #define cpu_has_el3_32    (boot_cpu_feature64(el3) =3D=3D 2)
- #define cpu_has_el3_64    (boot_cpu_feature64(el3) >=3D 1)
--#define cpu_has_fp        (boot_cpu_feature64(fp) =3D=3D 0)
--#define cpu_has_simd      (boot_cpu_feature64(simd) =3D=3D 0)
-+#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
-+#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
- #define cpu_has_gicv3     (boot_cpu_feature64(gic) =3D=3D 1)
- #endif
-
---
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend b/met=
a-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
index bc3b60d..f4196ff 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
@@ -1,9 +1,5 @@
 FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-4.14:"

 SRC_URI +=3D " \
-    file://0001-arm-Add-Neoverse-N1-processor-identification.patch \
-    file://0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch \
-    file://0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch=
 \
-    file://0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch=
 \
-    file://0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch=
 \
+    file://0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch=
 \
     "
--
2.25.1


--_000_AM6PR08MB389327750222C43F43F92382E0969AM6PR08MB3893eurp_
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
<div>This patch should also be backported to the gatesgarth branch, please.=
 <br>
</div>
<div><br>
</div>
<div>Thanks,</div>
<div>Richard<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-arm@lists.yoctop=
roject.org &lt;meta-arm@lists.yoctoproject.org&gt; on behalf of Richard Nei=
ll via lists.yoctoproject.org &lt;richard.neill=3Darm.com@lists.yoctoprojec=
t.org&gt;<br>
<b>Sent:</b> Friday, March 5, 2021 3:15 PM<br>
<b>To:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Subject:</b> [meta-arm] [PATCH] arm-autonomy/xen: remove patches that ha=
ve been mainlined in xen 4.14.1</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Remove the 4 patches from recipes-extended/xen/xen=
_4.14.bbappend that<br>
have been integrated in xen 4.14.1<br>
<br>
Issue-Id: SCM-2133<br>
Signed-off-by: Richard Neill &lt;richard.neill@arm.com&gt;<br>
Change-Id: If38262d17699794eb600b11e131c168ed4de4391<br>
---<br>
&nbsp;...Neoverse-N1-processor-identification.patch | 40 ---------------<br=
>
&nbsp;...sages-for-unknown-FP-SIMD-implement.patch} |&nbsp; 0<br>
&nbsp;...ble-CPU-Erratum-1165522-for-Neoverse.patch | 42 ---------------<br=
>
&nbsp;...ilicon-errata.txt-with-the-Neovers-A.patch | 35 -------------<br>
&nbsp;...N1-A76-A75-FP-registers-in-vCPU-cont.patch | 51 ------------------=
-<br>
&nbsp;.../recipes-extended/xen/xen_4.14.bbappend&nbsp;&nbsp;&nbsp; |&nbsp; =
6 +--<br>
&nbsp;6 files changed, 1 insertion(+), 173 deletions(-)<br>
&nbsp;delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/00=
01-arm-Add-Neoverse-N1-processor-identification.patch<br>
&nbsp;rename meta-arm-autonomy/recipes-extended/xen/xen-4.14/{0005-xen-arm-=
Throw-messages-for-unknown-FP-SIMD-implement.patch =3D&gt; 0001-xen-arm-Thr=
ow-messages-for-unknown-FP-SIMD-implement.patch} (100%)<br>
&nbsp;delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/00=
02-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch<br>
&nbsp;delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/00=
03-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch<br>
&nbsp;delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/00=
04-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch<br>
<br>
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-N=
eoverse-N1-processor-identification.patch b/meta-arm-autonomy/recipes-exten=
ded/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch<br=
>
deleted file mode 100644<br>
index df5e73e..0000000<br>
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse=
-N1-processor-identification.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 3b418b33265402aab0cb1bf2b745a25724bae2d8 Mon Sep 17 00:00:00 2001<br>
-Message-Id: &lt;3b418b33265402aab0cb1bf2b745a25724bae2d8.1602684880.git.di=
ego.sueiro@arm.com&gt;<br>
-From: Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;<br>
-Date: Tue, 18 Aug 2020 14:47:38 +0100<br>
-Subject: [PATCH] arm: Add Neoverse N1 processor identification<br>
-<br>
-Add MIDR and CPU part numbers for Neoverse N1<br>
-<br>
-Signed-off-by: Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;<br>
-Acked-by: Julien Grall &lt;jgrall@amazon.com&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Diego Sueiro &lt;diego.sueiro@arm.com&gt;<br>
----<br>
- xen/include/asm-arm/processor.h | 2 ++<br>
- 1 file changed, 2 insertions(+)<br>
-<br>
-diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/process=
or.h<br>
-index aa642e3..3ca67f8 100644<br>
---- a/xen/include/asm-arm/processor.h<br>
-+++ b/xen/include/asm-arm/processor.h<br>
-@@ -58,6 +58,7 @@<br>
- #define ARM_CPU_PART_CORTEX_A73&nbsp;&nbsp;&nbsp;&nbsp; 0xD09<br>
- #define ARM_CPU_PART_CORTEX_A75&nbsp;&nbsp;&nbsp;&nbsp; 0xD0A<br>
- #define ARM_CPU_PART_CORTEX_A76&nbsp;&nbsp;&nbsp;&nbsp; 0xD0B<br>
-+#define ARM_CPU_PART_NEOVERSE_N1&nbsp;&nbsp;&nbsp; 0xD0C<br>
- <br>
- #define MIDR_CORTEX_A12 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A12)<br>
- #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A17)<br>
-@@ -68,6 +69,7 @@<br>
- #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A73)<br>
- #define MIDR_CORTEX_A75 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A75)<br>
- #define MIDR_CORTEX_A76 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A76)<br>
-+#define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEO=
VERSE_N1)<br>
- <br>
- /* MPIDR Multiprocessor Affinity Register */<br>
- #define _MPIDR_UP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (30)<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-T=
hrow-messages-for-unknown-FP-SIMD-implement.patch b/meta-arm-autonomy/recip=
es-extended/xen/xen-4.14/0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-im=
plement.patch<br>
similarity index 100%<br>
rename from meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Th=
row-messages-for-unknown-FP-SIMD-implement.patch<br>
rename to meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-xen-arm-Thro=
w-messages-for-unknown-FP-SIMD-implement.patch<br>
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-E=
nable-CPU-Erratum-1165522-for-Neoverse.patch b/meta-arm-autonomy/recipes-ex=
tended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.pa=
tch<br>
deleted file mode 100644<br>
index 0ac4049..0000000<br>
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-C=
PU-Erratum-1165522-for-Neoverse.patch<br>
+++ /dev/null<br>
@@ -1,42 +0,0 @@<br>
-From 858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c Mon Sep 17 00:00:00 2001<br>
-Message-Id: &lt;858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c.1602684183.git.di=
ego.sueiro@arm.com&gt;<br>
-From: Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;<br>
-Date: Tue, 18 Aug 2020 14:47:39 +0100<br>
-Subject: [PATCH] xen/arm: Enable CPU Erratum 1165522 for Neoverse<br>
-<br>
-Enable CPU erratum of Speculative AT on the Neoverse N1 processor<br>
-versions r0p0 to r2p0.<br>
-Also Fix Cortex A76 Erratum string which had a wrong errata number.<br>
-<br>
-Signed-off-by: Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;<br>
-Acked-by: Julien Grall &lt;jgrall@amazon.com&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Diego Sueiro &lt;diego.sueiro@arm.com&gt;<br>
----<br>
- xen/arch/arm/cpuerrata.c | 8 +++++++-<br>
- 1 file changed, 7 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c<br>
-index 0248893..6c09017 100644<br>
---- a/xen/arch/arm/cpuerrata.c<br>
-+++ b/xen/arch/arm/cpuerrata.c<br>
-@@ -477,8 +477,14 @@ static const struct arm_cpu_capabilities arm_errata[]=
 =3D {<br>
-&nbsp;&nbsp;&nbsp;&nbsp; },<br>
- #endif<br>
-&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Neoverse r0p0 - r2p0 */<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .desc =3D &quot;ARM erratum 11=
65522&quot;,<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .capability =3D ARM64_WORKAROU=
ND_AT_SPECULATE,<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MIDR_RANGE(MIDR_NEOVERSE_N1, 0=
, 2 &lt;&lt; MIDR_VARIANT_SHIFT),<br>
-+&nbsp;&nbsp;&nbsp; },<br>
-+&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Cortex-A76 r0p0 - r2p0=
 */<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .desc =3D &quot;ARM erratum 11=
6522&quot;,<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .desc =3D &quot;ARM erratum 11=
65522&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .capability =3D ARM64_WOR=
KAROUND_AT_SPECULATE,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MIDR_RANGE(MIDR_CORTEX_A7=
6, 0, 2 &lt;&lt; MIDR_VARIANT_SHIFT),<br>
-&nbsp;&nbsp;&nbsp;&nbsp; },<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-U=
pdate-silicon-errata.txt-with-the-Neovers-A.patch b/meta-arm-autonomy/recip=
es-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Ne=
overs-A.patch<br>
deleted file mode 100644<br>
index 24b52f0..0000000<br>
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-s=
ilicon-errata.txt-with-the-Neovers-A.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From 1814a626fb5811184eda64fe22f0055df4600211 Mon Sep 17 00:00:00 2001<br>
-Message-Id: &lt;1814a626fb5811184eda64fe22f0055df4600211.1602684203.git.di=
ego.sueiro@arm.com&gt;<br>
-From: Julien Grall &lt;jgrall@amazon.com&gt;<br>
-Date: Tue, 25 Aug 2020 18:38:10 +0100<br>
-Subject: [PATCH] xen/arm: Update silicon-errata.txt with the Neovers AT<br=
>
- erratum<br>
-<br>
-Commit 858c0be8c2fa &quot;xen/arm: Enable CPU Erratum 1165522 for Neoverse=
&quot;<br>
-added a new erratum but forgot to update silicon-errata.txt.<br>
-<br>
-Update the file accordingly to keep track of errata workaround in Xen.<br>
-<br>
-Signed-off-by: Julien Grall &lt;jgrall@amazon.com&gt;<br>
-Reviewed-by: Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;<br>
-Acked-by: Stefano Stabellini &lt;sstabellini@kernel.org&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Diego Sueiro &lt;diego.sueiro@arm.com&gt;<br>
----<br>
- docs/misc/arm/silicon-errata.txt | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-erra=
ta.txt<br>
-index 11e5a9d..e15d092 100644<br>
---- a/docs/misc/arm/silicon-errata.txt<br>
-+++ b/docs/misc/arm/silicon-errata.txt<br>
-@@ -51,4 +51,5 @@ stable hypervisors.<br>
- | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Cortex-A57&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #1319537&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | N/A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br=
>
- | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Cortex-A72&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #1319367&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | N/A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br=
>
- | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Cortex-A76&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #1165522&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | N/A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br=
>
-+| ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 Neoverse-N1&nbsp;&nbsp;&nbsp;&nbsp; | #1165522&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | N/A<br>
- | ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 MMU-500&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | #842869&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | N/A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-M=
issing-N1-A76-A75-FP-registers-in-vCPU-cont.patch b/meta-arm-autonomy/recip=
es-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vC=
PU-cont.patch<br>
deleted file mode 100644<br>
index 673c63a..0000000<br>
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-=
N1-A76-A75-FP-registers-in-vCPU-cont.patch<br>
+++ /dev/null<br>
@@ -1,51 +0,0 @@<br>
-From 968bb86d04913f52d7678a842474f2a674a8b23e Mon Sep 17 00:00:00 2001<br>
-Message-Id: &lt;968bb86d04913f52d7678a842474f2a674a8b23e.1602683678.git.di=
ego.sueiro@arm.com&gt;<br>
-From: Wei Chen &lt;wei.chen@arm.com&gt;<br>
-Date: Fri, 28 Aug 2020 02:34:03 +0000<br>
-Subject: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context<=
br>
- switch<br>
-<br>
-Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports<br>
-FP/SIMD or not. But currently, these two MACROs only consider value 0<br>
-of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs<br>
-that support FP/SIMD and half-precision floating-point arithmetic, the<br>
-ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).<br>
-For these CPUs, xen will treat them as no FP/SIMD support, the<br>
-vfp_save/restore_state will not take effect.<br>
-<br>
-From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support<br=
>
-basic Advanced SIMD/FP and half-precision floating-point arithmetic. In<br=
>
-this case, on N1/A76/A75 platforms, Xen will always miss the floating<br>
-pointer registers save/restore. If different vCPUs are running on the<br>
-same pCPU, the floating pointer registers will be corrupted randomly.<br>
-<br>
-This patch fixes Xen on these new cores.<br>
-<br>
-Signed-off-by: Wei Chen &lt;wei.chen@arm.com&gt;<br>
-Reviewed-by: Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;<br>
-Reviewed-by: Julien Grall &lt;jgrall@amazon.com&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Diego Sueiro &lt;diego.sueiro@arm.com&gt;<br>
----<br>
- xen/include/asm-arm/cpufeature.h | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufea=
ture.h<br>
-index 674beb0..10878ea 100644<br>
---- a/xen/include/asm-arm/cpufeature.h<br>
-+++ b/xen/include/asm-arm/cpufeature.h<br>
-@@ -13,8 +13,8 @@<br>
- #define cpu_has_el2_64&nbsp;&nbsp;&nbsp; (boot_cpu_feature64(el2) &gt;=3D=
 1)<br>
- #define cpu_has_el3_32&nbsp;&nbsp;&nbsp; (boot_cpu_feature64(el3) =3D=3D =
2)<br>
- #define cpu_has_el3_64&nbsp;&nbsp;&nbsp; (boot_cpu_feature64(el3) &gt;=3D=
 1)<br>
--#define cpu_has_fp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (boot_cpu_fe=
ature64(fp) =3D=3D 0)<br>
--#define cpu_has_simd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (boot_cpu_feature64(si=
md) =3D=3D 0)<br>
-+#define cpu_has_fp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (boot_cpu_fe=
ature64(fp) &lt; 8)<br>
-+#define cpu_has_simd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (boot_cpu_feature64(si=
md) &lt; 8)<br>
- #define cpu_has_gicv3&nbsp;&nbsp;&nbsp;&nbsp; (boot_cpu_feature64(gic) =
=3D=3D 1)<br>
- #endif<br>
- <br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend b/met=
a-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend<br>
index bc3b60d..f4196ff 100644<br>
--- a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend<br>
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend<br>
@@ -1,9 +1,5 @@<br>
&nbsp;FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}-4.14:&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI +=3D &quot; \<br>
-&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-arm-Add-Neoverse-N1-processor-id=
entification.patch">file://0001-arm-Add-Neoverse-N1-processor-identificatio=
n.patch</a> \<br>
-&nbsp;&nbsp;&nbsp; <a href=3D"file://0002-xen-arm-Enable-CPU-Erratum-11655=
22-for-Neoverse.patch">
file://0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch</a> \<br>
-&nbsp;&nbsp;&nbsp; <a href=3D"file://0003-xen-arm-Update-silicon-errata.tx=
t-with-the-Neovers-A.patch">
file://0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch</a> =
\<br>
-&nbsp;&nbsp;&nbsp; <a href=3D"file://0004-xen-arm-Missing-N1-A76-A75-FP-re=
gisters-in-vCPU-cont.patch">
file://0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch</a> =
\<br>
-&nbsp;&nbsp;&nbsp; <a href=3D"file://0005-xen-arm-Throw-messages-for-unkno=
wn-FP-SIMD-implement.patch">
file://0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-xen-arm-Throw-messages-for-unkno=
wn-FP-SIMD-implement.patch">
file://0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB389327750222C43F43F92382E0969AM6PR08MB3893eurp_--
