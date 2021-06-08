Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web11.9383.1623137615081643364
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 00:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0dMRHCvb;
 spf=pass (domain: arm.com, ip: 40.107.8.40, mailfrom: hugo.lhostis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46MfFfpN+91HTpDNclXR40j42ufhYu3RZPk3kpmwris=;
 b=0dMRHCvbu2FMbxSXg0VyA5OzZ1nusuQUvlLjnij2fgvjVcWwAhXwlY9e12pgRy+PqdQGSsodpTIvQERnKdjTyMIcL/eILJRWx+Bp0+AzjaP/p3QJlGOojVRAXiGjiGj8Eq7fLLf6hwA4OVykYa6aG4+MfYWmCkaPTFuipBWI78A=
Received: from DB6P18901CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::28)
 by VE1PR08MB5102.eurprd08.prod.outlook.com (2603:10a6:803:108::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 07:33:26 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::2) by DB6P18901CA0018.outlook.office365.com
 (2603:10a6:4:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Tue, 8 Jun 2021 07:33:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Tue, 8 Jun 2021 07:33:26 +0000
Received: ("Tessian outbound 5e4f56e125a9:v93"); Tue, 08 Jun 2021 07:33:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 570826e0b11af930
X-CR-MTA-TID: 64aa7808
Received: from df6d33eb6861.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FEAAA652-687A-4E94-B6E1-CA3424BA6736.1;
	Tue, 08 Jun 2021 07:33:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df6d33eb6861.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Jun 2021 07:33:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVuy3OFkXEKfVHDvNuaDXq8HeaCvbU4fwuZBmrvmhnsLnf5caYvIwgdmNp275scT9WWLsCwwmTvZY/6x7wIodw/wZ8ywnGbiknyDvge6eLFATOHWrzamBQMlHRda/Vy+rjeWa/uWvL5uRqKbiitwDcfA5OaqJvQhPxjSBi13LX26AflmRNbl0UV9WuEHdaM87QmmwR8zLGCUhtNIhtgQOJrw4ZFYWEOLMPC31JBOEAuu0IyNgcJv8qEADLihQVsN/67GCgQBnJr5fsDLoUvvseVVu3DOKQ8lQS7/NAegbxGyG8G2XX2qeJe5ER2D4Eb4MnJoz7mnD/cmh4zf8dUlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46MfFfpN+91HTpDNclXR40j42ufhYu3RZPk3kpmwris=;
 b=hGruiL4cxb2eyf87xXMUAI9lx5nv+sWJxo0s0Z9mMGzoc27p5ZY5GIgvu8bKL4XbvkpsLDMh2Ce8y/H03aPS+g/tcK7RmCt119cRC6OKCZdBpx9n36BLlNnEDZ/rSpeYiba1VcHbY3LhguD1daANqRGSpFnbra1NOwW9AjcfGcTojOIaXk/bNikTaiMGvtrHLWppBtk0slffvqubrpW5UdXuHO44W6V6WewpJv1h5eewXyuOPLOK8J3/Db+7TOcFQL0AbeawKN4xbZVv1LINJfVqv0googNWHZ+1rTAVH1fvriBPEbBB/EhcdeHtX0KsAOgN4JyYctvtG6BNtujH3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46MfFfpN+91HTpDNclXR40j42ufhYu3RZPk3kpmwris=;
 b=0dMRHCvbu2FMbxSXg0VyA5OzZ1nusuQUvlLjnij2fgvjVcWwAhXwlY9e12pgRy+PqdQGSsodpTIvQERnKdjTyMIcL/eILJRWx+Bp0+AzjaP/p3QJlGOojVRAXiGjiGj8Eq7fLLf6hwA4OVykYa6aG4+MfYWmCkaPTFuipBWI78A=
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com (2603:10a6:10:1ac::23)
 by DBBPR08MB6091.eurprd08.prod.outlook.com (2603:10a6:10:1f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 07:33:13 +0000
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::8552:fe4:5bd4:3815]) by DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::8552:fe4:5bd4:3815%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 07:33:12 +0000
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Hugo
 L'hostis <Hugo.Lhostis@arm.com>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-manager: fix xenguest initscript stop sequence
Thread-Topic: [meta-arm] [PATCH] arm-autonomy/xenguest-manager: fix xenguest
 initscript stop sequence
Thread-Index: AQHXW29TL3sXiKbKkkuDdSmdwIn2ZKsJuNL0
Date: Tue, 8 Jun 2021 07:33:12 +0000
Message-ID: 
 <DBAPR08MB556030882E0EC0542720D3A786379@DBAPR08MB5560.eurprd08.prod.outlook.com>
References: <16863C6D6E7FC032.31052@lists.yoctoproject.org>
In-Reply-To: <16863C6D6E7FC032.31052@lists.yoctoproject.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e1ac8f94-f5e2-4ca2-03b9-08d92a4fb3ff
x-ms-traffictypediagnostic: DBBPR08MB6091:|VE1PR08MB5102:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB51021BFB5C8B2823D5ABFE5E86379@VE1PR08MB5102.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:605;OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PzfnN9p2DX46IMfnckxljKL1aIiI0uEyQ++FtrVumLFWiybgVvxQq5Mf9EXeU93F6PioLzJXt+Z1WKC79HwW2BhRIfnqMpZnIBkjPVlCJE9s1wdH7bp2JSMqYlAohdqY4CUNd2qnGhZW/W+tFOU4RSJgCZVasTMuAxmtl9mEf/6Z/aEfIiaR1R8LpzZnCJ43tfFDRLF8qqdwggGL7n5CDfi6GoBprNUbUBRKSeO58eyhOPgMwKokuYfXgnNbDTf9AGt5gTIJv+nGHRLEf8DS6SwreTIKiKpoEUZmU12fCE9Z+NzETTs+4aKL8EzkE+m3iZInChk3W7eA5N00IVHiJofxejjtfjHnfACO8LYNiZ571uJ5ARzuM3QCT/a1h9QPGWwnJTLhG/zOArsBhBESfoXrFEIeXtjv+17m80aQVSxGYda/NHEs6ftzWqQHy+bdCyJE2JW/H/eOK56yIt3HZkeN3GjBaPwA6TxAXkouc/9QvrKR6hLUUJSmMofei5CcFUq10QHJrp+74OJlv8b4Hdzh4tEfpvQV2BcubN9cL2qZMJcv43WucG7T2ayw68mmPliEuME06LQD0/25SYlNeDBIUi2g7OnpvpHbsxTLo18=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5560.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(8676002)(33656002)(66556008)(55016002)(71200400001)(66476007)(8936002)(86362001)(478600001)(9686003)(316002)(2906002)(6506007)(26005)(5660300002)(66946007)(19627405001)(110136005)(52536014)(64756008)(66446008)(7696005)(122000001)(76116006)(4326008)(83380400001)(186003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?heWaZV2PsMgQq+4nRzQXCRgV1dxdIVSlcdtzHCapnD7+F+QqvZxhvr9CQl?=
 =?iso-8859-1?Q?hcgyFuoym/rdqRZpnv+zuIHc8Zekd9sJyEnnOSSEaGwpM5eNg9kNPTC7gr?=
 =?iso-8859-1?Q?ZGD5uWxJBqZBcmINV0INFEhL7YuhYjH8QlQvMWMj1YzW5CWvJScz1fIJlU?=
 =?iso-8859-1?Q?xQrXEumF+/VbJLQD6lXiBdfE1MP24iHRHxHn+7JJwN4U0BpM7sL/feLgwN?=
 =?iso-8859-1?Q?VJjoG6wSpkSh4mmEsQSIiw3eHyS56yAosNe+Q/3owqGUsOcw8PQYkGYaSg?=
 =?iso-8859-1?Q?i5wovJXaimuW0DeCZn2RZ2JAomrHtWCOULfdlOHH1Tx2rG70G0uYu5ShHC?=
 =?iso-8859-1?Q?G+pTo1AlxKLV/6LXgQEh7rRSXOlmeqUdJBxVolf3PbBXpXe4PZlOMD0FXq?=
 =?iso-8859-1?Q?ReYLIxnk474x9Wwfi2OfBs+oReGD1t9Qham9zIJBk3S9p2m+/yewCVoDLD?=
 =?iso-8859-1?Q?R1uDyKupJlxto/WfrMobU89RzDQazxwmelYARMTkjNCT/wNtXwq9tJRXCe?=
 =?iso-8859-1?Q?5XF/p7t8GYnrnuOwJukgRizB2XcMYApW1Ef8yXtSJgG2OjmcsFs2O2PnGx?=
 =?iso-8859-1?Q?1o482pdI8Djdl2AT3nZZVvIBl0/xb5gYXUE8MyVJZu5QVariSqOhqf5pJC?=
 =?iso-8859-1?Q?Ay9Up6G/+6ihglI4nfNfFNviIKROfTSlsmp0CyEyujNqs4LiyQ/W3pMthW?=
 =?iso-8859-1?Q?RsIaR7LfWYmw+2OrOQW4LX71sRJDWWscDge6QSsggfnb8019ZqNXew5SbT?=
 =?iso-8859-1?Q?v0bLSIYBsyP3Bc7aeNg8EeHbRxQm9MRsT/vTpLMGCCLX+aPynqqWS94kUx?=
 =?iso-8859-1?Q?0qm58pzZRmZOHuDiebS6KflKm8QMOKGIVcKEymCCEieln8Km3uelxwECu5?=
 =?iso-8859-1?Q?tJeZvVLK6vJGSUmnSApH3oIETwt8BQi9OPrx1+pdbquUaYRhA+4/pcIetM?=
 =?iso-8859-1?Q?p8o6k3xQOszY4uXJD61KP0BpUhbI2567ddyZsgPgE4N/8GP2UeNHblsB68?=
 =?iso-8859-1?Q?jUD3JaweGIrFctXtKn8EtimPEtlmoh+j3Py+Rgw8CZSNt1QnnfBA3k6dx3?=
 =?iso-8859-1?Q?0YLB3hfUnfHuCDwpW2XDxzIz6M0bLCj7vb/RZx9EO+zlY2d6eIbAJW+DfF?=
 =?iso-8859-1?Q?/fRQq8z/aMv7oEHwMWB0w61vCy6HxlMN9/567P0VY1sbmT92Qz7R6NJW9s?=
 =?iso-8859-1?Q?mFPItmNhdPgJhHIZsLTbE9VFKFd+v/gI4WEH3CJkHfKbZA4pnXz5Fxu73a?=
 =?iso-8859-1?Q?Pm7bEwTfFRBXsYf/pcHACThCN0pMezshrr5LL4zcUE60jilmbTI+xHjzs7?=
 =?iso-8859-1?Q?7Lg9W2MLspR+8hV3ERAWqyNkVxLkbvdCZt8YEKmI9mQcg0Q=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6091
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Hugo.Lhostis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	12bdc39e-8ba7-4b6b-96a0-08d92a4fac35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/P4R9/26Qunw9luMEHrQ4zUkEeqUr4fW9c5E0t67vnufSoadDiYn/yhJWT15iC3pJGR4xRt/UZLHC2wwFpz86xwhBtlC/gaNLsEkmmMpCPIGht9TiRaSvEzsryoFvj8udXRCQ5V4um+0U2f9gPyxp2fHe0HQ4ErUbw303xEHVjPM22xN0UgBUjmoLX3NnkN9VEEdQIVHKX5XC5sn9Ouy25xlleHIZU5pRaGBBa/xLF+dvYNyPlzjGbCfg2Wv/ALZ9pvUKtOICnFGmlxtksLAGWycnzvlr/2DIce/1RcjtUBpYi4Iq1ZMgFm4cPFRYSqtszavNRA8paBsCtUnbc6eeZoccV6wAvo4Z5A4pecDcFJx0PXpdVfhbuQLZrrcbYo0bphCLt2WhXCv2mOej0LNUSNDVB/QzzIVQJSDHQKeDRGAvPul4LOp5chLd6FkBrFszH+ss0rctFEFPI7ZnxE9PrEDmJ44vt/FbgXRwW8+JiNGBFS4SyzmkW09wPtZvS4GN4pCnA8AAWZopT71zzSvP7Qy5iRgtM1mxwh5AgLEbekN/WM/tiKQB1iyO37C60FrGQp7Djqzy0jzAX9+dNxG4JpajiTVU++ua3kfQ888muCfTlzKX2u4xV2fLSE8MZbdx7lsg1WonmsRgpVcpM0sPdegvuTwpRYyN5PG69DOiMY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(36840700001)(46966006)(8936002)(336012)(82310400003)(52536014)(8676002)(478600001)(86362001)(19627405001)(316002)(55016002)(356005)(4326008)(9686003)(2906002)(7696005)(81166007)(186003)(26005)(82740400003)(70206006)(33656002)(36860700001)(70586007)(47076005)(83380400001)(110136005)(5660300002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 07:33:26.0158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ac8f94-f5e2-4ca2-03b9-08d92a4fb3ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5102
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB556030882E0EC0542720D3A786379DBAPR08MB5560eurp_"

--_000_DBAPR08MB556030882E0EC0542720D3A786379DBAPR08MB5560eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Jon,

Could you backport this patch to hardknott please ?

Best regards,

Hugo L'Hostis
________________________________
De : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> de l=
a part de Hugo L'Hostis via lists.yoctoproject.org <hugo.lhostis=3Darm.com@=
lists.yoctoproject.org>
Envoy=E9 : lundi 7 juin 2021 08:32
=C0 : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Cc : nd <nd@arm.com>
Objet : [meta-arm] [PATCH] arm-autonomy/xenguest-manager: fix xenguest init=
script stop sequence

This patch fixes an issue where xenguest initscript stop sequence was not
properly identifying the running guests.

Issue-Id: SCM-2772
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I3ad88e00f48fab07f99936a10c0d1deb7459e83b
---
 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-ini=
t b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
index 5862cb9..115b2d6 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
@@ -66,7 +66,7 @@ case "$1" in
   stop)
         echo "Stopping xenguest"
         # update guest list
-        guestlist=3D$(xenguest-manager status | grep Running | cut -d ":" =
-f1)
+        guestlist=3D$(xenguest-manager status | grep Running | cut -d " " =
-f1)
         for f in ${guestlist}; do
             xenguest-manager shutdown "${f}" --kill
         done
--
2.25.1


--_000_DBAPR08MB556030882E0EC0542720D3A786379DBAPR08MB5560eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello Jon,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Could you backport this patch to hardknott please ? <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hugo L'Hostis<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De :</b> meta-arm@lists.yoctopr=
oject.org &lt;meta-arm@lists.yoctoproject.org&gt; de la part de Hugo L'Host=
is via lists.yoctoproject.org &lt;hugo.lhostis=3Darm.com@lists.yoctoproject=
.org&gt;<br>
<b>Envoy=E9 :</b> lundi 7 juin 2021 08:32<br>
<b>=C0 :</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoprojec=
t.org&gt;<br>
<b>Cc&nbsp;:</b> nd &lt;nd@arm.com&gt;<br>
<b>Objet :</b> [meta-arm] [PATCH] arm-autonomy/xenguest-manager: fix xengue=
st initscript stop sequence</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This patch fixes an issue where xenguest initscrip=
t stop sequence was not<br>
properly identifying the running guests.<br>
<br>
Issue-Id: SCM-2772<br>
Signed-off-by: Hugo L'Hostis &lt;hugo.lhostis@arm.com&gt;<br>
Change-Id: I3ad88e00f48fab07f99936a10c0d1deb7459e83b<br>
---<br>
&nbsp;meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init | 2 +=
-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-ini=
t b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init<br>
index 5862cb9..115b2d6 100755<br>
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init<br>
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init<br>
@@ -66,7 +66,7 @@ case &quot;$1&quot; in<br>
&nbsp;&nbsp; stop)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;Stopping xengue=
st&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # update guest list<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guestlist=3D$(xenguest-manager =
status | grep Running | cut -d &quot;:&quot; -f1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guestlist=3D$(xenguest-manager =
status | grep Running | cut -d &quot; &quot; -f1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for f in ${guestlist}; do<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe=
nguest-manager shutdown &quot;${f}&quot; --kill<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DBAPR08MB556030882E0EC0542720D3A786379DBAPR08MB5560eurp_--
