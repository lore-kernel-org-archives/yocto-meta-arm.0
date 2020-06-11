Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.68])
 by mx.groups.io with SMTP id smtpd.web10.2751.1591862115354935392
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 00:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IUjxFIOm;
 spf=pass (domain: arm.com, ip: 40.107.6.68, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6vFZ44o5ruNlDSI8Fi2sSGpPKUNPIfeT+RJiU4erAw=;
 b=IUjxFIOmzH9A63e+3MlYnXLn9gzhH85BQBM3rqvd7RLMohDmnU5raegSujzHQLx0yHswe3x51Lpa2qSKaiHpRonM5/oj80T40pTvTCUHy8F7yEu/EEDxAfWa/oLe336LIZqzlAS0jZq3ucWJOuQRhzMlA3LrJVR2CcJwR4UYlzY=
Received: from DB6PR0601CA0043.eurprd06.prod.outlook.com (2603:10a6:4:17::29)
 by AM4PR08MB2657.eurprd08.prod.outlook.com (2603:10a6:205:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 11 Jun
 2020 07:55:12 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::89) by DB6PR0601CA0043.outlook.office365.com
 (2603:10a6:4:17::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Thu, 11 Jun 2020 07:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 07:55:12 +0000
Received: ("Tessian outbound 4f5776643448:v59"); Thu, 11 Jun 2020 07:55:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 542f32bcf2dba257
X-CR-MTA-TID: 64aa7808
Received: from 45847edd7808.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 961B45C1-8E1F-4FC4-972A-157F1B209C49.1;
	Thu, 11 Jun 2020 07:55:07 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45847edd7808.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jun 2020 07:55:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTMzVfMNPGcMh1woUMAY3ibVduc6QaXNMinPOlrMFrzjxPM1u8DPCPgAaDMmgDnBEff7nevlNwro2KM2XzZHiV5oH99xL6sfWP4MiWbdE+upAR7ItOefv3QPacV3REdWOc4Zd4jIqhAk1xCv7Y3lucFh9yXkIV/MaGYeowmontt0kTnaRrEABQGujoKBm0SZSfVllg5alSV2a3jEhsRyVMM2CJi9vgwkZrCc7rzrc9ZsZmd0LTsr4gVGDE75ZYEOqpEO7iQKz/74uJvCtRlto0WYhsoXDn3nDviIYsE8IziydsAj/y1Us3nzcereB9dJ92CsGSMJqxYhFoom1YGH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6vFZ44o5ruNlDSI8Fi2sSGpPKUNPIfeT+RJiU4erAw=;
 b=Uao55pSbRodJ3pfojNM0FEpbgEZIaisLheB+u2FUglIP9Rv7AMREPbZFHF1lawZwRgxWYaVOcLw4QsXYbB/Zlb0XUCek1R0GKjWHvOtylNuhOp6JNkG5rqfw9TwR9VbxqblggkyLCyPT6Opx8+5HtVO167e/wfVeG7ITkJHaaaS7p65iYhTZ+BwCBqsOaih6CpZBJ0XQe6kGbmm5Ljl92b7lSTAF5gphgWhS0jO9qbPqnG2KbYnLVTimpv4Sr35zVNjIsKV8Kp+1erSBpAjp9AajPU7j248K4q+e+fe4nPR4WOnFCrZ28u4FO+is05qTy579jWkEagajQ545RckVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6vFZ44o5ruNlDSI8Fi2sSGpPKUNPIfeT+RJiU4erAw=;
 b=IUjxFIOmzH9A63e+3MlYnXLn9gzhH85BQBM3rqvd7RLMohDmnU5raegSujzHQLx0yHswe3x51Lpa2qSKaiHpRonM5/oj80T40pTvTCUHy8F7yEu/EEDxAfWa/oLe336LIZqzlAS0jZq3ucWJOuQRhzMlA3LrJVR2CcJwR4UYlzY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3514.eurprd08.prod.outlook.com (2603:10a6:10:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 07:55:05 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 07:55:05 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy, xenguest-network-bridge: Set bridge members per machine
Thread-Topic: [meta-arm] [PATCH] arm-autonomy, xenguest-network-bridge: Set
 bridge members per machine
Thread-Index: AQHWP8TTTKGasO5/yUeMlSKy+J+qy6jTC7KA
Date: Thu, 11 Jun 2020 07:55:05 +0000
Message-ID: <5DAA03B1-3E78-4393-A538-E2A73C0F3801@arm.com>
References: <1591861655-35452-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1591861655-35452-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d163bb41-6472-447c-08de-08d80ddcc53f
x-ms-traffictypediagnostic: DB7PR08MB3514:|AM4PR08MB2657:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB26578F83B03F7F23242325049D800@AM4PR08MB2657.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lbplJlnnubYpJRT7m0OtEW0nyIin39jnZ8xtrNwQUi1tVlsgc48cjABuFEmKiZ6rwxZFvpPmf1rkg1jXUS2hTFRsW2HyTaozUtYct01xpb9elMVWQXYwM1B3QH/IbSrqAckij7GdgXb2YD7+wOdcvGZ6dv+WogUCuHTTIsQsuQQPgCjQpZJip2wnldKjLUjACTYaCAsacxr/39cpwr41J0h2wnVp8TytAAF0iwJH4+BEy08enQU1aRRu5hJwLl93QP/oFkS4AIgRfAIqGJUb8urnKdYU5741E2YrGMHjZ79ERvR3vyXoCCGLDoEN9SdnCeokknFoH44yrz5FIUjeJAkxPb7E9c8cYjEpd6wy5UmYcvaQwtsmxn00Kc7emQ/enQY7tfqWh1FniH/AvWGOpw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(6636002)(2616005)(186003)(91956017)(36756003)(66446008)(76116006)(2906002)(478600001)(966005)(64756008)(33656002)(66946007)(66476007)(54906003)(71200400001)(37006003)(53546011)(66556008)(5660300002)(316002)(6862004)(6506007)(8676002)(86362001)(6486002)(83380400001)(6512007)(8936002)(4326008)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 UBcOtsepBk5iZxnhhtzl4Q2mlk8dydhboya5rbkiwdhFyW33k/KjYwtStlO/ZbUb6l6xd/XRE7eg17X3qWvg3OM8ltNmOw4g/PXztbIaBozgM2m2yP1PT8Ax/0Wc7fG43rx25EoL4weBYwupVDd6+hmELjXzbitVPhMW0zG3b3n2QmE78+Ex80aJU5NmvCaNV22v/0U3CGk/3Q5zryLMaTsnqxhhzMGt17c6MYYd49fUtDunRB9/PUZyKmFxHgxn/V4SWsRmPk0n45/9WEStpmzOnrl/GTKSX8d5Gc5xpwu0+RM+RpKWEUI83+xPVu0CHqsAw23qWLIqy21NslxCMFhFaDhVKePzt/nQSJKwxCpGERt5yTJchTykkk/RZ+CSu32iT0PJdIu10D610QIzWPKIU/6pV2/AQMGLQ4r7vQUHxM95BczZhnIXq3lfvXMlhgiUVBBxoTvRtcRWP86RoT9xVC54Ip1E/QoU3wWuywcXUs8KL+evKVoMbg+TsG6r
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3514
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(70206006)(81166007)(26005)(37006003)(8936002)(6506007)(186003)(6512007)(82310400002)(33656002)(966005)(6862004)(83380400001)(6636002)(2616005)(53546011)(86362001)(478600001)(356005)(316002)(2906002)(5660300002)(8676002)(70586007)(36756003)(336012)(47076004)(6486002)(82740400003)(54906003)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	529d19d4-1dfc-4871-75ba-08d80ddcc0eb
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m5Y7f7hDopzX856l8M4bCv/3vnhMgk9sFqsZY3DsZLwS6kq/o6qXu7TNfdaJScJc2/cWMtjlZj5H1eD7DolncFRid1Xtg9O3hwBOcIlMWzqt8vXdIyM8TRH8LYTNM7lWYel8FW+YA4r2quMMtqzqSOsAGTW+Pn85UJecn56uUBD/aRxTzslbQfRp8Ba0hxOK9IF0312uQltgMClmsj6JC6oTEnQeqwAl9MfsGW3w4YHqJ69VXdkzf+QMtKzOhROtK/0OuAE8FtBu2oov5dEtPi8dKm25mNov30RMg3pEyEq8B/N6p7DQ4w77S0XB4dyyb0i1DoGzMXpFzj/VSvjVBMpa2yEtckxkdNWsQBnF4UMz08IATfq5T7ps2ngUST54JSoLlCUFHxEjUrCDFCIZqEOpZTY76CB/Po797QaJuUl5rTMLpSGO8lVzksG2ais977nl1ricf3NB9fBVdMWkg9PZOjj8bRi8jir4QVDnqXo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 07:55:12.6054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d163bb41-6472-447c-08de-08d80ddcc53f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2657
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EBF489F73B13B344877C990CF4B2AB24@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 11 Jun 2020, at 08:47, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> By default, XENGUEST_NETWORK_BRIDGE_MEMBERS should be empty and only be
> set per machine.
>=20
> Change-Id: I67c56847eb785279c28757a6052f092c838babe0
> Issue-Id: SCM-995
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../recipes-extended/xenguest/xenguest-network-bridge.bbappend    | 8 ++=
++++++
> .../recipes-extended/xenguest/xenguest-network-bridge.bb          | 6 ++=
+++-
> 2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-exten=
ded/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-l=
ayers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappe=
nd
> index dc84921..de88cce 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen=
guest/xenguest-network-bridge.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen=
guest/xenguest-network-bridge.bbappend
> @@ -1,2 +1,10 @@
> +XENGUEST_NETWORK_BRIDGE_MEMBERS_n1sdp ?=3D "eth0"
> +
> +XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?=3D "eth0"
> +
> +XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?=3D "eth0"
> +
> +XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?=3D "eth0"
> +
> # Juno board has 2 network interfaces, add both of them to the bridge
> XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?=3D "eth0 eth1"
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-networ=
k-bridge.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-=
bridge.bb
> index babd694..c6c2242 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridg=
e.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridg=
e.bb
> @@ -9,7 +9,11 @@ S =3D "${WORKDIR}"
> # Please refer to documentation/xenguest-network-bridge.md for documenta=
tion on
> # those parameters
> XENGUEST_NETWORK_BRIDGE_NAME ?=3D "xenbr0"
> -XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
> +
> +# The XENGUEST_NETWORK_BRIDGE_MEMBERS should be set in a machine.conf
> +# or bbappend file.
> +#XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
> +
> XENGUEST_NETWORK_BRIDGE_CONFIG ?=3D "xenguest-network-bridge-dhcp.cfg.in=
"
>=20
> SRC_URI =3D " \
> --=20
> 2.7.4
>=20
>=20

