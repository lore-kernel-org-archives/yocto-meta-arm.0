Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.89])
 by mx.groups.io with SMTP id smtpd.web10.8098.1588256731682966258
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 07:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gI55jTPe;
 spf=pass (domain: arm.com, ip: 40.107.13.89, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I84LFTFEElt0rvLxWg/UBtv1m+w4LTc81iD+7xw3eM=;
 b=gI55jTPeqFVA4GIM5ddUMmJAnoV6xu0LlbJHqhbqhHugXS8OxCJGRthLpFVzFA8Qe0Mi2rDBzAO00hkGVLiK+VHr1lAihg3u8L/3RYy9YCisHUPh+cpbVOiUU7+ibHy9skt301fhRflhYpQFlIjOKTY1PubeGAkddjevzntnoso=
Received: from DB7PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:10:36::15)
 by VE1PR08MB5248.eurprd08.prod.outlook.com (2603:10a6:803:10c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 14:25:28 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::f4) by DB7PR05CA0002.outlook.office365.com
 (2603:10a6:10:36::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 14:25:28 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 14:25:28 +0000
Received: ("Tessian outbound 5abcb386707e:v54"); Thu, 30 Apr 2020 14:25:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 66a4f5bd0f330809
X-CR-MTA-TID: 64aa7808
Received: from 71b67a7c7d20.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F655F87C-E831-42B8-976C-6105EE18E003.1;
	Thu, 30 Apr 2020 14:25:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71b67a7c7d20.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 14:25:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHdyeKsHH7K/Gk7vYr9PC6ZUjye2NcGHjEYsSlGp2EB4S5zhaDZA9klVXVu6xGhz2yEHAkmSahctdFMvneu0aG65dqppm6RsbGxrS+ADEsTMIZkikGXwhLfvqLXbQhH+6A6NPMM9EdwZhtrT350wHmGJh2WxVbhH/yFkP6zsxn6iUcm9aG8UnRY9YQ8HonZp4IKO3JBbKKh5UDHDdq7DGgijyKPqJLMd2abJYGq3mkBICbZyVrYrA3Wy8F7hmGCOnw+4cy+J9/a9KbobNrdbHgc/QaD/Aosftik0jO1BAG6o1q7BEr3ju9d36uiGNJINJKq7APq9ymyD2cNOrlEZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I84LFTFEElt0rvLxWg/UBtv1m+w4LTc81iD+7xw3eM=;
 b=VDwT3/94n8RDfGNL3pbiCnbMBneBuU1DgZUrIH1FqivH0lHKKpJfiYIoEMxG3dX2tGtBqvSPuzxfmTeYApMLxNt83n8sXW4cJt3yXY1zaOMJtGKsF0s8PRBEpkjTY5sHY/Hya33oQwuVhWVMY1FbhFxiegNtVPhLncDQKWyZAbPJU2NRy/1IcCGhbgh2S2N9ArQ7jJpj1uLFNOLYOYglQ2CXpSMKZZRqg27hE+qRRKGUeo7P7B8cSrA6ESga+9+SwhKEs+AzKzS1mthmyNWtOo9i9xeZLqg7D7y1aBx/gottgBjLxnOlcsTD4vWIZagjjPB99OLeVcbuxgbOEoazOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I84LFTFEElt0rvLxWg/UBtv1m+w4LTc81iD+7xw3eM=;
 b=gI55jTPeqFVA4GIM5ddUMmJAnoV6xu0LlbJHqhbqhHugXS8OxCJGRthLpFVzFA8Qe0Mi2rDBzAO00hkGVLiK+VHr1lAihg3u8L/3RYy9YCisHUPh+cpbVOiUU7+ibHy9skt301fhRflhYpQFlIjOKTY1PubeGAkddjevzntnoso=
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com (2603:10a6:803:ba::25)
 by VI1PR08MB3823.eurprd08.prod.outlook.com (2603:10a6:803:c2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 14:25:21 +0000
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926]) by VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 14:25:21 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] optee: Use softer assignment to "invalid" for COMPATIBLE_MACHINE
Thread-Topic: [meta-arm] [PATCH] optee: Use softer assignment to "invalid" for
 COMPATIBLE_MACHINE
Thread-Index: AQHWHvH9mn27okTTEkSW0L5CzJcoN6iRuHYA
Date: Thu, 30 Apr 2020 14:25:21 +0000
Message-ID: <4A699897-BCA5-46B2-B4C2-70913437C66A@arm.com>
References: <1588252755-48172-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1588252755-48172-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3eb73dd1-8d33-4886-3fa0-08d7ed1254b9
x-ms-traffictypediagnostic: VI1PR08MB3823:|VE1PR08MB5248:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5248CFC8BB6DCB2DB887837F9DAA0@VE1PR08MB5248.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
x-forefront-prvs: 0389EDA07F
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3693.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(33656002)(71200400001)(4326008)(316002)(6512007)(66556008)(2616005)(6486002)(64756008)(66476007)(66446008)(5660300002)(36756003)(8936002)(53546011)(6506007)(186003)(76116006)(2906002)(6916009)(26005)(86362001)(66946007)(478600001)(966005)(91956017)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3ib3AjYJeF3Tyd1j8UlMG4jNorQt1mTwqoflHDnou2DINGAygyZv8rMzIX+5VEVo3t8CVCrF/jEzgz8M+0brRTDuTPBdzJsVlnVaDKS3kbyxp4XWjX4bdwHVk+uUbEHPtzHUoAecih9Fx4TaG+X5BocZ9iZwOY+GhRpFD0SzvcJU2uqkpqM2AFnaLNv0jlau9EGvNrzf8iDj5RTKmCe1R49UQeM1aWOk2YhN+o5fcgYgCkepjkV5Cz444ydT+CzuPBl6VOq4yp9L7ChNSIIxfJwdCTFGi1hdQRtvGHuthJJfsp4tWM1fGcIl5JILLnaRtpe0T1XVG4NYKw8MhvopG77tMSKSBTOJSyQKushRksr4V1FbH+02EiySOLEX/oIg04+IOm5ixHr78n1GHKtiuHzMVmz3+p4ezu+cJk6rmNQKu4YKynIAgF7U+S1e7zMIAt1CWktBFM+3g7Uc1YEllApz7wEufXH722G05qN9u2JpqPQc7HiGsg2TW5hYRAIC5uRzklG9VhoWAKpcWFwMPA==
x-ms-exchange-antispam-messagedata: 
 EsYXzHCj4VAd+Z0bvJ/wxtRQ8Uac6eSJrkP5qnjnmMccRpIj8EoS8ZWIyOgRTQC8+VJEF0HONFh6E8oIy21jODmHfkJDuMZMA77ZKEe1p5sT89Zxd+An8naII1G3qXznk0rulIyyXKfUNZUoIrpSCHdtysabKrk8b4wXrfsXV1teOuTMy+ryznwSp9rpbvq5aYIlRvAy3qY+csjpG1WzXREPi0ioIshIjRMXIuaO38/w+z/7pdeCIJ/YgpXpgAUl7meFT7M59m+8QMQTTy9Lo/qIqv7AmavnAwM2Fo9RIhBIhXHbMALk/VD1XA7DLePUWku1L6MdSIyWpi/vXqf+pJp349dXse+/JawSv3lyXByxFnpMAZk1SSeViWagTfWy0ea2O3pU6ghtWCBGg9yWB+IZKsSlUHcAq72yLMCAdb6dyVs46PBr91t8Pw/NUiUlKB8DxxsHsHFhe4gNZegbSfxplcYF1hnAfsPDUFPkEZJfw+JfmjLXLpn0FXkrrn3+IQDoHHzPYgoExqVBH0jGdWvP6g2DpNZU5nyj/ZfZGmAqrSqqe569gD+1AXI8tJJjn1TscXpWH9Kh1Ndd7HkuWnEjAnAIOFN2UXNKOwST4sCw3rphibMXJC9e72XIE/gQlHwhcf6HgYIiCcJfZTWAbAIW3n/HNnx3ZFJJp72/vo3kIF9axkuA3fQ2IQcebYFM9GjgH/E5KQVR5kF8PqlAeOc7SexcFmrrneeRsgAznsiYx3zbnykWl2Qv034xuUCF7MJiJqeUPtEISVeJaLE3wA9EhfkVGE/fzg0BNHpqLn4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3823
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966005)(316002)(82740400003)(8676002)(2906002)(6506007)(53546011)(70586007)(70206006)(8936002)(47076004)(6486002)(4326008)(6916009)(336012)(26005)(6512007)(2616005)(966005)(478600001)(5660300002)(36756003)(86362001)(81166007)(186003)(82310400002)(356005)(33656002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9a749cda-f37e-43cc-fdf0-08d7ed125095
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nR5xcMloR2fv2eHWRnD24KT6Fb02t1ZoCQU/o793PAAa2RHzsB6P9TdHSzE3ZO8JGHTm25b/8UgDPp9UhennsANgFpuAQ2nWpns+eful2VrLBBx299OXY+v0uCZEL4sArMbl2VO43xJ9rRNdJ/5ZldGUbLctwyXzyiWssjdkn/+ZwN8llnMQuW0/1q0vMsSgJh7nnONuFtf1cZT7HQHEpBTSwL6aKDIzGnyaLqVdx1i6sWL3hypvtjOT5mbX7pxOLmfmeW9zkZiYXe3F8wcwy3Vt8/AEkh0Ao9CVeMWttiT3OP6jX4Yp3qH17SsahYDfjhXt9OTyLQe4oFnWRWJvROpSreZWuoWWUfD8VlwQDxmnaLG2bWQN/GwiyC8/gsKI7mvc7ykhPjhncpEYMfa4k11+oTYHNIVG6UpbeQE6U5mJP6O8IpTdc5OUN21sssmQ4oxlA132vsaM6CgXdBfgL7WVvhczYMIpcT3ek1c2ujq5mfGn0BomcECKqSypITY1vv5UFl2laGO+f4G9uWvD3QpSmlfjjuedrvCdlnlkGbLbIYcdIeU/DLC0ocE1YDQVLAJ/PGV7UC6sdMJXjoxFPw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 14:25:28.2725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb73dd1-8d33-4886-3fa0-08d7ed1254b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5248
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AB303B27CF46794983B9F1CC3A607258@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Apr 2020, at 14:19, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> To keep consistency with trusted-firmware-a recipe we should use
> softer assignment to "invalid" for COMPATIBLE_MACHINE.
>=20
> Change-Id: Ib05afcd62b6b2104188b90bad4d952eb055ae443
> Issue-Id: SCM-888
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm/recipes-security/optee/optee.inc | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipe=
s-security/optee/optee.inc
> index a12521d..b3e5271 100644
> --- a/meta-arm/recipes-security/optee/optee.inc
> +++ b/meta-arm/recipes-security/optee/optee.inc
> @@ -1,2 +1,2 @@
> -COMPATIBLE_MACHINE =3D "null"
> -# Please add supported machines below
> +COMPATIBLE_MACHINE ?=3D "invalid"
> +# Please add supported machines below or set it in .bbappend or .conf
> --=20
> 2.7.4
>=20
>=20

