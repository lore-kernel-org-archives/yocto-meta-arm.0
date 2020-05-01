Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.83])
 by mx.groups.io with SMTP id smtpd.web11.5563.1588315579556821984
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 23:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DYWktfl7;
 spf=pass (domain: arm.com, ip: 40.107.13.83, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOclbzm2/fqnrPkeMl2Sitz83pq/qn5sBZr6V0vqbeQ=;
 b=DYWktfl7FET3yAQT2o7ugMyM7A6O4ggxrGaWW5Lg0rL5svJwD7gWA0sB9pM9xmBt+iuqQpjgq2q/7OeuaazDsOGYLlUojWwe/LMsWpehJlvxzyrhle3aHI1/13utS6G3csmpgpi37dVB/SBxyNBIYkGy1OfthhTJFj2zY3tQPIM=
Received: from DB6PR07CA0171.eurprd07.prod.outlook.com (2603:10a6:6:43::25) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (2603:10a6:802:1e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20; Fri, 1 May 2020 06:46:16 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::f9) by DB6PR07CA0171.outlook.office365.com
 (2603:10a6:6:43::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.18 via Frontend
 Transport; Fri, 1 May 2020 06:46:16 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 06:46:15 +0000
Received: ("Tessian outbound 11763d234d54:v54"); Fri, 01 May 2020 06:46:15 +0000
X-CR-MTA-TID: 64aa7808
Received: from ce1d4652716c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 53BCC01D-659A-49F7-87BC-43586D4CBA09.1;
	Fri, 01 May 2020 06:46:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce1d4652716c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 May 2020 06:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqnfQ5VSN7wPlkmNBL7yNDUpO0ZOSUa2UzLXeil49bBYgQyNx1lVrY8o2r8oyfsF2jXLdrAO5/wvTE05ZbOnbOXAEUQgRlwu90skjrWodIv5qjXmpmtYZgR76Yun7zFbokdrKMze8AldttPnei5/i7/Qpadr3yqz81y7OkREwuZ8o5O9/yA3wqIr/a7SmwqR+wi5FDg5MJ2ascFCmRYzIqp8dnv8ilBdfnFBvjO4rtN21GQ8cURACl8VJNPhX8r/mz2l/AVwf/Fs3egxSPIO7thWa/YdvDUadqx8Gwok5dfXWkDG57UkzTFpkVznstwadfTk3Jowyq3TQKSmF/+d2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOclbzm2/fqnrPkeMl2Sitz83pq/qn5sBZr6V0vqbeQ=;
 b=dryv2wNybOS1P6XzB/OM/v4kHcNwzJusFjCZT0S5odjWeffuRCUVUCFPNM6e88WR8X02SHV/UUiiSNFJw+IkvGGCdA10+XYAb54R5s6TryIZwsf+k3LcRzhGykpblAUvD+6NVXwlylIQkDJAucx862aVJ+vWGhWOIvqHpHARxZzxyUrxdY5sWaPYAAO7cP6xb6fxITWOaVD44z4vOUxzElPRU+0DclTRBXCEgZu5Mfx9DjIXAqgZ7pKyOwHDQc+4JAqtePapD+D/eCVYmB6GNa78fCPAw8v9Vk20iZNGkUCqa93FhpzTvpob46S8rQMHTUdweBz+62ug5I/qSuwAJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOclbzm2/fqnrPkeMl2Sitz83pq/qn5sBZr6V0vqbeQ=;
 b=DYWktfl7FET3yAQT2o7ugMyM7A6O4ggxrGaWW5Lg0rL5svJwD7gWA0sB9pM9xmBt+iuqQpjgq2q/7OeuaazDsOGYLlUojWwe/LMsWpehJlvxzyrhle3aHI1/13utS6G3csmpgpi37dVB/SBxyNBIYkGy1OfthhTJFj2zY3tQPIM=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3170.eurprd08.prod.outlook.com (2603:10a6:208:65::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 1 May
 2020 06:46:09 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.020; Fri, 1 May 2020
 06:46:09 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/4] tcmode-external-arm: drop unnecessary CPPFLAGS and LDFLAGS adjustments
Thread-Topic: [meta-arm] [PATCH 1/4] tcmode-external-arm: drop unnecessary
 CPPFLAGS and LDFLAGS adjustments
Thread-Index: AQHWHqVfn8O4Lje5o0eaGM8aEYNm4qiSyoKQ
Date: Fri, 1 May 2020 06:46:08 +0000
Message-ID: 
 <AM0PR08MB398746628A1C3F2836A3FAEF92AB0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1588219828-34791-1-git-send-email-denis@denix.org>
In-Reply-To: <1588219828-34791-1-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 25f4c022-141b-4b35-a964-0f84b580e87a.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [188.221.127.70]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce867941-9fc8-4a7f-a631-08d7ed9b589d
x-ms-traffictypediagnostic: AM0PR08MB3170:|VI1PR08MB2702:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB2702AEDDFF2D323FE43B42BF92AB0@VI1PR08MB2702.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 0390DB4BDA
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(71200400001)(66446008)(52536014)(26005)(5660300002)(478600001)(4326008)(6916009)(9686003)(33656002)(55016002)(316002)(2906002)(7696005)(54906003)(6506007)(53546011)(186003)(66946007)(64756008)(8936002)(66556008)(8676002)(76116006)(86362001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qPV99U89Ac6cG4iDkFSlxWnda2PELLKa8CdutNTI0iBJbbq4o8q52yHpg/uRcL37eQww3Q2myGMgb75yZYGJzbcEBhffxcs3pJbXNJDmyBdmpZrHbqypt+/JN0SOEJoyEdVVtnU+bRzcGIoOgfxBTJaVGhshAzznSWMawViqZr2jf6vP2LR6MCbxlOdlqR+6rqJazLAn23WSv72dDWcbSP1NdjQRFia+2xj17+tAMvxx8ddQyWUgcS/qdG8/s4ElaLeCZtDKo2EWDs/lF/iFZ+GBBO0vP54uajuhERiwPmxWf/dKKDqoNXrYUnCsNkmZnm5/GnmUPpu9cZ0VzFEIVQjdUrSV1Ur3nsRvDqiIcmS04dRxC5GJYmZAb9uQXJJ8yN/lvtHwJI2jpa5yxTNRbBFRjWgCcjXG0F5sPdLP54osNRwOiTVFQcxRmciKP3ux
x-ms-exchange-antispam-messagedata: 
 I6K5n2++NMxjvy2L3RBjG241CWbtCZSQForAivMmmFN2BZoOOzqjCh7KgUYRgSok3tU2BslWTWIWAvnaRy9FsNunpMBidYJ4g1gs3EqTggljxW91LVx0hfNug3m18AI6FEa1HiZUs3mDHw2xvNWVvhD/6WRCimAa5YZToMWIR9rn+fbwC4qPpplDppbIhLRZn+CUeO9xQ7/I78RZs4ONkEkL610RnUertWyv+vjsSqrrQTdyfhPcC5Y5qjNIgSdGUVCE6R9mVtedot6wB9Nr9VVE5qs1TMT/8EXWjmzdyD3I8EAaZBGzhkUfd1Y/8hmOcD27hr2oP+LZPo9uecsWLU7JqduKhYxRGS540K+fxr6MpamyFB3qjyUBpW+kyfc5q1eFYQ3mLrM3OQmIqR3qn9Js3PcwHxDwjEGVhRd2a6pbn0k1VlSQSNTfYPVaHiAwboSum6W5K8d85qNocg2/l/4I++9k40uKZzkb10v8bf3N7UB23aGiwbFPCRGq9bBydQRl4rzHrEMC+L8PPmBWjQ1GR3a48dxwyWanxaDAm3I//Qu3VqV8G0sss5ZS8DkYVZjPNnLmdof0souH6BVehKDozAMFV+N5iYZN7Oaz2R90ev3zCz8Jzjywh/G8kmTXJH0SiyoXdl4A+OovAJWZyRSNMrT1MG9EW1yY4ONmrRQ4ZEzOWSUZt1//K7t0hd4DawJMaGPn8RkcsdSkyV983WUfJxsF2/eZZpMqKlEbpEHiO0ZfwbvsLT4EJFpEScfmIzcNJUNMVSEmBQQhMj3wm43bywBaqK59uurAYjmLkF0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3170
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(82310400002)(86362001)(70206006)(5660300002)(70586007)(82740400003)(53546011)(6916009)(6506007)(478600001)(7696005)(186003)(26005)(2906002)(54906003)(356005)(8936002)(47076004)(316002)(8676002)(336012)(81166007)(33656002)(52536014)(4326008)(55016002)(9686003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	75fd3892-4561-4cb4-0cae-08d7ed9b549c
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9c31s42evkSM69geaS0O+53MOndk6D1N1IyeKySySjUvi8BbYKYX9X9SCfcHzvZNDKK2S9BDkaxL/mZb8qoRi4zBMEGdw2AHSRpiDkFY49GOgyEro+daTrP/DyESynRnQb10lPowEN1PUyxbcV/2mN2AiaRoN4yyjBNq7gFXhSfRdsT+p+PeBbq+Qh/MoXXIBdpnMtf6dFZCWVeRs+UAxLPH6Ytzb3EDvwuEYKDUgnApnQ3mft8ZrQA5gpGk9mk+zy4aHpyK8CPRuQ98jruZf9XH/b/FxcqM5Z7eR5iBwao8jcetYW2jCxGVz6uEFb37MQqSAnFnI5hDwcXeITPjgTCkqbDXr4AunNJiiCpaxEe5TylqbVeMc89C6GfH9Y4IY4oOg6tY0AQ2qPM31vPLpYd+1Ki/G7+gjA4hgQwgYmgu98ssJDJx55DThPmzEeZvtQ/M9SwjheNfepS57mGqd6Xzn8ocZcAs+ReKArEs0T1vJqGar8X+GR7cREQ0VZvioOjJtPfzBIwUxMf8hQnx9g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 06:46:15.8585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce867941-9fc8-4a7f-a631-08d7ed9b589d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 30 April 2020 05:10
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH 1/4] tcmode-external-arm: drop unnecessary
> CPPFLAGS and LDFLAGS adjustments
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> These were there from the very beginning and they were used as crutches t=
o
> prop up the build by pointing directly to the external toolchain location=
, in
> case early versions of external-arm-toolchain missed staging/packaging
> something from there.
>=20
> First of all, it is unnecessary to adjust CPPFLAGS and LDFLAGS in this wa=
y, as
> external-arm-toolchain is supposed to stage everything needed from the
> toolchain in internal sysroot.
>=20
> And second, these settings can be harmful and conflict with component's
> own CPPFLAGS/LDFLAGS. For example, OpenCV 4.1 fails to link internal
> libraries because of incorrect -Wl,-rpath-link passed down the build.
>=20
> After dropping these, I was able to verify that everything still builds, =
including
> BSP, Wayland/Weston, Qt5, gstreamer, OpenCV, etc for Aarch64 and Armv7a
> platforms.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.i=
nc
> b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index 8ddaf53..9171380 100644
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> @@ -44,8 +44,6 @@ PREFERRED_PROVIDER_glibc-thread-db =3D "external-
> arm-toolchain"
>  PREFERRED_PROVIDER_glibc-mtrace =3D "external-arm-toolchain"
>  PREFERRED_PROVIDER_libc-mtrace =3D "external-arm-toolchain"
>  PREFERRED_PROVIDER_virtual/linux-libc-headers =3D "external-arm-toolchai=
n"
> -TARGET_CPPFLAGS_prepend =3D " -
> isystem${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include "
> -TARGET_LDFLAGS_prepend =3D " -
> L${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib -Wl,-rpath-
> link,${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib "
>=20
>  TOOLCHAIN_OPTIONS =3D " --sysroot=3D${STAGING_DIR_HOST}"
>=20
> --
> 2.7.4

