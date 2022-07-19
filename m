Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF2AC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 16:05:40 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web08.42530.1658246735615503636
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 09:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=kCb79smQ;
 spf=pass (domain: arm.com, ip: 40.107.8.78, mailfrom: adam.johnston@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bXrE9scyEDw2KU69dTz8Oi1mGitOESUU0SI1qsjNcFDVqO25PFLNcg2Q/rNIBjSpc9dNKYIN8mkJEsVnFijnmIjTZvbs+ttJshvpn1H5ReoodZ3HAhACEyaubsq31C8QCPHWbOR0bkvLlhBvpd4WCxdU8oD5aJihr3M/LkSACCgA8eEYU49P9yjNoZf4n+YcAAHLlzwD17frx/2zYO3gRP2ZBWeBLQNfYJlEVJ4c70x//y2b6vSYL3Mr9cml5cAsoUenhl8zp8L/fFV2czj9usmlDVEumwhNznYlofST83em93Q+NWEd8XLx2W8GRQ/LB4oEp1VvboX53YVgk954Cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCOPamhpjozdBEMULdeOzsRrWeRwOJcRGAtlBza7d/g=;
 b=Q71/i2kkQwhSsSOAixSxrN3WljO3PjvanL/O+jD+pHiOIStuKp0f7KSKtLqS/ymIW34Gal4VR+uWM0vdMMNjmn8c8K4E+jViGeA+od/Gd8aJUpOmH6R22MbMklQY+8gHKTB8mF2OgAy7/N34F+BMe8zrcTss6kwJNWOfXll0ILwsIEK7VsNCIygnMZ3qTmWps82uelvh1hqS3+eeFjlYlStBoMciOOuiDuHzzgOnqFL30mF8DeL7v5Uvh/xX9ON2v1Cfuwgqh8Ut2okDC/m343roJl4XBSOFkraZjwnEOUhD+5halvAS+GOWEN2ogbjNVoFC2mpezJYwUFqGs1CmcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCOPamhpjozdBEMULdeOzsRrWeRwOJcRGAtlBza7d/g=;
 b=kCb79smQqFGuKACS6wyvTlGBkIFV2ziVRWOZe8J5isa5JEqz3ZdC1fODSl+syqHiwjzd1/4OVB8RD96L/ZU3bBZUprU69pkSZoTUQYWt7O5aRgJnQA46I+VQUsWUFqhRzsdaGlgrTP+WeTxt+RT0UeiBr6PllskYNKfz263u2gA=
Received: from AM5PR0502CA0010.eurprd05.prod.outlook.com
 (2603:10a6:203:91::20) by VE1PR08MB5248.eurprd08.prod.outlook.com
 (2603:10a6:803:10c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Tue, 19 Jul
 2022 16:05:29 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::bb) by AM5PR0502CA0010.outlook.office365.com
 (2603:10a6:203:91::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Tue, 19 Jul 2022 16:05:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Tue, 19 Jul 2022 16:05:28 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Tue, 19 Jul 2022 16:05:27 +0000
X-CR-MTA-TID: 64aa7808
Received: from bd2751441ef1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1CF310B-BA50-403A-8D43-224683D21612.1;
	Tue, 19 Jul 2022 16:05:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bd2751441ef1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 Jul 2022 16:05:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlIaJ9Nwo2Z6YGuuKhqeI+uL/NxGCV11Zx5XHpgvIRgeCOF1JPQ5eoMBJoEKmfDLb4+qBv5aIUNUNg6Hf50nJmOZm8AEZAzK0cKahxus2SGmtVGXQJGC6/i6yIdGDPg4AJcDONLdMYj3TtER6jqO8VDbvaGWDlAwz6LYhVW5W8V/EY0Lb0Edu2ztlEn/g+NTqNB2TtsaFNfMN1mnB7dvnGYnbsa5WX2DG9ZpKUqkSUfm+Oeo9H/LXzo1qUBcplDYOgfbrb7WKn6pEJjjq7O7UhbZJn+4dClJI3MN4k50yBCrOPBg0mrUpu8ohka9xY1izlifTf2ZDXvug/OkRC9apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCOPamhpjozdBEMULdeOzsRrWeRwOJcRGAtlBza7d/g=;
 b=daDaHNh7GQb/fT+LsVnjFLZFt51H8m23l8dTegr46Q0pvwikvK5nVhHAkww9+J24T4FdP7Y5tcFVehnJTXgT46CHRZDRHYPD0p/fW/Y3e0qLDrG8HtNRC/ij5erQjlBf128NjYOhSku+lQUbvS1cjg767LnbEeU0Au1CR0fMuAPVxrRRbWHkVsKyLur+VpeR4cC+r1FDtIBL1dyzpgVPcdaFLMeR7c6RnHjoyIhqWDRULrwqB/qqkXpX1Tz+m86GOPX5zrRd/W02AM3m+V6ZSK1qSDyhJ2z6zuhIVZcuwiG0LQy+Wz96kCghXZgqQ+cdRrjZKIkbalNYnp/h7bARFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCOPamhpjozdBEMULdeOzsRrWeRwOJcRGAtlBza7d/g=;
 b=kCb79smQqFGuKACS6wyvTlGBkIFV2ziVRWOZe8J5isa5JEqz3ZdC1fODSl+syqHiwjzd1/4OVB8RD96L/ZU3bBZUprU69pkSZoTUQYWt7O5aRgJnQA46I+VQUsWUFqhRzsdaGlgrTP+WeTxt+RT0UeiBr6PllskYNKfz263u2gA=
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 by DB6PR08MB2854.eurprd08.prod.outlook.com (2603:10a6:6:1c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Tue, 19 Jul
 2022 16:05:19 +0000
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::5b7:7899:7588:22a5]) by PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::5b7:7899:7588:22a5%8]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 16:05:19 +0000
From: Adam Johnston <Adam.Johnston@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH 1/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to
 fix aborts when accessing virtual memory
Thread-Topic: [PATCH 1/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to
 fix aborts when accessing virtual memory
Thread-Index: AQHYm26lM2Ub1BCVBUePh8dvY8GNfq2F0cCAgAAJrFA=
Date: Tue, 19 Jul 2022 16:05:19 +0000
Message-ID: 
 <PAXPR08MB6432D717560C0FCA9B93BD4BE98F9@PAXPR08MB6432.eurprd08.prod.outlook.com>
References: <20220719125325.923598-1-adam.johnston@arm.com>
 <20220719125325.923598-2-adam.johnston@arm.com> <YtbNzdle16tMkd7q@kudzu.us>
In-Reply-To: <YtbNzdle16tMkd7q@kudzu.us>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 29F61F7B6D557B43984A70D5E6ACD9A4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6e5f86c0-3bb7-497f-fa15-08da69a07fb1
x-ms-traffictypediagnostic: 
	DB6PR08MB2854:EE_|VE1EUR03FT033:EE_|VE1PR08MB5248:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Ft2Vrzm5sLmTaF66R/GvfpGBEX4IGCR9P56SGy5J5Kv/mNDMcYJ8TfnzSTkl3btkJBHGztviK2NfbNSfJpxjiYkzryXZa7PX+g2ETP726PlaeFN21VTkHLtiiNnFGS2UX+Odzfk5w98F9etQ0cohGk95DKjGsz082taQ0/tPcBsot9RSMS7B/ezg47uaKvXuEdQhNL8/MCAzuhirKj5yncZmIsjNhk5edR4/NChNKAcP8jitoIQztkI2JqX2jd2yIk8wne2d6VOr0V3VgUL4kExyR9nParGqOLAYCzRdjZk74uYefbaoj6nJx9b4gpz7silYdoqCZZ1b6jSvfeJXoWTf6/6jAm3HLxRKVHQbmHRVGF8DDNC1GDdlovYyNX7BnIqsFQwxn0pMxC3X9y5yhJPU28YIrjYs/l3IuoNir7aXu4MKhCLdz1V9KQjHCXpiF0RFy9zd/hmybEQqsOSK68J4zuso6vx20m6xz2b/y2T2uItbSd3w08NF42rWBjBbi7IMP89VAxBKMSjkii6FC96YfdCipSx+ef5EMzfDdH6sCQ1ul8HNUkwbm124yaj5lANLm4wmTeLFnmIbSXllBZ/X9itciX7PPIdhQTDgZ9PIMfohA51CUjY7EzAafto78s9nLuxE4dWpX73lwHIe0+Cx9fwNd0w4Yw4tppwtUMx9CI/sP8Vv97qjUajBtHEWdsXP/iawKyDnPNYSpgy9OvKXvnuspAgSPgg30FO7B9YGXjrxP0FEREA45ZQF+i1ZuB04UQTwwEjjaK2etus8Y06eylpa5jCzduocZdHO10zoUmdsXNlwHD8j3YzORmptccZWTtnrzHAspG/97tPyg7nd5xUs0a7eV5tlBgmlDAFc7wtAL5TOO79AsTEcGQ6r
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6432.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(54906003)(38070700005)(6916009)(19627235002)(122000001)(316002)(55016003)(38100700002)(5660300002)(83380400001)(26005)(9686003)(64756008)(71200400001)(66446008)(66556008)(66476007)(8676002)(76116006)(966005)(66946007)(4326008)(478600001)(52536014)(53546011)(30864003)(86362001)(33656002)(186003)(2906002)(8936002)(7696005)(6506007)(41300700001)(32563001)(579004)(473944003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2854
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17b726c9-c302-495c-95a7-08da69a07a5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YS8SYnNGxSAJyV1GZZZlj+Qggkz5l70xJ03iIP28zxVc0quUMjcA4zGBvGlccUPI6iSkTO0ceQSGfNCNN6b0R16LbZ/iHmxTE/WFqIrS6o5bfNwZEKgjE/LzKkyd4GAdmnk3NUH9U0F8TrSjxV43ZQT0tUe7o/Y4qBe5BBQ7HpUD1SZ2M5Om2nQzX3HNwZ+gDfkQYVzgBjRfh1IKOAKVmWF79QdDHTsHDfbG2twrhg2IAVgayk5b11ooInSViifa3TJO68eqrBum2kA87pMiAqTuXzLXzTftzJGVCutbiGCtAbK9i5z6fIG3W4d5GSZRg4TWuPwty04FzQ0sBnDdfGV5WrlofVYM1gm4zuOMO425JY8orp/o+oJN5PBaAau9DBulbBp2cSd01NN4vGwJlpkmfYme917BcTiHw+4UeI/zxdAlpHWq6eB16yqkX78lzgsTGUFz11zCNqafMmG9pdoXgTtz0t5gRsWH4u16PBDN+Lqt84oTMulCQ5USPXgY9d8W+Qkry2kdW1EyKXFr15N/RS941iWc60mjHcpbtsNdu5YoW1rfD0JwbIA8BUGmlV8AqfdE02GGpDDI1lwr5ugOO9+xp7uJaGNEpFqZNNdNG8CeM3WvOhSF7k9o4RTzf3kV4OfouR5UpsqMCySBTEEOUL93QFtNTM0CdFpETO6hepL2w2JgZZpeuMmW+FVcB5MNlpskWy4F/iAWHbWWAqFmMLgAyZeGLMNbNEzKpftJjUh/WvtVxIjES2IIo2z1N01VOIurjfGDB/ANl2UoX+gQ9KPbkltSTFD4roaP/k+nduy7iw2p2DwhZNNSpdcLOAlyL3LWur/rOU+K7qrc0zeH8Fx1kPehEFsXkt/dwqXnHZ7JE7ItLwWM99F8Jod6
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(40470700004)(46966006)(86362001)(7696005)(9686003)(82310400005)(6506007)(53546011)(52536014)(2906002)(41300700001)(30864003)(8936002)(26005)(82740400003)(5660300002)(356005)(4326008)(6862004)(478600001)(83380400001)(186003)(81166007)(966005)(33656002)(40460700003)(36860700001)(40480700001)(55016003)(47076005)(8676002)(316002)(19627235002)(336012)(54906003)(70206006)(70586007)(32563001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 16:05:28.2994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e5f86c0-3bb7-497f-fa15-08da69a07fb1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5248
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 16:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3571

Hi Jon,

The EDK2 patch contains CRLFs which need to be preserved.
The log is consistent with them being replaced with LF, but it's not clear =
where they have been lost.

Thanks and Regards

Adam

-----Original Message-----
From: Jon Mason <jdmason@kudzu.us>=20
Sent: 19 July 2022 16:29
To: Adam Johnston <Adam.Johnston@arm.com>
Cc: meta-arm@lists.yoctoproject.org; Ross Burton <Ross.Burton@arm.com>; nd =
<nd@arm.com>
Subject: Re: [PATCH 1/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP t=
o fix aborts when accessing virtual memory

On Tue, Jul 19, 2022 at 01:53:25PM +0100, adam.johnston@arm.com wrote:
> From: Adam Johnston <adam.johnston@arm.com>
>=20
> NT_FW_CONFIG DTB contains platform information passed by TF-A boot=20
> stage. This information is used for Virtual memory map generation=20
> during PEI phase and passed on to DXE phase as a HOB, where it is used=20
> in ConfigurationManagerDxe.
>=20
> Signed-off-by: Adam Johnston <adam.johnston@arm.com>
> ---

This patch is failing because the patch below doesn't apply cleanly.
See https://gitlab.com/jonmason00/meta-arm/-/jobs/2740824630

Thanks,
Jon

>  .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   6 +
>  .../edk2-platforms/add-nt-fw-config.patch     | 474 ++++++++++++++++++
>  2 files changed, 480 insertions(+)
>  create mode 100644=20
> meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-config.pa
> tch
>=20
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc=20
> b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> index 8930c040..90c3f2ae 100644
> --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> @@ -11,6 +11,12 @@ COMPATIBLE_MACHINE =3D "n1sdp"
>  EFIDIR             =3D "/EFI/BOOT"
>  EFI_BOOT_IMAGE     =3D "bootaa64.efi"
> =20
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/edk2-platforms:"
> +
> +SRC_URI:append =3D "\
> +    file://add-nt-fw-config.patch;patchdir=3Dedk2-platforms \ "
> +
>  do_deploy:append() {
>      EFIPATH=3D$(echo "${EFIDIR}" | sed 's/\//\\/g')
>      printf 'FS2:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >=20
> ${DEPLOYDIR}/startup.nsh diff --git=20
> a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-config.
> patch=20
> b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-config.
> patch
> new file mode 100644
> index 00000000..f6f18951
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-con
> +++ fig.patch
> @@ -0,0 +1,474 @@
> +From cc58709b32d74273736886ccfc08e4723a436ea4 Mon Sep 17 00:00:00=20
> +2001
> +From: sahil <sahil@arm.com>
> +Date: Thu, 17 Mar 2022 16:28:05 +0530
> +Subject: [PATCH] Platform/ARM/N1sdp: Add support to parse=20
> +NT_FW_CONFIG
> +
> +NT_FW_CONFIG DTB contains platform information passed by Tf-A boot=20
> +stage.
> +This information is used for Virtual memory map generation during PEI=20
> +phase and passed on to DXE phase as a HOB, where it is used in=20
> +ConfigurationManagerDxe.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Adam Johnston <adam.johnston@arm.com>
> +Signed-off-by: sahil <sahil@arm.com>
> +Change-Id: Ib82571280bf1ca5febe5766e618de09e7b70bb02
> +
> +---
> + .../ConfigurationManager.c                    |  24 ++--
> + .../ConfigurationManagerDxe.inf               |   3 +-
> + .../ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h |  16 +--
> + .../Library/PlatformLib/AArch64/Helper.S      |   4 +-
> + .../Library/PlatformLib/PlatformLib.c         |  12 +-
> + .../Library/PlatformLib/PlatformLib.inf       |   8 +-
> + .../Library/PlatformLib/PlatformLibMem.c      | 103 +++++++++++++++++-
> + Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec   |   7 +-
> + 8 files changed, 152 insertions(+), 25 deletions(-)
> +
> +diff --git=20
> +a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> +figurationManager.c=20
> +b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> +figurationManager.c
> +index f50623ae3f..e023d47cfd 100644
> +---=20
> +a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> +figurationManager.c
> ++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe
> ++++ /ConfigurationManager.c
> +@@ -1,7 +1,7 @@
> + /** @file
> +   Configuration Manager Dxe
> +=20
> +-  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
> ++  Copyright (c) 2021 - 2022, ARM Limited. All rights reserved.<BR>
> +=20
> +   SPDX-License-Identifier: BSD-2-Clause-Patent
> +=20
> +@@ -16,6 +16,7 @@
> + #include <IndustryStandard/SerialPortConsoleRedirectionTable.h>
> + #include <Library/ArmLib.h>
> + #include <Library/DebugLib.h>
> ++#include <Library/HobLib.h>
> + #include <Library/IoLib.h>
> + #include <Library/PcdLib.h>
> + #include <Library/UefiBootServicesTableLib.h>
> +@@ -28,6 +29,7 @@
> + #include "Platform.h"
> +=20
> + extern struct EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE Hmat;
> ++static NEOVERSEN1SOC_PLAT_INFO *PlatInfo;
> +=20
> + /** The platform configuration repository information.
> + */
> +@@ -1242,13 +1244,11 @@ InitializePlatformRepository (
> +   IN  EDKII_PLATFORM_REPOSITORY_INFO  * CONST PlatRepoInfo
> +   )
> + {
> +-  NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;
> +   UINT64                        Dram2Size;
> +   UINT64                        RemoteDdrSize;
> +=20
> +   RemoteDdrSize =3D 0;
> +=20
> +-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUC=
T_BASE;
> +   Dram2Size =3D ((PlatInfo->LocalDdrSize - 2) * SIZE_1GB);
> +=20
> +   PlatRepoInfo->MemAffInfo[LOCAL_DDR_REGION2].Length =3D Dram2Size; @@=
=20
> +-1512,7 +1512,6 @@ GetGicCInfo (
> +   )
> + {
> +   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
> +-  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;
> +   UINT32                            TotalObjCount;
> +   UINT32                            ObjIndex;
> +=20
> +@@ -1523,7 +1522,6 @@ GetGicCInfo (
> +   }
> +=20
> +   PlatformRepo =3D This->PlatRepoInfo;
> +-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO=20
> +*)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
> +=20
> +   if (PlatInfo->MultichipMode =3D=3D 1) {
> +     TotalObjCount =3D PLAT_CPU_COUNT * 2; @@ -1623,7 +1621,6 @@=20
> +GetStandardNameSpaceObject (  {
> +   EFI_STATUS                        Status;
> +   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
> +-  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;
> +   UINT32                            AcpiTableCount;
> +=20
> +   if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) { @@ -1634,7 +1631,=
7 @@=20
> +GetStandardNameSpaceObject (
> +=20
> +   Status =3D EFI_NOT_FOUND;
> +   PlatformRepo =3D This->PlatRepoInfo;
> +-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO=20
> +*)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
> ++
> +   AcpiTableCount =3D ARRAY_SIZE (PlatformRepo->CmAcpiTableList);
> +   if (PlatInfo->MultichipMode =3D=3D 0)
> +         AcpiTableCount -=3D 1;
> +@@ -1697,7 +1694,6 @@ GetArmNameSpaceObject (  {
> +   EFI_STATUS                        Status;
> +   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
> +-  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;
> +   UINT32                            GicRedistCount;
> +   UINT32                            GicCpuCount;
> +   UINT32                            ProcHierarchyInfoCount;
> +@@ -1718,8 +1714,6 @@ GetArmNameSpaceObject (
> +   Status =3D EFI_NOT_FOUND;
> +   PlatformRepo =3D This->PlatRepoInfo;
> +=20
> +-  // Probe for multi chip information
> +-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUC=
T_BASE;
> +   if (PlatInfo->MultichipMode =3D=3D 1) {
> +     GicRedistCount =3D 2;
> +     GicCpuCount =3D PLAT_CPU_COUNT * 2; @@ -2162,8 +2156,18 @@=20
> +ConfigurationManagerDxeInitialize (
> +   IN EFI_SYSTEM_TABLE  * SystemTable
> +   )
> + {
> ++  VOID *PlatInfoHob;
> +   EFI_STATUS  Status;
> +=20
> ++  PlatInfoHob =3D GetFirstGuidHob=20
> ++ (&gArmNeoverseN1SocPlatformInfoDescriptorGuid);
> ++
> ++  if (PlatInfoHob =3D=3D NULL) {
> ++    DEBUG ((DEBUG_ERROR, "Platform HOB is NULL\n"));
> ++    return EFI_NOT_FOUND;
> ++  }
> ++
> ++  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)GET_GUID_HOB_DATA=20
> ++ (PlatInfoHob);
> ++
> +   // Initialize the Platform Configuration Repository before installing=
 the
> +   // Configuration Manager Protocol
> +   Status =3D InitializePlatformRepository ( diff --git=20
> +a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> +figurationManagerDxe.inf=20
> +b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> +figurationManagerDxe.inf
> +index 4f8e7f1302..fb59c29501 100644
> +---=20
> +a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> +figurationManagerDxe.inf
> ++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe
> ++++ /ConfigurationManagerDxe.inf
> +@@ -1,7 +1,7 @@
> + ## @file
> + #  Configuration Manager Dxe
> + #
> +-#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
> ++#  Copyright (c) 2021 - 2022, ARM Limited. All rights reserved.<BR>
> + #
> + #  SPDX-License-Identifier: BSD-2-Clause-Patent  # @@ -42,6 +42,7 @@
> +=20
> + [LibraryClasses]
> +   ArmPlatformLib
> ++  HobLib
> +   PrintLib
> +   UefiBootServicesTableLib
> +   UefiDriverEntryPoint
> +diff --git a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h=20
> +b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
> +index 097160c7e2..63cebaf0e0 100644
> +--- a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
> ++++ b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
> +@@ -1,6 +1,6 @@
> + /** @file
> + *
> +-* Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.
> ++* Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.
> + *
> + * SPDX-License-Identifier: BSD-2-Clause-Patent
> + *
> +@@ -41,11 +41,6 @@
> + #define NEOVERSEN1SOC_EXP_PERIPH_BASE0               0x1C000000
> + #define NEOVERSEN1SOC_EXP_PERIPH_BASE0_SZ            0x1300000
> +=20
> +-// Base address to a structure of type NEOVERSEN1SOC_PLAT_INFO which=20
> +is -// pre-populated by a earlier boot stage
> +-#define NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE          (NEOVERSEN1SOC_NON=
_SECURE_SRAM_BASE + \
> +-                                                      0x00008000)
> +-
> + /*
> +  * Platform information structure stored in Non-secure SRAM.=20
> +Platform
> +  * information are passed from the trusted firmware with the below=20
> +structure @@ -55,12 +50,17 @@  typedef struct {
> +   /*! 0 - Single Chip, 1 - Chip to Chip (C2C) */
> +   UINT8   MultichipMode;
> +-  /*! Slave count in C2C mode */
> +-  UINT8   SlaveCount;
> ++  /*! Secondary chip count in C2C mode */
> ++  UINT8   SecondaryChipCount;
> +   /*! Local DDR memory size in GigaBytes */
> +   UINT8   LocalDdrSize;
> +   /*! Remote DDR memory size in GigaBytes */
> +   UINT8   RemoteDdrSize;
> + } NEOVERSEN1SOC_PLAT_INFO;
> +=20
> ++// NT_FW_CONFIG DT structure
> ++typedef struct {
> ++  UINT64                  NtFwConfigDtAddr;
> ++} NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI;
> ++
> + #endif
> +diff --git=20
> +a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S=20
> +b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
> +index 8d2069dea8..88ed640d29 100644
> +--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
> ++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
> +@@ -1,6 +1,6 @@
> + /** @file
> + *
> +-*  Copyright (c) 2019 - 2020, ARM Limited. All rights reserved.
> ++*  Copyright (c) 2019 - 2022, ARM Limited. All rights reserved.
> + *
> + *  SPDX-License-Identifier: BSD-2-Clause-Patent
> + *
> +@@ -25,6 +25,8 @@ GCC_ASM_EXPORT(ArmPlatformIsPrimaryCore)
> + // the UEFI firmware through the CPU registers.
> + //
> + ASM_PFX(ArmPlatformPeiBootAction):
> ++  adr  x10, NtFwConfigDtBlob
> ++  str  x0, [x10]
> +   ret
> +=20
> + //
> +diff --git=20
> +a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c=20
> +b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
> +index c0effd37f3..fabe902cd0 100644
> +--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
> ++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
> +@@ -1,6 +1,6 @@
> + /** @file
> +=20
> +-  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>
> ++  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
> +=20
> +   SPDX-License-Identifier: BSD-2-Clause-Patent
> +=20
> +@@ -8,8 +8,12 @@
> +=20
> + #include <Library/ArmPlatformLib.h>
> + #include <Library/BaseLib.h>
> ++#include <NeoverseN1Soc.h>
> + #include <Ppi/ArmMpCoreInfo.h>
> +=20
> ++UINT64 NtFwConfigDtBlob;
> ++STATIC NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI mNtFwConfigDtInfoPpi;
> ++
> + STATIC ARM_CORE_INFO mCoreInfoTable[] =3D {
> +   { 0x0, 0x0 }, // Cluster 0, Core 0
> +   { 0x0, 0x1 }, // Cluster 0, Core 1 @@ -46,6 +50,7 @@=20
> +ArmPlatformInitialize (
> +   IN     UINTN                  MpId
> +   )
> + {
> ++  mNtFwConfigDtInfoPpi.NtFwConfigDtAddr =3D NtFwConfigDtBlob;
> +   return RETURN_SUCCESS;
> + }
> +=20
> +@@ -80,6 +85,11 @@ EFI_PEI_PPI_DESCRIPTOR gPlatformPpiTable[] =3D {
> +     EFI_PEI_PPI_DESCRIPTOR_PPI,
> +     &gArmMpCoreInfoPpiGuid,
> +     &mMpCoreInfoPpi
> ++  },
> ++  {
> ++    EFI_PEI_PPI_DESCRIPTOR_PPI,
> ++    &gNtFwConfigDtInfoPpiGuid,
> ++    &mNtFwConfigDtInfoPpi
> +   }
> + };
> +=20
> +diff --git=20
> +a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf=20
> +b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
> +index 96e590cdd8..6f9c9d5ab6 100644
> +--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
> ++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
> +@@ -1,7 +1,7 @@
> + ## @file
> + #  Platform Library for N1Sdp.
> + #
> +-#  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>
> ++#  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
> + #
> + #  SPDX-License-Identifier: BSD-2-Clause-Patent  # @@ -18,10 +18,14=20
> +@@  [Packages]
> +   ArmPkg/ArmPkg.dec
> +   ArmPlatformPkg/ArmPlatformPkg.dec
> ++  EmbeddedPkg/EmbeddedPkg.dec
> +   MdeModulePkg/MdeModulePkg.dec
> +   MdePkg/MdePkg.dec
> +   Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
> +=20
> ++[LibraryClasses]
> ++  FdtLib
> ++
> + [Sources.common]
> +   PlatformLibMem.c
> +   PlatformLib.c
> +@@ -59,7 +63,9 @@
> +   gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress
> +=20
> + [Guids]
> ++  gArmNeoverseN1SocPlatformInfoDescriptorGuid
> +   gEfiHobListGuid          ## CONSUMES  ## SystemTable
> +=20
> + [Ppis]
> +   gArmMpCoreInfoPpiGuid
> ++  gNtFwConfigDtInfoPpiGuid
> +diff --git=20
> +a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c=20
> +b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
> +index 339fa07b32..b58bda4b76 100644
> +--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
> ++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
> +@@ -1,6 +1,6 @@
> + /** @file
> +=20
> +-  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
> ++  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
> +=20
> +   SPDX-License-Identifier: BSD-2-Clause-Patent
> +=20
> +@@ -10,11 +10,95 @@
> + #include <Library/DebugLib.h>
> + #include <Library/HobLib.h>
> + #include <Library/MemoryAllocationLib.h>
> ++#include <Library/PeiServicesLib.h>
> ++#include <libfdt.h>
> + #include <NeoverseN1Soc.h>
> +=20
> + // The total number of descriptors, including the final "end-of-table" =
descriptor.
> + #define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 19
> +=20
> ++/** A helper function to locate the NtFwConfig PPI and get the base=20
> ++address of
> ++  NT_FW_CONFIG DT from which values are obtained using FDT helper funct=
ions.
> ++
> ++  @param [out]  plat_info  Pointer to the NeoverseN1Soc=20
> ++ PLATFORM_INFO HOB
> ++
> ++  @retval EFI_SUCCESS            Success.
> ++  returns EFI_INVALID_PARAMETER  A parameter is invalid.
> ++**/
> ++EFI_STATUS
> ++GetNeoverseN1SocPlatInfo (
> ++  OUT NEOVERSEN1SOC_PLAT_INFO *plat_info
> ++  )
> ++{
> ++  CONST UINT32                   *Property;
> ++  INT32                          Offset;
> ++  CONST VOID                     *NtFwCfgDtBlob;
> ++  NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI  *NtFwConfigInfoPpi;
> ++  EFI_STATUS                     Status;
> ++
> ++  Status =3D PeiServicesLocatePpi (
> ++             &gNtFwConfigDtInfoPpiGuid,
> ++             0,
> ++             NULL,
> ++             (VOID **)&NtFwConfigInfoPpi
> ++             );
> ++
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((
> ++      DEBUG_ERROR,
> ++      "PeiServicesLocatePpi failed with error %r\n",
> ++      Status
> ++      ));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  NtFwCfgDtBlob =3D (VOID=20
> ++ *)(UINTN)NtFwConfigInfoPpi->NtFwConfigDtAddr;
> ++  if (fdt_check_header (NtFwCfgDtBlob) !=3D 0) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid DTB file %p passed\n", NtFwCfgDtBlob)=
);
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  Offset =3D fdt_subnode_offset (NtFwCfgDtBlob, 0, "platform-info"); =20
> ++ if (Offset =3D=3D -FDT_ERR_NOTFOUND) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid DTB : platform-info node not found\n"=
));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "local-ddr-size",=20
> ++ NULL);  if (Property =3D=3D NULL) {
> ++    DEBUG ((DEBUG_ERROR, "local-ddr-size property not found\n"));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  plat_info->LocalDdrSize =3D fdt32_to_cpu (*Property);
> ++
> ++  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "remote-ddr-size",=20
> ++ NULL);  if (Property =3D=3D NULL) {
> ++    DEBUG ((DEBUG_ERROR, "remote-ddr-size property not found\n"));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  plat_info->RemoteDdrSize =3D fdt32_to_cpu (*Property);
> ++
> ++  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset,=20
> ++ "secondary-chip-count", NULL);  if (Property =3D=3D NULL) {
> ++    DEBUG ((DEBUG_ERROR, "secondary-chip-count property not found\n"));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  plat_info->SecondaryChipCount =3D fdt32_to_cpu (*Property);
> ++
> ++  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "multichip-mode",=20
> ++ NULL);  if (Property =3D=3D NULL) {
> ++    DEBUG ((DEBUG_ERROR, "multichip-mode property not found\n"));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  plat_info->MultichipMode =3D fdt32_to_cpu (*Property);
> ++
> ++  return EFI_SUCCESS;
> ++}
> ++
> + /**
> +   Returns the Virtual Memory Map of the platform.
> +=20
> +@@ -36,9 +120,24 @@ ArmPlatformGetVirtualMemoryMap (
> +   NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;
> +   UINT64                        DramBlock2Size;
> +   UINT64                        RemoteDdrSize;
> ++  EFI_STATUS                    Status;
> +=20
> +   Index =3D 0;
> +-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO=20
> +*)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
> ++
> ++  // Create platform info HOB
> ++  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)BuildGuidHob (
> ++                                        &gArmNeoverseN1SocPlatformInfoD=
escriptorGuid,
> ++                                        sizeof (NEOVERSEN1SOC_PLAT_INFO=
)
> ++                                        );
> ++
> ++  if (PlatInfo =3D=3D NULL) {
> ++    DEBUG ((DEBUG_ERROR, "Platform HOB is NULL\n"));
> ++    ASSERT (FALSE);
> ++    return;
> ++  }
> ++
> ++  Status =3D GetNeoverseN1SocPlatInfo (PlatInfo);  ASSERT (Status =3D=
=3D=20
> ++ 0);
> +   DramBlock2Size =3D ((UINT64)(PlatInfo->LocalDdrSize -
> +                              NEOVERSEN1SOC_DRAM_BLOCK1_SIZE / SIZE_1GB)=
 *
> +                             (UINT64)SIZE_1GB); diff --git=20
> +a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec=20
> +b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
> +index d59f25a5b9..4dea8fe1e8 100644
> +--- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
> ++++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
> +@@ -1,7 +1,7 @@
> + ## @file
> + #  Describes the entire platform configuration.
> + #
> +-#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
> ++#  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
> + #
> + #  SPDX-License-Identifier: BSD-2-Clause-Patent  # @@ -22,6 +22,8 @@
> +   Include                        # Root include for the package
> +=20
> + [Guids.common]
> ++  # ARM NeoverseN1Soc Platform Info descriptor =20
> ++ gArmNeoverseN1SocPlatformInfoDescriptorGuid =3D { 0x095cb024, 0x1e00,=
=20
> ++ 0x4d6f, { 0xaa, 0x34, 0x4a, 0xf8, 0xaf, 0x0e, 0xad, 0x99 } }
> +   gArmNeoverseN1SocTokenSpaceGuid =3D { 0xab93eb78, 0x60d7, 0x4099, {=20
> + 0xac, 0xeb, 0x6d, 0xb5, 0x02, 0x58, 0x7c, 0x24 } }
> +=20
> + [PcdsFixedAtBuild]
> +@@ -83,3 +85,6 @@
> +   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio32Translation|0x4000=
0000000|UINT64|0x0000004F
> +   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x4000=
0000000|UINT64|0x00000050
> +  =20
> +gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieSegmentNumber|2|UINT32|0
> +x00000051
> ++
> ++[Ppis]
> ++  gNtFwConfigDtInfoPpiGuid =3D  { 0xb50dee0e, 0x577f, 0x47fb, { 0x83,=20
> ++0xd0, 0x41, 0x78, 0x61, 0x8b, 0x33, 0x8a } }
> +--
> +2.17.1
> +
> --
> 2.17.1
>=20
>=20

