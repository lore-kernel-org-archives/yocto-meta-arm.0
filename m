Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.72])
 by mx.groups.io with SMTP id smtpd.web10.8398.1589879571021137391
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 02:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jLpkWomp;
 spf=pass (domain: arm.com, ip: 40.107.14.72, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1VfKepYMbiWn7ZDjcR4Eew2//955LMdZWGcr4V2fuA=;
 b=jLpkWompIV+zMKa/MspuwdeXAwtBpk+MdSIYAPL0SFpr+DvUzzr5kzvF8lq/0heiD80/RY/IAe9yY9tiRMqcpDQXVesjJbvq2egrPbK00nICHWrCFueKIjrX+mStWnfs9HsftmJLMzyhF/ASUWeN8PpiaCxXh1tGhtPK2XOkLvc=
Received: from AM5PR0101CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::46) by AM0PR08MB3153.eurprd08.prod.outlook.com
 (2603:10a6:208:59::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Tue, 19 May
 2020 09:12:48 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::6f) by AM5PR0101CA0033.outlook.office365.com
 (2603:10a6:206:16::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26 via Frontend
 Transport; Tue, 19 May 2020 09:12:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Tue, 19 May 2020 09:12:47 +0000
Received: ("Tessian outbound 14e212f6ce41:v57"); Tue, 19 May 2020 09:12:47 +0000
X-CR-MTA-TID: 64aa7808
Received: from 18b324b3830e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7784A70E-85D8-4D7A-A1A5-2E1AFFAA0070.1;
	Tue, 19 May 2020 09:12:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18b324b3830e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 May 2020 09:12:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZcdAdvOYI3Qh0uIjORL7U7DZXg3EizNW5tyEpC7FHroDzSgeCPzgPQa4pU4MYYkUlLFbqO4lKYRnAhKZ8w3pUePbDIn/SfpOyIwvWWVIuNbDJlo3v4G4EOnDeJ3Zv8BppgEo7X3PHjJVwUhdkbZe4UG1HEzfEl4g6kRTiTbLxXZAtcpz7m5miIh4DM6peputG3UJSWHsEXCe7h8mHN+5PqNf82i49brp/ia6cLo1PiOASSlVHM1lU9bz2KRKEUQp7XglC0+vHUOFguJGZOpMK3B/68h8mN5auNrmZggIhX8tOgz5zM9raVZF+aF9EmqeMkTQoRV9ynXrcswojhOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1VfKepYMbiWn7ZDjcR4Eew2//955LMdZWGcr4V2fuA=;
 b=NE4IhHeDSNJZPo8sCAJvbv6G6BfYlil1yCz/Op5nlPwEsTDaVA7lmaVE19ghxo/ESoS4UTPnLSCsx94cJZm8VwbOZjrh9EwA2fKvFTd1BVHGeElTNpLcAppLaWQCrgUE0OKxqswAlahj/f1LTFgbFoZG8lqiweQRZO3Py4DIvpeeH69265SW8wY/xX4bt4CQeaupOcmAOyHd4sYcv2762DeqVeaVdoGzwUKFCfVJItmFe6Kj5ybksPN3Y8ukbe7W5lCE77I4XBdUNt+BqquzMGUOCY2khWzPRMXQxn3qTM/krsY4COGsTybD+tw94JoV8Z/fVWBmoJ2Ru+j+ghJOdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1VfKepYMbiWn7ZDjcR4Eew2//955LMdZWGcr4V2fuA=;
 b=jLpkWompIV+zMKa/MspuwdeXAwtBpk+MdSIYAPL0SFpr+DvUzzr5kzvF8lq/0heiD80/RY/IAe9yY9tiRMqcpDQXVesjJbvq2egrPbK00nICHWrCFueKIjrX+mStWnfs9HsftmJLMzyhF/ASUWeN8PpiaCxXh1tGhtPK2XOkLvc=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4945.eurprd08.prod.outlook.com (2603:10a6:208:157::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Tue, 19 May
 2020 09:12:41 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.033; Tue, 19 May 2020
 09:12:41 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "denis@denix.org" <denis@denix.org>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: re-enable generation of packages
Thread-Topic: [meta-arm] [PATCH] trusted-firmware-a: re-enable generation of
 packages
Thread-Index: AQHWLaejuQFUJdMKAUehQIlPIC/p4KivH7cQ
Date: Tue, 19 May 2020 09:12:41 +0000
Message-ID: 
 <AM0PR08MB39871EB465BCFEF6BC70B17592B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1589870085-51773-1-git-send-email-denis@denix.org>
In-Reply-To: <1589870085-51773-1-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 23a31c85-9818-474f-b083-15216fb8f346.0
x-checkrecipientchecked: true
Authentication-Results-Original: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9a34c9d0-901d-4857-0c21-08d7fbd4cc94
x-ms-traffictypediagnostic: AM0PR08MB4945:|AM0PR08MB3153:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3153847D2430E552B36FFA1292B90@AM0PR08MB3153.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fqCDCTbDmDDvHiygN8cvs+LmQasnxdaaNYtQ1QS1HotlzSUhd8c1HLlLe/HQdDmAlIr+4yJ2Tt2mCCbyEt87ZvGmeT1t3Z8gFHsxNoptu0iN8/7ddz/fZ7Nl+twgvxuvxkXDQQmguW4ExedQBqMOvwaE8R5ixM74GbB6ifACM3SDB8xSnD6uNthWyXP+V3FxR6tENJTmN3o82/HdPJyOMqUZCqP5lq41diby8oOHjPUQebjEhsaAOdtDMWLlkXCplZD/Sv9htDsT7U9PResoVjPPlgoU5lNc12zqe1t67xVeNPTfdxnz+ASxlGiOTx4Ln3JsZkHyhO0ojVZPCkMwaYNCNenpEZ5zMJemZNuicUP+iq7f/kRutIIHP1kAGvO+UFY2gB6f9h09qcsQCbxz2WOR1s4WlfthRyqAKNWOwJvXHiZxxU5GPo7hZEEhsKzR
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(4326008)(8676002)(8936002)(186003)(76116006)(66946007)(66476007)(52536014)(478600001)(5660300002)(2906002)(64756008)(66556008)(66446008)(86362001)(71200400001)(33656002)(9686003)(55016002)(53546011)(26005)(7696005)(54906003)(6506007)(110136005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 XaKED8yGMFCgQAa7JEoZAcvLBN9xlasWV5h/7RY1f5KcgSoy936x/RggVwUMq9hdQ4+Diz1Nh8jiHaayRhxPWbTEtp/HpNWb4WWyWEldEMdHCaahO1SQn1JadlhHi6Kkz3nWAmOlJXk1qD9XMI37eu8Ud4E7bh/Xu6+tMPACKOtHcxaEJh0BFdiOPIOL8ZoxhoMi+EAsL0EPdqyrJjcbZpN4koN8d63P22x4i8wlWlgUe8dcavjUB3gHgDIqAV6+IVzaS2J9EWhRlSG1p065DoZaIP0N+z2J/SWO4Ioq/FLz3p3u4rYnuTHwLojBmzcvxewfvsaqW/VNVH1yy3H1Iisxkq/SXjlRWPVV39Dh36sF604s6e9NyIDHFkT3zS/kqO7Nip5onDDL/hkMrOXkGHL32airOs1R+D96q2WaxkXXAVLBJLLt+1ZyetPR8vH8G9j7GMJw/vgTtIm6uiBniE7pbOdoE5/vmg3NJ8+53gQ=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4945
Original-Authentication-Results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(54906003)(70206006)(110136005)(70586007)(478600001)(82310400002)(36906005)(6506007)(356005)(8676002)(81166007)(5660300002)(4326008)(53546011)(8936002)(316002)(52536014)(26005)(55016002)(2906002)(336012)(82740400003)(47076004)(33656002)(86362001)(7696005)(186003)(9686003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b2f3810e-5fa6-41d9-6e84-08d7fbd4c8b6
X-Forefront-PRVS: 040866B734
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DtaLuggYt43qZBBiQDn5rTtkBTmdCAN4fuRSxmSzP/1VvMq7A2IJy7mtuZCTItW3+gurDeHYMW0980d5RfwGkyt7c9bOrMpKVlgOV8iLbMgwCSKgKS3t5vD3Jb4Zxtg8/1A/Wo1btV/2Q1hblOg2ZrU5oCZ4cVxsZb23vP/vWLa3eCtlG0hqg+faBIHmMgcKNXWGDAON5jqa82MK5ccHbaAFRAWKrSLyZUaMQdtkuvtOyqszMFI6JIisEeb3KbG1CHs6ewprG3l3BAKG4cMXriZdL8NQlPH8XKYesMLnpOOU3X0g7h7Wl6+lcrfeXYR//rOjm6tMurB73uA8h2XVTmvlJUO+ksXRkh4OUV6iLnSUwIsNu9QKwHVnt/TYMfY1OopLVco0B5yjJIPV+u/VwLOP+FOoI5n3t0w0PRmWEE0f848XJmnB+xH6wNjQxguY77G/dmV/w2SW8WfIcx72SP37zNFgd/s+M0tJwRO9NfTAbr94luXRpIWXOIMiV17M5p/+QdAFJYvt1lCF9Odgvg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 09:12:47.9467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a34c9d0-901d-4857-0c21-08d7fbd4cc94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3153
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 19 May 2020 07:35
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH] trusted-firmware-a: re-enable generation of
> packages
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> There is no need to inherit nopackages. Even when the output binaries are
> being consumed from deploy or sysroot, and the main binary package is not
> meant to be installed in the rootfs, package generation is still useful f=
or SDK
> use cases and as a way to distribute sources (e.g. src.rpm/SRPM) in Distr=
os.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index c9c5710..fe9a4e0 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -5,7 +5,7 @@ PROVIDES =3D "virtual/trusted-firmware-a"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -inherit deploy nopackages
> +inherit deploy
>=20
>  COMPATIBLE_MACHINE ?=3D "invalid"
>=20
> @@ -158,7 +158,10 @@ do_install() {
>      done
>  }
>=20
> +FILES_${PN} =3D "/firmware"
>  SYSROOT_DIRS +=3D "/firmware"
> +# Skip QA check for relocations in .text of elf binaries
> +INSANE_SKIP_${PN} =3D "textrel"
>=20
>  do_deploy() {
>      cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> --
> 2.7.4

