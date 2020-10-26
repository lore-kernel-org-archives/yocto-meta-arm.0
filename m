Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.80])
 by mx.groups.io with SMTP id smtpd.web10.11142.1603711113854494987
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 04:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NpXsDZwp;
 spf=pass (domain: arm.com, ip: 40.107.7.80, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txUXdy2SbED55vSc4e/RtHBtJQrmSOW+HaIiLxp5isc=;
 b=NpXsDZwpPnTuAAilE10Wzz14e2BtipPnWYcj84fEVYNecnj6Sv2PvvUTokkK2sxMqE/zvJp4yilLhp9r2J43JkaQ61s1EBoQU6mZuUD3QX/UX1zAktTbe7JlFEoYlhffYvsceXHDyQNwP6r3Erjuf2pv2sB1ig5rexkV8L3RsVA=
Received: from AM6PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:20b:92::39)
 by PR3PR08MB5689.eurprd08.prod.outlook.com (2603:10a6:102:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 11:18:30 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::ec) by AM6PR04CA0026.outlook.office365.com
 (2603:10a6:20b:92::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Mon, 26 Oct 2020 11:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 11:18:30 +0000
Received: ("Tessian outbound c189680f801b:v64"); Mon, 26 Oct 2020 11:18:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41578dd41c24ce4c
X-CR-MTA-TID: 64aa7808
Received: from f0a9bd4a3276.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CA3C999C-571C-47A3-94A1-CB17BC36985C.1;
	Mon, 26 Oct 2020 11:17:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0a9bd4a3276.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 26 Oct 2020 11:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktKSfpqfmDyW09qDouSulwQPT8Tu5yMDA7GKdYgws6Qc+vM1YX7NVNv+UXbiM7FU+UNxGJEJgK/ZUZITUt6Op+UQjTPoMFdP8hmIy1nPKEXi6cGwqrJ73JCsIibrh3gweMy48lih5nzjJKmBNIsU0u/KiIiWcQm08vT3SFNcfE/M+hF7iIlUf2IH4Q6JTb9yVhCgmKJhJGOkn+FESJDrmhtiC+foUoGpIty6+RX9nUXT9MaV5O/MkGCpl6tjdbMtDKK7MYpVsU9rhP5mBbQ6dQevg7UPfu+uJsY/eQ6TTw7iUPViz5dtEIXFyjXIFe+t131xojMicr3XdRYzwukkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txUXdy2SbED55vSc4e/RtHBtJQrmSOW+HaIiLxp5isc=;
 b=ITvxiOPnoNZu44DO+2d5nKZn0Ql0gGFDFgSt0UpSVg7aVbGVVqlLNM5wLnjMpJiWYwgqkuCp6Ec+z07oGx9dGCBCr1mpQPWcwori68sG1ATYTER3Z9/wwpcXj1Wm0WGQhmZhF76+QDL1ildy0S+c7xIygBdk47RBCjipJytBdmHPPbH8UG3cJb70tFYlsTsVo+7nbVHncUc1z0AVPgWpc4OPfch758tw2eR3ZsrmLGt7dK70ExCf2TMoOAeyvWLldSrETAOTVkIpuyTt8YvkmHZ6WxOcqUVkMplZtcT4iVfVF4lkFDx4YN8ygoMOR8lmypNDZeDOKTNS/1gw77Uq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txUXdy2SbED55vSc4e/RtHBtJQrmSOW+HaIiLxp5isc=;
 b=NpXsDZwpPnTuAAilE10Wzz14e2BtipPnWYcj84fEVYNecnj6Sv2PvvUTokkK2sxMqE/zvJp4yilLhp9r2J43JkaQ61s1EBoQU6mZuUD3QX/UX1zAktTbe7JlFEoYlhffYvsceXHDyQNwP6r3Erjuf2pv2sB1ig5rexkV8L3RsVA=
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB6PR08MB2936.eurprd08.prod.outlook.com (2603:10a6:6:25::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 26 Oct
 2020 11:17:51 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32%5]) with mapi id 15.20.3477.029; Mon, 26 Oct 2020
 11:17:50 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Lakshmi Kailasanathan <Lakshmi.Kailasanathan@arm.com>, Ross Burton
	<Ross.Burton@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
Thread-Topic: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test
 recipe for systems comms
Thread-Index: AQHWp80b3ElNfkHUzUWB+wCnb04hGqmob9EAgAFTtxM=
Date: Mon, 26 Oct 2020 11:17:50 +0000
Message-ID: 
 <DB7PR08MB353190D4868440AC68092891FD190@DB7PR08MB3531.eurprd08.prod.outlook.com>
References: 
 <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>,<20201025150126.GE8073@kudzu.us>
In-Reply-To: <20201025150126.GE8073@kudzu.us>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a45f0c2a-5aac-4346-cebc-08d879a0de53
x-ms-traffictypediagnostic: DB6PR08MB2936:|PR3PR08MB5689:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB56898C6C7B9177B8B30CA319FD190@PR3PR08MB5689.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:800;OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Z1VAu+OxqeJleu31uyKFz8DNyvsfPGBEYRzYE8xH1LPCWk+qehSGRwa4F1vGPUGGTOabS7s2biNZ1YMJL0c+HOLBx1iuH1vK6E0q/MCT3UF3C2++31AajsJVJdY8CCcT5ZSiFl2PP7t6PDx1hHtobWDpkwq+RU57UwRiD9uqNfH1BEkLgkQqA8dxjqU0yPVI5QJKHW0KBvW2++WUPphFz+ccvAcFT1Jxrr+AQPnvIFv4Wfu93Iektt1THlQuTo86vrVnylqnOVDwjDeTamhAf6x6oUYIZLnkXa0M1u1TTlm0gC5V6iG7pz+xE+8TjbXJd6RfL7ksMJ+fv7ZBQAqN7DCwEnD4NYaBbAuOCAMcZuuconsN9P3O/RB2eHOvYYYCqBGjpAXqoKHa2ORUy5tfwg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(91956017)(2906002)(66476007)(66446008)(316002)(76116006)(55016002)(54906003)(6916009)(64756008)(186003)(6506007)(53546011)(66946007)(7696005)(26005)(66556008)(71200400001)(9686003)(33656002)(8676002)(966005)(478600001)(4326008)(52536014)(166002)(5660300002)(86362001)(19627405001)(8936002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 sHlY7TTN27MD1A7M01JbbNzabvJ/DB0ACtOdG2K0/BCuule4WoRvK1EssH89JHFjlqG67UAn9y5wDnFenJDGtZosKAOXAe79TyswdAEX/FUBDlDXQ6II9L9lhQXUbQUO6ZmiMvH1dbjJfrBGwBR9q062xCp3R8C0XI99uAFtflhZhUcMhQW/oszC4Dk4bm+RkbDkX6S/WmIzGn1HHBG0E8be3e/h5TxCQqlxVQb8jT8T6xrv4Pwgy2tD28pTj4CROIlKh9as0ldrL1jS8rg19L5X2gtmhJF4L/7bTdD+fsJaC9I5Jox0TJTlIscnAb28o2Kg2+l+dsBtqae5QipKcBWu4eSoiWlQ3tLBdHS8hFLMrVtDaD3gwEUq2dX4rMn8X47sUMCBtRr38fOIPsAF23R5G6/YZgzWZLzKCcXoqq52QUU6C5d0R6kh+OruSla62qVIpsZxQHCjB69sGFyb8v5d0DuvGTRwOynJ5QkmrFNvCbxZPx2x4e3g+dIy5DHNDbvFUqKWLaV+dRPXIK6V1LqvM/Ld1nzaQjNiDH7D1wkm8Zkh4EMjhG6IA8ClEIHSja/FoAtqwSmBjuP8RKnijWLxxVxbJUTA+scR4TZrDcVaaAfEHjsvlEap9dgekQ0DKdnLxxizzN4fJhSES1ZVFg==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2936
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2afc32ee-9076-49f7-9301-08d879a0c6a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pu8ZLBlIhsnhHKQEhMnCAAUK1oXFMHIC8vel40sEqSzgpRoJimOmSIueFg/NN2MLAqstedXMulUkD67ZDiGqbO2pVPnIVvHhF1t9UDq9PXOZhLTxWNLWd1u5OpfMOI6IT11FUZt6dQ2T9hepTjCYER9DG8bzGigLKsPerPQfAKYa8ba9MvV4g6LuX7RBqmmE8TNi8TqiU6cZQEv//N01H/MSwbubXy6bfOWfi8K+rZj7bm8klieJu1gwz0lhvw/78dD3T8OYJZsvKbFhR4zbpkqrxufL+z7chvJc9IVcaatPXDgv7V6D/y6aiDiVKTNASYd0PB6FiW5+Ttd9finyQ8I/mexAKdECWE+K+4YedfaMhkxcl29aa2vbA6bDG5mUZkeFy6vAP6yBrqoZ8jSO61AlFvQNDBEUiwg5+HN1Whne2PY5HyhagSiI8byaTQsNJ7EL4NFYR2+k3qZj4jXzGbhBIVKsquiij1K4oFGV0SM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(46966005)(356005)(26005)(70206006)(54906003)(316002)(5660300002)(86362001)(6506007)(53546011)(36906005)(70586007)(52536014)(7696005)(6862004)(4326008)(9686003)(55016002)(2906002)(81166007)(186003)(336012)(19627405001)(47076004)(82310400003)(166002)(8936002)(83380400001)(8676002)(33656002)(478600001)(82740400003)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2020 11:18:30.3268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45f0c2a-5aac-4346-cebc-08d879a0de53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5689
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB7PR08MB353190D4868440AC68092891FD190DB7PR08MB3531eurp_"

--_000_DB7PR08MB353190D4868440AC68092891FD190DB7PR08MB3531eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Great. Thanks Jon.
________________________________
From: Jon Mason <jdmason@kudzu.us>
Sent: 25 October 2020 15:01
To: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Lak=
shmi Kailasanathan <Lakshmi.Kailasanathan@arm.com>; Ross Burton <Ross.Burto=
n@arm.com>; nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test =
recipe for systems comms

On Wed, Oct 21, 2020 at 06:10:33PM +0100, Abdellatif El Khlifi wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>
> This commit provides a recipe that generates a Linux userspace
> application used for testing the communication between Corstone700 cores=
.
>
> Change-Id: I7c00653b0fcd6d9074510bbb70a838762aed0150
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../corstone700-test-app_1.0.bb               | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-test/corstone700-test-app/corst=
one700-test-app_1.0.bb
>
> diff --git a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-=
test-app_1.0.bb b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone70=
0-test-app_1.0.bb
> new file mode 100644
> index 0000000..d2bfb19
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-ap=
p_1.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "CORSTONE700 systems communications tests"
> +DESCRIPTION =3D "This is a Linux userspace tool to test the communicati=
on between Corstone700 cores"
> +HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/test-app=
s.git"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe=
988d9a0"
> +
> +SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/test-apps.g=
it;protocol=3Dhttps"
> +SRCREV =3D "ecd93a275d11cf08f670a97783110bd698250963"
> +PV .=3D "~git${SRCPV}"
> +
> +COMPATIBLE_MACHINE =3D "(corstone700)"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile() {
> +    ${CC} ${S}/test-app.c ${CFLAGS} ${LDFLAGS} -o ${S}/test-app
> +}
> +
> +do_install() {
> +    install -D -p -m 0755 ${S}/test-app ${D}${bindir}/test-app
> +}
> --
> 2.17.1
>

>
>=20
>


--_000_DB7PR08MB353190D4868440AC68092891FD190DB7PR08MB3531eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Great. Thanks Jon.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jon Mason &lt;jdmaso=
n@kudzu.us&gt;<br>
<b>Sent:</b> 25 October 2020 15:01<br>
<b>To:</b> Abdellatif El Khlifi &lt;Abdellatif.ElKhlifi@arm.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject=
.org&gt;; Lakshmi Kailasanathan &lt;Lakshmi.Kailasanathan@arm.com&gt;; Ross=
 Burton &lt;Ross.Burton@arm.com&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: addin=
g test recipe for systems comms</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">On Wed, Oct 21, 2020 at 06:10:33PM +0100, Abdella=
tif El Khlifi wrote:<br>
&gt; From: Abdellatif El Khlifi &lt;abdellatif.elkhlifi@arm.com&gt;<br>
&gt; <br>
&gt; This commit provides a recipe that generates a Linux userspace<br>
&gt; application used for testing the communication between Corstone700 co=
res.<br>
&gt; <br>
&gt; Change-Id: I7c00653b0fcd6d9074510bbb70a838762aed0150<br>
&gt; Signed-off-by: Abdellatif El Khlifi &lt;abdellatif.elkhlifi@arm.com&g=
t;<br>
<br>
Pulled into master.<br>
<br>
Thanks,<br>
Jon<br>
<br>
&gt; ---<br>
&gt;&nbsp; .../corstone700-test-app_1.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 21 +++++++++++++++++=
++<br>
&gt;&nbsp; 1 file changed, 21 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-test/corstone700-test-a=
pp/corstone700-test-app_1.0.bb<br>
&gt; <br>
&gt; diff --git a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone7=
00-test-app_1.0.bb b/meta-arm-bsp/recipes-test/corstone700-test-app/corston=
e700-test-app_1.0.bb<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d2bfb19<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test=
-app_1.0.bb<br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +SUMMARY =3D &quot;CORSTONE700 systems communications tests&quot;<br>
&gt; +DESCRIPTION =3D &quot;This is a Linux userspace tool to test the com=
munication between Corstone700 cores&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://git.linaro.org/landing-teams/w=
orking/arm/test-apps.git">https://git.linaro.org/landing-teams/working/arm/=
test-apps.git</a>&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://license.md;md5=3De44b25=
31cd6ffe9dece394dbe988d9a0">file://license.md;md5=3De44b2531cd6ffe9dece394d=
be988d9a0</a>&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://git.linaro.org/landing-teams/working/arm/tes=
t-apps.git;protocol=3Dhttps&quot;<br>
&gt; +SRCREV =3D &quot;ecd93a275d11cf08f670a97783110bd698250963&quot;<br>
&gt; +PV .=3D &quot;~git${SRCPV}&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_MACHINE =3D &quot;(corstone700)&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +do_compile() {<br>
&gt; +&nbsp;&nbsp;&nbsp; ${CC} ${S}/test-app.c ${CFLAGS} ${LDFLAGS} -o ${S=
}/test-app<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +&nbsp;&nbsp;&nbsp; install -D -p -m 0755 ${S}/test-app ${D}${bindir}=
/test-app<br>
&gt; +}<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB7PR08MB353190D4868440AC68092891FD190DB7PR08MB3531eurp_--
