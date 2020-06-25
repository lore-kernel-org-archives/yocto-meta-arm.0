Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.44])
 by mx.groups.io with SMTP id smtpd.web10.3469.1593057123276778689
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 20:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1zAZiHB+;
 spf=pass (domain: arm.com, ip: 40.107.14.44, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqFvnMnNdaxpaVocA/nK29nq24u/kjQpIL5IuY+HRYE=;
 b=1zAZiHB+u3HSZqgwVmBafe/clKJ3VimpeE7nveGxGeT5Otj4oIWNkEk/5PHz7ljLN5n3XOdbvt/XLGmB/G8WoBkz8w2QvrTRuon8ervIfgKqAcnJVu5YO6x4k//G95hc8/mijmSmexoE4ALHHXtpcQUMXAucibbT6Q7EcqOnXmQ=
Received: from AM6PR10CA0060.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::37)
 by AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 03:52:00 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::ad) by AM6PR10CA0060.outlook.office365.com
 (2603:10a6:209:80::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Thu, 25 Jun 2020 03:52:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 03:52:00 +0000
Received: ("Tessian outbound 147ff5d152c1:v59"); Thu, 25 Jun 2020 03:51:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e880256eb2b0719c
X-CR-MTA-TID: 64aa7808
Received: from c644cfef5b5b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 24EB0CF3-19D3-4147-AF11-F5D4AD757082.1;
	Thu, 25 Jun 2020 03:51:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c644cfef5b5b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Jun 2020 03:51:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGQqg53sUarJKioiHfxEHfPRYkkG9FsNu4GVwqi2eLk/zXBP9De3Mp++orgxX3mEN4fKHHNjgu8xjSEQ9ciilTtTFzW6VUJIAuKpTA5c7lm5E8qFgBo1CltRYh3rwb+FbB8NQSHfPxJ9jW3du08Up+4Sm6NseU+RaSFKlUHw02QTibJ1YLGb2JyQS51dn4G8EGKbmc5yZhx+qXrACma7GWZfK2QsDK59s7dH0pCpYak1jyFJdcAKmUB2yHkw2JdqK2ygGPB0fWI8pt/V3svH75SLx9WvNQDVv/pgIt9gZUvwl+U7lpJ7pl4f83DrnSJt7hLXWp/O3n1RVZtAXQVE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqFvnMnNdaxpaVocA/nK29nq24u/kjQpIL5IuY+HRYE=;
 b=LmaTNPZo92EZpIycnrcBduEm/jDrW1fVqBQUVn4SzgwTeAoNVBE4xa+tFde2VgI209/kawXlnVZCf+A/YYCjtHlOTEeP/hlL+vHj0nx8DyKwPozMOlTJa7Q0kzt8ssc0SWvOaJ2ARamRsG6r3POI73goz4NSfLQHUX5M6ytObVsgUps7TeFvtX0qTjgR2+87HQLxlLj8LQlrgB1snA8+tZGAK/kIrbS2XO3YIn9gsUpOPyFDcOz81LQURdBFkdFZsU5U2WMJ+L6xezhvyP0uMClf6SulLBtuUvssaeXbUK/a1MsM7TAKrU9AaMp/DKF0F3kgIFBvrT1xMAnb3SkD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqFvnMnNdaxpaVocA/nK29nq24u/kjQpIL5IuY+HRYE=;
 b=1zAZiHB+u3HSZqgwVmBafe/clKJ3VimpeE7nveGxGeT5Otj4oIWNkEk/5PHz7ljLN5n3XOdbvt/XLGmB/G8WoBkz8w2QvrTRuon8ervIfgKqAcnJVu5YO6x4k//G95hc8/mijmSmexoE4ALHHXtpcQUMXAucibbT6Q7EcqOnXmQ=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB7PR08MB3707.eurprd08.prod.outlook.com (2603:10a6:10:76::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 25 Jun
 2020 03:51:53 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3131.020; Thu, 25 Jun 2020
 03:51:53 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: Diego Sueiro <Diego.Sueiro@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
Thread-Topic: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log
 level to INFO or WARN
Thread-Index: AQHWSJ/qB26ubep570y+Rgv13IMSF6jlyCuAgAJUbwCAAALucYAAi8aAgAAKEpE=
Date: Thu, 25 Jun 2020 03:51:53 +0000
Message-ID: 
 <DB8PR08MB49699E16AF27A92EECAD5766FA920@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: <20200622141735.4951-1-khasim.mohammed@arm.com>
 <31688.1592895943168936989@lists.yoctoproject.org>
 <20200624184026.GC5282@kudzu.us>
 <DB8PR08MB49699B2CDA2A7AD1225E3A4FFA950@DB8PR08MB4969.eurprd08.prod.outlook.com>,<20200625031111.GA17463@kudzu.us>
In-Reply-To: <20200625031111.GA17463@kudzu.us>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8f5dec40-5b7a-4a79-1964-08d818bb1d41
x-ms-traffictypediagnostic: DB7PR08MB3707:|AM6PR08MB3399:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB33994ABF554E981C0BA4AAF2FA920@AM6PR08MB3399.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rE7aE7lStWmRJ782gWBtlZA/K30ZTwfJ9h/781tmRgPVrq8osJb0GSF+f/u7WVRxw3Iw5KZwUQtuCGiFCauZsH0dAwBA9yheXjwP9EIGC7nDyi+DBtksvRL1CAV1IpIHkxM0TkGQqHPLc9KAvHtPMmn5Lo8Vi0Tecgvxg5sycCU2VDiQPEzdypT0cLpIoRCj2KryuIKXKb7IGiMkHFH1rUjsWsQpQjkPMbfFXgCTjvY0MVLUzl2UqgAiStcLaYBLjvldVI/OGiugFv4LREDs4uIuJMN158wQqI0uYPYM5bPsPGfW5xK2jakqRvzt81fX4bSrfrrjTWFCfGRnG9VPSME40T0HvVoHG9gv70OaihuvnqaS8ekmr+YLk2eipdZBxNFCkyYtyD+w3mbAU/C9Yr+sj1VNKEPm1ii8aToETgMSqYhD73pBvL6K2MQSjlHm144OjZOoePMwG7gjnhuwFpIqukIdqSaLy/VacIzo0Vs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(6916009)(26005)(4326008)(8936002)(71200400001)(478600001)(2906002)(8676002)(54906003)(9686003)(33656002)(6506007)(64756008)(186003)(66556008)(86362001)(316002)(53546011)(66946007)(83380400001)(66476007)(55016002)(76116006)(66446008)(52536014)(7696005)(966005)(5660300002)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 YeA3YTZGi+6iabAEb9MIJiVdcQirsGgXM7TmbMaa7HApM0IyMWPQQRw/OnmcC1zr2wLP/GkAQra7Crzkjf6dQyxIhfRVfEOG76Fkao3/wwIMe7kWDVRE8bZKJ/VGYDU6pXRmG/8C7SDX7fclxmD4Iczpgtpz6+px6rFJlZt4/NpK9dqOeP2QByE/fnwwfIPk/7XALabMVpjNmXdG5fMF6+E0amDEbJELMfwIFuQ098GH/uPpfAHMC2bz4pvNMGeMKLRBQfTrsFPYzXStkAsaTWSDDIX0Bkl+nfiDuyeE3zXjitqiM6lZ5YFE7BoGOf2MMprN1Uon++QJKnrmfHTy8s6FTBwx9HqDikM5ayXtF2cYDdoPQRdc2JS2v8U/nDDUdVEL8k6V9L8YA6nyhfJLtCXCRy+bun/yxWOX+CZtlq0YleZgImqKyZlNS/enmmztQltoHaHMK/VDr2yVZRlOJ4WFt9cEgRGE0VqTh0x1Em4Uqf8IDmgjUmU02rWLn/j4
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3707
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(70586007)(70206006)(186003)(26005)(53546011)(336012)(7696005)(6506007)(36906005)(2906002)(4326008)(52536014)(82310400002)(8676002)(81166007)(8936002)(5660300002)(356005)(82740400003)(54906003)(316002)(47076004)(9686003)(6862004)(83380400001)(55016002)(86362001)(33656002)(966005)(478600001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	82602eab-dcdc-4491-bb5c-08d818bb1954
X-Forefront-PRVS: 0445A82F82
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7krMRRTJh+wFHTt9FIE9aQ2PBWllq5O4gjlSno1D5qMI51QLG7c1A2ZM29HiuuH8HEFU51z3YYFifhBGPgxH/2IikHYgtmPBjxIy4rPaWf9ivO7ebHI7z+/xDvkwLKLp/YP+wQcmGGWMBg5xPaL3dKKqJzDV7YU2moRLWY8vcsBDF0ex9JDIcDaCZ6hSjMvXVSs47tF4lIu4QKgWyK7XG4IgrJyb6xo8zUZrPmHWiynDhaKeE8mJchTTvppKnurb4UpBIniU7FWU5KtN4RsnZ7tauKqk4+PF9XWkVj4nCD/D5XbEwMAiYxyfzHTa66pmLrq7uaLIhZXGZ03x1ggJ1m5D7HhGUk66Dr7K7vn27t++EdQdC2M8MCKTM7kXB8lc3sSoKGAZzIUMLRY336HrtVwE9D3FFvYMlZBsB5sNqnGfOXdW2owWdOLjo7LIpDBlX6vWgAMnKPft7Pp3T47wXCs7VM9VDxb6OjHcF0QGVUpRbteR90GuDygF17C6wymPC4UwS4k3ZbTvhFTIoNFOQg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 03:52:00.1132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5dec40-5b7a-4a79-1964-08d818bb1d41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3399
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

<reply inline>
________________________________________
From: Jon Mason <jdmason@kudzu.us>
Sent: Thursday, June 25, 2020 8:41 AM
To: Khasim Mohammed
Cc: Diego Sueiro; meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp lo=
g level to INFO or WARN

On Wed, Jun 24, 2020 at 06:52:05PM +0000, Khasim Mohammed wrote:
> Hi Jon,
>
> ________________________________________
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> o=
n behalf of Jon Mason via lists.yoctoproject.org <jdmason=3Dkudzu.us@lists.=
yoctoproject.org>
> Sent: Thursday, June 25, 2020 12:10 AM
> To: Diego Sueiro
> Cc: meta-arm@lists.yoctoproject.org
> Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp =
log level to INFO or WARN
>
> On Tue, Jun 23, 2020 at 12:05:43AM -0700, Diego Sueiro wrote:
> > On Mon, Jun 22, 2020 at 03:18 PM, Khasim Mohammed wrote:
> >
> > >
> > > SCP code has been updated with new logging framework. The patch
> > > is to allow setting of log level parameter to INFO or WARN.
> > >
> > > Change-Id: I20ec19a9aa1bdb7f59c067d2344c299c057a088b
> > > Issue-Id: PLATFORMS-3134
> > > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> >
> > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
>
> > Pulled into master.
>
> Can you please apply these three patches to dunfell branch as well ?
>
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_2_2/75039153?p=3D,,=
,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039153
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_1_2_arm_scp_firmwar=
e/75039137?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039137
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_arm_fiptool/7503911=
3?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039113

> Looks like there is a problem on dunfell.  When compiling for n1sdp, I
> get the following error:

>ERROR: Nothing PROVIDES 'virtual/arm-none-eabi-gcc-native' (but /home/jdm/=
yocto/meta-arm/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb DEPEND=
S on or otherwise requires it). Close matches:
>  virtual/mesa-native
>ERROR: Required build target 'core-image-sato' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-sato', 'virtual=
/control-processor-firmware', 'virtual/arm-none-eabi-gcc-native']

> Can you confirm it compiles for you?

You seem to have missed pushing your gcc patches to dunfell branch :

http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolchai=
n/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major=
.bb?id=3Df9ece576ad476e6ed069dfdfc376eb422c1c511c

http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolchai=
n/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major=
.bb?id=3D04eb583c4be5e7c36d457eb2d0dec35fef89ae52

Can you please push these to dunfell as well ?

Regards,
Khasim

>
>
> Thanks
>
> Khasim
>
> > Thanks,
> > Jon
>
> >
> > > ---
> > >  meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc    | 2 ++
> > >  meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 2 +-
> > >  2 files changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > index 1873848..2db59d3 100644
> > > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > @@ -6,6 +6,7 @@ SCP_BUILD_RELEASE   ?=3D "1"
> > >  SCP_COMPILE_VERBOSE ?=3D "0"
> > >  SCP_PLATFORM        ?=3D "invalid"
> > >  SCP_COMPILER        ?=3D "arm-none-eabi"
> > > +SCP_LOG_LEVEL       ?=3D "WARN"
> > >
> > >  DEPENDS +=3D "virtual/arm-none-eabi-gcc-native"
> > >
> > > @@ -39,6 +40,7 @@ EXTRA_OEMAKE =3D "${SCP_COMP_STR} \
> > >                  BUILD_PATH=3D'${B}' \
> > >                  PRODUCT=3D'${SCP_PLATFORM}' \
> > >                  MODE=3D'${SCP_BUILD_STR}' \
> > > +                LOG_LEVEL=3D'${SCP_LOG_LEVEL}' \
> > >                  CC=3D'${SCP_COMPILER}-gcc' \
> > >                  AR=3D'${SCP_COMPILER}-ar' \
> > >                  SIZE=3D'${SCP_COMPILER}-size' \
> > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > index 5ff5859..9cb8b64 100644
> > > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > @@ -13,7 +13,7 @@ SRC_URI =3D "\
> > >
> > > git://github.com/ARM-software/CMSIS_5.git;protocol=3Dhttps;name=3Dcms=
is;destsuffix=3Dsrc/cmsis;lfs=3D0;nobranch=3D1
> > > \
> > >  "
> > >
> > > -SRCREV_scp    =3D "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> > > +SRCREV_scp    =3D "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> > >  SRCREV_cmsis  =3D "refs/tags/5.2.0"
> > >  SRCREV_FORMAT =3D "scp_cmsis"
> > >
> > > --
> > > 2.17.1
> > >
> > >
>
> >
>
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
