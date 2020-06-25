Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.87])
 by mx.groups.io with SMTP id smtpd.web11.666.1593104476703938719
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Jun 2020 10:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ThFgzp+1;
 spf=pass (domain: arm.com, ip: 40.107.1.87, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuwFyeu4Riz9ycHgFq8q4Fh79+Itg0aMSAj1RGx6GD4=;
 b=ThFgzp+1/LDalLMvHXmuYVO0j9L3IJcTUeumvT71IzDFS7bUVVb0/SXlLZSYvz9fbIX062ujenecX+ctwkAh5Jal4pmp3yOtxStHFB+vwMxgIZGll6CCoXndcoHcCiPKYb6/erarFMNjHvh5+frQCkHRkToJOojusl/NVlQqXj4=
Received: from AM5PR0701CA0002.eurprd07.prod.outlook.com
 (2603:10a6:203:51::12) by HE1PR08MB2668.eurprd08.prod.outlook.com
 (2603:10a6:7:2b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Thu, 25 Jun
 2020 17:01:05 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::d2) by AM5PR0701CA0002.outlook.office365.com
 (2603:10a6:203:51::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.10 via Frontend
 Transport; Thu, 25 Jun 2020 17:01:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 17:01:05 +0000
Received: ("Tessian outbound 2ba684f51d22:v59"); Thu, 25 Jun 2020 17:01:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25674f0eb9417460
X-CR-MTA-TID: 64aa7808
Received: from f69dcb8fc612.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A3D1940D-84B7-4D04-A7A1-217608DE3E5C.1;
	Thu, 25 Jun 2020 17:00:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f69dcb8fc612.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Jun 2020 17:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Va99Q1jcmYBm4CZgJz6kzZdgf68Qmc6B9uSRX22s0LBPeKRCFWBKZVIdlz8/LHEbUHnCF0Bo68v4W+dlRDxWgEK4f2OMioBXqJKjvvCeMmu0+jxbhAdLKWKUByH2qFuxg+4HkdwbGAyzQtkqFdeZ3cfvBpZYdue1T6MEaxYXeyZBsmsgHcAozAuIY6EUfRe2Mm/D+H4BNn95tuaCAebCUeOoE1nY+jUoI0hDVyRIhF5sYvbXBEXMQvHlMYcEoYntEk/N8aV1wu+74VsxSqpHBYUmnnUPlLQW4vikiiXUhDmn0hctwNRkt1QvrJ/4xvkdFH7PzDI/NMlggPxalqtv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuwFyeu4Riz9ycHgFq8q4Fh79+Itg0aMSAj1RGx6GD4=;
 b=Rr010+6fSQREv9pIU5MdsD4n02rmsM2/56NcZUCgU/2hO/KPi2ZPxHD9bk2JOTS7YlYMEscLynRQ7uQGUnmYGFO4HjsVs+kkBNpHWQDx6+UFcd4Zqfq5uJr4TfZk/vyT8F2s9u0FptCtOnnT98IrnWuWkdjNMMbXH0kv9QECKM1AfeTghe9lNGw+q4ynZ+VR87pelUXZnEl5Bqj4WWBE788DC+5ZWhRiso3Zwgf8WTEQNkWeMimyWRuHyejgEkpXjjQV+xqK2+I729RT0mQAzh4TjFc4S+9DjhMedd2E9lMMtXFmqE2arKOF6D+eK/YKAqOTn0OGDaSkcF6LQZYDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuwFyeu4Riz9ycHgFq8q4Fh79+Itg0aMSAj1RGx6GD4=;
 b=ThFgzp+1/LDalLMvHXmuYVO0j9L3IJcTUeumvT71IzDFS7bUVVb0/SXlLZSYvz9fbIX062ujenecX+ctwkAh5Jal4pmp3yOtxStHFB+vwMxgIZGll6CCoXndcoHcCiPKYb6/erarFMNjHvh5+frQCkHRkToJOojusl/NVlQqXj4=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB6PR08MB2904.eurprd08.prod.outlook.com (2603:10a6:6:1e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Thu, 25 Jun
 2020 17:00:57 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3131.020; Thu, 25 Jun 2020
 17:00:57 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: Diego Sueiro <Diego.Sueiro@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
Thread-Topic: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log
 level to INFO or WARN
Thread-Index: 
 AQHWSJ/qB26ubep570y+Rgv13IMSF6jlyCuAgAJUbwCAAALucYAAi8aAgAAKEpGAANaBAIAABuJo
Date: Thu, 25 Jun 2020 17:00:57 +0000
Message-ID: 
 <DB8PR08MB4969B610175CA73EAF11A0F4FA920@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: <20200622141735.4951-1-khasim.mohammed@arm.com>
 <31688.1592895943168936989@lists.yoctoproject.org>
 <20200624184026.GC5282@kudzu.us>
 <DB8PR08MB49699B2CDA2A7AD1225E3A4FFA950@DB8PR08MB4969.eurprd08.prod.outlook.com>
 <20200625031111.GA17463@kudzu.us>
 <DB8PR08MB49699E16AF27A92EECAD5766FA920@DB8PR08MB4969.eurprd08.prod.outlook.com>,<20200625163457.GA27139@kudzu.us>
In-Reply-To: <20200625163457.GA27139@kudzu.us>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 598da748-1a2d-4290-ade4-08d819295916
x-ms-traffictypediagnostic: DB6PR08MB2904:|HE1PR08MB2668:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB266893D2D276A13010AC108AFA920@HE1PR08MB2668.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 m5Mx1ClJu4DcTHkSQ4unXE44t08Hr+xS/MiqQC+v+MyZOjbPcSkj5cK5mvTbufQufxjplO0br1MaRoY0khsVV+YngIpY0C7ZN3qrWs9JSrpws7yEtANWPZKCfuHUb3Cpt4ObCdSaAePCM4mGn7y9YxX2mnGgL1DuAB0gIbclTCj0dmUtqdhxAfywEIPMOhI27x6C1hlr2HZamCAN0nMAKb/URnQQ1APbxLs0zIycNe+oZHzNmBFxGy/tNBqdKVsGXkI+zazA31wcPno0VJ4fYYEIiyMDL+xNmdfBiC5ZYUv6mZXfhVNMMGKBSNH1I072dv93btCNPyIOjYcsyMeXilRWtoYKNpyE5pLyVfMLZYhzcCe6+BsTzM7m9DnBk6TSxKd+pMDDOwsjl7wwK5ijEjBVW9DArRd9ZekKC+CIpHJ8Mq/P/ZmaQso6devEHoxBVniw7dV+XjlLRL+7G3rPn5TQlg4F4Mtqd/9HwKof4Yk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(966005)(9686003)(83380400001)(55016002)(6506007)(2906002)(4326008)(33656002)(186003)(26005)(53546011)(7696005)(5660300002)(86362001)(64756008)(66446008)(71200400001)(54906003)(6916009)(316002)(66476007)(66556008)(76116006)(66946007)(52536014)(8936002)(478600001)(91956017)(8676002)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 O1RRBrZbjIa0GWsFHMBaGa1366U+JJXLGi3zhxJ0zgZ1JCTQ52QIJy2nSoiG6exExY/maBqB8xbJHM42yQ5tFug0vHZlKDwdWfyK8wENLQVBn8thJ31j80nIIiovutzeKgUzmsWY7JCAEcoe8IAgTmUTf+btcHotDYfIF4aqZg3aArzBwwYbldBA3NU0Lkj1bnr8QfNZa56d+PrtsOnqmLJZH5FYk9A2vVuCFfKsAUuWCWwK+yBowd1xK1vNpeUiTc1RQgEYIzdOsMMN+adPMfZZbwlVHdMscKwsYWLW8HSR7W/I0vTqfzd+NovZu2LAvtpKmBQjivlxnkN/aYuadiEMtu1yDUMXMisR/hx9e88DbK6fqCXnZkREpG0eI1+Pf+5VNNaEs0LrCx/qQXp6T9GWYUNJJXikHmhAZT91lZf6gM7HYzJxkmjS/L3Jyv0qnysKbioLZVAhNTJv4YoXrCgALQ0KnjG+EZ/xUDhyEfe2MKjZIdQH+nIKWs43dKRP
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2904
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(83380400001)(5660300002)(55016002)(6506007)(53546011)(54906003)(316002)(7696005)(36906005)(26005)(52536014)(2906002)(33656002)(186003)(82740400003)(86362001)(336012)(70586007)(4326008)(9686003)(47076004)(70206006)(8936002)(82310400002)(8676002)(966005)(356005)(478600001)(6862004)(81166007)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f8d84fcd-f519-410d-f1e0-08d8192954ae
X-Forefront-PRVS: 0445A82F82
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OOsVVohhkCbU1CrzencVc3AhNKy6cvEx5B36X3TXUrmgbR/xP4L6Rd9Fn/g4V0JZ8coeZRyRyPwkLspecjgCSt07wGA1UkliFxtX6SHZ3yNxE+ga6a/EnpZ8yuzPJyCHSttu3z2St2QRW7BlBbelpqMXup+Ju3G4nj0/8kv6yRuaNtRLOV2QM23ABfAI1H0UrxifdvBz4kjYEP2gR0EmQiRdp1Wvn+7st62tgkb/tb7yOqOdlhB4lQzeDIGebaVYM9aNsrMwieqQHefOxECAU0WI6fCGpsT5+tpiEaOTAM6+5uVVBOxHFTXvohjWC5KzTNH+S0A1TN9YZIsJ1fSVv+p3PmFSI79L6T3U13Of20b6BCZLlIE90YLb9i2jlvJE8IAIdTJlqlVoKbp6Uk3zwXa6CHrsJgGpH/HFSODopOvuicRRWcmJpSLMQgMKddEw8vHNPb7+vaAcHz7LgOJVojPHmPcsRfCEla1CJJGLUDxVAutVIkMduo2Rx7sRipvR4llfepe+XFo9Gv11rLNmQw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 17:01:05.0807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 598da748-1a2d-4290-ade4-08d819295916
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2668
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Ack'ed ,

________________________________________
From: Jon Mason <jdmason@kudzu.us>
Sent: Thursday, June 25, 2020 10:04 PM
To: Khasim Mohammed
Cc: Diego Sueiro; meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp lo=
g level to INFO or WARN

On Thu, Jun 25, 2020 at 03:51:53AM +0000, Khasim Mohammed wrote:
> Hi Jon,
>
> <reply inline>
> ________________________________________
> From: Jon Mason <jdmason@kudzu.us>
> Sent: Thursday, June 25, 2020 8:41 AM
> To: Khasim Mohammed
> Cc: Diego Sueiro; meta-arm@lists.yoctoproject.org
> Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp =
log level to INFO or WARN
>
> On Wed, Jun 24, 2020 at 06:52:05PM +0000, Khasim Mohammed wrote:
> > Hi Jon,
> >
> > ________________________________________
> > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>=
 on behalf of Jon Mason via lists.yoctoproject.org <jdmason=3Dkudzu.us@list=
s.yoctoproject.org>
> > Sent: Thursday, June 25, 2020 12:10 AM
> > To: Diego Sueiro
> > Cc: meta-arm@lists.yoctoproject.org
> > Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting sc=
p log level to INFO or WARN
> >
> > On Tue, Jun 23, 2020 at 12:05:43AM -0700, Diego Sueiro wrote:
> > > On Mon, Jun 22, 2020 at 03:18 PM, Khasim Mohammed wrote:
> > >
> > > >
> > > > SCP code has been updated with new logging framework. The patch
> > > > is to allow setting of log level parameter to INFO or WARN.
> > > >
> > > > Change-Id: I20ec19a9aa1bdb7f59c067d2344c299c057a088b
> > > > Issue-Id: PLATFORMS-3134
> > > > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> > >
> > > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> >
> > > Pulled into master.
> >
> > Can you please apply these three patches to dunfell branch as well ?
> >
> > https://lists.yoctoproject.org/g/meta-arm/topic/patch_2_2/75039153?p=3D=
,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039153
> > https://lists.yoctoproject.org/g/meta-arm/topic/patch_1_2_arm_scp_firmw=
are/75039137?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039137
> > https://lists.yoctoproject.org/g/meta-arm/topic/patch_arm_fiptool/75039=
113?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039113
>
> > Looks like there is a problem on dunfell.  When compiling for n1sdp, I
> > get the following error:
>
> >ERROR: Nothing PROVIDES 'virtual/arm-none-eabi-gcc-native' (but /home/jd=
m/yocto/meta-arm/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb DEPE=
NDS on or otherwise requires it). Close matches:
> >  virtual/mesa-native
> >ERROR: Required build target 'core-image-sato' has no buildable provider=
s.
> > Missing or unbuildable dependency chain was: ['core-image-sato', 'virtu=
al/control-processor-firmware', 'virtual/arm-none-eabi-gcc-native']
>
> > Can you confirm it compiles for you?
>
> You seem to have missed pushing your gcc patches to dunfell branch :
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolch=
ain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-maj=
or.bb?id=3Df9ece576ad476e6ed069dfdfc376eb422c1c511c
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolch=
ain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-maj=
or.bb?id=3D04eb583c4be5e7c36d457eb2d0dec35fef89ae52
>
> Can you please push these to dunfell as well ?

> Exclusively the above doesn't apply cleanly.  I think we need the
> following:


commit 9af4348fa0b83b2f5b318692c745716de5de0545 (HEAD)
Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 5 18:57:10 2020 -0400

    gcc-x86host.inc: properly link triplet-prefixed binaries

    Use the correct path for the binaries in ${datadir}, otherwise it resul=
ts in a
    single incorrect symlink like gcc-arm-none-eabi-*

    Signed-off-by: Denys Dmytriyenko <denys@ti.com>
    Signed-off-by: Jon Mason <jon.mason@arm.com>

commit d5bc2633f2c203aebf372fc80f7cb87d7621bed9
Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 5 18:57:09 2020 -0400

    gcc-aarch64-none-elf: properly set ${S} that is different from default

    Also use ${BINNAME} and ${PV} variables for automatic substitution.

    Signed-off-by: Denys Dmytriyenko <denys@ti.com>
    Signed-off-by: Jon Mason <jon.mason@arm.com>

commit dfafcf9ec274330ad8ae5d602e208ac35aba4139
Author: Jon Mason <jdmason@kudzu.us>
Date:   Thu May 28 09:33:17 2020 -0400

    arm-toolchain: merge binary toolchain recipes

    Merge the majority of the binary toolchain recipes for building on an
    x86 host into a common include file.

    Also, found and fixed an error with both install commands where the nam=
e
    was double nested on the copy.  For example,
    /usr/share/arm-none-eabi/arm-none-eabi/ due to the way it was being
    copied.

    Signed-off-by: Jon Mason <jdmason@kudzu.us>
    Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

commit 24181d47084cef34a794dfd88056fa9bc5583913
Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed May 20 04:47:18 2020 -0400

    arm-toolchain: gcc-aarch64-none-elf: Add recipe

    Adds a recipe to pull down the prebuilt GCC for compiling bare-metal ta=
rgets
    for Aarch64 processors from ARM.

    Signed-off-by: Denys Dmytriyenko <denys@ti.com>
    Signed-off-by: Jon Mason <jon.mason@arm.com>

commit e6ff4eb1d6683e967e4ef81bf5b42a087a47f6d5
Author: Jon Mason <jdmason@kudzu.us>
Date:   Thu May 14 21:36:20 2020 -0400

    arm-toolchain: gcc-arm-none-eabi-native: Add recipe

    Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
    and Cortex-M processors from ARM. This toolchain is required to build
    Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
    some firmware for the M0 coprocessor.

    This was originally taken from meta-rockchip, but has been modified fro=
m
    mailing list feedback.

    Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
    Signed-off-by: Jon Mason <jdmason@kudzu.us>
    Signed-off-by: Denys Dmytriyenko <denys@ti.com>
    Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
    Signed-off-by: Jon Mason <jon.mason@arm.com>


> Please ack and I'll pull all 5 into dunfell.

Please consider these patches for dunfell branch.

Thanks,
Jon

Regards,
Khasim

>
> Regards,
> Khasim
>
> >
> >
> > Thanks
> >
> > Khasim
> >
> > > Thanks,
> > > Jon
> >
> > >
> > > > ---
> > > >  meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc    | 2 ++
> > > >  meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 2 +-
> > > >  2 files changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > > index 1873848..2db59d3 100644
> > > > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > > @@ -6,6 +6,7 @@ SCP_BUILD_RELEASE   ?=3D "1"
> > > >  SCP_COMPILE_VERBOSE ?=3D "0"
> > > >  SCP_PLATFORM        ?=3D "invalid"
> > > >  SCP_COMPILER        ?=3D "arm-none-eabi"
> > > > +SCP_LOG_LEVEL       ?=3D "WARN"
> > > >
> > > >  DEPENDS +=3D "virtual/arm-none-eabi-gcc-native"
> > > >
> > > > @@ -39,6 +40,7 @@ EXTRA_OEMAKE =3D "${SCP_COMP_STR} \
> > > >                  BUILD_PATH=3D'${B}' \
> > > >                  PRODUCT=3D'${SCP_PLATFORM}' \
> > > >                  MODE=3D'${SCP_BUILD_STR}' \
> > > > +                LOG_LEVEL=3D'${SCP_LOG_LEVEL}' \
> > > >                  CC=3D'${SCP_COMPILER}-gcc' \
> > > >                  AR=3D'${SCP_COMPILER}-ar' \
> > > >                  SIZE=3D'${SCP_COMPILER}-size' \
> > > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > > index 5ff5859..9cb8b64 100644
> > > > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > > @@ -13,7 +13,7 @@ SRC_URI =3D "\
> > > >
> > > > git://github.com/ARM-software/CMSIS_5.git;protocol=3Dhttps;name=3Dc=
msis;destsuffix=3Dsrc/cmsis;lfs=3D0;nobranch=3D1
> > > > \
> > > >  "
> > > >
> > > > -SRCREV_scp    =3D "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> > > > +SRCREV_scp    =3D "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> > > >  SRCREV_cmsis  =3D "refs/tags/5.2.0"
> > > >  SRCREV_FORMAT =3D "scp_cmsis"
> > > >
> > > > --
> > > > 2.17.1
> > > >
> > > >
> >
> > >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
