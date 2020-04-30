Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.89])
 by mx.groups.io with SMTP id smtpd.web12.7939.1588256793000420768
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 07:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AquOVB+O;
 spf=pass (domain: arm.com, ip: 40.107.1.89, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiqLkdlMd/yKY2oxO0qcMP+moZhq61zjyZdS9WmckeU=;
 b=AquOVB+Obd7iT2AIChggUvxDYtaPUmRYyoOTIy39UCNVVSAq1sLU03GjGOfaerK58KzXJTLCf1OkUGt4SdynudpQjUriB0Ku9noX2678vMcdSPZ7F2Mij1zv/NHShZ5ffV+uMCWnCnspkVIGZQZRtFC+RG4fjJ6qmR7GQ1d7kdk=
Received: from DB8P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::22)
 by HE1PR0801MB1916.eurprd08.prod.outlook.com (2603:10a6:3:55::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 14:26:30 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::fc) by DB8P191CA0012.outlook.office365.com
 (2603:10a6:10:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 14:26:30 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 14:26:30 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Thu, 30 Apr 2020 14:26:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00afcf69fbfd77e9
X-CR-MTA-TID: 64aa7808
Received: from 364a14994afd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 201A2AB8-0EDE-4A7E-9F0B-9E7402D01A19.1;
	Thu, 30 Apr 2020 14:26:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 364a14994afd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 14:26:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zq+NPTQeg9PDW3/OnPIUfdhBUNo8k4r2BADDfK2wjLE6YhrQJFJVeC+U4w1qlGrMlK1h6fINkMytE0j0y0ZpVKb3lBCWhYt8oxobG8+nwf9+nuy9IUS8/k+kNW3Wyfrf2zyTjKhZFSqwjem5cjPr7X3d0pHrVIdtyiKvc8efznaoIb6OA9eGzR52q/HXbPbD7aXKIh2HKIDEIGR9opHKJX50OBI19V8tAn55/xkl8yPOql21QsUF5iiZUht6mU5pI+Ij1IfFjJRNecnnXmKBlhIJJzfNpvMUOXSJBAAO3awGLFKt8GzpZ+XK8CYkqi0Rnlf6aA4QnsDKos4MlQ4GKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiqLkdlMd/yKY2oxO0qcMP+moZhq61zjyZdS9WmckeU=;
 b=BYvsvb7lSpnva9pPl/hQ1+hR1Ad66j9CWF+sp6n0H3QwLHnNqIjjhKJFMx1HcNgdBeQieF//+C9Be+Ac3paWZYdmRymLvd/ai7rT/lsYt9y4YXDgF897jLbLLXSvH3PJaPKjC1kADL0UGkODgPG5xldt6ZY5Q3dmK7BFzU2CBHZLjTYU4fylcO0hNualRrVGnQBmaYQS0qQgtbQY9AKXbn4FbRaelgBrmajrKx/x7o/1wDOSXBA23FQfAQ7Ez5WKIaBR+4GPsTZw914rYtP1Js7V4A3RnFTfMIjTZeP4YsRCFkdngwXQsHJwoVClbSOi6qsMLnl2Gga87TEBBnkU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiqLkdlMd/yKY2oxO0qcMP+moZhq61zjyZdS9WmckeU=;
 b=AquOVB+Obd7iT2AIChggUvxDYtaPUmRYyoOTIy39UCNVVSAq1sLU03GjGOfaerK58KzXJTLCf1OkUGt4SdynudpQjUriB0Ku9noX2678vMcdSPZ7F2Mij1zv/NHShZ5ffV+uMCWnCnspkVIGZQZRtFC+RG4fjJ6qmR7GQ1d7kdk=
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com (2603:10a6:803:ba::25)
 by VI1PR08MB3551.eurprd08.prod.outlook.com (2603:10a6:803:79::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 14:26:23 +0000
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926]) by VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 14:26:23 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] [arm-autonomy] firmware-image-juno: Remove unnecessary machine override
Thread-Topic: [meta-arm] [PATCH 1/2] [arm-autonomy] firmware-image-juno:
 Remove unnecessary machine override
Thread-Index: AQHWHvZwdmVp2emLC0mLc0xQUeTBlqiRuLiA
Date: Thu, 30 Apr 2020 14:26:23 +0000
Message-ID: <ACC89E88-2020-4EBF-8190-63A594E8CD36@arm.com>
References: <1588254663-86702-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1588254663-86702-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 65a7936b-e2f4-45eb-1a1a-08d7ed12798d
x-ms-traffictypediagnostic: VI1PR08MB3551:|HE1PR0801MB1916:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB191614D775463A60813D7C959DAA0@HE1PR0801MB1916.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2089;OLM:2089;
x-forefront-prvs: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SU/Cfv5FT/GHsKmBjZ18Kgz+QBAkA8nca05aosVLQHXaByf/Ou03oMhYfcl/5dPQfjVQ8Myu7tDTrhzZUTj3e8p0OYWHR72vjucl+Tlt/e/EyHT6fQBAlwJbfV53gkOlUHFn9TJTSb7jYpxKvCyGBFKy9+Jy+OrWiIeHXQ9lZHzwG5c+3TM68N9wOjtacklHT/+7L75b32TIkvUTmAfKzmLyQw9RtdPqxY5RyjJUM2rlIw/ghy4e6JdQceLgsDCGQOkgGO+RzCGiebyOA6+YRQEtSJV7xmmUIaWJ9GJwCbYR4QZ6B/yqhSUtmQUh+AQ8el/sWiQrSZqSY+Aov8/LTw8YHu535U4fNu29vXrbJ14Byl1ho+bHS5z3CwrvTnj4ZB7mttylT3Gr8Kcf+ZiPuxy3Hbv6IzH63kwiuRZVuEsgoYSjA4nd7V94IgrnYGjS/5Unp38GmALxJfyKwtJCDK9IKk2uoFMspFKVMVVIhyDzgKZ9yi3eK9k9LbjV1DHc/rdawV3HeaQK2WvcJWQLjw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3693.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(66446008)(64756008)(66946007)(966005)(6512007)(2616005)(6486002)(8676002)(6916009)(478600001)(2906002)(5660300002)(71200400001)(76116006)(26005)(33656002)(316002)(186003)(66556008)(66476007)(8936002)(53546011)(6506007)(91956017)(4326008)(86362001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 kvci/YFtJzqlFnUEhEBfw8kyDloQMWCDintlbl9RhdF33bfa1Csx6O6QRXJEDKxii+2znEPE4AgvLvYhdKzCjJMhP4kw5/BMtxqupt85JMOHpAhnpVbKSsStLA7UlFD1a0vNnbOdPKZjt+i0b4/4sDOVReXLBRHLT2d0i6indp6p/pCOOUdhPQU7/B8KFpuSrkCvabU8LwdEx1Dt6WJCVcqf9cMNCSqHt1FqIA7h4+OUbiiSLlnke8705Rpq8NEsCiL0MjRE2216FhptXg4Flsve/pmwXS6rppEtP33V0z1mjG9jWW7KAoqSXs4BABlcUCkDMChlmty/tE/QcBRGKxSttvvSQ9/BSnMHKODRC01lxDnYCXWJ7XfEHfs8lmJ05YVQyeFtm2ZYfHhNKq/7p38bTw9ul3zDu/NoIFmsJLinal82Dva87LyS6DaFY+i2Vf6fLCK3HTohnGh2lEDgIiqR/kwPKyxa0hGCiZwphJcwi3Rbiy+7CZSy3qKhNEp8Nph6NyB6ThYdhr0AajzswFA1mFCjUyJGhbyUVKriZjBwMbHy7ho+ub0XdxscnGE+9+4sqt1Np59kMJyY0noGrp7jknMnVhrXqrqUbn9rtMky9nHCenI4FuxxsRzprHl3SnKzjHEapD/4t63V4tXHd9gBYfrroH7n0mcYVRM7TAOU7awilysDh3D16ryoB+fz6jdfKNkgasRlcCenbVi5wzlRr9VOJyX/J1CxKtDMw6azkJRmcUWhtaB5E/woRBRYT8RoAKjgUTMfvdAy/ByUHCy4zfvryuapy6RwKjZ9tOc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3551
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(47076004)(6486002)(82740400003)(86362001)(6916009)(186003)(33656002)(2906002)(5660300002)(8676002)(316002)(8936002)(26005)(4326008)(70206006)(478600001)(70586007)(53546011)(6506007)(6512007)(36756003)(81166007)(356005)(966005)(336012)(2616005)(82310400002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f5248849-b013-4bf8-63d5-08d7ed1275b3
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	naRV+EK6tbia4CFEoHBy64o3jo64fvuj4BdMATZ4Q07BI5m7t5un+q9PxJUdrb9vNaVPsyqObN6qp4hdN0KEaBZq35ls0pjYUt0lcKrdEfuyI2WRlObyx7VVGh9Y+BLXFarn5VnI3DE225Gh2zV9GQMmeCus8qBiwCQ/ywygKuufGbmRHRdoH3AC4JuiRmll8DLMuqdasuCPCu+2TZS1IbBfjNR4rynr+0hcQgMCkv+gK9kl4ziLodISCMxQe+qsAgZ8ZjGp0rJMX/+FIKeWj3xNYC41mimN2+ynPUV6y5TknJCUHl4SMSwp2hJD0jlg6p1wsajRV1/E5MTvSqZAKSNWJb7IO8bnVLmPlixo2eL2iQ63sD4Vtjpu0JXiVdifHARJDzH1QrqzhunJLDFXu/XMq3pl+ky25Xwv5+uWkv65T7fvj2WGV/mSvgDoxCqDF78w2gs5nGuoLClTM2RdItHoktVMzWxPoNJXfqPYC+xi9ic3QwR4aTopIEJiO4MSJhDeQ0NVnmbiReqjBvlKoNzVgz1sToXoC8QqPc/yR98cPPWXIVbRv2e6+WgP4wABEMd+ruHl5UT+k5cb02S9ng==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 14:26:30.0639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a7936b-e2f4-45eb-1a1a-08d7ed12798d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1916
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5BF75B5CEDE5F34B8436ECE89F795973@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Apr 2020, at 14:51, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Since firmware-image-juno main recipe is only compatible with juno
> MACHINE, the _juno machine override are not needed.
>=20
> Change-Id: If1b880ee2b6b854f83087005f7ae89f0d77aef7d
> Issue-Id: SCM-889
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend | 6 ++=
+---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bb=
append b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
> index 55b83d3..2904e0b 100644
> --- a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
> +++ b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
> @@ -1,10 +1,10 @@
> -FILESEXTRAPATHS_prepend_juno :=3D "${@bb.utils.contains('DISTRO_FEATURE=
S', 'xen', '${THISDIR}/${PN}:', '', d)}"
> +FILESEXTRAPATHS_prepend :=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
xen', '${THISDIR}/${PN}:', '', d)}"
>=20
> -INSTALL_EXTRA_DEPS_juno =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
en', 'xen:do_deploy', '', d)}"
> +INSTALL_EXTRA_DEPS =3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', =
'xen:do_deploy', '', d)}"
>=20
> do_install[depends] +=3D "${INSTALL_EXTRA_DEPS}"
>=20
> -do_install_append_juno() {
> +do_install_append() {
>     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)=
}" =3D "yes" ]; then
>         cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
>             ${D}/${UNPACK_DIR}/SOFTWARE/xen
> --=20
> 2.7.4
>=20
>=20

