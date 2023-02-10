Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5031AC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 08:00:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web10.9388.1676016041853622186
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 00:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Qj+NtWwK;
 spf=pass (domain: arm.com, ip: 40.107.21.41, mailfrom: gowtham.sureshkumar@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKmhbpa6itSS3OX31jbYZbkvi3/kdbRFyUj5Ntlg/f0=;
 b=Qj+NtWwKvKkvZTOp7tMgBOaWNSfo2KEKW9PQTPisXLbR2CNS8eIDJ8pBKbwKjdHWckPXv1P/kpCZcDOBZmKYDNMFLUcSUcblDxvr8y0aApyULAUhyOj1rtXG1EtIOhl8KFi4yVNqzU+hHT/NBVlHa78ioHak+7rI/P02cgPvNZI=
Received: from AM6PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:20b:6e::29)
 by AS2PR08MB10208.eurprd08.prod.outlook.com (2603:10a6:20b:648::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Fri, 10 Feb
 2023 08:00:38 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::df) by AM6PR02CA0016.outlook.office365.com
 (2603:10a6:20b:6e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21 via Frontend
 Transport; Fri, 10 Feb 2023 08:00:38 +0000
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
 15.20.6086.19 via Frontend Transport; Fri, 10 Feb 2023 08:00:37 +0000
Received: ("Tessian outbound 333ca28169fa:v132"); Fri, 10 Feb 2023 08:00:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e27e3bdf6f480e20
X-CR-MTA-TID: 64aa7808
Received: from e408ac62bf94.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B2D59695-1727-4BE7-ABD8-AD57CE6F7F08.1;
	Fri, 10 Feb 2023 08:00:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e408ac62bf94.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 10 Feb 2023 08:00:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja7FK5H07Z3G+JkS082RSPYGyfvgcoSczj/qXCctXUqoZBa83YsqHdTB9xIwcw1iSU5pFwNznpfWOrs9Y7fH2fEKgilWK/6YhTB8iMo1wX0d5q2RRU9Yo31OFtKUMev2JH1PW7woWxcqbM0MUGOsSlLUXNUH6iB+ewCOj9k1e/lpAn5+FUQH9Q2S8A9PA7G5+Pq9pMlqjP4WW10Ukuzk8rKbiCbczHUERaDMAFYtdqI2Q52ohIH6YZRz0HonPbkVTIpHKNVuhqhht4pno69QS+DUl5+2SjRRYxZa3eepnSJoqsC5GFk1hBkPQouCkw2xylQDmKfSXZc1895/Qd0i5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKmhbpa6itSS3OX31jbYZbkvi3/kdbRFyUj5Ntlg/f0=;
 b=OOl+B3knEsO3OXYA8WlpZePXJmG9bDjcIV/ozYxbSunpiA2CoiDnEy+dspmAIvlBfC6OGk8FRx6DwDtQhQFCT6zeRQonUoHQrwRM/KtHTplRAkmVEJI1n+vFPb9bGnXDy35p/K7vkZkgN+NANAkE9etbE8kyIFvRIM8RQmhN2TPb7u43FpqUVSdNJ0qJf0opTXveXX8W4lwlu7y0FfVwWiQqJWx1SKRTO4lVQ1miDY8ZvjfvjxPgZQ1s6E0zP5l97XthUUpebEDjjofCJVDLUppBg9ZTDDuPMATmQcfhr/V1Pyp3VsowLGbS2ugg3WMYjyMzWXJmjWoltUgB5xdvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKmhbpa6itSS3OX31jbYZbkvi3/kdbRFyUj5Ntlg/f0=;
 b=Qj+NtWwKvKkvZTOp7tMgBOaWNSfo2KEKW9PQTPisXLbR2CNS8eIDJ8pBKbwKjdHWckPXv1P/kpCZcDOBZmKYDNMFLUcSUcblDxvr8y0aApyULAUhyOj1rtXG1EtIOhl8KFi4yVNqzU+hHT/NBVlHa78ioHak+7rI/P02cgPvNZI=
Received: from AS8PR08MB7173.eurprd08.prod.outlook.com (2603:10a6:20b:404::8)
 by AM0PR08MB5425.eurprd08.prod.outlook.com (2603:10a6:208:17d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 08:00:28 +0000
Received: from AS8PR08MB7173.eurprd08.prod.outlook.com
 ([fe80::47b7:1812:6dc:b508]) by AS8PR08MB7173.eurprd08.prod.outlook.com
 ([fe80::47b7:1812:6dc:b508%3]) with mapi id 15.20.6086.017; Fri, 10 Feb 2023
 08:00:28 +0000
From: Gowtham Suresh Kumar <Gowtham.SureshKumar@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm/edk2-basetools: Add edk2 base tool
 native recipe
Thread-Topic: [meta-arm] [PATCH 1/3] arm/edk2-basetools: Add edk2 base tool
 native recipe
Thread-Index: AQHZMoSomlPYFX2vNUu51rmf9tfIn66yx1WAgBSddoM=
Date: Fri, 10 Feb 2023 00:24:56 +0000
Message-ID: 
 <AS8PR08MB717386476034CAB055FE3E2EE0DE9@AS8PR08MB7173.eurprd08.prod.outlook.com>
References: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
 <20230127192122.19338-2-gowtham.sureshkumar@arm.com>
 <20230127212741.GI22689@denix.org>
In-Reply-To: <20230127212741.GI22689@denix.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB7173:EE_|AM0PR08MB5425:EE_|AM7EUR03FT018:EE_|AS2PR08MB10208:EE_
X-MS-Office365-Filtering-Correlation-Id: 69be394a-3476-4c7e-bd07-08db0b3ce534
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wee8WCGT6v/OVyDvsv4bujbtgTbaYknN1J1uRdSFOatDiVkf+L4uPrASMXtvdZvNUQhEVTw2X96iv0DWf9dAmsiz60FFnqGr5d/aCKSDbYk8Sldmoopny38Z7FcuC01iFPLMa0vRKvMBO2LG/cM2xPMMVhCd4w985IR06odD0V4fAUAUnyUrAywnk2Ndm2a3IrbTS0ip9sid+fxRiIBTpeO3eMPzEq1XLU7PE48M+6MXpRA3OCoEN0Ix9PDoPRTNUhpnInEKr9+5AvvRH/7fyG01zsELKYy75qT5iJSF8eA+A1v3Rk/1LKyDtbf7TgfjUvqC7wosd9Js1UvHAH6UUyoCmK6jTNYTQ6BLJDQsW37Y+fC1BsswtB1Al+BWzgQ4TZToHl6xRwJzehFt0ceCpllkiJSHn5b3nKG65ic8X8A4OWFLF7Y/uEJq7ZRnArax7aa/NPRKChvRD8HTAuQcySWJB056QYuiT7ImGPQVRRdPg4iap0IBA2fwDSueJp3WjEYeEShKo2FYF5b7gQ0oVmSdkhaKOvOemqcHR3nPx8nipPY19K8+jCKv1tc4gQvwTwkYYdpll8hDcCpVPYvxEgxH5dSwiwE+0xgkbN60RTuivzBTX1PZkNoe5XWgikdx5MUCcNfaosBCqI+ZK4u+etllE8xDlfyJ2iGNWbvCsZcsJwNQhMJE7K5TZvYfkIQsc8NDUWZnmwW7yl3oruCGQA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7173.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(2906002)(86362001)(53546011)(316002)(6506007)(76116006)(122000001)(66946007)(41300700001)(64756008)(8676002)(478600001)(66446008)(66476007)(71200400001)(66556008)(6916009)(55016003)(7696005)(33656002)(91956017)(4326008)(38070700005)(38100700002)(6666004)(54906003)(5660300002)(19627405001)(52536014)(8936002)(186003)(9686003)(26005)(83380400001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB717386476034CAB055FE3E2EE0DE9AS8PR08MB7173eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5425
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	75f45cc6-9985-47e0-3e3a-08db0b3cdfe9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vhdPE5VYcELGlVrQO0A+e90ZFZ9ovMFHpLl/aI/82rsjsbP9t9EHVFQ1tYLiSHQI51/CkVhPKz1CXb/kbWzAYSeZ/HU1mV/RkikqQPOF2P/pNRpIS+iPvhUcUoxqZI0l09Jg7RNM7Ljc+O7EuyR9dzLAgF1r2Qf46jUWDroUdIN3B5wphNGeFaf5E0ZmDAzLjiv7IlKWuuIOfNgr3OZFQLdADGKcCwPnHFwh9xjdMuzTQCE5L3vC/prVjD6362iVIpR1nSMBeJpOvIWVPdQ3d2g33uJwz9A5vSKwK+ijUkZZfxy5VzvWhmlJRqNzehmmg4NmVBsTIqY19rSiUuCEgFnC/53UxaDnlFxfNZNEqSHKksJ3/W96X1+IxPP38+X9CgdQDdlUY4nnTQc+k2ilsn/wce3EMM5cstb3PaFiF//ZB/5/+w3MCEQRW+Iq2qlkqA/xoAF3Lbu4TyOkA6ZJ6gODkU6us8QOPXPR71vMAZ6CyT34e295UNj5jP/u9Y6raZ2Ax8QNSmtUlKENZx3Wxf11SyP/kocIXigfiuuGnVnIOfQpCajhMhH7Ac//5qctk55HeUmX6M1dsvgMkM9b5AVbxzGsCmmIpPiXRZAH52M1rYq1p2s7RpLyDd42rwt6LJVdetKBILajopZvilwGGogocA1dQPXfaZvsv4R7jU7bD0lJld5VxbTHlB32HIjb94WefIwTjl20WMzOexAytQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(19627405001)(186003)(26005)(9686003)(5660300002)(6862004)(8936002)(336012)(47076005)(52536014)(6506007)(53546011)(478600001)(8676002)(356005)(6666004)(2906002)(83380400001)(82310400005)(81166007)(41300700001)(36860700001)(82740400003)(54906003)(86362001)(4326008)(40460700003)(40480700001)(7696005)(55016003)(316002)(70206006)(70586007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 08:00:37.3657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69be394a-3476-4c7e-bd07-08db0b3ce534
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10208
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Feb 2023 08:00:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4377

--_000_AS8PR08MB717386476034CAB055FE3E2EE0DE9AS8PR08MB7173eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Denys,

I do not see any warnings related to host contamination when I use the reci=
pe. Can you please provide more details on it? If you are referring to the =
ownership issue with cp command, does it also affect native recipes? This r=
ecipe is just populating the required edk2 tools to the native staging dire=
ctory to use for UEFI capsule image generation.

Best regards,
Gowtham Suresh Kumar
________________________________
From: Denys Dmytriyenko <denis@denix.org>
Sent: Friday, January 27, 2023 9:27 PM
To: Gowtham Suresh Kumar <Gowtham.SureshKumar@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ross=
 Burton <Ross.Burton@arm.com>; nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm/edk2-basetools: Add edk2 base tool =
native recipe

On Fri, Jan 27, 2023 at 07:21:20PM +0000, Gowtham Suresh Kumar wrote:
> From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
>
> The native recipe installs the UEFI capsule generation tool
> along with the other base tools to native sysroot.
>
> Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
> ---
>  .../edk2-basetools/edk2-basetools_202211.bb   | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-arm/recipes-devtools/edk2-basetools/edk2-basetoo=
ls_202211.bb
>
> diff --git a/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_2022=
11.bb b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb
> new file mode 100644
> index 00000000..c80fdae2
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb
> @@ -0,0 +1,24 @@
> +# Install EDK2 Base Tools in native sysroot. Currently the BaseTools are=
 not
> +# built, they are just copied to native sysroot. This is sufficient for
> +# generating UEFI capsules as it only depends on some python scripts. Ot=
her
> +# tools need to be built first before adding to sysroot.
> +
> +DESCRIPTION =3D "EDK2 Base Tools"

This ^ should be SUMMARY


> +LICENSE =3D "BSD-2-Clause-Patent"
> +
> +# EDK2
> +SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protoco=
l=3Dhttps"
> +LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae1=
2b4570a"
> +
> +SRCREV =3D "fff6d81270b57ee786ea18ad74f43149b9f03494"
> +
> +S =3D "${WORKDIR}/git"
> +
> +RDEPENDS:${PN} +=3D "python3-core"
> +
> +do_install () {
> +    mkdir -p ${D}${bindir}/edk2-BaseTools
> +    cp -r ${WORKDIR}/git/BaseTools/* ${D}${bindir}/edk2-BaseTools/

You could potentially have a host contamination warning here.


> +}
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.17.1
>

--_000_AS8PR08MB717386476034CAB055FE3E2EE0DE9AS8PR08MB7173eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hello&nbsp;Denys,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I do not see any warnings related to host contamination when I use the reci=
pe. Can you please provide more details on it? If you are referring to the =
ownership issue with cp command, does it also affect native recipes? This r=
ecipe is just populating the required
 edk2 tools to the native staging directory to use for UEFI capsule image g=
eneration.&nbsp;</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best regards,<br>
Gowtham Suresh Kumar</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Denys Dmytriyenko &lt=
;denis@denix.org&gt;<br>
<b>Sent:</b> Friday, January 27, 2023 9:27 PM<br>
<b>To:</b> Gowtham Suresh Kumar &lt;Gowtham.SureshKumar@arm.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Ross Burton &lt;Ross.Burton@arm.com&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH 1/3] arm/edk2-basetools: Add edk2 bas=
e tool native recipe</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, Jan 27, 2023 at 07:21:20PM +0000, Gowtham =
Suresh Kumar wrote:<br>
&gt; From: Gowtham Suresh Kumar &lt;gowtham.sureshkumar@arm.com&gt;<br>
&gt; <br>
&gt; The native recipe installs the UEFI capsule generation tool<br>
&gt; along with the other base tools to native sysroot.<br>
&gt; <br>
&gt; Signed-off-by: Gowtham Suresh Kumar &lt;gowtham.sureshkumar@arm.com&gt=
;<br>
&gt; ---<br>
&gt;&nbsp; .../edk2-basetools/edk2-basetools_202211.bb&nbsp;&nbsp; | 24 +++=
++++++++++++++++<br>
&gt;&nbsp; 1 file changed, 24 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta-arm/recipes-devtools/edk2-basetools/edk2=
-basetools_202211.bb<br>
&gt; <br>
&gt; diff --git a/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_2=
02211.bb b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.b=
b<br>
&gt; new file mode 100644<br>
&gt; index 00000000..c80fdae2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.b=
b<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +# Install EDK2 Base Tools in native sysroot. Currently the BaseTools =
are not<br>
&gt; +# built, they are just copied to native sysroot. This is sufficient f=
or<br>
&gt; +# generating UEFI capsules as it only depends on some python scripts.=
 Other<br>
&gt; +# tools need to be built first before adding to sysroot.<br>
&gt; +<br>
&gt; +DESCRIPTION =3D &quot;EDK2 Base Tools&quot;<br>
<br>
This ^ should be SUMMARY<br>
<br>
<br>
&gt; +LICENSE =3D &quot;BSD-2-Clause-Patent&quot;<br>
&gt; +<br>
&gt; +# EDK2<br>
&gt; +SRC_URI =3D &quot;git://github.com/tianocore/edk2.git;branch=3Dmaster=
;protocol=3Dhttps&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://License.txt;md5=3D2b4155=
20383f7964e96700ae12b4570a">file://License.txt;md5=3D2b415520383f7964e96700=
ae12b4570a</a>&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;fff6d81270b57ee786ea18ad74f43149b9f03494&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot;python3-core&quot;<br>
&gt; +<br>
&gt; +do_install () {<br>
&gt; +&nbsp;&nbsp;&nbsp; mkdir -p ${D}${bindir}/edk2-BaseTools<br>
&gt; +&nbsp;&nbsp;&nbsp; cp -r ${WORKDIR}/git/BaseTools/* ${D}${bindir}/edk=
2-BaseTools/<br>
<br>
You could potentially have a host contamination warning here.<br>
<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8PR08MB717386476034CAB055FE3E2EE0DE9AS8PR08MB7173eurp_--

