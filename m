Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.67])
 by mx.groups.io with SMTP id smtpd.web10.9634.1589301426314251190
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 09:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HNExqD/D;
 spf=pass (domain: arm.com, ip: 40.107.3.67, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PSC3wGNLHFeW5mTWZoQJnlGk0XQ3p+beAh3Ns20nYU=;
 b=HNExqD/DMvD52SvM9AiCp2ACGXFocugoKS3brVFPFzcQFpj5NaOak7xqFqbWvT6RuWPCHFo3/KAZLA4LTXd3j1QYU+6LYw4X0BtZWXTUdx/kbgoKRbJ/SXtMaPB9z1q8KtZD90UIRfH/UFnq/YhqBz+gwswxZJYRiu71TOmgxBk=
Received: from AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::29)
 by AM0PR08MB4244.eurprd08.prod.outlook.com (2603:10a6:208:13b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Tue, 12 May
 2020 16:37:03 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::c0) by AM6PR10CA0016.outlook.office365.com
 (2603:10a6:209:89::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Tue, 12 May 2020 16:37:03 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 16:37:02 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Tue, 12 May 2020 16:37:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4334e5d4868cabf
X-CR-MTA-TID: 64aa7808
Received: from e616741afbd3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 081BA81C-50C6-45EA-B213-2CF288D40DDD.1;
	Tue, 12 May 2020 16:36:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e616741afbd3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 May 2020 16:36:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKD7GYfnIVvamekoRHll4Z9nDZUViUBfRpHAR6HVLG7gSwh7d7+wvlfTukyUEUPVK9+A/1ew0kVZPDj0UiHi5hkOYoFfRS4TmcYwQKgYFD8RBOI+g3wFN4sqn8ASRMoXEJNHhZv6/roUDinwoiqJBZ6WVzHGHuOFS4AlpZufRXetB4IZWHf9+2D6CW0CDzbHW4jtbqELrtZKI5thbtVVE6OW0QUMGpE1ymdA7cETmhL697fHBuvLi+GpmQ6msTfZGTYp2SfMn+hWhqDd1RNpk7OGTArY0+Icmk6Ku6O2yzIMvS74URnR4BMK+/klwgNwtzumKJ0Di9GR/uT25Srf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PSC3wGNLHFeW5mTWZoQJnlGk0XQ3p+beAh3Ns20nYU=;
 b=eWYSKTVPcKEEZr1CV9SYPcYPq6ZSJHEUWRw4giK0d8n0pwbSmqT0MYUMHUcnThc/lazB93HCiFX0a7ZrHfmSko3GFGwT0bHkvOaPkmr3YPYu393vu8xc3qljuRgD8ng4Fc+IETKMOWn8993NmGBooFwiS8wr22007HFIAXIaDTJyfbBibZz0uGQYEsB7DuNTwtrScztP97aOR5WLhaLggOU1UcB+HlsyXDBoTkmKX0cVvb1kbfpzLRpNuvgK8k+cPSmLUryb4FkoXxJlLupotrSjB0Ybp1ov2lqhJtwsThpiI/UZMLkNikhhUNb6PbKFSbwWvsP8HNO3Z1BS9Icmeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PSC3wGNLHFeW5mTWZoQJnlGk0XQ3p+beAh3Ns20nYU=;
 b=HNExqD/DMvD52SvM9AiCp2ACGXFocugoKS3brVFPFzcQFpj5NaOak7xqFqbWvT6RuWPCHFo3/KAZLA4LTXd3j1QYU+6LYw4X0BtZWXTUdx/kbgoKRbJ/SXtMaPB9z1q8KtZD90UIRfH/UFnq/YhqBz+gwswxZJYRiu71TOmgxBk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3788.eurprd08.prod.outlook.com (2603:10a6:10:31::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 16:36:55 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 16:36:55 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: linux-linaro-arm: Set COMPATIBLE_MACHINE to "invalid"
Thread-Topic: [meta-arm] [PATCH] arm-bsp: linux-linaro-arm: Set
 COMPATIBLE_MACHINE to "invalid"
Thread-Index: AQHWKHW8a2FzA+UpRU+jJSpHcyKVNaikpiyA
Date: Tue, 12 May 2020 16:36:55 +0000
Message-ID: <92099448-B0DB-4C92-9E25-7592D09B716A@arm.com>
References: <1589298895-66051-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1589298895-66051-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca3a4cfe-a17e-41ad-7b1f-08d7f692b343
x-ms-traffictypediagnostic: DB7PR08MB3788:|AM0PR08MB4244:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4244E42DCDC28504E2FFFC309DBE0@AM0PR08MB4244.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AJZdifAOgsESGIoLXigb66R8TSVF5uR1oVHic6Pib969pZVzHgpuLWfIK6g7X5tKLsgicA0d3I/1xgaQyL9Q7kNGrz62zJtAP6sXWedot/3e9JtE7UQ9igwhre1HhyIBKl7J2AJVHue3lvSxnxMwwjmZB5k4bQr27HhNlvgaeEBqQ121n8KDrsOsHb3JVoguRSGIE8BUYZFcmG2T1qd0CFhDqH29XOaNf6zb/HCmhGLrvszb1+XCh2CJgQfz9E68mfrCacQtRPMs7kRB58uOVm5tQ2gUcs8y12vfi4CS9WyC0fktHjvlObZm5zwXIYwPPvadn1fFwkK0thSvPyjRrWSlnx2iGZie1nUCqA/mU8tENEa3GzJiw+97OaV/jzkD1w2jr7KETDO2plvWTHvZueE3p3W7Yk0Ngw4TFCYdPl2J4N7FEsmV/BR+f1f3VDPNS6IwtEmRHYViKCFv0xUceK2APB2XyAsmE4su7eolw64aQakNuDvFeTvERUB+179YR1/F22vzw6lTLpwVWDXr9ZitPAhZ3dxP7bpLXQ8qI7ATjStEhu436AFUXPzuQezB/fqY3Wn9OB+D9IsbWSCdh61SKvsgpEx0Ze+tlh6N8I7LuJNyQlG1YI/0p5DRf7BKXrDoIElzomRsm1jHoFRIcQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(33430700001)(91956017)(76116006)(64756008)(6916009)(2616005)(4326008)(2906002)(66476007)(66946007)(66556008)(66446008)(86362001)(478600001)(6486002)(966005)(71200400001)(33656002)(6506007)(8676002)(8936002)(6512007)(36756003)(53546011)(316002)(5660300002)(186003)(33440700001)(26005)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 opWpRE25HHERGTWfohu5W7mtra6l/OzZAsURP42fSJKJzBv5OuuHx2QV47f4csdwu2JPpO0untRNTjUtBx2cnGLjPZFnWOi9PDsHRRQ7QVjgMl5jOmYJAwR++/wVMWkwgLQuhXFiowYA/ALaxxNBd1n+pBWC+DSXRnVNNvxclC+KTpokSCMX3PJsY2fjRGzT0nnODdmHsx/zWrj0lSq4ELfu44vEDtBOVGI3e8kw+pKnOjXWK1qrAa4Y0bzjKrZXYCfeyzqbo3mkz3Mb+Y3OiIpfc7BL5p50nOXcg+/plrdXsEA8fybiTfjovLvUfSxz+Z5byLODOsYJmkeVcuvVog6ieIWF0/xV3JPpd03LBwBtKWqrQxUdpvtN6QGyjL0ryO28zcSZMXiIRg16S+tk2QPGLHJ0kUi5rGdQcquQ46c0mxzByBrQN16pboYi13jDZAK3pCBqfPuMD4Bs5m9heK4fSucjSwd8gkK+GBFpqAaUmetWpr269DrmEeqrseAy
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3788
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(33430700001)(53546011)(4326008)(2616005)(6486002)(70586007)(2906002)(336012)(70206006)(86362001)(6512007)(33656002)(81166007)(26005)(966005)(6506007)(8676002)(82310400002)(36756003)(8936002)(478600001)(82740400003)(36906005)(356005)(47076004)(6916009)(316002)(5660300002)(33440700001)(186003)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2e129ed3-3d59-4120-4de8-08d7f692aef0
X-Forefront-PRVS: 0401647B7F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lKJRG5qLsEX2s5O4p6jyNFXdikh2Mo/6982STbwT2EDXpcwl85L3BkYvDsUI0HvolrjMzloknPcifzXre3dYT132jb2uRe3TkSOdDQSJJidVh+EXIecxNBJwIP64EX91Z5gw86ydyx7o3FDe6hIlYOUJz7PX9auSL+KppmQfhgrBOr71VKTcfQF7R30vCJ7KZBneqFBBbptsr/Nt25eVPMxq8pdsdSP3/VmKa9KWt3HrcxmAHaFcsV2lL3inzWNoxxS1TTLbmaHMRpUIoKl2UAzO19RELQ9Iql4/wQdyd/fl4+iXHcTNl4PvJQuDXxaonbHWhIcvnrNimhxyIrs4dJbDPkAzC0TrGziBuq7uLZMU5SB+xhuoahwa1JvPS7P8mTo9D3UHMNIwxtWCb7XseKc6+B2u8Xpkcf9kA/fc42x/zNrM2nxA3jscn/VDggKLIP2qgbp/3T06ZNrRtkvx1VNcUZg4Rr2G9q0RApuSQhWxCP2qPo3XSTLefd6620gmAcB1zRXCqQxhEzRQ28zju02XlZfMnGN8Wg7b/dOMeyGsukWiNUQemYG4SBJw8yIakq0fGrRhMoxfccGS8ytrv0b748pXVwigLr4U95Pn44VtegX/7SUk8GvIJO6RHdmD07yGyrRNEYlg+ytAUrkj/e9kDAyRauvBTDGQL0lo09SpRM7E7Y2mLeNiGvnhB8jA6UTXx+02Sxia2R8zyl/kUg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 16:37:02.8777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3a4cfe-a17e-41ad-7b1f-08d7f692b343
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4244
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7978036693B4244685D2F9F0CEEC8356@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 12 May 2020, at 16:54, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> To keep consistency with trusted-firmware-a and optee recipes we should
> use softer assignment to "invalid" for COMPATIBLE_MACHINE.
>=20
> Change-Id: I57d0b220d92c4546e0539f95a54d391935f995fc
> Issue-Id: SCM-954
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b=
/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> index cc68ed3..fcc07a6 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> @@ -6,7 +6,7 @@ SECTION =3D "kernel"
>=20
> require recipes-kernel/linux/linux-yocto.inc
>=20
> -COMPATIBLE_MACHINE ?=3D ""
> +COMPATIBLE_MACHINE ?=3D "invalid"
>=20
> # KBRANCH is set to n1sdp by default as there is no master branch on the=
 repository
> KBRANCH =3D "n1sdp"
> --=20
> 2.7.4
>=20
>=20

