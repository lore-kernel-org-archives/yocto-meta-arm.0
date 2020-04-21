Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.89])
 by mx.groups.io with SMTP id smtpd.web10.6349.1587466378732775254
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 03:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GJrmBk/p;
 spf=pass (domain: arm.com, ip: 40.107.7.89, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0kzewyovbmjdR77GojlBFRO1S/nxRoDi09XElGCzko=;
 b=GJrmBk/pKBhXp5GqyEiEmiDKAHzzsrqHZ1Bgi7LHJtieuMTX65dfi04SZ3CemdUDGu1lo1Pv+rprbUN2Zj8gS65A3JDy4m7STovebMqcYeqt/5nHIBwGq3CflBmlw7OieGWTZMF6u7b7UOLiMziad8Zb6+TGl2KSMRVDm0wu/+A=
Received: from DB8PR06CA0032.eurprd06.prod.outlook.com (2603:10a6:10:100::45)
 by AM4PR0802MB2324.eurprd08.prod.outlook.com (2603:10a6:200:5f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 10:52:55 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::3e) by DB8PR06CA0032.outlook.office365.com
 (2603:10a6:10:100::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 10:52:55 +0000
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
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 10:52:55 +0000
Received: ("Tessian outbound cbb03e3a1db0:v53"); Tue, 21 Apr 2020 10:52:55 +0000
X-CR-MTA-TID: 64aa7808
Received: from 9dd5d38cec4f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B1CFB13C-A226-4D8C-8E7F-1B3435D36660.1;
	Tue, 21 Apr 2020 10:52:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9dd5d38cec4f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 10:52:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/ohLWf1itQPjrrnQwOJWb66e48STZoy8lpqGz80zWvEgefXVMdl02FxaDn4O+JjxKavIjJzxe2fDz3p5bvh98f9FUdIfQ8GASGEqkOINsPQHAxs1nDUC2fU3V+wtA36JU2TKAcYM+hwjwzsJhgdx83vw+iJJJLfdp48aaiEHn3Hhw2KRP/+C1KTyM2RRi1T7NeoBeeq57FDG+b1oUJ4k8KjNtn58Ol9zoVooS7ZFD10rm66hTNej4vcdnOjHO5iEndm5PzPYrd0iEe2/E1YrD3Uqq/B15am+ZINYPIKtDVRfdu263LmkSsYz4WS/Ll9fF6jcY0rM8vjCRQwyF+zKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0kzewyovbmjdR77GojlBFRO1S/nxRoDi09XElGCzko=;
 b=a7+tbICPFkXoubyW4Piv63C1byWaVC2/0M8Da99gldwd4yLIbEGaH7UqDoRfraJhDE18qMuTrPRpxrXVeQOfX2ppnyCWFuy1Z0rO88PD/lRVFbyl5rUy9V5s2dphKbj9L+XMuZnJpYVj1k1Hu3y6zeAigED7UA+geSrH+GDk5Vn002uXmf0WhVHB2CcfuSwx/lAXh+T3OxGI9amhhx98Uo5jhHD/QIoNnESij1+iEzM6CZMW0WbD0bhF+3SOWrOj3AVluTMMu9epnXVJRht2X0xA0imJSPS71b9b2BOxKtp61rGh9AV01DGlXM4yDKsI+qClNhYWMei3GVC3G5Vw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0kzewyovbmjdR77GojlBFRO1S/nxRoDi09XElGCzko=;
 b=GJrmBk/pKBhXp5GqyEiEmiDKAHzzsrqHZ1Bgi7LHJtieuMTX65dfi04SZ3CemdUDGu1lo1Pv+rprbUN2Zj8gS65A3JDy4m7STovebMqcYeqt/5nHIBwGq3CflBmlw7OieGWTZMF6u7b7UOLiMziad8Zb6+TGl2KSMRVDm0wu/+A=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3537.eurprd08.prod.outlook.com (2603:10a6:208:da::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 10:52:49 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 10:52:49 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/2] arm-autonomy: Fix xenguest volume check on boot
Thread-Topic: [meta-arm] [PATCH 2/2] arm-autonomy: Fix xenguest volume check
 on boot
Thread-Index: AQHWF8qIBOuEMv+NQEuefQ81PSwuaaiDZlNg
Date: Tue, 21 Apr 2020 10:52:49 +0000
Message-ID: 
 <AM0PR08MB398775D311EE7BA6B58D798F92D50@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200421104856.4389-1-bertrand.marquis@arm.com>
 <20200421104856.4389-2-bertrand.marquis@arm.com>
In-Reply-To: <20200421104856.4389-2-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: acac3949-4ba4-4f0f-889e-a5e29c20d5b4.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e537cbd-c7fa-4807-00ee-08d7e5e225ab
x-ms-traffictypediagnostic: AM0PR08MB3537:|AM4PR0802MB2324:
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB2324C1EB86D191EA6AD6C55F92D50@AM4PR0802MB2324.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(53546011)(52536014)(6916009)(6506007)(7696005)(9686003)(8936002)(71200400001)(86362001)(33656002)(81156014)(26005)(66446008)(64756008)(66556008)(66476007)(2906002)(66946007)(76116006)(8676002)(186003)(4326008)(55016002)(478600001)(316002)(5660300002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LEfnxAxzYNvud+/iufM0+wHlC4C3H4T6B/wTJzKDhCmXfjtF022YZ6SVEqbV2BHaLdf8y9tvJ2zyk5q0UvAdfY4VDQrY5IGwHAEt7tXjAhBAe2DNiq2IzuRf01WhIsTlNP/DPXmw0PM/VZ+sipkiRx9VoJwUGnSa96yz/MLQULImUKa+mz70APXAIJdsv1T7zj8ppUC5P59JCdfP4Mpw1FxJwN6UoznYoxTUS0bokyZ3VF65M4ucs79suAxbSIdHWoya+COsenkT/UDOU9rTxquyv+HxN5kTnVVU+NodnPN1can+Dw0+c/Z/NAnQGb2EfO1TLpFFf5fnKvzHhpAkDLWD/0ekByyHydW5XlRjvyukX4ymPEkL/xTMYUWfXtkO828Lj/R44XHCinLFePnBy5PlIpO8/Dd1GwVqMTegEG3vKKfSQEYkj6iqMcPoaMuV
x-ms-exchange-antispam-messagedata: 
 huJBGZMbw7ziwZh4AOCJlzs3D55fBK5JFolwPOm5AGNWRFC2qweDukhYMVeRAqSVpr8whHsP+iJvJD2kik9bwX/RamaMBQi/zTVn0abkxTzbaTxb5zLgmHMP/RxZPJD//9ggiB113YwAf7GJM1FZwA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3537
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966005)(336012)(70586007)(47076004)(86362001)(53546011)(186003)(81156014)(8676002)(356005)(82740400003)(7696005)(26005)(316002)(8936002)(6506007)(33656002)(478600001)(6916009)(70206006)(5660300002)(52536014)(4326008)(55016002)(9686003)(2906002)(81166007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6785edcd-5cf8-445e-d5cd-08d7e5e22227
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S7Dd1MjiMv29Blw6lOx3D6mCNonudUBUzzN6YQsyrb8kgrnHVfeNdUh3LoIJC+t6+ApLSlZhDHKj+HMsL5cNdogB8Uc51f9+I4Hb7KHE2PQF+KhoJVB9ReT0mS8vEA/hFfj0Pf2C74GX9r96UIGV5JTUVykU7UjSjwH1Y73jmcK2fjoWD5ZFTEeNeaxoClw+TUKi/wkeJ1+abqZvj7lhLP2Idr5djm7Yo3xyM4qsz0gdoFM950902pip6Kt0NyGvJq9c13zv/VwPrkOLHoDnvTctGhOVknhYTYuaSNNbLYgJyB7T7/TgxAqNw6c0K1CysYOiK8YZXRxH4rZkr/h9kOoR46myj5/SsEwcKqyTfZHg8DtXtWSpRjFhJJnqnzIGESUsWDQVkvnGcOvpCo4WbfuBgzcl+v007eX/ms9IeH79qlVIGHbfm/LTPquwKDaR5VHGYdRGsuz/Hig7pQAtZebbdOnqdh44ETuMbzvT4ajQbsmUyLf62UODoDzfz/w8kxP/Xe+YVV+r0JqH+MRqFA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 10:52:55.3477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e537cbd-c7fa-4807-00ee-08d7e5e225ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2324
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via lists.yoctoproject.org
> Sent: 21 April 2020 11:49
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 2/2] arm-autonomy: Fix xenguest volume check
> on boot
>=20
> Fix xenguest-manager to only check the device configured to be used for L=
VM
> volumes for guests when a guest is created which needs it.
>=20
> This prevent the manager doing errors during boot when the volume does
> not exist even if it is not used by any guest.
>=20
> Change-Id: Ibc285887836ea40595634412dcfa7ee9039dc220
> Issue-Id: SCM-956
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../xenguest/files/xenguest-manager           | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> manager
> index 1daebc1..b25eeb5 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> manager
> @@ -19,17 +19,6 @@ source ${XENGUEST_CONF_BASE}/xenguest-
> manager.conf
>=20
>  PREF=3D"xenguest:"
>=20
> -if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
> -    ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
> -    echo "${PREF} Invalid volume device in configuration:
> ${XENGUEST_VOLUME_DEVICE:-}"
> -    exit 1
> -fi
> -
> -if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
> -    echo "${PREF} No volume name in configuration, using vg-xen..."
> -    XENGUEST_VOLUME_NAME=3D"vg-xen"
> -fi
> -
>  function usage() {
>      cat <<EOF
>  Usage $this ACTION [OPTIONS]
> @@ -67,6 +56,17 @@ EOF
>=20
>  function xenguest_volume_init()
>  {
> +    if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
> +        ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
> +        echo "${PREF} Invalid volume device in configuration:
> ${XENGUEST_VOLUME_DEVICE:-}"
> +        exit 1
> +    fi
> +
> +    if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
> +        echo "${PREF} No volume name in configuration, using vg-xen..."
> +        XENGUEST_VOLUME_NAME=3D"vg-xen"
> +    fi
> +
>      pvs ${XENGUEST_VOLUME_DEVICE} > /dev/null 2>&1
>      if [ $? -ne 0 ]; then
>          echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
> --
> 2.17.1

