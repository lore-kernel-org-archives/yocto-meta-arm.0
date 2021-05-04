Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.67])
 by mx.groups.io with SMTP id smtpd.web11.3015.1620117945702337013
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 May 2021 01:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=152m7Lzd;
 spf=pass (domain: arm.com, ip: 40.107.2.67, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhBd99vUeQDH9MjcrqYtzb5VuG8Aaj7TjIaoZMot6eM=;
 b=152m7LzdGzeuJRs4/C2Ah6znZE/qCiTbZLpl/Ip7UtkSBJ6gALda2MB3klTvAAYBKOSNdIOld2QMBMVFTgV/6YV2fIGfRUSUv8S3dIqw1pQ050JUHgfbQO0mWZr/uwthX21fl53YlTimqlnSBrqwDXNFiWfrlyphnvE9HMrCuyc=
Received: from AM6P195CA0084.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::25)
 by VI1PR08MB2687.eurprd08.prod.outlook.com (2603:10a6:802:25::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 4 May
 2021 08:45:42 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::8b) by AM6P195CA0084.outlook.office365.com
 (2603:10a6:209:86::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Tue, 4 May 2021 08:45:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:45:41 +0000
Received: ("Tessian outbound 1e34f83e4964:v91"); Tue, 04 May 2021 08:45:40 +0000
X-CR-MTA-TID: 64aa7808
Received: from 00717fb5b491.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 16BE8F2A-CA8B-4BAA-87B0-A62C16C8D077.1;
	Tue, 04 May 2021 08:45:34 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00717fb5b491.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 May 2021 08:45:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKIx2u2vWcL7Jg/QFEgERm8ocqupkDrmndsEAghO2W6lwtTGoY0lTGGdrxG8JET3tRKLkP2KQZSzliZl/UfOJ4IIb3HAgAqaBqvMOBKSTfZmjJWc4PlAONAVutUmJgv7Qa8pR+MTHq8zjAIUKP5MmLQuUgR297bNvPxGCGOU4DAZw3zmKX0rMa5zP/ZS/USCQFKOEWIb3Gq/JbMtayIeZ4mg0n4BFP3xstne3rrwk2BoNxtCyMuvA/zCiJoPLKRkmEWcYBsvzKlbJp2xn6vKnN4akfTvPaDKyyAIWLAqvyHiivCf4exCLiEoeIydrlb7tRJfsKii45dx4nD6VU3AMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhBd99vUeQDH9MjcrqYtzb5VuG8Aaj7TjIaoZMot6eM=;
 b=ItjWTYLrTelEiaXhBRXpUcXRsUfQNuUtTooftG6iEHwbbFOpA3RMO0/ooqGq+Dl3lGxAHui18FHj7pJe17T2phfF1LHl23am22yZF3VbBGu7mcu/frAcTwemJt1H7R2y1zTJ2toaaDiNt7Jyvf0q7KJlLPWN2MZ3vNrJv7mjl3gjT+h0UMqKjRSXUnYtFEfiOy3GSDxxXUiYD2XGqcHs44otACO/0clJ1CT3GfM1L3AfWsGcsY8H7XNDZ6QFMjBMeq3eYw/jufsW8KNbAwMy7MRC4jxhYw/OHdFxDiuGim7lg8RbBR2J3PFwa+gXZL+OXhCI5VVXaTCL8Tc0Qv7Z5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhBd99vUeQDH9MjcrqYtzb5VuG8Aaj7TjIaoZMot6eM=;
 b=152m7LzdGzeuJRs4/C2Ah6znZE/qCiTbZLpl/Ip7UtkSBJ6gALda2MB3klTvAAYBKOSNdIOld2QMBMVFTgV/6YV2fIGfRUSUv8S3dIqw1pQ050JUHgfbQO0mWZr/uwthX21fl53YlTimqlnSBrqwDXNFiWfrlyphnvE9HMrCuyc=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1620.eurprd08.prod.outlook.com (2603:10a6:203:3a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 08:45:33 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 08:45:33 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Peter Hoyes <Peter.Hoyes@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Remove Xen irq lock patch
Thread-Topic: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Remove Xen
 irq lock patch
Thread-Index: AQHXOGC3ep6T3PVcokO5vaBbEJe5d6rTEovQ
Date: Tue, 4 May 2021 08:45:32 +0000
Message-ID: 
 <AM6PR08MB3461B34229304863B7669494925A9@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20210423164934.3238671-1-peter.hoyes@arm.com>
In-Reply-To: <20210423164934.3238671-1-peter.hoyes@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 18694F7B4038024AA59B31FC03132248.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cfe53379-bfda-48fb-7d24-08d90ed8ffa1
x-ms-traffictypediagnostic: AM5PR0801MB1620:|VI1PR08MB2687:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB268703AC25C140005C9392B5925A9@VI1PR08MB2687.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CBI5pwa61SeeQf7SEXSmKXUaRMAY8d3zrRVwHPmQ20uPKv1L5BDS2aWvF7ZJhFOm4mpxSmoaQsOSuKS4SHUfKGdRJheuWIekjYpyKDe8+sb4aY7FaWA2GxBMhK6Zg66DUKxZoTJGCg3TO34EOXi8wrwZjH3Aa7aeWODAZWebzUv/bnzYpTaYW2dBaJfGxFEmEl4H5tKBtaclXXDTWWs7HQhOm4IQdoQrZStoTrr99D39QnLjIr4hNa1/+zxtSdwdFfO1q2DrpsLApZ2wvq9I81b4KL1UfxfuYiJ47jstc1lsR9OM4S4wL4m8V7WNSf/CX90WH5eO1POJ0P0j4Lz4WPreVLMdEXvPmU/KnUTnG3mkatc9nVksYkEGbhwmIgHJUT/tEiGLhi1YCQ2owLxkwOB+yYvBjL8hjP7M7ziCjkXSzekKW02THRIRfx1a0oA6TdCH/6x1Q17zNXmm24677OUil2nnTRa2lDBoiE6bxhcwDuF1xQlFXL/RZNq5jLYV8VteYqc75GONcL8Wr08zThrWjRq8I6Wi8+SKbTcQghurfOkftxKCwsQxOm/ScNCUpVIkCbe8n6REFDXMkqtDk+zR0ass8WqzPV7MEDxVtKI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39840400004)(376002)(346002)(38100700002)(83380400001)(6506007)(2906002)(316002)(55016002)(110136005)(186003)(478600001)(26005)(7696005)(122000001)(8936002)(5660300002)(86362001)(64756008)(66476007)(4326008)(66556008)(76116006)(66946007)(66446008)(71200400001)(33656002)(9686003)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?AHHcSGAMlGpgT4Jwh4NhWOfTh914Ox74XiEBxksGSmgDUsDdZBd9PgmlZd5k?=
 =?us-ascii?Q?FXQ6UkhHYPkCGVpfM+2E09Jrtaoene0jOyl42BTfHeqTmYE49+tTUjIG815z?=
 =?us-ascii?Q?6Bdrglqr+uEMoEt/V6yOiEszPF2DosPu7HMvMcfZibu2XkSgqMuO6xL/ntnn?=
 =?us-ascii?Q?A/gqgGAw77f7AoU+Sv4gPQ0VwHd2lTqXMD0+JH8GR9VLcSyAFsRZ4FBeM3nv?=
 =?us-ascii?Q?M//Y/mOY0JdT9uGb+cpOgbMrUybl6udmmxeZA/F3iyedNbb8Big1L760wB3p?=
 =?us-ascii?Q?dkymoNPwTCjFP+M5MHagvfnCA6tVE6GQsE7ZVAI4s7v6aQQnAR4/sw+goXnm?=
 =?us-ascii?Q?arGmvoYAKUFJxm9YqU7WTIs2x4vTRtqScNXQQcTcD+6naU+oIXlb9sCqvfqz?=
 =?us-ascii?Q?acPAnvbpXGH8tQmWk943ZbOb+tSrHoI/RTp16kWsIwR24yJohRidcRK2LQag?=
 =?us-ascii?Q?y7qYE66M5HYfveYI1M2JeZQvozhziGnioKgzvgzlsYAwUVf1/LSLoh69esSI?=
 =?us-ascii?Q?Rdj83jkSa1yvfwL58alIws5fjXm3v0E4rN0joLeIoO0tgOt5uiJE9/bR/iNR?=
 =?us-ascii?Q?uEFFoga5uTKQVu+DwHAFSL26ubjfVToelXflthwomkP6yhoCQTYwbhUQtoW1?=
 =?us-ascii?Q?BSW1pjW98s69ENtLmpe3hOlOMrbZ1Eer0PJj1aGJwIb4GyTxfLKEjHGWUOl3?=
 =?us-ascii?Q?ZdmgKJagyzRu4lfMbDtlViqQ7CBLPMa4ZIKdnisDSgYvZscNvLd3tkhdvvs+?=
 =?us-ascii?Q?h7DGUCeSgV6uNnsoQyU+NoG8gPVbvrPEWSLK7lUI7uUY04ZOo2hMn2LD1hMX?=
 =?us-ascii?Q?GbhtV8lPM8m1N5UjLc/zvP+A14p2NyJHj4E+SBndhhibxLKPFOlDyMleNhFr?=
 =?us-ascii?Q?ux5Btojkd3TmSHL9ew1xuIyrpqMy880IxkSnluLvQf3FfYXURKkLCSwBSKSI?=
 =?us-ascii?Q?1bdSED+heWsh29QDZcDL5ri+XJLAU6BE2rXmfwmFEq7+bw/SZr7nRS+qyZGR?=
 =?us-ascii?Q?SlWRiVkJmuv4pvTuNDJCUEE9bc5RSYBhZXWjZoC61ZpHSgWTjas79FQa8p3P?=
 =?us-ascii?Q?OwlmNVYU7crn3IIvVDjJQH+H+erGB+iQJ+cR7tsuiN+8Y7V/seFx0FnKPdZV?=
 =?us-ascii?Q?4xfsD13uioA8Xh2JavsdQLs5wQYFgcbkc/DXyRRADBR1hyJO5/tf7G1hGiDi?=
 =?us-ascii?Q?9JKelDGct5pw3EXlDxpwm3Op0TOkfO3pEpjYnZSSo57hSeto0mdue0DlZrO1?=
 =?us-ascii?Q?cjsZD6f5W3GAjS8bGRUtv3bEHgBXvHC1jifGu18PlFNzGGFvCWdZY/1Gm1uj?=
 =?us-ascii?Q?wajf6XevLABxuaz4KNKKljNZ?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1620
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b118dd55-5b0e-4065-8faf-08d90ed8faa2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8qVFbpIFtE8N+sBPr+3h6RaTPOxZhOpiF1pybLBWfxUUce5oDM5BRPCjozhk4tWvEBCfi3S8RkfrrceVl3xr6+OzO9ejbMkmPtHjqE0IvGdQB0hbYEQkbZ6MrKtvMgIMPjVf9y+U/mraaeXuGwhsmzJYj0Sn+wHGevZRKO7iIP3Mkb825arUss77TWPTQgbDVhZWOFwQ/H7BA+D04eVxAIFB20o6aWvCBCtK1Z/2IVNE21AXPAKT+ocsyXuHUs3KBXH7CBWYqxaH/wIUIe2BuGf6Xsxc63pS6Hm+pHr5RSTgsaDvHEL83lFPkiSVApu52Xf+aHgul2g1NM7D3Zf0t2Gh5CkiP43AcHxe7SjgcS42uFr2pljHSKZkGwUp3fObKuoijk341kTcs6Uos/e/WE9kiWwN43Pd8Dc3Emw+fNLyxviL1mOT/3Vr5jAA+qkhJf1fCer8EUaTRMRy4740CZMb7Cquqm+qWIKPBN+3cQhx6+YMJtLMkFnduOUOBG84NkQMDXvGIkrC5z9GXNJRVt+QVoT5mJQR2zscyVASp05x61Al8nL5n4LuQ/3LJOFS0EO8KXQMdWLToQUDvtao+Tx2QNX3YABfhkxi3Ajpz6JXPwMev4QE+HP+mgG9jQrQRnKdgmR4dYBp2dlA9RRcYsD7MkJ2jv04LVOAvJNfEPI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39840400004)(346002)(376002)(396003)(136003)(46966006)(36840700001)(316002)(356005)(70206006)(55016002)(52536014)(9686003)(36860700001)(70586007)(110136005)(7696005)(33656002)(47076005)(4326008)(8676002)(8936002)(5660300002)(26005)(6506007)(478600001)(336012)(83380400001)(186003)(81166007)(82310400003)(2906002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:45:41.3574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe53379-bfda-48fb-7d24-08d90ed8ffa1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2687
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Jon,

Can you please backport this patch to hardknott branch?

Cheers,

--
Diego Sueiro

>-----Original Message-----
>From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
>On Behalf Of Peter Hoyes via lists.yoctoproject.org
>Sent: 23 April 2021 17:50
>To: meta-arm@lists.yoctoproject.org
>Cc: nd <nd@arm.com>; Peter Hoyes <Peter.Hoyes@arm.com>
>Subject: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Remove
>Xen irq lock patch
>
>From: Peter Hoyes <Peter.Hoyes@arm.com>
>
>The following patch has been backported to kernel 5.10.30:
>    0001-xen-evtchn-Change-irq_info-lock-to-raw_spinlock_t.patch
>
>Issue-Id: SCM-2307
>Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
>Change-Id: I9cef017b60891780176dff944e3eca5986746d8a
>---
> ...ange-irq_info-lock-to-raw_spinlock_t.patch | 77 -------------------
> .../linux/linux-arm-autonomy.inc              |  2 -
> 2 files changed, 79 deletions(-)
> delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-
>xen-evtchn-Change-irq_info-lock-to-raw_spinlock_t.patch
>
>diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-evtchn-
>Change-irq_info-lock-to-raw_spinlock_t.patch b/meta-arm-autonomy/recipes-
>kernel/linux/files/0001-xen-evtchn-Change-irq_info-lock-to-
>raw_spinlock_t.patch
>deleted file mode 100644
>index f37be44..0000000
>--- a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-evtchn-Change-
>irq_info-lock-to-raw_spinlock_t.patch
>+++ /dev/null
>@@ -1,77 +0,0 @@
>-From 3bc59ed7bc26c967cfe6eb9c1ef9a1ef9108e99d Mon Sep 17 00:00:00
>2001
>-From: Luca Fancellu <luca.fancellu@arm.com>
>-Date: Tue, 23 Mar 2021 16:16:39 +0000
>-Subject: [PATCH 4/4] xen/evtchn: Change irq_info lock to raw_spinlock_t
>-
>-Unmask operation must be called with interrupt disabled, -on preempt_rt
>spin_lock_irqsave/spin_unlock_irqrestore
>-don't disable/enable interrupts, so use raw_* implementation -and change
>lock variable in struct irq_info from spinlock_t -to raw_spinlock_t
>-
>-Issue-Id: SCM-2147
>-
>-Upstream-Status: Pending
>-Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>----
>- drivers/xen/events/events_base.c | 12 ++++++------
>- 1 file changed, 6 insertions(+), 6 deletions(-)
>-
>-diff --git a/drivers/xen/events/events_base.c
>b/drivers/xen/events/events_base.c
>-index 7bd03f6e0422..b91c19b90b8b 100644
>---- a/drivers/xen/events/events_base.c
>-+++ b/drivers/xen/events/events_base.c
>-@@ -108,7 +108,7 @@ struct irq_info {
>- 	unsigned short eoi_cpu; /* EOI must happen on this cpu-1 */
>- 	unsigned int irq_epoch; /* If eoi_cpu valid: irq_epoch of event */
>- 	u64 eoi_time;           /* Time in jiffies when to EOI. */
>--	spinlock_t lock;
>-+	raw_spinlock_t lock;
>-
>- 	union {
>- 		unsigned short virq;
>-@@ -280,7 +280,7 @@ static int xen_irq_info_common_setup(struct irq_info
>*info,
>- 	info->evtchn =3D evtchn;
>- 	info->cpu =3D cpu;
>- 	info->mask_reason =3D EVT_MASK_REASON_EXPLICIT;
>--	spin_lock_init(&info->lock);
>-+	raw_spin_lock_init(&info->lock);
>-
>- 	ret =3D set_evtchn_to_irq(evtchn, irq);
>- 	if (ret < 0)
>-@@ -432,28 +432,28 @@ static void do_mask(struct irq_info *info, u8
>reason)
>- {
>- 	unsigned long flags;
>-
>--	spin_lock_irqsave(&info->lock, flags);
>-+	raw_spin_lock_irqsave(&info->lock, flags);
>-
>- 	if (!info->mask_reason)
>- 		mask_evtchn(info->evtchn);
>-
>- 	info->mask_reason |=3D reason;
>-
>--	spin_unlock_irqrestore(&info->lock, flags);
>-+	raw_spin_unlock_irqrestore(&info->lock, flags);
>- }
>-
>- static void do_unmask(struct irq_info *info, u8 reason)
>- {
>- 	unsigned long flags;
>-
>--	spin_lock_irqsave(&info->lock, flags);
>-+	raw_spin_lock_irqsave(&info->lock, flags);
>-
>- 	info->mask_reason &=3D ~reason;
>-
>- 	if (!info->mask_reason)
>- 		unmask_evtchn(info->evtchn);
>-
>--	spin_unlock_irqrestore(&info->lock, flags);
>-+	raw_spin_unlock_irqrestore(&info->lock, flags);
>- }
>-
>- #ifdef CONFIG_X86
>---
>-2.17.1
>-
>diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
>b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
>index 6927987..5361e75 100644
>--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
>+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
>@@ -44,8 +44,6 @@ python() {
>        and oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonom=
y-
>guest"):
>         if LooseVersion(kernelVersion) < '5.9':
>            d.appendVar('SRC_URI', ' file://files/0001-arm-arm64-xen-Fix-t=
o-
>convert-percpu-address-to-gfn-c.patch' )
>-        if '5.10' <=3D LooseVersion(kernelVersion) < '5.12':
>-           d.appendVar('SRC_URI', ' file://files/0001-xen-evtchn-Change-i=
rq_info-
>lock-to-raw_spinlock_t.patch' )
>
>     if kernelVersion and LooseVersion(kernelVersion) < '5.10':
>         if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonom=
y-
>guest"):
>--
>2.25.1

