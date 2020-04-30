Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.89])
 by mx.groups.io with SMTP id smtpd.web12.7943.1588256812040270397
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 07:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IXU23uAW;
 spf=pass (domain: arm.com, ip: 40.107.6.89, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvpRS0MyeJdB4JDiAWAVa5CRPDzjLyD9S1Tdq3198q8=;
 b=IXU23uAWqQ8uqEj11xJ2UIBfTKbypSaHfjmTHnZZVRSCjeNbGXM4jn7rGLMrRPJI5LCufHZyojoqzOHeHW77Y/Q15UUnEjHHhH7Il4rppdRM/7vnWHHmoJyKXBjbugwjRRUEKRJ6DtvLfe5E43YxubgAkPB2z2hNQ9Vqg4/7qzo=
Received: from DB8PR06CA0032.eurprd06.prod.outlook.com (2603:10a6:10:100::45)
 by AM0PR08MB4481.eurprd08.prod.outlook.com (2603:10a6:208:148::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 30 Apr
 2020 14:26:49 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::cb) by DB8PR06CA0032.outlook.office365.com
 (2603:10a6:10:100::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 14:26:49 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 14:26:49 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Thu, 30 Apr 2020 14:26:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9cbabd2535399c8
X-CR-MTA-TID: 64aa7808
Received: from 4d108650adab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2BF472B5-4739-4BAC-96D6-1E23A0B7F74C.1;
	Thu, 30 Apr 2020 14:26:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d108650adab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 14:26:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6UO5StDamfHZ1BicYKVyY+jA7rOtvYi1CRjyPvoDFfuoam1MlRvcnB9FVhVz3ITb3sRiak9/Qu5KcHh5jnZeBDVi6Tq8NLzEoVXAN8/KfZdUOdlL7oduBRRKMQhZ+8AuUpLmRJ889ywSVZVGooffnjGaoIIGUciYWn1HqYiCzmG+SeCZ5Ffaf3t+artw5bAQzmdDwjRFRQ+gbGMjlAj8uNx8kYu4thKky1mcu9YzzrfuYaoWS+zySCOAFqt0/m3V+uFootJXcTEv9afaG271wPImhoy6JSPZhNuyX/gpA/9iGNz4ddJh/I0Fn7Hy+tJfdpjlzHNmC3edGDB7ZIpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvpRS0MyeJdB4JDiAWAVa5CRPDzjLyD9S1Tdq3198q8=;
 b=fJ8Hl2tUDkb54y75wXAI5JZJwPvW4utPJG2oClSzdl5BINoE9TSaC1Coom66Ddzq7lPXJ+cOwwTFD8Uw5fiAxaR2AYt8UK4Q1UvrZfHNaCPg0Rnu2+FkkG+PEBzNKwlsC4KtMPujdWMju8IyjXJt7ONtNQApdWxUnnnQWQixOBTVCcfrbrxE8xWxOtta/CSTF4p2YHov0k4rluu0WLuEvP3TFS+DCDUGsFv04J4ZSCGCXiu+BqkeY2+EmUuoVm9teISoq6kYZ/WSmcoeqkLPz3i4z6jp7sTeaTylFDjXopTw2x2eIBYwEFvqmK62IHcT1F68YcstTYfR1KUD7iTSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvpRS0MyeJdB4JDiAWAVa5CRPDzjLyD9S1Tdq3198q8=;
 b=IXU23uAWqQ8uqEj11xJ2UIBfTKbypSaHfjmTHnZZVRSCjeNbGXM4jn7rGLMrRPJI5LCufHZyojoqzOHeHW77Y/Q15UUnEjHHhH7Il4rppdRM/7vnWHHmoJyKXBjbugwjRRUEKRJ6DtvLfe5E43YxubgAkPB2z2hNQ9Vqg4/7qzo=
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com (2603:10a6:803:ba::25)
 by VI1PR08MB3551.eurprd08.prod.outlook.com (2603:10a6:803:79::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 14:26:42 +0000
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926]) by VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 14:26:42 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/2] [arm-autonomy] Have meta-arm-bsp specific bbappends as BBFILES_DYNAMIC
Thread-Topic: [meta-arm] [PATCH 2/2] [arm-autonomy] Have meta-arm-bsp specific
 bbappends as BBFILES_DYNAMIC
Thread-Index: AQHWHvZ0a/zCepdfIUOX2RXsfAV4JKiRuM8A
Date: Thu, 30 Apr 2020 14:26:42 +0000
Message-ID: <92E490B5-C071-439F-BBD2-A6396CB1FE9B@arm.com>
References: <1588254663-86702-1-git-send-email-diego.sueiro@arm.com>
 <1588254663-86702-2-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1588254663-86702-2-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5da5224c-6ab9-4f27-3974-08d7ed128508
x-ms-traffictypediagnostic: VI1PR08MB3551:|AM0PR08MB4481:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB44810B492C159AA2103EC56B9DAA0@AM0PR08MB4481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:669;OLM:669;
x-forefront-prvs: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 sDNBTEYpL1PwgSMAsfAIhoBn4eg9ACRZ8q+wccc04jhxCtAiRLOUyzFpsGJORXhHXvjZNrDq3gGW1uEvK9gDkAy3IzfbOMYiTViRZlTtUJ7Sq7noTsxS96Qzo1r7gpcWEteFrIQCLi5G0kpWzM+47Cf3oNEPWuJMUEeT3gauVzx4GEs0cgpXNWtgRCqEuGzoAtyZs5aKJf0mRg0yK43xkONymWlMIY0LmX6e8XL/0164xS5O+FyQz+DAwnidpbMvMZjqGOEOp3oz8rcOv4YdONRkJDKRiVYRpfaz3i4Sef46pTG57Nf/wT3Rt2XroJhPWP1nyOrxYceG7XxmjTmFCE/gSr2bKNRoUH2WcCrFcOFczQZ/PeMDytYvQjt6tLZOLld4bXr/fbF/+1cG6Xm0Sor9xI9v9Vxq8LvQ4dAQcxAd1jg3v5GB4MtV5ZKmBfhdqqHcjGQ0aMiIC6JCMvR53AzCOD0biGDRAdJcTO2itfJ2WSwpRWHilU4lxomsbpo3ImPKBybcc8ILoNlKyZIo+Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3693.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(66446008)(64756008)(66946007)(966005)(6512007)(2616005)(6486002)(8676002)(6916009)(478600001)(2906002)(5660300002)(71200400001)(76116006)(26005)(33656002)(316002)(186003)(66556008)(66476007)(8936002)(53546011)(6506007)(91956017)(4326008)(86362001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 DZoZbkPS11qL7iyzxn6vv+f0jmi6IfvhFmUFHqp3YHR72J+YEJdpH9Sld77pATftzFYBcKnj+0ayjyFfEy5HnNYih20f8cTfRxCOdVTvDZpfwo8lJUZ6vxjyqaYdruNy7cpf2S6PIR5EkfNGoTTQuUV5rJ2fADL2ZN7+ao9kP6QHEzm3wCLlB9vQYiNfUzPOv4MyPNjCljvHyFpAjmsg+Y0njC736dFrTNesnP6eTtuzqzjlvefTJN/9oOv0+hinUG7/pjKymgeAafU3O+07Zi03muz4DFcsezZA36/j2L7TKm/spekZmQszgkBtQ1CRahg/MMdQialUDRr838kb/J4/ikAW+VztIHodX6YuVrS5Uoc55RbWvW9HQP+XfApOaK1trgPnWsKa31YKIwgxg6wdL1hPu+nz2Lage0t4yJUu5taNkKYdOjqJhvs7w9XhWXfi/rJGoZJfwe2OA0WjzjJi9nWTFKw8Ko6GncgPf+Zhl8LKXe/RS4EVJlCM6kl2CRVVolrfNXGZZGWvyYKdmjOJFLrFEKwi3rLuz6/6W/R7YSTndAHmvow+lipJubsYoq2ePxkaM4vu4I9Kiorq2AMbnVmm5WdM415anJ9M/rTlDIhl6Mj9GA1sP58KcAhVYr0BdjuWdWMOQpwlfL6EslfkiYSi9oC2UEuJ21+HyaKi26W52oNsXQjamZXiHmJU/o/7r2NeXp3GT18FeBT7phZR9ws1Gi89TKtJAeSNJjqUPaf+4QK8heqiX5vYOGpl9HRR/nlRYB+AGOMoCyjTnX4PFF9Moclp/4PvzvC+aT0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3551
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(36756003)(2616005)(6916009)(8936002)(2906002)(336012)(6486002)(478600001)(6512007)(4326008)(316002)(966005)(8676002)(33656002)(5660300002)(70206006)(47076004)(81166007)(356005)(86362001)(70586007)(26005)(6506007)(82310400002)(53546011)(186003)(82740400003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	758dbd9f-cb8d-40ff-9814-08d7ed12810d
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mZaVfv8nzq7weeF1KIXoYGs5IM85TFmZtofk3n2agsG1KYSnkV61e1WNEJLf1bs7UUwixqAVS9B0Uu4AfDB/InnwMbjbyWZeY56VBRN3v3ezPRKNEyYk9WFkUFeBUTkTUJdfoccEEP/vFTWA/trwFxft9WRSF0vw6fT6kUhJEorvP637x5Hf/owJiVmSelDa9e4tFtyKRekgYENsvbImSQWLzZJB3Q/svZRbJgWEEG3YcTonI67b1JrctdAXOY7guPhiVtK4m9VWeaq97DzLBAHQ7sYVV6V8ovM5DVsru4M7DBbcm/yD+pmoS/fI+W7WHkcqPNlBfU4LuyT0BUHn5twBln4NXEhxxKHzpcfsBvakIX2D9W+4Rga4Mwuoby1u2ZgO6oFN0yV+k0/zUyk4WUAAEoM+p2eb7KjV16kRwwNYLSXzW3Q01a283cUnnK+nsfD9lZr64hte48K7H0piZkzdDlGHyiqph908dtxWxAdbrsJG9iy8EoecBWGxoq3Yl44H1aN2gVgNK3Quv/6XFRljyS9czY8uUp81PpU8vlsMHBMOHJ68oyyv8EeHrCe8EUsnl7Lg0OjAVjjBVP+biQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 14:26:49.3247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da5224c-6ab9-4f27-3974-08d7ed128508
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4481
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <600DBD5FA2A4814DAC4A75652BCF925A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Apr 2020, at 14:51, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> The boot-wrapper-aarch64_%.bbappend and firmware-image-juno.bbappend
> should be only considered when meta-arm-bsp layer is present.
>=20
> Change-Id: Id66a989820675a281946a26b9afec6d5b3d29bca
> Issue-Id: SCM-984
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-autonomy/conf/layer.conf                                      |=
 3 +++
> .../recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend  |=
 0
> .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno.bbappend      |=
 0
> .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r0.txt |=
 0
> .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r1.txt |=
 0
> .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r2.txt |=
 0
> .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/uEnv.txt      |=
 0
> 7 files changed, 3 insertions(+)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-bsp=
/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend (100%)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-bsp=
/images/firmware-image-juno.bbappend (100%)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-bsp=
/images/firmware-image-juno/images-r0.txt (100%)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-bsp=
/images/firmware-image-juno/images-r1.txt (100%)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-bsp=
/images/firmware-image-juno/images-r2.txt (100%)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-bsp=
/images/firmware-image-juno/uEnv.txt (100%)
>=20
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/=
layer.conf
> index de79bdf..83c149d 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -29,3 +29,6 @@ ARM_AUTONOMY_DISTRO_CFGDIR =3D "${LAYERDIR}/conf/distr=
o/include/"
> # Add class to handle arm-autonomy distro extensions
> USER_CLASSES_append =3D " arm-autonomy-features"
>=20
> +BBFILES_DYNAMIC +=3D " \
> +    meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend=
 \
> +"
> diff --git a/meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wr=
apper-aarch64_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/re=
cipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wra=
pper-aarch64_%.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot=
-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bb=
append b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/f=
irmware-image-juno.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bba=
ppend
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/imag=
es/firmware-image-juno.bbappend
> diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/im=
ages-r0.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/ima=
ges/firmware-image-juno/images-r0.txt
> similarity index 100%
> rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/ima=
ges-r0.txt
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/imag=
es/firmware-image-juno/images-r0.txt
> diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/im=
ages-r1.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/ima=
ges/firmware-image-juno/images-r1.txt
> similarity index 100%
> rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/ima=
ges-r1.txt
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/imag=
es/firmware-image-juno/images-r1.txt
> diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/im=
ages-r2.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/ima=
ges/firmware-image-juno/images-r2.txt
> similarity index 100%
> rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/ima=
ges-r2.txt
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/imag=
es/firmware-image-juno/images-r2.txt
> diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/uE=
nv.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/f=
irmware-image-juno/uEnv.txt
> similarity index 100%
> rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/uEn=
v.txt
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/imag=
es/firmware-image-juno/uEnv.txt
> --=20
> 2.7.4
>=20
>=20

