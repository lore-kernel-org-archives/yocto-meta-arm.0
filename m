Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.52])
 by mx.groups.io with SMTP id smtpd.web10.10875.1597222309565845041
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 01:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3XtBNeRb;
 spf=pass (domain: arm.com, ip: 40.107.8.52, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu65iCsnNKnPBUEhm6LKQyZwuCWVLeSTI8xAO6UOhlM=;
 b=3XtBNeRb4iAalHIbqxfkpu55gIttfc31pMLXi/zRbful3Ej8/Jh43bV9V17yi1DBYeFxDJBxkETNapIdDk/jWBL1Qe06n0mkpXYLBtYGD9FEKuCynsRfs1WEBGciJwPPIQ9PB961Ojt5mQNQaoMGJmwS97NnRf0s3mgzYfEc19w=
Received: from DB3PR06CA0004.eurprd06.prod.outlook.com (2603:10a6:8:1::17) by
 AM0PR08MB3090.eurprd08.prod.outlook.com (2603:10a6:208:56::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Wed, 12 Aug 2020 08:51:47 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::67) by DB3PR06CA0004.outlook.office365.com
 (2603:10a6:8:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Wed, 12 Aug 2020 08:51:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Wed, 12 Aug 2020 08:51:46 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Wed, 12 Aug 2020 08:51:46 +0000
X-CR-MTA-TID: 64aa7808
Received: from ed892a26b3e7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CCBB5B11-4B7A-4A49-8741-DEFB23673560.1;
	Wed, 12 Aug 2020 08:51:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed892a26b3e7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Aug 2020 08:51:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biPMOtj/Q7abYoRh/OpK5S4Ba7q5zQqOtBCXvQf+eiN8pP88P94FoFm75V69jNVJp339h8v9YAGRcJR6t91gVa+zEEsukBx8FRuqMpLYgm4dUkteOoEKjvHBuYi6MWmiTTHy0DtOEmDDAG4VJlAeYJ0448hV8kJWKgDlHBX5Xll1QLiUGTG4qpnuX6xuRbAmgzqVdKyxihWIVkOOSamVPgvFbbFPYt7pImXLUN/zJrZ/o/C6xnxw9mukrjx//FiMAkq/zX0tWr0noySKLJvvnY59t7uYdv1Sfwth+ki4WT81cAPTm5YqT5fbxqDMvpDKDzMb+dhkj3pHsaxSsdIKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu65iCsnNKnPBUEhm6LKQyZwuCWVLeSTI8xAO6UOhlM=;
 b=X4pDaLb4P2IEv4KOd5muJGP2FJ/eDb2UuZTC0I2VbxqdYx1t6kYMJY+QBu5HCSLv+2EcXHo11CLfsYVBG84J3UlKeUQv82KtZJtDyXuKn2BDwi2Qnp/Rd0fT1CYn+LWuc/F+pgGxub15i5GnFR6ngNUGGSc+afc+KSTOQwGzY9Jo/4p8vzUqQfCdLpNUuqxpYxVAsusUmkkQxIadKHuJEzT2SjYHvAK6KZrybSUIWQ5uyAo01g/pxfN/b0Y6r1u31LBOR1waKauFVRPXBS0E3zpRNAIkz5+42PxSHw6J76Yx9r52JPoyxGHsHklgYqCTwBHIJe3Sw2kGDCa74CUsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu65iCsnNKnPBUEhm6LKQyZwuCWVLeSTI8xAO6UOhlM=;
 b=3XtBNeRb4iAalHIbqxfkpu55gIttfc31pMLXi/zRbful3Ej8/Jh43bV9V17yi1DBYeFxDJBxkETNapIdDk/jWBL1Qe06n0mkpXYLBtYGD9FEKuCynsRfs1WEBGciJwPPIQ9PB961Ojt5mQNQaoMGJmwS97NnRf0s3mgzYfEc19w=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3813.eurprd08.prod.outlook.com (2603:10a6:20b:85::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Wed, 12 Aug
 2020 08:51:40 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3261.025; Wed, 12 Aug 2020
 08:51:40 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "ross@burtonini.com" <ross@burtonini.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm/layer.conf: unify on a layer priority of 5
Thread-Topic: [meta-arm] [PATCH] arm/layer.conf: unify on a layer priority of
 5
Thread-Index: AQHWcIVop+ZF3GPKcE6o/7WF4eCEKak0Klyg
Date: Wed, 12 Aug 2020 08:51:39 +0000
Message-ID: 
 <AM6PR08MB346170641095967351FE2D1392420@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20200812084803.3235721-1-ross.burton@arm.com>
In-Reply-To: <20200812084803.3235721-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 59900f44-bb25-45c6-914e-d6c133cb79fe.0
x-checkrecipientchecked: true
Authentication-Results-Original: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [78.105.98.91]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a471de4b-102e-4ae1-05a7-08d83e9cf204
x-ms-traffictypediagnostic: AM6PR08MB3813:|AM0PR08MB3090:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB30909FB07FB87364CE2B4E9E92420@AM0PR08MB3090.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kU5mRe/0+M3RvWaTtHLpmiaMiC9I4iGnAA3SIKLolqWzZtG582rAPj3KFhkZFcbXsxvIToGSuCYP6bD8I1h4Gk/uYn3XZy2FyS4uomSZnunc6yDmhpwqjjF4uk+b7Wg8IxANJILNTwUS+f2RlHEjn1H51cZjmFos2iAfGpxaIKjhPn4R9FMZcFUhpDaUx9NZYc224JZcC8W3JhsCt3Mh1+VmnuAoEr11YxXErYjBEl56a7x+Lus6rb23lrXZdi8tym25mKau3UL2NFWl/AoJ8tWNQVqT0LCY8oFGk1uxdhoNChxT6C/SbfCtPGkNV5RZ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(110136005)(52536014)(33656002)(76116006)(2906002)(55016002)(71200400001)(83380400001)(6506007)(316002)(478600001)(9686003)(66946007)(5660300002)(186003)(86362001)(8676002)(26005)(66556008)(64756008)(66446008)(66476007)(8936002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 GdMKPeIZUSVFP9nYGsje0Xm8CylsZzpb84gQLTl6UpbitoUlnS7AXLIV+7viQijr+hG41gUORLkFA4/6ImE8CuC3j6Cy0FcctNsGlMS+KbDvEVUZt0qWVc3T0n+8gfQYFtOhn/0M2jC7CZzaR4IXibYExkDkBY5o0zfkf1mH+l4yOrSMC7TId1A3p9lPsQKtPJLNzXssu4xtjDcpiZ2+YVwyugj4Xpte/AXIKbiYfPja3mdMqr3Gh+hxMUMJd6oz33Hh37shF3xTpJWKN8jIxn6sOKKPgeSFlww17Bky+HxEcTtNPJsOXB/Y+LQVcqH0KMDHq5ejuYtvZQr6plvbbgvdpz89BPBOMZD1c8vvx99ge75t/g575Hv9JD4icA9CDstDISyfpk9FIlIrH7TLw0FYqiWFm+DfHjaCx1yOX2CpSh5KCZTLFTA2cyoiHy+v5ukLWIVujK5t4l6J7ZblioNGFrtiP6gByq1jR/f+2be0bWLnkFLok5B2J7b1SlQqFXg0eRdwBKjBLOG83CCdgFxMeLmvM3KD7y0LvImHHu8p3LjkSU+esMp4PwIhwtKWIrpMB+uTBs3H33Xmb+8+zK8X2BqjpmgFelo8uANClg9Vnb7W82tAd4+NMoezBWDeozx4ZsoOx9Dm9Sr6YhHnsQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3813
Original-Authentication-Results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a943edac-1038-4615-1f74-08d83e9cedf5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cu1cjRFmOh3b+ihN3WHsTGqIFgW3KtXX8tAF3CigauNiUbCRjqOmsLrATQMEgq8VGWCFhKQNZN6t5xZ+l9Ra3OsaiF4YqnoSd2zLa7wH0l5O/0SVMs0P9rHiCsukajIHwnv1v7XfbQ9Ud7qWHUIk1RIbXAKpy+RgZNfpFIGKIiCJNdGTLWRZwE6jNeTKx13JD67tR5USdRaU+J+A3oTtMXwLtRFFvV1RF+DMm56KoyyaSiF0ecUURObqTli2rD89bLxL+guj6Gb1ZEDnfTXf8iKq36zoxZryoO1Z2pYzNWTafONdp1ZCWFR/6mauS93oFqsFvjEez3OEL2394cl6PAxK1ne0SnbcjNgZTJ6ZZsdVOpnvtU2nZ0dEoA4lB0Apj/gvZIE5TvMT8cJ8ub20pg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966005)(70206006)(70586007)(2906002)(6506007)(7696005)(47076004)(86362001)(478600001)(8676002)(52536014)(83380400001)(26005)(5660300002)(316002)(110136005)(55016002)(8936002)(81166007)(33656002)(82310400002)(356005)(336012)(9686003)(186003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2020 08:51:46.9025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a471de4b-102e-4ae1-05a7-08d83e9cf204
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3090
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
>On Behalf Of Ross Burton via lists.yoctoproject.org
>Sent: 12 August 2020 09:48
>To: meta-arm@lists.yoctoproject.org
>Subject: [meta-arm] [PATCH] arm/layer.conf: unify on a layer priority of 5
>
>From: Ross Burton <ross.burton@arm.com>
>
>This layer may want to ship older versions of software than oe-core for so=
me
>BSPs (such as u-boot), but we don't want to force those downgrades on
>everyone else.  Unfortunately because the meta-arm layers have priority 6,
>any recipe in this layer wins over newer versions in oe-core:
>for example with an older release of u-boot in meta-arm, simply adding met=
a-
>arm to BBLAYERS will result in qemux86 downgrading u-boot.
>
>Solve this by lowering meta-arm's priority to match oe-core, so that recip=
es are
>treated equally and the usual version ordering applies.
>
>Change-Id: I6de7a6b493e71b8b88862018b9fa35608342c1b2
>Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>---
> meta-arm/conf/layer.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf index
>14a5922..d53c40a 100644
>--- a/meta-arm/conf/layer.conf
>+++ b/meta-arm/conf/layer.conf
>@@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
>
> BBFILE_COLLECTIONS +=3D "meta-arm"
> BBFILE_PATTERN_meta-arm =3D "^${LAYERDIR}/"
>-BBFILE_PRIORITY_meta-arm =3D "6"
>+BBFILE_PRIORITY_meta-arm =3D "5"
>
> LAYERDEPENDS_meta-arm =3D " \
>     core \
>--
>2.26.2

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
