Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3101EC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 08:03:17 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web10.124930.1680681791472469605
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 01:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EEAWIImZ;
 spf=pass (domain: arm.com, ip: 40.107.7.74, mailfrom: adam.johnston@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nTkL3TwXwTFlv6KPCr1QBoX+E98iETcchbzBuXhS5g=;
 b=EEAWIImZBCEa2R98f0oJB2Jh1PcUQrZGYk9y9ErqpRA7hKoAwUldJP7VQQFj3xqLAnEl21TUbLO1VPhRApuraoPQtOAz30xH8XG88L05nIhJ2w3gFttTrHiTjnB8qqTSrs9SfpMDTqBroSBzyyd/UwwE6thJIlwxtv0PScQkuyc=
Received: from AM5PR0502CA0023.eurprd05.prod.outlook.com
 (2603:10a6:203:91::33) by AM7PR08MB5367.eurprd08.prod.outlook.com
 (2603:10a6:20b:dd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 08:03:05 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::cc) by AM5PR0502CA0023.outlook.office365.com
 (2603:10a6:203:91::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Wed, 5 Apr 2023 08:03:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.18 via Frontend Transport; Wed, 5 Apr 2023 08:03:05 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Wed, 05 Apr 2023 08:03:05 +0000
X-CR-MTA-TID: 64aa7808
Received: from 3d85319ef2ca.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A6EDC648-799D-45D8-AE2B-3A736450C431.1;
	Wed, 05 Apr 2023 08:02:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d85319ef2ca.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Apr 2023 08:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hg5/1eRDrhCMIB8mrXEH7XEo+vkNcKlM80U+G+cy+IOOprUs+9fqlDnpspSrpBN3lyJ0v8OD0QNuIfmjoNuVyHrbj2eZ9wcvPaoIPaxvitf+ILga5E2qS1t5NObXVabdK/bQgg5gzqiRxW2zhEFhHI8n6uQZww1M+A1hpSJUAF4C5CO+kGrR6hWq7rW3r53zCc6k1f0RqcObODMOHVCqXHlV3+k+4iGUGHSWf8Eod713EcNOVI6XZPUrENx+WWkmi2ZRy/UwJrm2kqEjznUxxQWcTx/crjBBMMbH4H7GQhdaMwDf4PaQAFeuG76M2xL+RFLByxyAh1YmEQPRKIsVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nTkL3TwXwTFlv6KPCr1QBoX+E98iETcchbzBuXhS5g=;
 b=e7CLoc7VSCIEoGokx1LdQxvLMZSzeXWgEdgUJzCulcFinPcVWI4nTPkpY7/NaKISjJuG8KdWsAGGsvF3sDOvV4eRA2FsZmHPKWrTTzwzgH1Gvc+dedwEvYcX0UIcJdmyEq2dztha32LkWKk7ysTenAIS9BGAlPGpxEbXFNAy4st+ts6OYfIPW2oElVojK9DpxfrYvTofdSZDgh4hXho/ebS13TBGjIiYxxRbWW1hxMlo8Tbvxa+N01qLxkXDyMgnOssP4OA5TiqbPiwGzqMghxd0DK9VjZrrCuR+9wHEzlzEDDCRAF2jWUgxaIQUkU//DkHgnMeGcrHsDI5v+CJ2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nTkL3TwXwTFlv6KPCr1QBoX+E98iETcchbzBuXhS5g=;
 b=EEAWIImZBCEa2R98f0oJB2Jh1PcUQrZGYk9y9ErqpRA7hKoAwUldJP7VQQFj3xqLAnEl21TUbLO1VPhRApuraoPQtOAz30xH8XG88L05nIhJ2w3gFttTrHiTjnB8qqTSrs9SfpMDTqBroSBzyyd/UwwE6thJIlwxtv0PScQkuyc=
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 by DB5PR08MB9971.eurprd08.prod.outlook.com (2603:10a6:10:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 08:02:52 +0000
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::ee8f:d071:c766:9288]) by PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::ee8f:d071:c766:9288%8]) with mapi id 15.20.6277.029; Wed, 5 Apr 2023
 08:02:52 +0000
From: Adam Johnston <Adam.Johnston@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>, nd <nd@arm.com>, Jon Mason <Jon.Mason@arm.com>
Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to
 3.20 for N1SDP
Thread-Topic: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to
 3.20 for N1SDP
Thread-Index: AQHZZkMLlJYm/4A5wE+gvm9fShyImK8aRfKAgACHQCCAAIdGAIAAENBu
Date: Wed, 5 Apr 2023 08:02:52 +0000
Message-ID: 
 <PAXPR08MB6432BA9D89EC85F016E440FDE9909@PAXPR08MB6432.eurprd08.prod.outlook.com>
References: <20230403154306.3422-1-adam.johnston@arm.com>
 <20230403154306.3422-2-adam.johnston@arm.com>
 <20230404000559.GA9226@denix.org>
 <PAXPR08MB6432BC10804AF2B98275C3E6E9939@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230404161414.GC9226@denix.org>
In-Reply-To: <20230404161414.GC9226@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 49689AE6027C77448E0E3C15B6019E07.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PAXPR08MB6432:EE_|DB5PR08MB9971:EE_|AM7EUR03FT018:EE_|AM7PR08MB5367:EE_
X-MS-Office365-Filtering-Correlation-Id: daa63451-78cd-451f-8845-08db35ac2fb9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RftjQnp4jpUITcKMLlG0vat2g9jX4xYNnjzmJDSbpfW9tQDv4VUr5gw+yBATYN1gSIMyorhDFKxKAQDoZ15My5SGuhapIkhPvfO/budwootd6NhtZp36uI11uOXXVvs9qHx8MzCcAMyafuJX8UrO4XBIpskqWjzb4WiV+KufcCVNYnca23EAClddvTnMJ8xjDSVMC88ucuZePfyk/ZdPFuRiCQ+CD+XUsAWJWHLgdUJQPe/ijUsiG/YbBBnlkpilV3GJlyTPP/+UHNOQTzVVOxDIK5nMMLqERo+Ez7k7SNfpazGkJEIGFpcdFV3beSc1R7UjMZqSkTML/fUAFKtag0BLzsXn0Abs14U7kQZxG/ZFVOvJhIkSfSiapjVyPAff3b8hGFzRS2+8uWplnpemTZGhZt6xUiGcmSQlgKXkCXK1236QX3JLv5L3o9yXFOOaOdYQqHKKnHsACqXbir8poTg3r6NJMzSdc2Rj2NXZk2ckhlFLMXoP8K0e2XU3jEGoT7ri2t8OwRkSODN/70AHTsBjwUKNeKJbSVvKVe3/EI8wLvQB1PQKSEnd4Q8nHDrfkcWqrOG2TE2vCRr3XBhhqfSmx22fB1wWxlbYDX4rBG8XV5pHL7NQjg15HLQgW7Aj1BnmPVP4Y+TJVE3AMX/1m9zNShLsrha3y+GkO8StDOk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6432.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39850400004)(366004)(451199021)(5660300002)(83380400001)(71200400001)(316002)(186003)(54906003)(9686003)(26005)(53546011)(2906002)(478600001)(6506007)(4326008)(15650500001)(166002)(33656002)(122000001)(38100700002)(66476007)(66556008)(86362001)(6916009)(8936002)(66446008)(66946007)(64756008)(41300700001)(8676002)(76116006)(52536014)(55016003)(38070700005)(7696005)(32563001)(473944003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PAXPR08MB6432BA9D89EC85F016E440FDE9909PAXPR08MB6432eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB9971
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	888081bc-0491-4a1b-9a21-08db35ac27d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	00lUqtd4yhRd+TFtG34FyMZL6hihlD4bd94mLd+xIApk/T1t0OxJPBYvQZEnw2HUzWLOntUmjQbKvczCf4BRArDKfPmc09K8W2fXu2dGIsKLbSXHupTUg/cE8AaBJ63ZTyMpL7/Uw2KOn8lzrJdkGu8MGJ2rQqLJ8ctuhxwSaVY+uWUjKhzc8XJIB4wgmLO8MEdifnJutW9x0grgQT+/X8joAc0dDxY3az39W//85/rP7Y+cVdghvZz8TgoOMF3S1UW9a8KkQ3pqHk7Y7WALYipsJdb2URcOsTlNM/R42F0GTq4zI/l/2KWFdiTJG7SKKUowpsVb+pMYrIk40Bq6ilSDUvvcTp+qWDXLU80thsbTkz/WLXXJTtT0bP34W7hwIMexzDG0OMWLTI0JpPMf1TMkO9IDpzm0EQZPTXo/iHaxj+6vnuvo6IC7KUfBrXoi4vn69+CsIch5+dhST5EpnvoF5yE34C0YZZdoernlYVx+hVh+XCvAwwE4TFSI0PlvtdFGB0fnqrH7QEeiiNtlryWrnQ9+uwNEqn6nJAOSSO3aF9gc7yjFZTROpxQZgYh2jeKhh2QY7b2tXrn2Tt3Sieq9T75UrrA2/BJ/bg0E4/MovblHlIeZelBc7c48yePQnliNWTdfB0rYNmsXdSG7egBgwvj/JRLn1jA8l19AFlPpS4hJ9JW5k/VfkRHj4qAZnm/E74a75j3YVoz4cjz1ca2+OfUSFsCrmUwJpm0Na6YKQD+PKZoG9AcGxZhcTvA+
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39850400004)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(33656002)(82310400005)(166002)(7696005)(82740400003)(336012)(186003)(55016003)(83380400001)(47076005)(40480700001)(81166007)(40460700003)(36860700001)(356005)(26005)(9686003)(6506007)(53546011)(70206006)(15650500001)(70586007)(4326008)(54906003)(316002)(8676002)(6862004)(5660300002)(2906002)(41300700001)(52536014)(8936002)(86362001)(478600001)(32563001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 08:03:05.3611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa63451-78cd-451f-8845-08db35ac2fb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5367
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 08:03:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4539

--_000_PAXPR08MB6432BA9D89EC85F016E440FDE9909PAXPR08MB6432eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ross/Jon might be able to provide more insight here.

AFAIK they drive the versions supported based on what the component team (i=
n this case OP-TEE) have released.

The complexity for components like OP-TEE, which require platform adaptatio=
n, is that updating the recipe for a specific
platform is gated by when the adaptation (or OoT patches) can be updated an=
d validated by the relevant platform team.

Regards

Adam

________________________________
From: Denys Dmytriyenko <denis@denix.org>
Sent: Tuesday, April 4, 2023 5:14:14 PM
To: Adam Johnston <Adam.Johnston@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ross=
 Burton <Ross.Burton@arm.com>; nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit =
to 3.20 for N1SDP

On Tue, Apr 04, 2023 at 08:24:14AM +0000, Adam Johnston wrote:
> The only other platform which also enables OP-TEE OS is Corstone-1000, bu=
t
> they didn't enable OP-TEE OS TA Devkit (required for OP-TEE xtest)
> I agree it would make sense to update/enable both at the same time for CI
> (as long as it doesn't affect the Corstone-100 BSPs)

And there are downstream BSPs using meta-arm and consuming OPTEE (OS, clien=
t,
xtest, etc)

It would be appreciated if generic recipes are also updated for everyone to
use and not just platform-specific bbappends. Thanks.

--
Denys


> -----Original Message-----
> From: Denys Dmytriyenko <denis@denix.org>
> Sent: Tuesday, April 4, 2023 1:06 AM
> To: Adam Johnston <Adam.Johnston@arm.com>
> Cc: meta-arm@lists.yoctoproject.org; Ross Burton <Ross.Burton@arm.com>; n=
d <nd@arm.com>
> Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devki=
t to 3.20 for N1SDP
>
> On Mon, Apr 03, 2023 at 04:43:06PM +0100, Adam Johnston wrote:
> > From: Adam Johnston <adam.johnston@arm.com>
> >
> > As optee-os for the N1SDP has been updated to 3.20 we need to do the
> > same for optee-os-tavdekit. Otherwise errors will be seen if/when
> > optee-os-tavdekit is built.
>
> So, why only update it for N1SDP and not for everyone globally in meta-ar=
m?
>
>
> > Signed-off-by: Adam Johnston <adam.johnston@arm.com>
> > ---
> >  .../optee/optee-os-tadevkit_3.18.0.bbappend   |  1 -
> >  .../optee/optee-os-tadevkit_3.20.0.bbappend   |  6 +++++
> >  .../optee/optee-os-tadevkit_3.20.0.bb         | 24 +++++++++++++++++++
> >  3 files changed, 30 insertions(+), 1 deletion(-)  create mode 100644
> > meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappend
> >  create mode 100644
> > meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> >
> > diff --git
> > a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappen
> > d
> > b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappen
> > d
> > index 9a210832..6a22d47e 100644
> > ---
> > a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappen
> > d
> > +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bba
> > +++ ppend
> > @@ -2,6 +2,5 @@
> >
> >  MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
> >  MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc =3D "optee-os-generic-tc.inc"
> > -MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
> >
> >  require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
> > diff --git
> > a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappen
> > d
> > b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappen
> > d
> > new file mode 100644
> > index 00000000..e09c4a5e
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bba
> > +++ ppend
> > @@ -0,0 +1,6 @@
> > +# Machine specific configurations
> > +
> > +MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
> > +MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
> > +
> > +require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
> > diff --git
> > a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> > b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> > new file mode 100644
> > index 00000000..202caa54
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> > @@ -0,0 +1,24 @@
> > +require optee-os_3.20.0.bb
> > +
> > +SUMMARY =3D "OP-TEE Trusted OS TA devkit"
> > +DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
> > +HOMEPAGE =3D "https://www.op-tee.org/"
> > +
> > +DEPENDS +=3D "python3-pycryptodome-native"
> > +
> > +do_install() {
> > +    #install TA devkit
> > +    install -d ${D}${includedir}/optee/export-user_ta/
> > +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > +    done
> > +}
> > +
> > +do_deploy() {
> > +   echo "Do not inherit do_deploy from optee-os."
> > +}
> > +
> > +FILES:${PN} =3D "${includedir}/optee/"
> > +
> > +# Build paths are currently embedded
> > +INSANE_SKIP:${PN}-dev +=3D "buildpaths"
> > --
> > 2.38.1

--_000_PAXPR08MB6432BA9D89EC85F016E440FDE9909PAXPR08MB6432eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal">Ross/Jon might be able to provide more insight here.=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">AFAIK they drive the versions supported based on wha=
t the component team (in this case OP-TEE) have released.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The complexity for components like OP-TEE, which req=
uire platform adaptation, is that updating the recipe for a specific<o:p></=
o:p></p>
<p class=3D"MsoNormal">platform is gated by when the adaptation (or OoT pat=
ches) can be updated and validated by the relevant platform team.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Adam<o:p></o:p></p>
</div>
<div id=3D"ms-outlook-mobile-signature">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Denys Dmytriyenko &lt;denis@denix.org&gt;<br>
<b>Sent:</b> Tuesday, April 4, 2023 5:14:14 PM<br>
<b>To:</b> Adam Johnston &lt;Adam.Johnston@arm.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Ross Burton &lt;Ross.Burton@arm.com&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA =
devkit to 3.20 for N1SDP</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">On Tue, Apr 04, 2023 at 08:24:14AM +0000, Adam Johns=
ton wrote:<br>
&gt; The only other platform which also enables OP-TEE OS is Corstone-1000,=
 but <br>
&gt; they didn't enable OP-TEE OS TA Devkit (required for OP-TEE xtest)<br>
&gt; I agree it would make sense to update/enable both at the same time for=
 CI <br>
&gt; (as long as it doesn't affect the Corstone-100 BSPs)<br>
<br>
And there are downstream BSPs using meta-arm and consuming OPTEE (OS, clien=
t, <br>
xtest, etc)<br>
<br>
It would be appreciated if generic recipes are also updated for everyone to=
 <br>
use and not just platform-specific bbappends. Thanks.<br>
<br>
-- <br>
Denys<br>
<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Denys Dmytriyenko &lt;denis@denix.org&gt; <br>
&gt; Sent: Tuesday, April 4, 2023 1:06 AM<br>
&gt; To: Adam Johnston &lt;Adam.Johnston@arm.com&gt;<br>
&gt; Cc: meta-arm@lists.yoctoproject.org; Ross Burton &lt;Ross.Burton@arm.c=
om&gt;; nd &lt;nd@arm.com&gt;<br>
&gt; Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA de=
vkit to 3.20 for N1SDP<br>
&gt; <br>
&gt; On Mon, Apr 03, 2023 at 04:43:06PM +0100, Adam Johnston wrote:<br>
&gt; &gt; From: Adam Johnston &lt;adam.johnston@arm.com&gt;<br>
&gt; &gt; <br>
&gt; &gt; As optee-os for the N1SDP has been updated to 3.20 we need to do =
the <br>
&gt; &gt; same for optee-os-tavdekit. Otherwise errors will be seen if/when=
 <br>
&gt; &gt; optee-os-tavdekit is built.<br>
&gt; <br>
&gt; So, why only update it for N1SDP and not for everyone globally in meta=
-arm?<br>
&gt; <br>
&gt; <br>
&gt; &gt; Signed-off-by: Adam Johnston &lt;adam.johnston@arm.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; .../optee/optee-os-tadevkit_3.18.0.bbappend&nbsp;&nbsp; |&n=
bsp; 1 -<br>
&gt; &gt;&nbsp; .../optee/optee-os-tadevkit_3.20.0.bbappend&nbsp;&nbsp; |&n=
bsp; 6 +++++<br>
&gt; &gt;&nbsp; .../optee/optee-os-tadevkit_3.20.0.bb&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 24 +++++++++++++++++++<br>
&gt; &gt;&nbsp; 3 files changed, 30 insertions(+), 1 deletion(-)&nbsp; crea=
te mode 100644 <br>
&gt; &gt; meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbap=
pend<br>
&gt; &gt;&nbsp; create mode 100644 <br>
&gt; &gt; meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb<br>
&gt; &gt; <br>
&gt; &gt; diff --git <br>
&gt; &gt; a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bb=
appen<br>
&gt; &gt; d <br>
&gt; &gt; b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bb=
appen<br>
&gt; &gt; d<br>
&gt; &gt; index 9a210832..6a22d47e 100644<br>
&gt; &gt; --- <br>
&gt; &gt; a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bb=
appen<br>
&gt; &gt; d<br>
&gt; &gt; +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.=
0.bba<br>
&gt; &gt; +++ ppend<br>
&gt; &gt; @@ -2,6 +2,5 @@<br>
&gt; &gt;&nbsp; <br>
&gt; &gt;&nbsp; MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D &quot;&quot;<br>
&gt; &gt;&nbsp; MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc =3D &quot;optee-os-gen=
eric-tc.inc&quot;<br>
&gt; &gt; -MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D &quot;optee-os-n1sdp=
.inc&quot;<br>
&gt; &gt;&nbsp; <br>
&gt; &gt;&nbsp; require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}<br>
&gt; &gt; diff --git <br>
&gt; &gt; a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bb=
appen<br>
&gt; &gt; d <br>
&gt; &gt; b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bb=
appen<br>
&gt; &gt; d<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000..e09c4a5e<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.=
0.bba<br>
&gt; &gt; +++ ppend<br>
&gt; &gt; @@ -0,0 +1,6 @@<br>
&gt; &gt; +# Machine specific configurations<br>
&gt; &gt; +<br>
&gt; &gt; +MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D &quot;&quot;<br>
&gt; &gt; +MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D &quot;optee-os-n1sdp=
.inc&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}<br>
&gt; &gt; diff --git <br>
&gt; &gt; a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb <br=
>
&gt; &gt; b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000..202caa54<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb=
<br>
&gt; &gt; @@ -0,0 +1,24 @@<br>
&gt; &gt; +require optee-os_3.20.0.bb<br>
&gt; &gt; +<br>
&gt; &gt; +SUMMARY =3D &quot;OP-TEE Trusted OS TA devkit&quot;<br>
&gt; &gt; +DESCRIPTION =3D &quot;OP-TEE TA devkit for build TAs&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://www.op-tee.org/">https://w=
ww.op-tee.org/</a>&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS +=3D &quot;python3-pycryptodome-native&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +do_install() {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; #install TA devkit<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}/optee/export-use=
r_ta/<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do<=
br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -aR $f ${D}${inclu=
dedir}/optee/export-user_ta/<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; done<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +do_deploy() {<br>
&gt; &gt; +&nbsp;&nbsp; echo &quot;Do not inherit do_deploy from optee-os.&=
quot;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +FILES:${PN} =3D &quot;${includedir}/optee/&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Build paths are currently embedded<br>
&gt; &gt; +INSANE_SKIP:${PN}-dev +=3D &quot;buildpaths&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.38.1<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_PAXPR08MB6432BA9D89EC85F016E440FDE9909PAXPR08MB6432eurp_--

