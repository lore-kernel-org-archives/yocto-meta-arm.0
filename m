Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web11.34344.1591633991896747252
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 09:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ie3M3iD8;
 spf=pass (domain: arm.com, ip: 40.107.20.79, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMKlblmNqGE+CVl/Hrg2jgFuctxQw4XuU9ROZUajgHM=;
 b=ie3M3iD8RrCCLsXuMyGq5t1Y8nf8mKIC6EYURcy6zyZ+L3GVCiDOT4DPyfShO/Jqrm9RbOUmMdF7pU6g8FSkcSWlGtP2CZBzPTN/Zd2ddy5J5jHBVvNOJDl8dws+XiUj8/N1YP+FIxacOpNPWXjXQRc8XdegWmZBilV6Tn/OV4c=
Received: from DB6PR07CA0097.eurprd07.prod.outlook.com (2603:10a6:6:2c::11) by
 AM6PR08MB4293.eurprd08.prod.outlook.com (2603:10a6:20b:be::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Mon, 8 Jun 2020 16:33:08 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::10) by DB6PR07CA0097.outlook.office365.com
 (2603:10a6:6:2c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.9 via Frontend
 Transport; Mon, 8 Jun 2020 16:33:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 16:33:08 +0000
Received: ("Tessian outbound 56dbe829191e:v59"); Mon, 08 Jun 2020 16:33:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f674bbdce824320
X-CR-MTA-TID: 64aa7808
Received: from f39164610e54.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 24145C7B-DC77-4872-9169-9E30C899F6EB.1;
	Mon, 08 Jun 2020 16:33:03 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f39164610e54.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Jun 2020 16:33:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8GcFjHMDHiamgbGWxNM3uR7cQlL7MdLndGAukOcFiu9zSKXnWv018s6l9Lz/spe/4OIK1yKhtXV1Hs3v5RojAfJjyQty6byZQEqkXh2EqR+Xobd84bApTHD86wVnahSa13czYGKw4WPl02TKkDtZZoMiED8q3LPX3L+g7dosheGuwj7DpBhw1lMeS2V2x0TM1w51X8+liMMY1uIunMnwIMy4shKLXDV5iv7ojVCLbFoFfsoMG5FFqq2SExg4wvjWWn1VlRKlNWdrWSTFmohmu86oW42YqG9g8qq23bWkDFyiIUX1FF9ZbX9h7qI8jYSJebNSkmetAENxuxmpdWHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMKlblmNqGE+CVl/Hrg2jgFuctxQw4XuU9ROZUajgHM=;
 b=R5SvTa4IsDqHrwIPSElodHD+Ok2dV2GNMZnZBbKKjriPuNKS4mHFhTzCFY65SFerNRb+zQHda1EHPBwrdUHjP0oAiK43KWttgq2/iojUWG6/jK5K547glzl02CTzp/24fih7iWyT7TDNLEszSINK1wax2KHixHwYjc16MXTzKWXM2eufPmk8fdu4/chrp/l6ejxsM06ZrICm9adzm8gWgvngJ2LFxmihF5ZVkEd3hS56qgXmNFPMAX+C8BDuqH882fWe5pN7M+p8+OUQlzzA7z/Hjk3Q3WVsKK5HdIAz2Jm831u/7yJcbY29jG7DfcpMmO1P54yPMSHmVgBkOKXg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMKlblmNqGE+CVl/Hrg2jgFuctxQw4XuU9ROZUajgHM=;
 b=ie3M3iD8RrCCLsXuMyGq5t1Y8nf8mKIC6EYURcy6zyZ+L3GVCiDOT4DPyfShO/Jqrm9RbOUmMdF7pU6g8FSkcSWlGtP2CZBzPTN/Zd2ddy5J5jHBVvNOJDl8dws+XiUj8/N1YP+FIxacOpNPWXjXQRc8XdegWmZBilV6Tn/OV4c=
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5403.eurprd08.prod.outlook.com (2603:10a6:10:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 16:33:01 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 16:33:01 +0000
Message-ID: <0902c05ab1ab7a6b8d36266904f766df69745e40.camel@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: Add trusted firmware support for N1SDP
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: jdmason@kudzu.us
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Date: Mon, 08 Jun 2020 22:02:56 +0530
In-Reply-To: <20200608154950.GD15959@kudzu.us>
References: <20200602165152.27514-1-khasim.mohammed@arm.com>
	 <20200608154950.GD15959@kudzu.us>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-ClientProxiedBy: LO2P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::20) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.37.8.169] (217.140.96.140) by LO2P265CA0032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19 via Frontend Transport; Mon, 8 Jun 2020 16:32:59 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ee434aa-bad8-4de1-18db-08d80bc9a0d4
X-MS-TrafficTypeDiagnostic: DB8PR08MB5403:|AM6PR08MB4293:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4293B6AE572A14610A68D83CFA850@AM6PR08MB4293.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LYpCEHDTGWRk036x9ZGIIHVkFx8m+I3ScxQL3tKA7Pa/g8d+xHMwGT/PDwTcs5CR+OM1UcP+sD26FvO8kO8wvw/pmSTbP6JtGF7HD+BPrucb7iggNeTxvIaA3lYs31Z1GP57v4GF4kad+sIveFgRVB/sOqcSUnwQjgttRsywY83WL0+UOSiX33ZHva78XdD+G5mVKh7Xl4HTuYEuaPXe08dXuxvwuBwd1u2L0q0Fxvp6zzzJ5rp34AQng3i0LlblZit8NIb5VboLEdn3y8y9tVTJJfSiAKl+sQhF+c+f1ylfdUaqAyid69L/davt3HrL2g0N+0y46nLji/MWSjFhRpELRC4JBSgVGuVVB+KClE+BdGYJ6Q0usK6WuieAQlIhFy76HKJBQ7KeHWU+c0cbKm4vEfJnFm4d5k0yhTA4JidgfrZC9WRgFzUeRh4lBNZfk1CQ3oT3x1184FoVQm2nnR/QxWNNkomFbvgQy9X2xLdKz86qRxEfq1/E8vfcu+d1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(6666004)(316002)(8676002)(6916009)(2906002)(36756003)(5660300002)(16576012)(66556008)(16526019)(186003)(86362001)(6486002)(66476007)(2616005)(4326008)(966005)(8936002)(52116002)(26005)(478600001)(66946007)(956004)(83380400001)(44832011)(99106002)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 9Gm2b+rFn4gKcSpEl5O3OlKGeCCPL/2ubAkLjL76SUBbMtRELYwDX2zw7mzZIjuJ6FYLkEQu3tQlH8qmw/IfER7W65TPA/raiKyOiglrbH2CUgZ8ZkLgah7OwbJFo3dZKSPnDd6CHZi1AfApRUAcRGZE1PPRd1Mq0bcW9aEkepnV5OSQvhOWEalYIdvY0Zc/lO4YLjB7854tyPHxCdH1C2quTiBi1hbHTyTR/7Vtzcii2Lsho0YcMV4yECIpz5O6WtQ7j5AuUYqh05JD1qp32NnfYNnEPcO6xhUERd/PUQ5AeWN3MpfbrQJAhWvhmp7ML/2U/8+e4Tikimc+hcr7TeAfsoM6SFn8RshDcnT3r0R47kFvtsaU3z9YmyldrM2McO6rtZBKaTLZlwW1HgGPnXkYVTAoUjrhYf/6cGRvdn7l7QYEzOf+tXK/4v0IvBlUQ9yUywPFGSHpLypdiRtZ2IgRN/1yQnbSXJEqhfE+Hgtv3avUTR0/YQiuNcHzn0c+
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5403
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966005)(6486002)(70206006)(70586007)(36756003)(5660300002)(86362001)(26005)(83380400001)(6666004)(186003)(2906002)(4326008)(16526019)(8936002)(966005)(478600001)(336012)(356005)(82310400002)(2616005)(81166007)(8676002)(34206002)(316002)(44832011)(16576012)(956004)(47076004)(82740400003)(99106002)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8ca76ea8-9e3d-48f5-c5fb-08d80bc99c2f
X-Forefront-PRVS: 042857DBB5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tyqsEa5Chr7wbhNXomtBggG7YAzo0V9xl+xtS3evFBZI/9VVcF5uwUZEDmO9naNon4GmtwjqpDnGvQ2pDK4KoxnUYtO4zogM7U2Gp+qYc3g6ifaQNZQbZSTrAWtd5xe4DkYQ0bp81wdCF7lvJBaC5MDuK2x2mjpny0n2/8VBPg8KYPx9cScl9h8unIGBGrdLQvA7GPgQRF6aZeny02L9WMq4WBFQbZGOVYWhX20JCy9Kcl3hI0DxsDY1VUADmTi4GrZJjbgc0aC30KMBhl4HzLmoYax9hJeC/1STQQi9bbqQAP8ltz9N2b+hkq8rSeQHuvl3qhSubUnkQ5++7SqN2UUfx0069u0Ji+nrji+RUyoNqfr/4eI9YKgvcEqoKXvYP2jkn6RjA2MrhJCd/1FcsEmyhKbW4IIxevIDlhAlDn2VlSAC4UzfRoKfV2/AwLrsDWy0Pk2rg2Y981whjJ9lpBRjKf6E/x2K4nXg+oD7iVmIEvhf7xRgGk+UEaNngURvOpzn26tHt4wd/bEpDGqeJNTLdpniE5L4uFiY2i6mLFI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 16:33:08.7451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee434aa-bad8-4de1-18db-08d80bc9a0d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4293
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Jon,

On Mon, 2020-06-08 at 11:49 -0400, Jon Mason via lists.yoctoproject.org
wrote:
> On Tue, Jun 02, 2020 at 05:51:52PM +0100, Khasim Mohammed wrote:
> > - Add new bbappend to fetch tfa ver 2.2 required for N1SDP
> > - Apply additional patch required for N1SDP
> > - Update machine conf to add image dependency for
> >   trusted firmware component
> > 
> > Issue-Id: PLATFORMS-3134
> > Change-Id: Ibf593c1818c9ea08acf71c6b5b80abc4aca79723
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> Pulled into master
> 
Can you please pull this on Dunfell branch as well ?

Regards,
Khasim

> Thanks,
> Jon
> 
> > ---
> >  meta-arm-bsp/conf/machine/n1sdp.conf          |  6 +++
> >  ...able-workaround-for-N1-Erratum-13157.patch | 46
> > +++++++++++++++++++
> >  .../trusted-firmware-a-n1sdp.inc              | 13 ++++++
> >  .../trusted-firmware-a_2.2.bbappend           | 11 +++++
> >  4 files changed, 76 insertions(+)
> >  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-
> > a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-
> > 13157.patch
> >  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-
> > a/trusted-firmware-a-n1sdp.inc
> >  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-
> > a/trusted-firmware-a_2.2.bbappend
> > 
> > diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-
> > bsp/conf/machine/n1sdp.conf
> > index 5fddcad..133fb89 100644
> > --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> > +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> > @@ -21,3 +21,9 @@ PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
> >  
> >  # RTL8168E Gigabit Ethernet Controller is attached to the PCIe
> > interface
> >  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
> > +
> > +# Trusted firmware v2.2 version
> > +PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-
> > firmware-a"
> > +PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
> > +
> > +EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
> > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-
> > a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-
> > 13157.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-
> > a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-
> > 13157.patch
> > new file mode 100644
> > index 0000000..53a6616
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-
> > n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch
> > @@ -0,0 +1,46 @@
> > +From 76847eb46e77d094eb8611760dd1ab880f617321 Mon Sep 17 00:00:00
> > 2001
> > +From: James Yang <James.Yang@arm.com>
> > +Date: Wed, 4 Sep 2019 10:49:45 -0500
> > +Subject: [PATCH] n1sdp/arm-tf: disable workaround for N1 Erratum
> > 1315703 and
> > + Spectre v4
> > +
> > +This patch disables the workaround for Erratum 1315703 so that the
> > N1 CPU
> > +performance in the N1 SDP better reflects that of released
> > versions of the
> > +N1 for software that does not require mitigation for Spectre
> > Variant 4.
> > +
> > +N1 SDP uses N1 version r1p0, which is affected by Erratum 1315703,
> > which
> > +is fixed in N1 r3p1.  The workaround for r1p0 disables the CPU
> > performance
> > +feature of bypassing of stores by younger loads.  This can
> > significantly
> > +affect performance.  The Erratum is classified "Cat A (Rare)" and
> > requires
> > +a specific sequence of events to occur.
> > +
> > +Disabling this CPU performance feature is also the mitigation for
> > Spectre
> > +Variant 4 (CVE-2018-3639).  On CPUs that provide the PSTATE.SBSS
> > feature,
> > +the OS selectively applies the mitigation only to programs that
> > require it,
> > +leaving the performance of other programs unaffected.  However, N1
> > r1p0
> > +does not have the PSTATE.SBSS feature (which is introduced in N1
> > r3p1), and
> > +Arm-TF does not provide the interface to to dynamically disable
> > the CPU
> > +performance feature.  Therefore, applying the workaround penalizes
> > ALL
> > +software running on N1 SDP, including those that do not require
> > mitigation.
> > +
> > +This patch is meant for performance evaluation purposes ONLY and
> > should not
> > +be used for software that requires a seccomp computing
> > environment.
> > +
> > +Signed-off-by: James Yang <James.Yang@arm.com>
> > +---
> > + plat/arm/board/n1sdp/platform.mk | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/plat/arm/board/n1sdp/platform.mk
> > b/plat/arm/board/n1sdp/platform.mk
> > +index 986bd70a..7e30c857 100644
> > +--- a/plat/arm/board/n1sdp/platform.mk
> > ++++ b/plat/arm/board/n1sdp/platform.mk
> > +@@ -66,3 +66,5 @@ include plat/arm/common/arm_common.mk
> > + include plat/arm/css/common/css_common.mk
> > + include plat/arm/board/common/board_common.mk
> > + 
> > ++# N1SDP: disable workaround for Errata 1315703 and global Spectre
> > v4 mitigation
> > ++override ERRATA_N1_1315703 := 0
> > +-- 
> > +2.17.1
> > +
> > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-
> > firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-
> > a/trusted-firmware-a-n1sdp.inc
> > new file mode 100644
> > index 0000000..ad4af5a
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-
> > a-n1sdp.inc
> > @@ -0,0 +1,13 @@
> > +# N1SDP specific TFA support
> > +
> > +COMPATIBLE_MACHINE = "n1sdp"
> > +TFA_PLATFORM       = "n1sdp"
> > +TFA_BUILD_TARGET   = "bl31"
> > +TFA_DEBUG          = "1"
> > +TFA_MBEDTLS        = "0"
> > +TFA_UBOOT          = "0"
> > +
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/files/n1sdp:"
> > +SRC_URI_append = " \
> > +    file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-
> > 13157.patch \
> > +    "
> > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-
> > firmware-a_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-
> > firmware-a/trusted-firmware-a_2.2.bbappend
> > new file mode 100644
> > index 0000000..a87999f
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-
> > a_2.2.bbappend
> > @@ -0,0 +1,11 @@
> > +# Machine specific TFAs
> > +
> > +MACHINE_TFA_REQUIRE ?= ""
> > +MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
> > +
> > +require ${MACHINE_TFA_REQUIRE}
> > +
> > +# TFA referred in release tag N1SDP-2020.03.26
> > +SRCREV_tfa_n1sdp = "cfb3f73344217aa000aaff9d84baad7527af75bf"
> > +
> > +PV_n1sdp = "2.2+git${SRCPV}"
> > -- 
> > 2.17.1
> > 
> > 
> 
> 

