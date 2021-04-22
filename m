Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.56])
 by mx.groups.io with SMTP id smtpd.web08.2247.1619133529705625179
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 16:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=c4sPd3+w;
 spf=pass (domain: arm.com, ip: 40.107.0.56, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehGDGxQ0CDOMYLUyLnw/UV0MOyZARKkw1grGYTgbZOc=;
 b=c4sPd3+wCkgH4m6ODbD3LMI3slMWk+QOi2gy392bEqilTb+q0FGloVTJ2msqX8PyZMBAd0sRidP+ebKLkEVa59NZezTcJErI3aJXh9geiSHuFgfHSyCgPR1mGjS2SIq6B25Mwv16ynU0SfBTkRfJqcmzcfgSfVfLzM2Pc7fG948=
Received: from AM7PR03CA0030.eurprd03.prod.outlook.com (2603:10a6:20b:130::40)
 by HE1PR0802MB2313.eurprd08.prod.outlook.com (2603:10a6:3:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 23:18:45 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::b3) by AM7PR03CA0030.outlook.office365.com
 (2603:10a6:20b:130::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Thu, 22 Apr 2021 23:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 23:18:45 +0000
Received: ("Tessian outbound 4ee49f77c636:v90"); Thu, 22 Apr 2021 23:18:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c32cdff01746e425
X-CR-MTA-TID: 64aa7808
Received: from 7c4ede5cff5b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5EDEAF11-A77D-4A83-AAC0-D3D22962143E.1;
	Thu, 22 Apr 2021 23:18:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c4ede5cff5b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Apr 2021 23:18:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADX7bHZBjfZPOiK1OhrChHuH8yeZ1qcDAMnaSU0HBbpQLW0lO97I8aFLhtqzHTteWyr00zW5nBwMvaL/pZiYbYNx8d4QOUGmlCXGo5EPAIbf3VwJp7JUJnUlwKg9te/jKatTPNEOFoBlnc4Av/4autR4Km2BOtYQkU9fBBFT9zwqhydHo8cCMO6R+39po1GgNijngQySzcOliPwZzk3nYH6tMrArr3lM5cEk5GfXNpuqFFpOJOfiEZFcpN/+rvY4x7vBAZlsPJRtb1/+2PstHyt81AMudOYszLHCR/ZSyKoe7GKoXMZMm3wETC0UQ7IZj8nsaUhn7QfqPq5jiZaZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehGDGxQ0CDOMYLUyLnw/UV0MOyZARKkw1grGYTgbZOc=;
 b=HJVhKrxpTot0kCRBj9wighqXN43LCk2G6q8sS3wbYYJ0bllCsvWIPS+mDBcJRBtGV7f6/KabZDGvuFnia2I4Yn9PmKBtx05kTF1SAYtQ2cTu/vkICkEfcDbZN0+pvSne/zSqhf4zcM4tGCtgaOMjQGyIIAWWxXiP4tLODSPac0fnzKrd82zZl+J5tI4Isouu/k4LGMROsRzMQAEFUN/aXNlaLGC2BRTenp5aCYK7sQxHaa+Nh/4mXKArtxTYcm0Y/yKHq8TQjRhWz2LYvDTvg05drWTl+fYNtvp9ega/l/NOoCGEImORci7NZb2UY4m7CvLn7SPhw3h7gSbg4rasMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehGDGxQ0CDOMYLUyLnw/UV0MOyZARKkw1grGYTgbZOc=;
 b=c4sPd3+wCkgH4m6ODbD3LMI3slMWk+QOi2gy392bEqilTb+q0FGloVTJ2msqX8PyZMBAd0sRidP+ebKLkEVa59NZezTcJErI3aJXh9geiSHuFgfHSyCgPR1mGjS2SIq6B25Mwv16ynU0SfBTkRfJqcmzcfgSfVfLzM2Pc7fG948=
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com (2603:10a6:802:ae::22)
 by VI1PR08MB3070.eurprd08.prod.outlook.com (2603:10a6:803:3e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Thu, 22 Apr
 2021 23:18:36 +0000
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b]) by VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 23:18:36 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Ross Burton <ross@burtonini.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp/scp-firmware: Enabling coresight debug non-secure access
Thread-Topic: [meta-arm] [PATCH] arm-bsp/n1sdp/scp-firmware: Enabling
 coresight debug non-secure access
Thread-Index: AQHXN5GL0V9E7Edi7kGLVCOjF3rm16rBE62AgAAYo1U=
Date: Thu, 22 Apr 2021 23:18:36 +0000
Message-ID: 
 <VE1PR08MB48464C6314642A4FCB127DBDFA469@VE1PR08MB4846.eurprd08.prod.outlook.com>
References: 
 <20210422160655.3720-1-khasim.mohammed@arm.com>,<CAAnfSTsaDuTVoMDnk0_ta+5bX3R7c-Xs7Ez9v_8Zv4N=RCoUfQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTsaDuTVoMDnk0_ta+5bX3R7c-Xs7Ez9v_8Zv4N=RCoUfQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.105.56]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c762dd2c-ebc7-4b77-b400-08d905e4f9ce
x-ms-traffictypediagnostic: VI1PR08MB3070:|HE1PR0802MB2313:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB23132AAFE347E53EDD623FC3FA469@HE1PR0802MB2313.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NNr8nt3JkWzUwKPy3tMhNfeZMiq0KULA39lBA6sTXbsAvPuwmDBYRzXKh4JpN+i4Z1Q1kqx+R4sH3zW4t4GosDXkofimqCg63JP+GHv7JkHpRUX7n/vBsVQdWNWp1DAC86LGEJRhNWT/e1v9d93i11wyLmZ7aey/uvwOQ+O98fH5HY6yhPUkYZT/nJGInkIOkg0pbNqOQFticl5rNPwlNRkWtJaxV8do85IyxXvN+l4P5Fdb8f9pHUB8Zji2Gm9Cyo7YiNnO+s9zbun1AILRDyEIgsbepynTgbpFPOAlzrkIG39vMMNZKbDC8Q2HoDrgdbJ8WE92pjlQ4BREFhFvYqSUKAhDJuCLpmtGEgfjaq2F3wV7TOkxs3IT/VfpL7vnaFoyliWkwet38E3qY6BJUp2AGUHBVvXdwII4mqe/uwdRWbwrR3uZs+dZ+MNfIoONy1HbaBiAhjLw5WlAiliTHOxJBRSmAUTOh7ezi53OlagbuDzc0gqYpGOZUwjyadcExGGM5t4JaqyTWpxU7WnXona0fmMd/0doJcqCzeI+Bp/ArJQbuxT0FGHUaWSBiXh1l1so2wBDI1aV6jM/QfnD2Mtn5V5PsHkcIIShtlp0ZTm9qgxhM/DvMgkShvjONCEAtPNwdhPs0OIm8c+5SY6LVrmu1f9PGQ0h2baxNkrR/XoQwQizwrmok4NnkXPd8PgK2ukNjO7TpNL5LSTaAkMWnVJtuBtDHwg5jY331AUfsqYYblNCCBt/MCNvWUpbD8KB
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4846.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(7696005)(4326008)(5660300002)(86362001)(66946007)(64756008)(71200400001)(83380400001)(8936002)(66476007)(38100700002)(52536014)(122000001)(66446008)(478600001)(316002)(66556008)(53546011)(6506007)(966005)(8676002)(91956017)(33656002)(186003)(26005)(6916009)(76116006)(2906002)(55016002)(9686003)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?K704GVD2hTVzMSplty7RU2KFSMOwuL0H8ELYuOXCQA1JPjX9+2vKEAsK2Zc/?=
 =?us-ascii?Q?38cEemvC8dqeVCRmPcwtcIa2pGDh0od4uEV7/PhR/ktZrIDh8yTZKTy6IFUW?=
 =?us-ascii?Q?Xgkoz8CJWS3no4RrriNU8sfMr/hq7IQoXERBaI8b45S6Oe0YqSUuhTtB4MSe?=
 =?us-ascii?Q?scz3mtwhmFellOCcBTgQyphRa5YzE2JemkkYW3BOUVPXNYFaVX3y9K4XkHfN?=
 =?us-ascii?Q?CPQxJW7dKkPsFZHetVNW620trRuuV1gvkUQNXHpXZM+MxmnrO0WuY9NoynVX?=
 =?us-ascii?Q?AdTBMAfsZmMEkEban4KXuVGFrbwjxuc2/rwSQ/xA2G2HtIq//IDttRk6eZdM?=
 =?us-ascii?Q?qDN5uROaa/QwuRJbk1TVpe8sgMjnkb2u1azSEoCUePNGv+sT54ebYSH59pQo?=
 =?us-ascii?Q?S5g9CrEj/AeFkFg6pc5jYgnnenoFyfIplb/RAMZqz8bdUt3JpLp0WR10aGfA?=
 =?us-ascii?Q?JGMsG1dz7vY2UuMjy9UiiamuepU6u4YzhNk7QGBxDRJLeiCLcrYOodpg0rN5?=
 =?us-ascii?Q?brUDsYV5rOK8RtqR5lo9wI2QPhyYjpH7OHiLdXNhF1o4qTfATDpFQdYY+06P?=
 =?us-ascii?Q?983wM9o+Dc37lwZJWgFNH2vL9PZdld4Uis+QC2D3iTwRSrHQPk9POTbv9sjV?=
 =?us-ascii?Q?kMinLqPfS/7QeHy1Lyt8XjeKBHrQb5HCYvQ0nWgZuUrGSqHOD4GA/xZeYcZk?=
 =?us-ascii?Q?Unx9E87wshpwHfIk0eI2wP/li/Jhk3grPqgzVcQDRdxNf4L8s+yLVZc1VIon?=
 =?us-ascii?Q?ra5r42Le+bRwnptep6jHaNa90pRT+qgyHhbFvStXyMgq0ucoEFybz0Trn+65?=
 =?us-ascii?Q?DKppUPhOcr5UjU5YRtk9R40sBWyQbyWfk4BLaDuper+qqoP3ynGGw0xEQvnE?=
 =?us-ascii?Q?AZsyGPcBUfPlbuBNUrokbuUmwSS7jqKjdGw2KOLD0+bSoMwPiQyYAvQtYvOM?=
 =?us-ascii?Q?QkMKN4MSYKUNBDjyRv/5amECSW2hkCiJNmjYCnauT1H1MOU9DC2L1L5fcmVs?=
 =?us-ascii?Q?PZOw8Fn+OfyMpCoII80q03CK1INi+iWMjLuB11tEI+e9t1Un39QBa5ZfyIvu?=
 =?us-ascii?Q?D+fi5QcvqtVYEQX/bPDV3LCytwqn6+hC+l8MwFdx00ErV5UfHRmfaQUv5Mdh?=
 =?us-ascii?Q?+3rEhXwYeDyJsGAc1B4vxOv2ZuiqIjmd4pCWuEe7Mb5NTVftevRpXGP0ejr9?=
 =?us-ascii?Q?CzXZYU4IvfnCx4Ejwp1mBFZffV2eNaOggxl3el7aOcYyeMVYfahqin6hopX/?=
 =?us-ascii?Q?/ziNKBxpQE5tGT2xTIs/n8LGR0TxmVhbK0qHO5KPhNYwpeQ1LD9bhkYiQ+hG?=
 =?us-ascii?Q?5Ts=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3070
Original-Authentication-Results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	65823f14-b30d-4d84-9166-08d905e4f4d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BTSQCi55f6zl79EeP40U5D8xLBrkxGau3RWziDPGpc4CccMNp2CrjubXgl1FKxRJYTcCsTk9mS7iVCpbAiGFMKB4HGlsPISUozONLZ9lQyR25MWAjKfnO/oJn/zQWjGlWXHzIINplanYYaiqH3AI6+DzDGRvLThLqCS05375c4VIL6/x4iiPhbKz5ycpc99U3kM5LPJ/rF4/0wJGFsHpijHkYblHhnAAHlqCJOPIRafMHDsE3XvnjOulPXaxUJb0seOagWmKnkZuaGg4aYyj7HWaMt3bvdobmz4m643OYpSFmKcJR7gZ5KzDh0kTmXd9VfWpM1lqHU4xR9zldg3OFEU/FyNDjA6zpd0sWLg0Zm/nTB5mDQplG67vcAXKZNqnmhSuuU9V7vA5VSwQCiii1lvtIPC8KW+PSr3YWyyDaVLw1Z9Ulu6/V4F2pETdYTfkQmViyZvCRC8AAjNMbhekaf7ba5+dg7L6tk23QnjLS+T8/lHm+3bQ4zWkf+k599o3KYGIQ8xd13xl33faxFu6046bBFKWN5kL9w+KXwocsx91n7bnLFGVAuIKjSUZ5BFgKHxuuTbtOfDZzUA23xyhOp+uA7MxZixWV/HtR1GWviNjIxhqTOu6fgqKlzfCy0rKBMapXi9TGP9RE6GOJPEfOinwxzz9kprGz2EMdgFRV6L8Lrf5/fqqJrUIAcNQ68jK+I+s6ex0ZOv3OXLct9r3ye3ZDyYatNQJb0pIPWVUYHOBPWls3YsliwOvciphFisCbI37GwTBqWZrxQVQloB0aX6sGgpuYVupNQQpcFmTBY6VnxZ7KTRACO5rf9WPeVh9
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966006)(36840700001)(70586007)(83380400001)(70206006)(81166007)(33656002)(2906002)(34020700004)(316002)(47076005)(86362001)(82740400003)(356005)(36860700001)(52536014)(5660300002)(82310400003)(26005)(8936002)(478600001)(336012)(55016002)(966005)(9686003)(186003)(4326008)(7696005)(6506007)(8676002)(53546011)(6862004)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 23:18:45.0811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c762dd2c-ebc7-4b77-b400-08d905e4f9ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2313
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

We need this on master as soon as possible for an official N1SDP release. =
If it can get into hardknott that will be good as well.

Regards,
Khasim

________________________________________
From: Ross Burton <ross@burtonini.com>
Sent: Friday, April 23, 2021 3:19 AM
To: Khasim Mohammed
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp/scp-firmware: Enabling cores=
ight debug non-secure access

Is this intended for the hardknott release (next week), or is it okay
to merge this just into the master branch after hardknott has
diverged?

Ross

On Thu, 22 Apr 2021 at 17:07, Khasim Mohammed <khasim.mohammed@arm.com> wr=
ote:
>
> From: Khasim Mohammed <khasim.mohammed@arm.com>
>
> This patch enables coresight to work with n1sdp c2c profile.
>
> Change-Id: Id3a5f92cc1f99cd907111ea858aad4efe561179e
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> ---
>  ...ng-coresight-debug-non-secure-access.patch | 38 +++++++++++++++++++
>  .../scp-firmware/scp-firmware-n1sdp.inc       |  6 +++
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/en=
abling-coresight-debug-non-secure-access.patch
>
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-=
coresight-debug-non-secure-access.patch b/meta-arm-bsp/recipes-bsp/scp-firm=
ware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch
> new file mode 100644
> index 0000000..713f4a5
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresig=
ht-debug-non-secure-access.patch
> @@ -0,0 +1,38 @@
> +[PATCH] n1sdp: Enabling CoreSight debug non-secure access
> +
> +Upstream-Status: Pending [Not submitted to upstream yet]
> +
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +From 194e6239737272c3fadb202deb8015cb6e8df6ec Mon Sep 17 00:00:00 2001
> +From: Khasim Mohammed <khasim.mohammed@arm.com>
> +Date: Thu, 22 Apr 2021 15:48:02 +0100
> +Subject: [PATCH] n1sdp: Enabling CoreSight debug non-secure access
> +
> +This patch enables coresight to work with n1sdp c2c profile.
> +
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +---
> + product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c b=
/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
> +index 70e2ec3f..ff380ae2 100644
> +--- a/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
> ++++ b/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
> +@@ -466,6 +466,12 @@ static int n1sdp_system_init_primary_core(void)
> +             return status;
> +     }
> +
> ++    else {
> ++        /* Enable non-secure CoreSight debug access */
> ++        FWK_LOG_INFO("N1SDP SYSTEM] Enabling CoreSight debug non-secur=
e access");
> ++        *(volatile uint32_t *)(AP_SCP_SRAM_OFFSET +
> ++                               NIC_400_SEC_0_CSAPBM_OFFSET) =3D 0xFFFF=
FFFF;
> ++    }
> +     return FWK_SUCCESS;
> + }
> +
> +--
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.in=
c b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> index fa3403d..65034d2 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> @@ -6,6 +6,12 @@ SCP_LOG_LEVEL =3D "INFO"
>  LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8=
d9300a6c3d15101b19731 \
>                      file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a8=
8d0a364313df4b21ef20c29e"
>
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files/:"
> +
> +SRC_URI_append =3D " \
> +   file://enabling-coresight-debug-non-secure-access.patch \
> +   "
> +
>  SRCREV  =3D "6c15afb1b37d0728482c598b063cd69bfc733e93"
>  PV =3D "2.7.0+git${SRCPV}"
>
> --
> 2.17.1
>
>
>=20
>
