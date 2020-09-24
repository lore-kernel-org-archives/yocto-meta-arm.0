Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.82])
 by mx.groups.io with SMTP id smtpd.web10.18904.1600959213893680283
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 07:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UTlkFhR2;
 spf=pass (domain: arm.com, ip: 40.107.4.82, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNAFBjHQlsEH8WVyqK09zzetQ3ef9XHVphAob1E2L/Y=;
 b=UTlkFhR25PKRZMNQJjtGEAgxUaxxiYcQMfIDoT6RGOyUemNH95/JSDqJoQH1Jzf9SAea7Azu2lqwhN11L0FgxaeamGgsemAMG1fY2bVxqeevh4AnMEqa8+zLLgsWMmqFYXzSlNmynCrOtVnQfmvn7VbmRHtWFAmGkcINsmjnC8o=
Received: from AM7PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:20b:100::21)
 by VI1PR08MB3520.eurprd08.prod.outlook.com (2603:10a6:803:84::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 24 Sep
 2020 14:53:31 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::f3) by AM7PR02CA0011.outlook.office365.com
 (2603:10a6:20b:100::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend
 Transport; Thu, 24 Sep 2020 14:53:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 14:53:31 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Thu, 24 Sep 2020 14:53:31 +0000
X-CR-MTA-TID: 64aa7808
Received: from 0e1d31f90df1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1E454A70-0EE8-46C2-A57C-FB3C04A4362C.1;
	Thu, 24 Sep 2020 14:53:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e1d31f90df1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Sep 2020 14:53:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZ28EKTyrsIn21iW0JNnpI0boMIg7ADbO8qMcp2kkIIFgYqBoYyWPjrE212ExMqrTMLiRD0PUCEVrfjbteb8WKmnXVswjUMvRmQv2jIs93yLV+hEsRQKMXU9v9pDIuaFEFFy3PVx8ehE2xJe8ISjKMgoy5ANThfuDSIsuwEf3IKb3LyGFx6dz67dGWfAu/zxTglncQugDrmu5JV91KGJl/wYlqwXnxQarDL/9JBtUG6D+Yae5Zn5guSekcyQjQopbhW0Cn/QTa+k1SHxe6P15wBUjFH4xO10h+pDzfcqwXXpA2fS6iWgrN80D8fq6ba/gJdCezcxAA9ZCDFhWuqr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNAFBjHQlsEH8WVyqK09zzetQ3ef9XHVphAob1E2L/Y=;
 b=a9TxsiW/tPddTCab5Y6PKzj+0dLw7eh9iz62nz733Tt4V94rOlA3NjUOMLfM9Q8umAxKlXcgAa9Ftn4ok0L+3b4LiiE2CSXFvpJenH9WX3SG17qUYolNdwPEniw3bqhbaSCXNE2LW01x26sWCupaKxxosnZuxLM+7EwuxPqopmgqw7lu8bPms8F7NX2AFAUPXAC6eubGy+4e4HE1uEmXCRo9BbU/himjSdrxpLgRzATjWLlHp41GvXkrBUWChf5F9kWqFGkRxuWh1cZsD4Sg5LHk8kpgpPGHcWWcitav+ytcDtibrEQDtOVCrLx/4tv/DvJoLjekUhqHplDAeGu4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNAFBjHQlsEH8WVyqK09zzetQ3ef9XHVphAob1E2L/Y=;
 b=UTlkFhR25PKRZMNQJjtGEAgxUaxxiYcQMfIDoT6RGOyUemNH95/JSDqJoQH1Jzf9SAea7Azu2lqwhN11L0FgxaeamGgsemAMG1fY2bVxqeevh4AnMEqa8+zLLgsWMmqFYXzSlNmynCrOtVnQfmvn7VbmRHtWFAmGkcINsmjnC8o=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3173.eurprd08.prod.outlook.com (2603:10a6:209:4c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 14:53:25 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 14:53:25 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Nathan Dunne <Nathan.Dunne@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: Use IMAGE_EFI_BOOT_FILES instead of IMAGE_BOOT_FILES
Thread-Topic: [meta-arm] [PATCH] arm-bsp/n1sdp: Use IMAGE_EFI_BOOT_FILES
 instead of IMAGE_BOOT_FILES
Thread-Index: AQHWkoJL4QIgGpwmuUWqDcuUP2fwiql336Nw
Date: Thu, 24 Sep 2020 14:53:25 +0000
Message-ID: 
 <AM6PR08MB3461B9421A34F3C80DD9EE1B92390@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20200924145026.14906-1-Nathan.Dunne@arm.com>
In-Reply-To: <20200924145026.14906-1-Nathan.Dunne@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 5266D2F51A421C4C8398DF09F30E9383.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1e1cb71-3928-4302-ecd5-08d860999aa4
x-ms-traffictypediagnostic: AM6PR08MB3173:|VI1PR08MB3520:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB352003FE763ED103B525351292390@VI1PR08MB3520.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:317;OLM:317;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WDWFrqEkpDpQIjXDNkH3v4/SH4sXdI0XcryuKLqw01+jwm/bDDAI9eCSjkS8TxNFFuXaee4AV2ejjVQG/NXWBGgEkmTdVgtaNCI2/Ir2g9Td4Dysc4TrAiE1y0laFZMRk2gbVcklHQ+YQuDUydfrkqHOytAL/+5C8MAV5jmE7gVdB669eUFYSmIynYTvi2cwuIPqMYdVAQHfGKHm+G6uGGqoHL4oLogGmcGc4QVRrQ5e8rjrOoMopmKL7x0YY+rlQRMGqt2nns5MmWuI/O1ky0Z9rtEqQGp8KFSvmQOZP2CwJzWvKaLHMe2nRH0Jaht8vByybeZnaSC8SNkAzLHfPvq19yEoJOwstRk5F7G6SGHY+SAjYvD52Dsc/DYlYYMC
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(64756008)(316002)(478600001)(86362001)(110136005)(55016002)(4326008)(186003)(26005)(9686003)(8676002)(71200400001)(33656002)(7696005)(2906002)(5660300002)(66946007)(83380400001)(76116006)(66476007)(66446008)(66556008)(6506007)(8936002)(52536014)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 7Fq7ekfickdoR8Xavtqmnmu3ZVotfLw5kf1UEgetfc65OQFkzsS1EEeS9u1BacjazAeTyohW7ffQ9MlqDky4sYByB50Ar/2Znd58YMpE8rWKYTpiK7j0kZ3AUJQjJgGUxC6Djp/7CqY6463HhESuUC2eWjMDhmHVgoOJ8iPH9JsabgQohq/rh6zloLDnkEOXf4h9N/WUHmlLyhXBXCXO4sDw4Vy+S4NmBP9vLacUUwkyJkTGKROShaZvXPQ3W0xqK/3u+M0ECOEHuy/3IBfa0MbQapBgKcclkEwPXa4E0enS1oQcC+ptNU+sKJ+99iI1gQouq3blNXWgOLsvn4BZXTOfZYpatb8s7qKwYeMtAbp2EoPSNzbLdy4yJiIZ6ts74KiNEnocRTqPv7utlo/dKnlG8OMjHQVlNOQj6I49rraSeJAyVDAVvR/50Ojw8bThxDrOoo5MCYg5IUeUgY6L0BAsGXP0elOahow6mOjBEBU4+i644kT93hO+V/2GHvMM4xhO9nYdLWTG1lpRgB0tWi5g8zc/SN1J/QlFfpBS1yCk50+6Z7TYQCMKnJFNPmPuMf5NUeRvPfGT+CHdK8/7Zb49n2bknFABk/UfKnXqavk2hFEz5GkeSfeWY3WicnF2ZPKvjpSlNDXUkBI8V13wfw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3173
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f125b3d9-8109-4695-1f77-08d860999702
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6TNGJsQytnVVgbREZRUxZd9GdStJjuqmNWbY8HFAWop0H5myIw/y+nTDvXu6uKp/ELtL5Qv2pT0iQBFGlHOaavrKZf3ez/3a311rn4SXmJBnDthRbr8wV2x3URS12eGsTh5KFFmXRQyD9qaVnK2230eFEICLxfGi2M+ufhnc6NYbxR6kD2Y0z/ag6pxWmrFrO6ehbCfmJNRIT/aTjGspCyQeoEXqtFDqm5yVM8S0SYwTjJzBNuQvOr7aDCAJ5Fl6YGon6cR2pG/4MzEZFGCGfEmsGFihcMXI0rfDVgE/pNze+TZoAjZL7NCSHNBcz9jMCjVvTGxqo/KGRysmHisiQao7CJiU3YAlS8AIMdZ/rv8FjX2W5s1WDUwNemt68KWi8342wJlKBEDm4CcNj2uStNb1Kke4hptliNytk6m0hUY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(316002)(336012)(478600001)(186003)(82310400003)(82740400003)(4326008)(47076004)(26005)(6506007)(36906005)(8936002)(7696005)(8676002)(2906002)(9686003)(55016002)(356005)(83380400001)(81166007)(86362001)(70586007)(70206006)(5660300002)(110136005)(52536014)(33656002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 14:53:31.3138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e1cb71-3928-4302-ecd5-08d860999aa4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3520
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
>On Behalf Of Nathan Dunne via lists.yoctoproject.org
>Sent: 24 September 2020 15:50
>To: meta-arm@lists.yoctoproject.org
>Cc: nd <nd@arm.com>; Nathan Dunne <Nathan.Dunne@arm.com>
>Subject: [meta-arm] [PATCH] arm-bsp/n1sdp: Use IMAGE_EFI_BOOT_FILES
>instead of IMAGE_BOOT_FILES
>
>Replaced IMAGE_BOOT_FILES variable with IMAGE_EFI_BOOT_FILES in the
>machine config file for N1SDP, in line with commit
>85574ce0cf84eaf828334dd2fafadc18909e73b5 from oe-core.
>
>Change-Id: Ib7b76c01870dc10f49be4bb9c0b7623bd2819d46
>Issue-Id: SCM-1300
>Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
>---

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> meta-arm-bsp/conf/machine/n1sdp.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-
>bsp/conf/machine/n1sdp.conf
>index e4e6663..9df3e50 100644
>--- a/meta-arm-bsp/conf/machine/n1sdp.conf
>+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
>@@ -15,7 +15,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
>
> # Set default WKS
> WKS_FILE ?=3D "n1sdp-efidisk.wks"
>-IMAGE_BOOT_FILES ?=3D "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
>+IMAGE_EFI_BOOT_FILES ?=3D "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
> WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"
>
> # Use kernel provided by linaro (Contains support for SCMi or HDMI)
>--
>2.17.1

