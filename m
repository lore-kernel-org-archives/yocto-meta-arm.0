Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.74])
 by mx.groups.io with SMTP id smtpd.web11.25270.1591602835359087502
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 00:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fFLFJnNq;
 spf=pass (domain: arm.com, ip: 40.107.8.74, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vju00OuFdM4QxgatMZgNgUPq49bp+rzuma9yWi+3A3k=;
 b=fFLFJnNq30c4+Qce/n25WVeSb3Kn3ddS4NsTXczdVmRfu5iCTDRVuWstXxNd5oSd1AKDfx10djEr36efQ321ZArOjk39kypS9eZ8koT9snFvBcyEQpFC1XKY+2v8e9Mb/EA1JGPc8cSQPGJR+mNfxi50gmDG+GF6bpX/Ge+4tms=
Received: from AM6PR0202CA0065.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::42) by AM5PR0802MB2401.eurprd08.prod.outlook.com
 (2603:10a6:203:9d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Mon, 8 Jun
 2020 07:53:52 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::b2) by AM6PR0202CA0065.outlook.office365.com
 (2603:10a6:20b:3a::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Mon, 8 Jun 2020 07:53:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:53:52 +0000
Received: ("Tessian outbound d3ae83885012:v59"); Mon, 08 Jun 2020 07:53:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6bd1c0c369938cf2
X-CR-MTA-TID: 64aa7808
Received: from c2dc8b3e1e54.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0C687E55-0C93-428E-A3E8-8CACE31134EA.1;
	Mon, 08 Jun 2020 07:53:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2dc8b3e1e54.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Jun 2020 07:53:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXVuAzV0jkp7XdHnFnBCoHLdO2qIRXoxX9JrroexksIo4EasH+6GYcYgjjePxBbLXrSVE3toi3VQSTJODKZu8rwBbJclwiyOOYOE95iASmM6b6yQVJc1Jh6lQnqhQMBHU3YqsRwOm5h4g/rUEDEB1RvwMzuMghPlB9qL9D2eUmfehGgdC4YCC0qLakB888Zmz3FG6ttSghJ76laJJrSaS3WqDInC79HgEi9vgMKhvylrhVOFOwgio03DB77rISWlAwlMeBZ+AcFJ06CiqdjlShCEdTz3SMowZbpe+sy6CuK4nifJK6dtv9tXNfWw3tmRJ7+CP+SRnVJLPdBBrotmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vju00OuFdM4QxgatMZgNgUPq49bp+rzuma9yWi+3A3k=;
 b=FwhBMSD9vOYeBjYtc4WrBSotx8BpH/zH661A5+xXaP/gDVO5ug2cAbfVKj6tL2r5xnJq3pcFySxw5mkOkPq0+pqGKp0/5k5EGpQNXmHzZcw4wkL4PpTQEL3vHjXXTIn3mqtBZoFyJpn5ojn+CxDGIvouY/4kG2G3s3j3YaV3xmXQA66rZ4vGzzgLFd+YFhLhd4Pl7j7r6w5zr17X+SRLUzDXLMIaey6cQ3Yxwe3eWw8bP5x7SlXJoXGwhOnpkB6FJh2uWIONeIgezQQypehsD76PidMHlS2llQ5z4ok1PyZYRZiP/DAIPPFbaOmLWj+fe7Hxx1F4UR50oKxM7e6xXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vju00OuFdM4QxgatMZgNgUPq49bp+rzuma9yWi+3A3k=;
 b=fFLFJnNq30c4+Qce/n25WVeSb3Kn3ddS4NsTXczdVmRfu5iCTDRVuWstXxNd5oSd1AKDfx10djEr36efQ321ZArOjk39kypS9eZ8koT9snFvBcyEQpFC1XKY+2v8e9Mb/EA1JGPc8cSQPGJR+mNfxi50gmDG+GF6bpX/Ge+4tms=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3788.eurprd08.prod.outlook.com (2603:10a6:10:31::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:53:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:53:43 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp, linux-linaro-arm: Don't perform SHA verification
Thread-Topic: [meta-arm] [PATCH] arm-bsp, linux-linaro-arm: Don't perform SHA
 verification
Thread-Index: AQHWO0DdvRB3TYdm7E2kyQ8TxSke6ajOXVqA
Date: Mon, 8 Jun 2020 07:53:43 +0000
Message-ID: <D82A2791-0897-4D7A-AB9E-301C0276D578@arm.com>
References: <1591365242-62744-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1591365242-62744-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae2756d9-c46f-48c8-247b-08d80b81162e
x-ms-traffictypediagnostic: DB7PR08MB3788:|AM5PR0802MB2401:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB2401ADE1340459CA583D628B9D850@AM5PR0802MB2401.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:949;OLM:949;
x-forefront-prvs: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QljFpF86ObRtC4tGA8/sBkfZvcZil1EWkuYkwf29Elf7AtOAyGAtzE49gB80mgMwT7hT4lPq0LXyGx5pKguTb4DD0X2nM55hYsnPx9hs7SrCSdLmY5c8YTcba6F5LpsB8ZNR3+zB8SguOdTyU1COqcAweyPLTd4KwZ99sI+1INuydtTa68ZKyDUgLJgaaAPhdRlPUwDp7zI6vepJnhWAsrwFqkSWIY1o2YTW5t9wJCVoVGAwLgITdOF33OCD8YydJ9ezioXmYsGpAgApnHfY9/EwnYerDuGeqGoZ42mYfTiy04UT1RLGY8kV8mJqg0ZgBUy2FzCKly1Xcrv5l5JOZ2nsDj6+p1urIJP6i2M99FoF+Z6XOA/eMX8QOS4fmEQtuwl/lJzyBOkHq4vS0RRbS0U8pEUy2pfQyor/To1tU2WpjvKOui8h9dXfa6G9mYUPranEPbgYIFRwl5sH2AjaOrAwRArP6qfuqRRGnarL9N4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(5660300002)(15650500001)(2906002)(33656002)(966005)(186003)(91956017)(76116006)(83380400001)(36756003)(66946007)(64756008)(26005)(6506007)(71200400001)(478600001)(53546011)(86362001)(66446008)(66476007)(66556008)(316002)(4326008)(8676002)(6512007)(2616005)(37006003)(54906003)(6862004)(6486002)(6636002)(8936002)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 vSABe4ITBx9pA8K0yOUzS0jb7g/V5mO8J/qxOTy53wVBRtEi3xQhq0wUTAprnFCHYuL/tat3/tHO6tn2sq3uTpUQBmTMVhQN1OuY86ZgtaeiPnOhh2xqAHocsvNUkGSc5jgMfIq0MoWNSf20LJ9IYrWIEg5vaEWjcmldSLVEqlJG8WjXSLLyZTHyO8g7c/guII+2Nym6GrcVkWp6JglTH/RmmfOH/43K186HPwaepfUWQEKN7ZNH2V9mxpvkgMJTh4Dnw1uEYAoni4VLAJibE4bJsiXhZ3Bna3AdNyy42HTkdtJCpXpVFCDolrrLnIb1kKxkzScZ7GX+H+0bM+I2MRVQSUcEHtz8ItJERCobDoEU+32fI8O6rlwYHrTfnXz0VeGaivJF2EdrwvqRECIT2j4F0InNfVEsHpZwXp5u9nRtl53NGMzWwpuitZ7eEvHzxpF+cGWdzqqd0tRkuj3rRXmoeR9/GoFw1mKq2kQElLE=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3788
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(83380400001)(8676002)(36756003)(316002)(37006003)(82740400003)(4326008)(336012)(356005)(70586007)(33656002)(70206006)(15650500001)(36906005)(6862004)(82310400002)(81166007)(2616005)(8936002)(86362001)(54906003)(26005)(6512007)(6486002)(6506007)(53546011)(47076004)(5660300002)(2906002)(6636002)(478600001)(186003)(966005)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	12113645-0129-4d81-4179-08d80b81111f
X-Forefront-PRVS: 042857DBB5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WN3fsvdBaHjkX0wo/QqjWHCsv5sY6BNPzk56GirVuzwAd+yujkM9YR2DmFRUxx5B50R5IhIls7pMnQt0d9AT+Nmu3u+9J9LsY7R4zUz4g3eKRS0ahyQFZDpYq6WRa+/al1J0DoHTlswehRWlwjNgb83tN7bao1gwpwwFMnqKOQjO4QdoOOfXFpbxyc9FaPI043msdiOH7wvKwXHGkXQojFNjTT5W/7uH7me0ycLkanJVYsQo4xtapfMxQk5TW9IQL4rSOsM1Ughuf+gg+efaqOYTC23UIkOBhdVvhcm8IS50EOE5mVIpNLDCVbBnJmRgtcXVz9ERdwSkDpu7dh+jKnM9ZN0sSciRvGH/+6j4InWBNqkeg0r7hJjmI9dABZYY8n03uuRLU+9RuWLzyPaW0qkMA3eZU4bW6WCYmriLLGB03Ym3JkNcp2Nn3jpABqQxYyjyctZsjyUPx0ETBSePMfnBOhASA1slCNy3Z2690hypMpXcMvxtsOW8oEnw0hRGrRtWeFDCM46S/AYdwcnzpw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:53:52.2595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2756d9-c46f-48c8-247b-08d80b81162e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2401
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BD4F8F043694084A8B73AD7554D5BE1E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 5 Jun 2020, at 14:54, Diego Sueiro via lists.yoctoproject.org <diego.=
sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Since the Linaro kernel-release repo doesn't have a master branch and
> the branches are force pushed, we need to have the nobranch=3D1 setting
> in the SRC_URI and have the SRCREV pointing to TAG commit SHA the will
> not get modified.
>=20
> Change-Id: Id1ad6b57a6f11ec4dadd3647043e6f2f48f498d4
> Issue-ID: SCM-888
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b=
/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> index fcc07a6..d2cd127 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> @@ -11,10 +11,11 @@ COMPATIBLE_MACHINE ?=3D "invalid"
> # KBRANCH is set to n1sdp by default as there is no master branch on the=
 repository
> KBRANCH =3D "n1sdp"
>=20
> -SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/kernel-rele=
ase.git;branch=3D${KBRANCH}; \
> +SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/kernel-rele=
ase.git;nobranch=3D1 \
>            file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurs=
es-location.patch \
>           "
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
>=20
> -SRCREV =3D "${AUTOREV}"
> +# Refer to commit TAG N1SDP-2020.03.26 since it will not get force push=
ed
> +SRCREV =3D "137cccb0843e63b031acf67d1ca4f6447b8c417c"
> LINUX_VERSION ?=3D "${PV}"
> --=20
> 2.7.4
>=20
>=20

