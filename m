Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.51])
 by mx.groups.io with SMTP id smtpd.web10.10455.1591890351951254199
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 08:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Z9jfbncs;
 spf=pass (domain: arm.com, ip: 40.107.1.51, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHx5osLi2ox/uxMz3YwDWWRqaRO3YjET3WTGIRr4KR0=;
 b=Z9jfbncszuCiH84qHd1pAX5uHfJDiGRhp44GRbS2lRpHqL74ERjlX1F3HvX37+Ui/CbUdSPnci4qxM5ubGTQG1OLjFgyqoueLJaZyCrSaNA3fujONilousXUzr0B5Z9NJF74JcmRwgTlzO2bwn2/1ziGyuIOZ0zU4lGBibjJB2g=
Received: from DB6PR07CA0163.eurprd07.prod.outlook.com (2603:10a6:6:43::17) by
 VI1PR08MB3469.eurprd08.prod.outlook.com (2603:10a6:803:8a::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.23; Thu, 11 Jun 2020 15:45:48 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::e4) by DB6PR07CA0163.outlook.office365.com
 (2603:10a6:6:43::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.7 via Frontend
 Transport; Thu, 11 Jun 2020 15:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 15:45:48 +0000
Received: ("Tessian outbound 8bb15bb571b3:v59"); Thu, 11 Jun 2020 15:45:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6dbc344aa1f8a25
X-CR-MTA-TID: 64aa7808
Received: from 722ac7e9bec3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1FB79BA4-8C28-4E14-8ACE-190937FF253A.1;
	Thu, 11 Jun 2020 15:45:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 722ac7e9bec3.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jun 2020 15:45:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyUk7vvK3FoNo42JBcOSyDLmHKf5ekkrCr2K2qhqe+Or3HcicNKpbqFLMqrK5z8DMuZ7FH3IIly3twp8booSNuWQH7Pzck7yNahGlL+BpIFbzL3h6wYPkNZeUteL/L9uLCqTl8zaaVxSmDjV4hkfs3m820gScH2H/g4PFl3jtxUbD1QtWOtM1SjHiJRuKdmpr/kNQauJhZ9A9l82r/+lMjkyLdl4mw2chKkP+yDhrlHrVAyfApynpT2KCBlisZkv5UQT+AUmmhnc2xJlCYPm91Ch4EFEksplE4Hwm6AUDSv4IL0dBLMQmpIqGDcdgd5efMLS14flamyAWwscoD7kYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHx5osLi2ox/uxMz3YwDWWRqaRO3YjET3WTGIRr4KR0=;
 b=VyfaK/qxaMJOmXIcyZeGh+sK8o1+9+HzW6JZv1LCJGIB53YQSjv4fMbhPeWAt3KT1EO31HTnnJOY6BPGACMI5xN0UPzmPF6+YCzdPT9cSfxg6723WNsYlEdwEvN4NMgYN3H1WPLoLfGrKnbMnK9hpZycdNIi7dcdiOeacs0ERdTcso9WxqTJlc4RtlHmE63GTbIiAtPDIIao+UiLI4EUtvt8OkXOJeRQIjxrvjNXMFNlqlfM1FZ08vrFmHmfiNOJX0OxI4poZEytV+sxUZoK6iOKprimvXLwhi2UuKeZD57rf4w/olbFWHtEv9jNxceADRGU6ZkKOmuBqPQc7+ST7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHx5osLi2ox/uxMz3YwDWWRqaRO3YjET3WTGIRr4KR0=;
 b=Z9jfbncszuCiH84qHd1pAX5uHfJDiGRhp44GRbS2lRpHqL74ERjlX1F3HvX37+Ui/CbUdSPnci4qxM5ubGTQG1OLjFgyqoueLJaZyCrSaNA3fujONilousXUzr0B5Z9NJF74JcmRwgTlzO2bwn2/1ziGyuIOZ0zU4lGBibjJB2g=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5145.eurprd08.prod.outlook.com (2603:10a6:10:eb::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 15:45:41 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3088.022; Thu, 11 Jun 2020
 15:45:41 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: "jdmason@kudzu.us" <jdmason@kudzu.us>, Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp: Build UEFI EDK2 firmware for N1SDP
Thread-Topic: [meta-arm] [PATCH] arm-bsp: Build UEFI EDK2 firmware for N1SDP
Thread-Index: AQHWP0FtYeTkTkQf3EOeNvA582rjnajTVxMAgAAciICAABxZrQ==
Date: Thu, 11 Jun 2020 15:45:41 +0000
Message-ID: 
 <DB8PR08MB4969AF25491FD3664A8CDF1DFA800@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: <20200610160841.9949-1-khasim.mohammed@arm.com>
 <3097.1591878072867663797@lists.yoctoproject.org>,<20200611140319.GC17598@kudzu.us>
In-Reply-To: <20200611140319.GC17598@kudzu.us>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [223.186.138.81]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed5afb12-2c04-444d-89ac-08d80e1e831a
x-ms-traffictypediagnostic: DB8PR08MB5145:|VI1PR08MB3469:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3469CB63010D06413BF60217FA800@VI1PR08MB3469.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:374;OLM:8882;
x-forefront-prvs: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HPb8cq2LGxgEQek2HeSDu8qUrMRMFQ2D0lLVTnZaGID+RZzt6arpPgZ/w4nifKY2/FCVceRf8bxqq5mly8EKhkN+UKUf2+/sFm0+2lDlm1dQv3p1Tg1y/fxhh/eSPId3rLAhhd+tgiPLx/bC0MKbZ6INIz8gyARawX3tu4nE3MfqEJV08p0ICaz5eIXaNufwo6q6h3iE5rFOZ16StfYIWpgvr6YE/lbicxTbQfcHLGLYBN6TkBewnFN0CahnepedtySyoiWvd1N6+VCLywRMgpJrFHnhauBJ4Jb45eXDk4icBICD+SrnJqN7Yx9QiIZCcKv7wFGDGQiIXoeL97wgD/8p0iqcCN/WsGLKQ9mvKt0eh20xb28HiG5mA33HD+2pCNAVKrj0UvSOB/iMZoonWA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(55016002)(26005)(71200400001)(2906002)(9686003)(186003)(7696005)(53546011)(33656002)(6506007)(86362001)(66476007)(5660300002)(110136005)(66556008)(6636002)(66946007)(83380400001)(8676002)(64756008)(478600001)(91956017)(4326008)(66446008)(76116006)(8936002)(316002)(52536014)(32563001)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 +6XlrA3dZ1oftPanv6rf0yCrpt/pktnf3kEm0YB8a4jhMbkcyOHhI1bm2Z+YVg88kCh2W6ypZj9Tnpq2nkCDfSqhrRYP1mJlZkRXpLmrWtnxsVVQXRokw8wWoSUUZe55A4Q/v+JykNViknpE7geAeVp3CB0JpsewIGSu+LdmneMAmfkyav+GeOeNe2lQreAt6rchu2twJLWmCC4oOZtDkNdRvFrCB18ygLx/wBrnm1c9YpKBmsLy4ZVtf8Q7AYSx9FpVg/YIZ+7Vb3r6Gbd2ps7Q41Ke/OScxQnMXirz3IKymWS5Xdrr5OdpDPTmlauM2ZoZ8pSvPm+DpN3EdzBsBhIXaK36gwiFJnzVFSdgBMPHvrevspy2U5XM3JvT2tYZY7jDL/4P9Dj1mk4+I6N5NcXe8ZRi92WbU9zezA20pknUCE+ZZMzHCe31yB2+32HeuB8T5wWAD++lva2fMvv5cAMoJ4IgHZg2FaW4Ga5H+No=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5145
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(86362001)(6506007)(316002)(53546011)(478600001)(2906002)(336012)(6636002)(82310400002)(110136005)(4326008)(47076004)(82740400003)(26005)(9686003)(8676002)(81166007)(70586007)(52536014)(5660300002)(33656002)(356005)(55016002)(186003)(7696005)(70206006)(8936002)(83380400001)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1e80246b-93bf-4a57-692c-08d80e1e7eff
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oEF74RdKVDmSOnhlUFTmpYvkJoASuhZr5rmn8iALDe3f8/R3YgQ4TIcl85bGSWVRANFyODDPgUbZkZXg2EhNU2SpDN+FsPzTIodzJL7jcmhwBmbTQJzpzCKZQh+Z48BY1Lr5pBcCbwrXpWH99wFChwxVT80oSuYYAIjIHJvCtm1ky+Zm/ZWbFp13qn2QMjsXsKInu1KZ2KRK98gKEjVwu6fsEjGulImJ07DKh0jLqHOBAXfoT6k4+o5Ks1etJrdJIHntnWSpPP85WU+TQCz2a0mPEB00oHYJ35OFzsWWeDI4aLCHLxQL7pP0wQFDJ3Bd35zgkwIe6cvBQREG7rFPxY1uZzrNIdK224YdVUdEL9DGKFSBF70f4F9ILTvvDvOTAb919GHphctK5iwPPm5Scwr4JXh53k6lSWFZNEYdznpffXaLn+ipi/e8vcXXAI3Y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 15:45:48.4207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5afb12-2c04-444d-89ac-08d80e1e831a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3469
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB8PR08MB4969AF25491FD3664A8CDF1DFA800DB8PR08MB4969eurp_"

--_000_DB8PR08MB4969AF25491FD3664A8CDF1DFA800DB8PR08MB4969eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi Jon

Please apply this patch to dunfell branch as well.

Thanks

Regards
Khasim

________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Jon Mason via lists.yoctoproject.org <jdmason=3Dkudzu.us@lists.yo=
ctoproject.org>
Sent: Thursday, 11 June 2020, 7:34 pm
To: Diego Sueiro
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp: Build UEFI EDK2 firmware for N1SDP

On Thu, Jun 11, 2020 at 05:21:12AM -0700, Diego Sueiro wrote:
> On Wed, Jun 10, 2020 at 05:09 PM, Khasim Mohammed wrote:
>
> >
> > - Add bbappend recipe to configure N1SDP specifics
> > - Enable UEFI EDK2 firmware build for N1SDP.
> > - Update machine conf to add dependency
> >   for EDK2 firmware components
> >
> > Change-Id: I89d41c176f31bce6f1df7f3b3a7cd624b46c05e1
> > Issue-Id: PLATFORMS-3134
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
>
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Applied to the master branch.

Thanks,
Jon

>
> > ---
> >  meta-arm-bsp/conf/machine/n1sdp.conf          |  3 +++
> >  .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  | 19 +++++++++++++++++++
> >  .../uefi/edk2-firmware_git.bbappend           |  7 +++++++
> >  3 files changed, 29 insertions(+)
> >  create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.i=
nc
> >  create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bba=
ppend
> >
> > diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf
> > b/meta-arm-bsp/conf/machine/n1sdp.conf
> > index 133fb89..20eaf27 100644
> > --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> > +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> > @@ -27,3 +27,6 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D
> > "trusted-firmware-a"
> >  PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
> >
> >  EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
> > +
> > +#UEFI EDK2 firmware
> > +EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
> > diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > new file mode 100644
> > index 0000000..c8fc70a
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > @@ -0,0 +1,19 @@
> > +SRC_URI =3D "\
> > +
> > git://git.linaro.org/landing-teams/working/arm/edk2.git;name=3Dedk2;des=
tsuffix=3D${S}/edk2;nobranch=3D1
> > \
> > +
> > git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=
=3Dedk2-platforms;destsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1
> > \
> > +"
> > +
> > +# TAGS and commit ID as per N1SDP-2020.03.26 release
> > +SRCREV_edk2           =3D "3ff8a6bffabad761279817252014d59b6069d68a"
> > +SRCREV_edk2-platforms =3D "b6bfc4417ff13168d69c4cbf2338f62c89c82dfd"
> > +
> > +# N1SDP specific EDK2 configurations
> > +EDK2_BUILD_RELEASE =3D "0"
> > +EDK2_PLATFORM      =3D "n1sdp"
> > +EDK2_PLATFORM_DSC  =3D "N1SdpPkg/N1SdpPlatform.dsc"
> > +EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
> > +EDK2_ARCH          =3D "AARCH64"
> > +
> > +COMPATIBLE_MACHINE =3D "n1sdp"
> > +
> > +PV ?=3D "201908+git${SRCPV}"
> > diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> > b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> > new file mode 100644
> > index 0000000..dfebd87
> > --- /dev/null
> > +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> > @@ -0,0 +1,7 @@
> > +# Include machine specific configurations for UEFI EDK2
> > +
> > +MACHINE_EDK2_REQUIRE ?=3D ""
> > +
> > +MACHINE_EDK2_REQUIRE_n1sdp =3D "edk2-firmware-n1sdp.inc"
> > +
> > +require ${MACHINE_EDK2_REQUIRE}
> > --
> > 2.17.1
> >
> >

>


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_DB8PR08MB4969AF25491FD3664A8CDF1DFA800DB8PR08MB4969eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
"><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto" style=3D"text-align: l=
eft;">
<div dir=3D"auto" style=3D"text-align: left;">Hi Jon</div>
<div dir=3D"auto" style=3D"text-align: left;"><br>
</div>
<div dir=3D"auto" style=3D"text-align: left;">Please apply this patch to du=
nfell branch as well.</div>
<div dir=3D"auto" style=3D"text-align: left;"><br>
</div>
<div dir=3D"auto" style=3D"text-align: left;">Thanks</div>
<div dir=3D"auto" style=3D"text-align: left;"><br>
</div>
<div dir=3D"auto" style=3D"text-align: left;">Regards&nbsp;</div>
<div dir=3D"auto" style=3D"text-align: left;">Khasim</div>
</div>
<div id=3D"id-889ea5ef-ca7f-4fb2-b20d-01d7efb6bbf8" class=3D"ms-outlook-mob=
ile-reference-message">
<div style=3D"font-family: sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;"><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg"><strong>From:</strong> meta-arm@lists.yoctoprojec=
t.org &lt;meta-arm@lists.yoctoproject.org&gt; on behalf of Jon Mason via li=
sts.yoctoproject.org &lt;jdmason=3Dkudzu.us@lists.yoctoproject.org&gt;<br>
<strong>Sent:</strong> Thursday, 11 June 2020, 7:34 pm<br>
<strong>To:</strong> Diego Sueiro<br>
<strong>Cc:</strong> meta-arm@lists.yoctoproject.org<br>
<strong>Subject:</strong> Re: [meta-arm] [PATCH] arm-bsp: Build UEFI EDK2 f=
irmware for N1SDP<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style><font size=3D"=
2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">On Thu, Jun 11, 2020 at 05:21:12AM -0700, Diego Su=
eiro wrote:<br>
&gt; On Wed, Jun 10, 2020 at 05:09 PM, Khasim Mohammed wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; - Add bbappend recipe to configure N1SDP specifics<br>
&gt; &gt; - Enable UEFI EDK2 firmware build for N1SDP.<br>
&gt; &gt; - Update machine conf to add dependency<br>
&gt; &gt;&nbsp;&nbsp; for EDK2 firmware components<br>
&gt; &gt; <br>
&gt; &gt; Change-Id: I89d41c176f31bce6f1df7f3b3a7cd624b46c05e1<br>
&gt; &gt; Issue-Id: PLATFORMS-3134<br>
&gt; &gt; Signed-off-by: Khasim Syed Mohammed &lt;khasim.mohammed@arm.com&g=
t;<br>
&gt; <br>
&gt; Reviewed-by: Diego Sueiro &lt;diego.sueiro@arm.com&gt;<br>
<br>
Applied to the master branch.<br>
<br>
Thanks,<br>
Jon<br>
<br>
&gt; <br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta-arm-bsp/conf/machine/n1sdp.conf&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;&#43;&#43;<br>
&gt; &gt;&nbsp; .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc&nbsp; | 19 &#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; .../uefi/edk2-firmware_git.bbappend&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 7 &#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;<br>
&gt; &gt;&nbsp; 3 files changed, 29 insertions(&#43;)<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmw=
are-n1sdp.inc<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmw=
are_git.bbappend<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf<br>
&gt; &gt; b/meta-arm-bsp/conf/machine/n1sdp.conf<br>
&gt; &gt; index 133fb89..20eaf27 100644<br>
&gt; &gt; --- a/meta-arm-bsp/conf/machine/n1sdp.conf<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arm-bsp/conf/machine/n1sdp.conf<br>
&gt; &gt; @@ -27,3 &#43;27,6 @@ PREFERRED_PROVIDER_virtual/trusted-firmware=
-a ?=3D<br>
&gt; &gt; &quot;trusted-firmware-a&quot;<br>
&gt; &gt;&nbsp; PREFERRED_VERSION_trusted-firmware-a ?=3D &quot;2.2%&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;&nbsp; EXTRA_IMAGEDEPENDS &#43;=3D &quot;virtual/trusted-firmware-=
a&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;#UEFI EDK2 firmware<br>
&gt; &gt; &#43;EXTRA_IMAGEDEPENDS &#43;=3D &quot;virtual/uefi-firmware&quot=
;<br>
&gt; &gt; diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.in=
c<br>
&gt; &gt; b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..c8fc70a<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1s=
dp.inc<br>
&gt; &gt; @@ -0,0 &#43;1,19 @@<br>
&gt; &gt; &#43;SRC_URI =3D &quot;\<br>
&gt; &gt; &#43;&nbsp;&nbsp; <br>
&gt; &gt; git://git.linaro.org/landing-teams/working/arm/edk2.git;name=3Ded=
k2;destsuffix=3D${S}/edk2;nobranch=3D1<br>
&gt; &gt; \<br>
&gt; &gt; &#43;&nbsp;&nbsp; <br>
&gt; &gt; git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git=
;name=3Dedk2-platforms;destsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1<b=
r>
&gt; &gt; \<br>
&gt; &gt; &#43;&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;# TAGS and commit ID as per N1SDP-2020.03.26 release<br>
&gt; &gt; &#43;SRCREV_edk2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D &quot;3ff8a6bffabad761279817252014d59b6069d68a&quot;<br>
&gt; &gt; &#43;SRCREV_edk2-platforms =3D &quot;b6bfc4417ff13168d69c4cbf2338=
f62c89c82dfd&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;# N1SDP specific EDK2 configurations<br>
&gt; &gt; &#43;EDK2_BUILD_RELEASE =3D &quot;0&quot;<br>
&gt; &gt; &#43;EDK2_PLATFORM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;n1sdp&=
quot;<br>
&gt; &gt; &#43;EDK2_PLATFORM_DSC&nbsp; =3D &quot;N1SdpPkg/N1SdpPlatform.dsc=
&quot;<br>
&gt; &gt; &#43;EDK2_BIN_NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;BL33_A=
P_UEFI.fd&quot;<br>
&gt; &gt; &#43;EDK2_ARCH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =3D &quot;AARCH64&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;COMPATIBLE_MACHINE =3D &quot;n1sdp&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;PV ?=3D &quot;201908&#43;git${SRCPV}&quot;<br>
&gt; &gt; diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbap=
pend<br>
&gt; &gt; b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..dfebd87<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git=
.bbappend<br>
&gt; &gt; @@ -0,0 &#43;1,7 @@<br>
&gt; &gt; &#43;# Include machine specific configurations for UEFI EDK2<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;MACHINE_EDK2_REQUIRE ?=3D &quot;&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;MACHINE_EDK2_REQUIRE_n1sdp =3D &quot;edk2-firmware-n1sdp.inc=
&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;require ${MACHINE_EDK2_REQUIRE}<br>
&gt; &gt; -- <br>
&gt; &gt; 2.17.1<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
&gt; <br>
<br>
</div>
</span></font><br>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DB8PR08MB4969AF25491FD3664A8CDF1DFA800DB8PR08MB4969eurp_--
