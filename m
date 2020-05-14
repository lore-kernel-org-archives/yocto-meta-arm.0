Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.58])
 by mx.groups.io with SMTP id smtpd.web12.7432.1589437831737563818
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 23:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UbT0PrVg;
 spf=pass (domain: arm.com, ip: 40.107.2.58, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6a7k9i4qNQ3hM+r3N0eBtdKZTk/qLVtkDcNFBKnzOY=;
 b=UbT0PrVgQek158ZtJ3Pj7p2egHSzxV7hUfwrEIMiEwhtd3I9YYpNpEo7kQlqHVBRx+ZUFOVyA8G59nYq1LyDEv5KB5ZwqezT7eOo9snfxVCvtnfJtFIaMgV1CaSHJHVqd1CsY0aroNgeWyuJU81B3cbGyXYnYMcIgB8wPASsUvk=
Received: from DB6P193CA0016.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::26) by
 VI1PR08MB4384.eurprd08.prod.outlook.com (2603:10a6:803:fd::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28; Thu, 14 May 2020 06:30:28 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::50) by DB6P193CA0016.outlook.office365.com
 (2603:10a6:6:29::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Thu, 14 May 2020 06:30:28 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Thu, 14 May 2020 06:30:28 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Thu, 14 May 2020 06:30:28 +0000
X-CR-MTA-TID: 64aa7808
Received: from bf8f0bdad0ef.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E9D62432-84DE-4492-88D9-DE078DADEE50.1;
	Thu, 14 May 2020 06:30:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf8f0bdad0ef.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 May 2020 06:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hs2zndB+sYqW8Yavs9AUN2e1TbUCllzfWMGQJiZ9/jiMWYtJb4KCtcQzwzD/mTxxZMPqKWBCXa+QvelqHc/tW+dtqqhZsBVcnx3b6llR3cqk0G7vL+LJ9ZdBBNFurahsbNKXTMa+aB2GqI9EOIk1PQyMMsNLvTnoh565Qx2dNG8xIgr+Er+PMIhyJ77DIjgL7/oBXXYad9PSdeUI98Z8EPyLyT5XcdNEY3DlFBG7+LV1zZz2lhuQ+O6G7aTRDWA0z9dDV7F+IfmKDh7OsJfj2EYbZvZhwxaaZD2UG+hnfL0mc0JgyM7FweFJOgGNOe1FXWA40q1HusvOBCVSY/WWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6a7k9i4qNQ3hM+r3N0eBtdKZTk/qLVtkDcNFBKnzOY=;
 b=QWYzVyeonMT97CP5zGLQNDu/wehhVQ/bibeAOVi4IM+mUtHVPCvUlp60HDpwPTrtMQF11GbqdIc8JBApIr48Hsq1eTS3cH2qAYJiTR0BDYDQRzmwTkHOEaxI3Yltx/3SW7H0MQHMWeTS3O+24EONnbr5ZpVy+6UIXQtlOShzatJFwCMxWiTThfZV6NHkuKXuvJrr690x0o1SQanXfhF6JiBzN6S6jW/nzMOBbpG8DIkTM7jy/WcvxJxLlPgfQbgBHkpJ5Hum5yyTfiNppQ3IBfoKZSSRvXLyxZUis8x/ROh8bKVXwJVh5Xg+8Hx7KRGmDUTfMgxz2ZsxYZOogsWsag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6a7k9i4qNQ3hM+r3N0eBtdKZTk/qLVtkDcNFBKnzOY=;
 b=UbT0PrVgQek158ZtJ3Pj7p2egHSzxV7hUfwrEIMiEwhtd3I9YYpNpEo7kQlqHVBRx+ZUFOVyA8G59nYq1LyDEv5KB5ZwqezT7eOo9snfxVCvtnfJtFIaMgV1CaSHJHVqd1CsY0aroNgeWyuJU81B3cbGyXYnYMcIgB8wPASsUvk=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4468.eurprd08.prod.outlook.com (2603:10a6:208:145::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Thu, 14 May
 2020 06:30:22 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 06:30:22 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "denis@denix.org" <denis@denix.org>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH 1/2] trusted-firmware-a: install/deploy multiple variants of the target
Thread-Topic: [meta-arm] [PATCH 1/2] trusted-firmware-a: install/deploy
 multiple variants of the target
Thread-Index: AQHWKYKkSgoZu+WLdEaM4M3Y0WaAaainHxiQ
Date: Thu, 14 May 2020 06:30:22 +0000
Message-ID: 
 <AM0PR08MB398721203A52B9A404638E9492BC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1589414400-5413-1-git-send-email-denis@denix.org>
In-Reply-To: <1589414400-5413-1-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 2b4ca930-389f-47c7-bb4b-65ff3e931d20.0
x-checkrecipientchecked: true
Authentication-Results-Original: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a92cc54-f763-4538-edd9-08d7f7d04b6e
x-ms-traffictypediagnostic: AM0PR08MB4468:|VI1PR08MB4384:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB438497379E2F77015FAE172192BC0@VI1PR08MB4384.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:10000;
x-forefront-prvs: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +GqL0fXBYypDEYYxbLnNlUkkvyTEl3E5qKedckF0rBmS7eNGpdjaH/aY082TKXiUtq+a3slCAlibFTexjrsl/Q071aA5xKwMeW0pSRDM718wJgMORvimoMbCP4M0oJC+btsjWQmx7rAWsemvgnxVDQeMfKabIgUCxsvdu7pR05xY+POHYoqviZ1Ixl0duftfuYbWmx10tdPj90BYjuZqXozyn+OZHu9jCeBnQHQtn//Z7loOTyyI/cw+QqjZpqIfHFEb+kBsDVujTveWQyHwdYHuFOYUzjB0k6o//4YIhD67p/ScTZk7R2oPDju7Wbpef79R3M7jXNPWYigETC5PKCIWcOyLUfGa3QYkK34XHCAeXYGJLm1+JK3Vo/CB53iNlgalXaLqL3wlWsUEynuQMpM7mF+7gSGUZfcbdhOFDARIcMsorv/0HLcYsdslia62
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(66556008)(2906002)(316002)(5660300002)(110136005)(478600001)(9686003)(55016002)(52536014)(8936002)(26005)(86362001)(66476007)(66946007)(76116006)(6506007)(7696005)(66446008)(53546011)(8676002)(33656002)(186003)(71200400001)(64756008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 gm8JsxVa/hVDgyyAHIJ6dVnC4Ml9LW5TgV55hro5mJtQXli8KrLqIsBikEUwshl5rAEaCzh9BtrbRBJOg43y+NvYzGh4EtHJjXgpStWhTdcOInAvm4uxaoHc8+JtdmIsuzUvVh1gEgbCX1mwh7imLZ9GtdXFhFMDiLdFwFwm6402pZUjZKJulVZ8SsqYKUXEg9FyGRhXS7BqmezeIArEY0zkI+Ew1RaOpakPGhs+iJrqFpVNZuMh7oxdT/1f/5zrhdIPOZM52r/QAMXP9yt/Ujgx27tGdEEr3q8yyFI9BLQ6r258h58ARwVvyKvlmKpqBdAyjclBJ2sdCqE3DGq7fCHp7PdIS+6DEFVzubgJyj9LXNz4i1LQY+vN33uFcQKx4jDX6HcVltQcIe8OyP0g1zDMbOsI/TfKj+LltVRqgpnc2uws33/f4bU2rXMJAO/mxNhRnn6ATgiRPDptdiFAKD3aRLXL3OtiAzHGvUMyXmM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4468
Original-Authentication-Results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(55016002)(2906002)(33656002)(9686003)(4326008)(356005)(478600001)(316002)(110136005)(186003)(52536014)(82740400003)(7696005)(70206006)(26005)(6506007)(47076004)(53546011)(8676002)(336012)(82310400002)(5660300002)(8936002)(70586007)(81166007)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c04ca7e6-bfde-423e-e250-08d7f7d04798
X-Forefront-PRVS: 040359335D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yiKoTd0UaKTV9fiElo33CE05kmg3k50c3BfOfXeiCCA0seuzgdIH3lBe8PHZJpEKO1EEyisRBhcfbEIeTiPNxVBMyVLKyA1ZN7ddEFzPNCQ2FmAaDPGz/laAs8O8Q3R8i2Vjgai8yQ5TfyUVHAYVDg762wqH/zbRhiLKQm8kgCSjQ0EBSzIbhzDMoFaU2ZM5j2CklvjBYDodfd5i2bmNXC38bwZg+Vd99BAEj/CkbjPZOtXGRJYn0ZIocngihW9CkPQJ9QioXKhL70xbzhyrILOb7mmgS8jRYOFhuhUdz+NNUWfsYU6LJhXNwHiK9jha4cHZVs4+omgPEkCKtK4X4zLb7aZSDF2SxQdP/4Ed2ljPLQQsFjO13EnIe4NhmCuGXHi1CibQe2G+7US246NF0YTHooge9I8A72bsGEglLb1hPQK0VH3FZFrZUqp1vnmZe8s+P1wjxVlY+VAlnuFImimC86nw8xABPYKeCCgZOvYWwfgJeed7SKr1mp1IxrEpHMnzd4xg97KVE2S2vouUGA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 06:30:28.6963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a92cc54-f763-4538-edd9-08d7f7d04b6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4384
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The patch itself looks good to me but I haven't tested it (a.k.a build & ru=
n).

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 14 May 2020 01:00
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH 1/2] trusted-firmware-a: install/deploy multip=
le
> variants of the target
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Installing and deploying .bin and .elf shouldn't be mutually exclusive.
> There are scenarios where both can be useful - .bin for booting and .elf =
for
> debugging.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../trusted-firmware-a/trusted-firmware-a.inc        | 20 ++++++++++++++=
+-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 0804689..3ec8c2c 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -116,29 +116,39 @@ do_install() {
>
>      install -d -m 755 ${D}/firmware
>      for atfbin in ${TFA_INSTALL_TARGET}; do
> +        processes=3D"0"
>          if [ "$atfbin" =3D "all" ]; then
>              # Target all is not handled by default
>              bberror "all as TFA_INSTALL_TARGET is not handled by do_inst=
all"
>              bberror "Please specify valid targets in TFA_INSTALL_TARGET =
or"
>              bberror "rewrite or turn off do_install"
>              exit 1
> -        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
> +        fi
> +
> +        if [ -f $BUILD_PLAT/$atfbin.bin ]; then
>              echo "Install $atfbin.bin"
>              install -m 0644 $BUILD_PLAT/$atfbin.bin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> -        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
> +            processes=3D"1"
> +        fi
> +        if [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
>              echo "Install $atfbin.elf"
>              install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> -        elif [ -f $BUILD_PLAT/$atfbin ]; then
> +            processes=3D"1"
> +        fi
> +        if [ -f $BUILD_PLAT/$atfbin ]; then
>              echo "Install $atfbin"
>              install -m 0644 $BUILD_PLAT/$atfbin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
> -        elif [ "$atfbin" =3D "dtbs" ]; then
> +            processes=3D"1"
> +        fi
> +
> +        if [ "$atfbin" =3D "dtbs" ]; then
>              echo "dtbs install, skipped"
>          elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
>              echo "Tools $atfbin install, skipped"
> -        else
> +        elif [ "$processed" =3D "0" ]; then
>              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
>              exit 1
>          fi
> --
> 2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
