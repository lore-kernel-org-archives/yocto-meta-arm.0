Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D04C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:55:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.51])
 by mx.groups.io with SMTP id smtpd.web11.12812.1692888902784114195
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 07:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3fEhfLn5;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3fEhfLn5;
 spf=pass (domain: arm.com, ip: 40.107.7.51, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6Qn61KvQ/7Zc3LHCxMaPZA606+KAMudpxjT4co0O0M=;
 b=3fEhfLn54C8AspkM2BZyJrjGapUJrhdVmYZd+zTK8nOQEJg5V6+wj9MmNUtmw2hRBPlmV397uF5p9OtbR1Mtahnq391CxwZBry6JP4Rx3JdfRtb6luFnXhqrjIHC47tSy9Bv0b0F693V8rEQ+twDg4IAmh900RJaq5rECm1/EP0=
Received: from AM0PR06CA0142.eurprd06.prod.outlook.com (2603:10a6:208:ab::47)
 by DB3PR08MB8820.eurprd08.prod.outlook.com (2603:10a6:10:438::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:54:55 +0000
Received: from AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:ab:cafe::72) by AM0PR06CA0142.outlook.office365.com
 (2603:10a6:208:ab::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Thu, 24 Aug 2023 14:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT054.mail.protection.outlook.com (100.127.140.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.19 via Frontend Transport; Thu, 24 Aug 2023 14:54:54 +0000
Received: ("Tessian outbound c99fbc01d472:v175"); Thu, 24 Aug 2023 14:54:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c969c08808f3aefa
X-CR-MTA-TID: 64aa7808
Received: from 175f9806acd1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F6F85281-CBBE-4AF7-B685-CF6AD3B12CFD.1;
	Thu, 24 Aug 2023 14:54:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 175f9806acd1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Aug 2023 14:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwpoRp5TogNt/f4N0g3JHns5MaMFkfeRuJ9g/7MJiFPZBEOA5X5drfZ7Dp0wGDqGepwf7oKzX/Lm8yhvdU5Qtgb5MULwmvZEX2iJaONDfzpTFa/+PzjAWo1HVg+uCLwtIe8ATknZa3oZFxtf9FSmm2j5sEA0iQk/gZfQQxG9lrXpLgSYGDArIDYotdq6XD6BewlRlqDClkhw+UNcXeauuZlLsWaeqoD7Ie9a0IK3T8IPHKzmeyJdP9v2BKQrAcRNfeP/V+FFfCaxoosd90gt9jd2LP3c6dIczXeOvDmCdJt3SJ1Jq7A3EgGEXm4IRcpsB324hhGemxZV6y1Ksbs5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6Qn61KvQ/7Zc3LHCxMaPZA606+KAMudpxjT4co0O0M=;
 b=m8yCINhmhWWXgqFVHYdE7FGscdNbrG66rdfS/Qurw3oFv+/uHqsyAWAzpIfoxQnpUYW9M4v/DOp1pSuH3Iz3TR+FV/Loh3m1/lmTQBq5DtJjDJSek/K2UWt071tQcH0xUknlZQOM9XWF45NYn2Gx0fRufZ95CzNBKyMM/L43zfABdb/gmgXLM4t1fRAMyEC40Zifb0CbppFyLw1sS4JnYIY8aSMgi3fvbxXxoIdxavmitAsA/kkaKCT/Vssv9zVtBOw+TZSw10uxc2fCQmeErVWWiLsri8ZJwiTKqRClwN9CFKNSWIvXLLsUUJMgX84L65sFaWphwQ3M1UOpvqL/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6Qn61KvQ/7Zc3LHCxMaPZA606+KAMudpxjT4co0O0M=;
 b=3fEhfLn54C8AspkM2BZyJrjGapUJrhdVmYZd+zTK8nOQEJg5V6+wj9MmNUtmw2hRBPlmV397uF5p9OtbR1Mtahnq391CxwZBry6JP4Rx3JdfRtb6luFnXhqrjIHC47tSy9Bv0b0F693V8rEQ+twDg4IAmh900RJaq5rECm1/EP0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5463.eurprd08.prod.outlook.com (2603:10a6:20b:106::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Thu, 24 Aug
 2023 14:54:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 14:54:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/secure-partitions: fix build with GCC
 11.4
Thread-Topic: [meta-arm] [PATCH] arm-bsp/secure-partitions: fix build with GCC
 11.4
Thread-Index: AQHZ1prBNXMqJrx17EyFdPsIKpeeVq/5iJCA
Date: Thu, 24 Aug 2023 14:54:42 +0000
Message-ID: <2925F8A3-4D78-4A9A-B023-B2C29F3B3D02@arm.com>
References: <177E595F7487AA67.17289@lists.yoctoproject.org>
In-Reply-To: <177E595F7487AA67.17289@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5463:EE_|AM7EUR03FT054:EE_|DB3PR08MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: fd03d97c-e777-4d41-4d1c-08dba4b213d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qYZVtq92tMlIF7+8C7VxE4yn/GvURzBWz5fRSnWw3OTWZOl+4c0N4anr8kPEeAGrbiQFsGnBfqslyazZ+1Hf/SkY8cY+TxOOelnBGB4wvxHRXaCgtuTe4YNqGGU7N4Gt+2Xb9J99LYr3ZwvhZKO0dLpWQ+KbhdLyNGnadiHpeExC1chsCZMva0QRrTo/MkX+6gGxJolYcuySxGxMIR1U+WtU1S5y37SlLLtbikSHdP0k3JNBAYuwNQVXE669AcoQ2/y07o3jJ+0iKKPQPzoNX3GZH4dll3mdTubi+E3cqVbHMRqbz4/EDRtF5NfD1rMOtDLRCe1AOuzGEtQ5xuukTCHaXq/yXcanGNx1I9biMIjMuNHL9/QODQXZolzEWPB3U4rdzHhe0yxFjxM+qKtcdUKDoKL+xzCkp4JOVxUhFXv/u4tbsSij95PLzh6L/j5VVIFamlJi2UbZgt9BbAxtZsLbSPHNz2BB3ZHQvWjNZmkYtWzSyb8lmHOhk/xDout8MhxWO033uC8gM88+khabYYVvsn9QtWM/g6Fn2IcoxzgBa8GdSVFd1tC2EU/5eH+kY1aC72DQQhERP3PKoJmYqY+RZ/ZVxoUXQbIVIHzJPvlJAziw1nNa53MImcOZnoe8ULrf1h9bN4AjUm+yEw1swSthAixBSKefsTzqtid+2Bg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(186009)(1800799009)(451199024)(33656002)(36756003)(86362001)(122000001)(316002)(91956017)(478600001)(41300700001)(66556008)(66946007)(37006003)(66476007)(66899024)(66446008)(38070700005)(966005)(76116006)(64756008)(54906003)(2906002)(26005)(53546011)(38100700002)(6512007)(6200100001)(8676002)(8936002)(6862004)(83380400001)(6486002)(5660300002)(6506007)(2616005)(71200400001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2D557A60D489294EA7D8DE8141A99BD0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5463
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cda89ae2-c95d-45ee-a424-08dba4b20c64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0wYfKkXaqq3pq6JBowLn6Uw8U4+Nmp9UEWKnGuokqPAVj3drIrGE++a4U2YoG9OFMLGvyk+8EVm1gAt5+mk9vLJCC1xSjd1DsbYwL4Npmey3krCNKcuQ1hoRHOpzE+BWEPv2vA4QJXpS/guXd9Ls3nBrIe0Odn8f3OVCFo+UmFEFUjClGkVc+IQ1DTH8ZyLdiV3ZDcv3sKwsJg86seEBd4dR053fss66vk2akNT9WPDiWx+LB5WSf5wqcjil27OeMvYNZyfOd3j3vsugCUkDf3vWGOgl/rCsaXlhhE6C8cc/BCS1tOstkFh3of8UIl2RgN77EFqwfUBbyZGgGM6Ipm+h8/m3MVEt7xF6pK4LjfTWTnaYQpsJFubX7pLkXB+P5h81uKDDMAdX27nADcYmdaFT/pwDD+XhzrDU07SFXefVwORX7OcCe9BCR+g06Jlgh73sHchViDWvT5Pt2/1tkqQHi92kOnyllzW4ay8jOY3AHE2JDGgay7XC3aue/xExeSvQMDuQIF7D518ufw3vB2muDZJx+8+LDenvkyK1houIOa3KiiMOlkfLQ7kH26WAW9q7MruCm8FiF0pyMO9inHDb2pA/Yij15eE9OJBHeFgNoMMZ6reZgYBPX005RRUGTOZi57d6f7mbF+uiOc2cfuI86NyV5ZkTTUcMjU3ddBJyMJF8qMZg5Z3bV82MtPh/g1MfEpPjBKaJbQC2xxRtvC879qD/yTeSxCeh/r01gZ8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199024)(82310400011)(186009)(1800799009)(36840700001)(46966006)(54906003)(6506007)(37006003)(70206006)(70586007)(316002)(6200100001)(478600001)(26005)(36860700001)(356005)(40480700001)(82740400003)(81166007)(41300700001)(86362001)(6486002)(6512007)(2906002)(53546011)(966005)(6862004)(8936002)(8676002)(4326008)(66899024)(2616005)(5660300002)(83380400001)(33656002)(36756003)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:54:54.6312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd03d97c-e777-4d41-4d1c-08dba4b213d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8820
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Aug 2023 14:55:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4994

Ignore this, forgot the branch prefix.

Ross

> On 24 Aug 2023, at 15:52, Ross Burton via lists.yoctoproject.org <ross.bu=
rton=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> From: Ross Burton <ross.burton@arm.com>
>=20
> GCC 11.4 has improved code generation and needs the __aarch64_cas4_sync
> intrinsic from libgcc, but one of the modules here doesn't link to
> libgcc.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> ...7-Add-openamp-to-SE-proxy-deployment.patch | 25 +++++++++++++------
> 1 file changed, 17 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch b/meta-arm-=
bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0007-A=
dd-openamp-to-SE-proxy-deployment.patch
> index 06fb4979..3cb44aaf 100644
> --- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
> +++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
> @@ -53,7 +53,7 @@ new file mode 100644
> index 0000000..840683a
> --- /dev/null
> +++ b/deployments/se-proxy/opteesp/lse.S
> -@@ -0,0 +1,19 @@
> +@@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
> @@ -61,18 +61,27 @@ index 0000000..840683a
> +
> +.text
> +.globl __aarch64_cas4_acq_rel
> ++.globl __aarch64_cas4_sync
> +
> +__aarch64_cas4_acq_rel:
> -+ mov w16, w0
> -+ ldaxr w0, [x2]
> -+ cmp w0, w16
> -+0: bne 1f
> ++       mov     w16, w0
> ++       ldaxr   w0, [x2]
> ++       cmp     w0, w16
> ++0:     bne     1f
> +
> -+ stlxr w17, w1, [x2]
> -+ cbnz w17, 0b
> -+1: ret
> ++       stlxr   w17, w1, [x2]
> ++       cbnz    w17, 0b
> ++1:     ret
> +
> ++__aarch64_cas4_sync:
> ++       mov     w16, w0
> ++       ldxr    w0, [x2]
> ++       cmp     w0, w16
> ++0:     bne     1f
> +
> ++       stlxr   w17, w1, [x2]
> ++       cbnz    w17, 0b
> ++1:     ret
> diff --git a/external/openamp/libmetal.cmake b/external/openamp/libmetal.=
cmake
> new file mode 100644
> index 0000000..3a647e6
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4992): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4992
> Mute This Topic: https://lists.yoctoproject.org/mt/100936655/6875888
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross.burton=
@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


