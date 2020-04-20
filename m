Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.61])
 by mx.groups.io with SMTP id smtpd.web11.2298.1587390613241266386
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Apr 2020 06:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MP1qJp1j;
 spf=pass (domain: arm.com, ip: 40.107.1.61, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25SN15OuK8bSryUUC9gpxgcvvfMaw0ckRyDrazflqSU=;
 b=MP1qJp1j+GuuE7EJ++DPzZVcnkTew/QjmnTTP3kbWFpSfMgYymbCaYJq63YR29KprWcFHmJWuo4vN/CBMiFZ5+3YXgTRpmydbv9WZngfIsIwPoI8aniX/pXvcdiyxlj3a95vNLIxRMx3jJCn+2dRmexTBEmjKv6wCmrfOPYygsw=
Received: from AM6PR0502CA0061.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::38) by HE1PR0802MB2363.eurprd08.prod.outlook.com
 (2603:10a6:3:c8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 13:50:09 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::58) by AM6PR0502CA0061.outlook.office365.com
 (2603:10a6:20b:56::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Mon, 20 Apr 2020 13:50:09 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Mon, 20 Apr 2020 13:50:08 +0000
Received: ("Tessian outbound 76e9a4cf1540:v53"); Mon, 20 Apr 2020 13:50:08 +0000
X-CR-MTA-TID: 64aa7808
Received: from a354db9b6a58.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F5009500-1A58-458A-AC8C-D16BBB51AD96.1;
	Mon, 20 Apr 2020 13:50:03 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a354db9b6a58.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Apr 2020 13:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2mBNq/8DYM4dZpyazcM5qij9B5efb8dOnYB4vGMh3ZlHaMUDKIkCmFq6+UP719JpbloSvYhzK2vxhF6r4hMBxLBLeYmfY9LvoIRKP9xLKNEhdP2244ZxgP1sletdV2dCMSc9imVZl5C5poDDHZFOZ4EyJ0R0/+BuasPPVs3sgqvzPdR/9ytipmTP5uT8Sd5XUQ1mzJwiVcxIRmru9w28J5e3WdUM4PMy2WOix/g4kMQMroKhgt6nQ74CVVng5WT1ippn/3PwuVdOvObDzvFz81zasTOamtk9fgwqfhy3qctUO081FtdvPIYnaryK+o04PvE/7FjTb7KPVCGnBfqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25SN15OuK8bSryUUC9gpxgcvvfMaw0ckRyDrazflqSU=;
 b=UNwrxXay/fLbGuW1Qlo5AZXHev5jyT15xFojVkLV+Y8KgP5V527EbQ9zQMrxXGvjGyHQwqwL/hnK85a9bWloaxYCMf/QeA5o4LyqtfFMJbSFxerFhAQq48Oi4HPtKml2JBNKeIkPMPU2z7fC3OETUsAIhqBn0hOTFesicPmBdI/zFo1swGzIDDRbF8URj7hnylDiJolNqwzQRuYs+YzbglXSm6GSNgvqE3GfNTnl/yCnACl3libJ4ak2xZUx8DiE1mU3Q2alMr8F25u2V/3a5zrOSJQpnnOzmp+rLOuVJKacAEkhQne+ynk0hAoXDyTna/BoX1RBiLxFV6qTm3aIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25SN15OuK8bSryUUC9gpxgcvvfMaw0ckRyDrazflqSU=;
 b=MP1qJp1j+GuuE7EJ++DPzZVcnkTew/QjmnTTP3kbWFpSfMgYymbCaYJq63YR29KprWcFHmJWuo4vN/CBMiFZ5+3YXgTRpmydbv9WZngfIsIwPoI8aniX/pXvcdiyxlj3a95vNLIxRMx3jJCn+2dRmexTBEmjKv6wCmrfOPYygsw=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5044.eurprd08.prod.outlook.com (2603:10a6:208:156::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.26; Mon, 20 Apr
 2020 13:50:02 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 13:50:02 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Khem
 Raj <raj.khem@gmail.com>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
Thread-Topic: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
Thread-Index: AQHWEI2ZVc64Q/YKpkKdKSxGhiIc4Kh3niGAgAAJyJyAABT7gIAADuYAgApG76A=
Date: Mon, 20 Apr 2020 13:50:01 +0000
Message-ID: 
 <AM0PR08MB3987E41E58DDE8D91684320192D40@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200412054531.1804159-1-raj.khem@gmail.com>
 <20200413220519.GD30105@kudzu.us>
 <16058061C39D13E2.17445@lists.yoctoproject.org>
 <20200413224013.GB11927@denix.org>
 <CAMKF1soD3EJLe4tLfH-t8ovh0rMc5T4hAy+862aeGr_cRU1uww@mail.gmail.com>
 <20200414004844.GC11927@denix.org>
In-Reply-To: <20200414004844.GC11927@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 857f0ffd-6c71-4515-8a64-a0dc9742889b.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9927153b-2b4c-46b4-da74-08d7e531bd35
x-ms-traffictypediagnostic: AM0PR08MB5044:|HE1PR0802MB2363:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB236386510FAA6C3831EA297D92D40@HE1PR0802MB2363.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 03793408BA
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(478600001)(55016002)(52536014)(53546011)(9686003)(110136005)(8676002)(6506007)(186003)(316002)(26005)(81156014)(66446008)(64756008)(66476007)(7696005)(71200400001)(5660300002)(2906002)(66556008)(4326008)(33656002)(8936002)(86362001)(76116006)(66946007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zD7xD62rNsLjkQLe78tUl8ad6e8FG4p97SieExXfXMyMHoQ1t9mUtvn0OSW7xNdgpEnBcbPenvfioJiT9sMCYM6wBJg6XqJOUDtQVCygesTqBMiIWr5FKq/sS17y81IbbqMsfYRiDm9ZjK0SU/+b52fWhGj1bMgPFMwt+g5nhewzCax16YIWOSPG2xx2FgJXrfX/Xm31Awgg2EYyVfC3R1jWdw5QTz0ZZ8aFNulzZd6KV9Gx2Xv+kh+f6OtZt5787wRjI2P60Z7bT/3IT/3yNh65ca56N3irR8LNrSkPG7iIYC9AUTEfL0NwNoJhBXkk8/Lzo86XXwVJ35hlYwBeh1K31mIC96LzOKc/hDypYmxrd+atOFt+ivmrWq0muts8v3llKA4JBh6975KG1TJgC7K00WM3xkycmSK2dmrXahSi52nqz0O1J0Sv+/8bf0k8
x-ms-exchange-antispam-messagedata: 
 DPmWx9awlgSCPcDcJ/q75hVtQP9lnkcyyukSzS1RQB3ev7TxPzkeZhvMRqU37DEIbg/BZaQ0FiTgoq15Y2FfY4Tq7nTyNLrMjX5P9K8t4T0ZNPdayoD6EqtaEBw3Lll5iJcaOe+LLe+ZLfOZ6oudTg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5044
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(478600001)(70206006)(70586007)(82740400003)(8676002)(9686003)(8936002)(55016002)(81156014)(81166007)(4326008)(33656002)(36906005)(86362001)(316002)(26005)(110136005)(7696005)(2906002)(53546011)(356005)(47076004)(5660300002)(186003)(336012)(52536014)(6506007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b74552a7-2531-42fa-67e3-08d7e531b94c
X-Forefront-PRVS: 03793408BA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X0bN8nC89zvDs9Mtx1TQfCkH1vqyr3C1Irwk6zV1KoVXtim+cR72KbtCx57LmcGOf3Fvi6/X7lRZ4wy5MCmZHF2R42S6jtkhObE8mObIYRDf3SzKbMnWv5D3O0OCnzA5Be9hw7LSzEm8q0A86cq5bL+7Z7FCjm6T1qHaIq+CH4dZNrtOCi4sD5/4TxZcQnkYOvFcdRKvaTYGLg4cDlwibwHn2Di8LGrFKKpQCqHf9DX+nabuRBarQ89jDnI60i3zOvkEP9YQuJP3OOZSd2e+k2IQx3pkGJgz6c4a5yG2S/baldCCS96nptLop7OYJMHXzneF3Nr80GLK1rCRuKSxe3ENoa4pf81KG3OH6ps4P5PEb26bDQ9X5ZIlvwLmaT9eqtUpyGMPf5xGAC1MOF9Wy2UWWUi3jmehbTddxWWXdyxcTjLz6qTtiGbIdXnHAEDslYUi6KNMaVSM1yz7LGVm14VXbSg0nqi+LnJSl60gYcuYZkkPmdfvCBLr3hORL0dniEGNyNU6bcFsrcuzPjOryw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2020 13:50:08.5725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9927153b-2b4c-46b4-da74-08d7e531bd35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2363
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 14 April 2020 01:49
> To: Khem Raj <raj.khem@gmail.com>
> Cc: meta-arm@lists.yoctoproject.org
> Subject: Re: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
>=20
> On Mon, Apr 13, 2020 at 04:55:25PM -0700, Khem Raj wrote:
> > On Mon, Apr 13, 2020 at 3:40 PM Denys Dmytriyenko <denis@denix.org>
> wrote:
> > >
> > > On Mon, Apr 13, 2020 at 06:06:37PM -0400, Denys Dmytriyenko wrote:
> > > > On Mon, Apr 13, 2020 at 06:05:19PM -0400, Jon Mason wrote:
> > > > > On Sat, Apr 11, 2020 at 10:45:31PM -0700, Khem Raj wrote:
> > > > > > all arm SOCs may not support optee and there are non-arm
> > > > > > machines too this makes this recipe fit into mutli-BSP
> > > > > > environments, platforms which support optee should be
> > > > > > specifically called out via COMPATIBLE_MACHINE, for general cas=
e it
> remains 'null'
> > > > >
> > > > > Pulled into the master branch.
> > > >
> > > > I think this was due to the parsing issues, resolved by another
> > > > patch. What's the point of masking this recipes now?
> > > >
> > > >
> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > > ---
> > > > > >
> > > > > > diff --git a/meta-arm/recipes-security/optee/optee.inc
> > > > > > b/meta-arm/recipes-security/optee/optee.inc
> > > > > > new file mode 100644
> > > > > > index 0000000..a12521d
> > > > > > --- /dev/null
> > > > > > +++ b/meta-arm/recipes-security/optee/optee.inc
> > > > > > @@ -0,0 +1,2 @@
> > > > > > +COMPATIBLE_MACHINE =3D "null"
> > > > > > +# Please add supported machines below
> > >
> > > Can we instead of neutering all OPTEE recipes and requiring BSPs to
> > > provide bbappends with COMPATIBLE_MACHINE for opt-in, add
> EXCLUDE_FROM_WORLD =3D "1"?
> >
> > its fine to provide it via bbappends, as long as it is per machine,
> > which really supports Optee it is also educational to understand the
> > recipes thats way, excluding from world is then not required.
>=20
> This is rather backwards. OPTEE is widely used these days.
>=20
> What's the harm for the recipe to be fully open and compatible, if it's n=
ot
> being built by default?
>=20
> Otherwise, we should similarly neuter ATF, U-boot and even kernel - not a=
ll
> platforms are supported by those and require per-machine support and
> configarion added. Why not require those to be opt-in via bbappends?

For `trusted-firmware-a` recipe we use `COMPATIBLE_MACHINE ?=3D "invalid"`
and I think  we should we use the same strategy for optee (use the `invalid=
`
term instead of `null`) to maintain consistency.

--
*dS

>=20
> --
> Denys
