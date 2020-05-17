Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.59])
 by mx.groups.io with SMTP id smtpd.web11.21704.1589718655249624624
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 17 May 2020 05:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zcO8Ekuh;
 spf=pass (domain: arm.com, ip: 40.107.2.59, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC8JM08it7kj5eqL4Z57uetlO8UUj4bz0tx54KK3eXY=;
 b=zcO8Ekuhk1vmZ8l0I+bew14c61Wg/LZV1T7pUf9pTvcagqSXw83oiAK+WjYvw0OeL9QAJZSbViCr8yDHMNr8OeuvkA90G8n5tLDSbZoiTfKc4DCi57K9kab4WzErEfA2wZskExIwULpFY9k82sf0rDbH6e62jAjRWxyJt0lBcVk=
Received: from AM6PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:20b:c0::16)
 by DB6PR0802MB2392.eurprd08.prod.outlook.com (2603:10a6:4:a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Sun, 17 May
 2020 12:30:51 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::f0) by AM6PR08CA0028.outlook.office365.com
 (2603:10a6:20b:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Sun, 17 May 2020 12:30:51 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Sun, 17 May 2020 12:30:51 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Sun, 17 May 2020 12:30:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ecd15e3e47d9b63b
X-CR-MTA-TID: 64aa7808
Received: from 0ee233e0d264.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9834170A-6B3C-496A-BF1E-0E0BEDB131C5.1;
	Sun, 17 May 2020 12:30:45 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ee233e0d264.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 17 May 2020 12:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYTCIKnycQ4sQX382CPjhyG/xt0GyaUN2zTLTyzQpukfCLbsUvOJkGqeOW5BeUjNaDDrk+AHaRn9B6u8lavevDkrpsj7A5G7kIShviWz9fkPSaSadrIn50ujpWAtGMAhHzocDz350e0sbDFrlhPtdMaIcrR3LcL9L1Zxcg5nnrmHtkguNBRUKlX4KmHxfxv7QpF3AqjyOxvmC//WY1m+cDqtGaDhXT7OX/b5eFssY67AKGeZCPNmpRUyFk7He75bVDK2d4qbebj8Wew3o4FWTNjLrFKTA3Ve4EH2S5J1u4ojXe2RN27iMozyw8zS4AvGgxuFdCWYb1nR8+DL7bVRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC8JM08it7kj5eqL4Z57uetlO8UUj4bz0tx54KK3eXY=;
 b=HCm8ayArp1dh72f/VsMr4gVkTh5tA5P9uo6RSOmuiwcDfj+pG/e9yniz9M4Pb0/ImB1gP/3tqr/hP2Q+PM4MATuB1zWFnr+1/Jw6T/oygKlwhRqJgA27a69porHKIrY+fkZbdnjs4HxODqExtnyImgFz+4rtxL43SEMfUHc6SD+EKlnk66bsCGE2wIaTX7v/r7rO/Y9RIVo6hOC9X0AT9MVExLFp+xjb3BgccLzNiXUwp2oB3QFnWeCWrjmzusIrQsOl69WPIMJ8Rzr6XqObdDVDsCDeiKQNVg8bPoaPmOPOKRHBqExYDttzRPMqRDxkhWoO8Wk4dCKbNHWIj3gb4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC8JM08it7kj5eqL4Z57uetlO8UUj4bz0tx54KK3eXY=;
 b=zcO8Ekuhk1vmZ8l0I+bew14c61Wg/LZV1T7pUf9pTvcagqSXw83oiAK+WjYvw0OeL9QAJZSbViCr8yDHMNr8OeuvkA90G8n5tLDSbZoiTfKc4DCi57K9kab4WzErEfA2wZskExIwULpFY9k82sf0rDbH6e62jAjRWxyJt0lBcVk=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5065.eurprd08.prod.outlook.com (2603:10a6:10:e8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Sun, 17 May
 2020 12:30:43 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4%6]) with mapi id 15.20.3000.022; Sun, 17 May 2020
 12:30:43 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Diego
 Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Thread-Topic: [meta-arm] [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native:
 Add recipe
Thread-Index: AQHWKllIxvRkKSlB/EOF6JHb5qSa1aioxFEAgAN0OK4=
Date: Sun, 17 May 2020 12:30:43 +0000
Message-ID: 
 <DB8PR08MB4969622CFFD8F722ADE61F70FABB0@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: 
 <1589506580-40706-1-git-send-email-denis@denix.org>,<23216.1589528602075061452@lists.yoctoproject.org>
In-Reply-To: <23216.1589528602075061452@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b96dd9d8-04a0-45bd-1da9-08d7fa5e22b0
x-ms-traffictypediagnostic: DB8PR08MB5065:|DB6PR0802MB2392:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB239231516870749EDE4DD040FABB0@DB6PR0802MB2392.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:9508;
x-forefront-prvs: 040655413E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WP+Tptf573bHv/F4CVJVjOo8trteYP50GmnoLwEzcKi4tZPRycWhxhHWX5IytxAeoa9f4PWcd6DvpN8s4G+9b9Qx96uVPduSmzIXqthW/yaYBOg615gaqwyqhkksxybJACiPf6Uai8dTfpkvUFn2VjVhmBscCI2mW+ggYc7S5Sr6l9ryNV/UBeVwhhiuOLP8F5VtcVV3DprjJOPsy8qHCLsK6cVRMbHCHepQgfXDNEgS/xRt+JDMjpmO9PBVlTuH6TR8CjfUPPd+FylyZJyEhX8SQHdcNxPSGrhPuijgUng3U9Wm4hiSBSkts4/D+Sb+KeXuUtF+6Wr5s0Btj/qDahL95qhMt0+pMO5sfMSHAN9ekiPfUnHbxMvxKj+8iY5aDZ9mzi6pDa6N7XrC/h0vVY8/0iwJT7C0a3L5YV5n7+GR9FJ04UtSfpAIQ5X29KMnpVXD1YKegMgcYSAwZ3k683VLTyeT2/OxUodx4NZJfafvOwlcpBd/srpSkLCeYjPF+PYGrRrnd+IHJuxF+WsNRKAd88JQ/861kE79Yv9Vx3Cv8nD4FQtrcgvnnKDWvEXuIXgCncHsB3nbJjwwgPsJxTSt5Sj1pPnGUk/hW4++1pt6PZRhGBZF1Hzox85Qt965
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(39850400004)(376002)(396003)(346002)(52536014)(66446008)(110136005)(86362001)(316002)(6636002)(8676002)(9686003)(64756008)(6506007)(53546011)(478600001)(71200400001)(5660300002)(186003)(26005)(76116006)(66556008)(66476007)(66946007)(33656002)(2906002)(55016002)(8936002)(7696005)(586874002)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 8Ts9z4UE/NwQdS0S9spCqRp8R+/njR3FTvvJoXALCyEKjQCEcNqGkpWPYLOs5StmLMuUBNSVLs4IsXIHvbwLPUa6LbGJWFCEcCuj0ETlKZwzgWl3/bxRIze5Iv8tJQubSZQEU11nevN0aPp0HemxZEryHA1zxCgswTTDi0M6fKUFPm+uqYIl9AE2OIb4DkJd3GDNH+5e0vB1IDUg1tgBx/6hSYvnd1nFhVSX60a/6P36VdblzEM71Y4HUubZq1z72RZ24r+WudijunljfwORLIw/fxCdSnaQfOjEqnFvkMtJ82mMaTrRR6+1PSy2VirKHnL9LD4E/yVhsndq9ghJDyidXlvi+JS/r+NdjMXZ19q5M0CtT1t9hokX+sDqKG/aBas/qGezAFbTTkOH4BkCkJH10dCg8qmx7A1YmKXWfnSvQJHr9FXcKiZ1uyPJStY5a7DywyrG38+sxG+noZT1AqxcNLqyV7CT4LIkvvQCz6GNkOa7bbCc6uB/dHVc+v61
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5065
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(46966005)(336012)(55016002)(186003)(8676002)(8936002)(52536014)(9686003)(7696005)(5660300002)(53546011)(6506007)(70206006)(70586007)(26005)(47076004)(6636002)(110136005)(81166007)(82310400002)(356005)(316002)(82740400003)(36906005)(33656002)(2906002)(86362001)(478600001)(586874002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6adb5358-0a27-41a1-68cf-08d7fa5e1e20
X-Forefront-PRVS: 040655413E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I4oKw4N6w+efEuD3kIjGoD7GvhRnruMVzQvZ3fMXLN+x4g4rRKk9oepng8vCA3PJP+wl1CL2MDkEJI4vU0P1QIzHW1c1cUVxMS0Fz/+n+omRvlD22rQDHEhH1KW5Q+otwa9YE00G7EFpo7KPc450yUsCucjVpFahcEn7YgFmdcBjmeK1gpD32wJykNgiHL5RQoPaixg8wD2LDjisB1gp9JstK2gt+/f6dN1zJUS0TXhBHc8DQTg/KqWv1djYyEg4dtSCnMs5g5nLODf1IeGKIrsV8vU6aRO+6Ug+hbhH0Tg/qRcB14fHNgzWh67EzBJogxIZmqBiHtmHbg+e3/8F4jPNSKsIn946PvFt28PhwTFDRgJTaDBMVsod+++IKbwxu3TTTaUFk9NZO7fbvP5xOa4xY7UR9JtvuGojLt5m6OIyhkFbDQrd3xUD54qD51R6H7IwoTdUu5Pj8XN5ha1XDbC8UW2eyK5j6ZmKktzpQ1MMRgThnwTJr5W7bGb+IJ7F9Z3LAPT9BvPZyRFFc8zscC0J3rHx5vNnEsss27er8ug23t4MfczVdxyiwZ4D9wmqOlRf0PNWWbCjCcwZYjapyyt1NHk4P2dgOq1QDZh1WtUrSCZ7na1fafUIYBsBoQfT9wUJQW/W3nNTBI0UbC1VSk5Y1RmcPxkdptc4/C9r1zM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2020 12:30:51.1411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b96dd9d8-04a0-45bd-1da9-08d7fa5e22b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2392
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Diego Sueiro via lists.yoctoproject.org <diego.sueiro=3Darm.com@l=
ists.yoctoproject.org>
Sent: Friday, May 15, 2020 1:13 PM
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native:=
 Add recipe

On Fri, May 15, 2020 at 02:36 AM, Denys Dmytriyenko wrote:

>
> From: Jon Mason <jdmason@kudzu.us>
>
> Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> and Cortex-M processors from ARM. This toolchain is required to build
> Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> some firmware for the M0 coprocessor.
>
> This was originally taken from meta-rockchip, but has been modified from
> mailing list feedback.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

I observe one issue when building for n1sdp,
gcc-arm-none-eabi PROVIDES virtual/arm-none-eabi-gcc but was skipped: incom=
patible with host aarch64-poky-linux (not in COMPATIBLE_HOST)

> ---
> v3 changes:
> * rename recipe to not contain -native in the name
> * fix typo in "subsidiaries" word
> * use SUMMARY instead of DESCRIPTION
> * remove inherit native
> * add FILES_${PN} for nativesdk package
> * add extra INSANE_SKIP_${PN} due to prebuilt binary package
>
>  .../gcc-arm-none-eabi_9-2019-q4-major.bb           | 39
> ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644
> meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-e=
abi_9-2019-q4-major.bb
>
> diff --git
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none=
-eabi_9-2019-q4-major.bb
> new file mode 100644
> index 0000000..84f6dba
> --- /dev/null
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none=
-eabi_9-2019-q4-major.bb
> @@ -0,0 +1,39 @@
> +# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
> +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM =3D
> "file://share/doc/gcc-arm-none-eabi/license.txt;md5=3Dc18349634b740b7b95f=
2c2159af888f5"
> +
> +PROVIDES =3D "virtual/arm-none-eabi-gcc"
> +
> +SRC_URI =3D
> "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}=
-${PV}-x86_64-linux.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "fe0029de4f4ec43cf7008944e34ff8cc"
> +SRC_URI[sha256sum] =3D
> "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +

Can this be changed to : "x86_64.*|aarch64.*"

> +do_install() {
> +    install -d ${D}${datadir}/arm-none-eabi/
> +    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
> +        lnr $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +FILES_${PN} =3D "${datadir} ${bindir}"
> +
> +INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev file-rdeps"
> +
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.7.4
>
>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
