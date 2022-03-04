Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B76C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 11:43:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.45])
 by mx.groups.io with SMTP id smtpd.web08.5947.1646394235787696089
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 03:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=9p8TuXV4;
 spf=pass (domain: arm.com, ip: 40.107.6.45,
 mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9LzcVWL7/oIljMSVfX1haY7p3oSeSYKjoqYpwuJfbs=;
 b=9p8TuXV4ARovNNdknL3gZlny7palBDyYuvBbskUh97AzJPruskXQGZDfvKPjdShwwtNCncwtzAbLmuAxH3auTognb1SsFqDk4CvTb7t9DGPYqvrkX5f7ykaiR3+K5/iB3HbpPXK4k/s9Hv9DRX8XwQ6g7KbzYyGvOnEwf7EG3QQ=
Received: from AM6P195CA0044.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::21)
 by DB8PR08MB4154.eurprd08.prod.outlook.com (2603:10a6:10:b1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 11:43:48 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::f6) by AM6P195CA0044.outlook.office365.com
 (2603:10a6:209:87::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Fri, 4 Mar 2022 11:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Fri, 4 Mar 2022 11:43:48 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Fri, 04 Mar 2022 11:43:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e15f9dcd784f8f9f
X-CR-MTA-TID: 64aa7808
Received: from 01fe8dd83e63.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9FEAA4B7-08D2-4CA8-8447-191C85ED3204.1;
	Fri, 04 Mar 2022 11:43:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 01fe8dd83e63.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 04 Mar 2022 11:43:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaNAalvHLC5eekAG4aJRb0yZ/5og2ndN2n51CZmGQV778KeudzVGpxmx5jkOsb7WMVFe6U9gjukoH2foAxMvnJorgT6cKwlAcYMiLOesSiFG/uDxaH+IuPUEtd1LVxaL3cy0AIuh04z7bHB+xHFnx/xNqG73/VCCLKzs+nw0McQnVZrezdGxrW0RucxrlQP1KFqHVB4aCb7KqdVKK8eFC7xfRA4LNLmJ527OoELqSrAqNFGsMX9ED3sVyN3WQR8uJtJj5xZnSFml1CRFifD//WOO4hzk9XjcYvtzbKiZIpdhiSbLqoDAMz+1HEoQZEeBONohGhbJBNFEPhJ3r1SZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9LzcVWL7/oIljMSVfX1haY7p3oSeSYKjoqYpwuJfbs=;
 b=cFeDcDv9TKPpa11AyvN3moiibkynla/sb4PHuTkaPjZrIs9LOKe25/38oJ2R1hofkEL0Y2w/hFK8kOVZC1DeETqfSdQBdL7fibiUaPVuZ05km5+0WHU+gOpwmJrNbjr2SDf9aj0LwV1L0rEROEV8eHW8ELaVyzGHsmF1tEwxnkhJRNGhSmaT8g56h1ABhLFDfRGdkueT1dboAcrKc23LjAIJj2mEjjVtxsiZ5UqTVDvhOFW1+fB4K/QBKmC5USQ4waoyiu429mgmNIppgJhNa6OzC2gw1SWjrP50I4KQjFACCLAp/3U7oKcXf//jWpnqt4X2dSL20D5j8P67BP86Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9LzcVWL7/oIljMSVfX1haY7p3oSeSYKjoqYpwuJfbs=;
 b=9p8TuXV4ARovNNdknL3gZlny7palBDyYuvBbskUh97AzJPruskXQGZDfvKPjdShwwtNCncwtzAbLmuAxH3auTognb1SsFqDk4CvTb7t9DGPYqvrkX5f7ykaiR3+K5/iB3HbpPXK4k/s9Hv9DRX8XwQ6g7KbzYyGvOnEwf7EG3QQ=
Received: from AM5PR0801MB1716.eurprd08.prod.outlook.com
 (2603:10a6:203:39::18) by VI1PR0801MB1885.eurprd08.prod.outlook.com
 (2603:10a6:800:84::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 11:43:38 +0000
Received: from AM5PR0801MB1716.eurprd08.prod.outlook.com
 ([fe80::a43f:bc38:e76e:2b34]) by AM5PR0801MB1716.eurprd08.prod.outlook.com
 ([fe80::a43f:bc38:e76e:2b34%12]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 11:43:38 +0000
From: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>
To: Tim Orling <ticotimo@gmail.com>, Alejandro Hernandez Samaniego
	<alhe@linux.microsoft.com>
CC: Denys Dmytriyenko <denis@denix.org>, Drew Reed <Drew.Reed@arm.com>, Jon
 Mason <jdmason@kudzu.us>, Maxim Uvarov <maxim.uvarov@linaro.org>, Peter
 Griffin <peter.griffin@linaro.org>, Sumit Garg <sumit.garg@linaro.org>,
	Vishnu Banavath <Vishnu.Banavath@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Thread-Topic: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Thread-Index: 
 AQHYLkR2cO31jWkCZkuCqK1e0SZv1qytIzOAgABXUG2AAK9yAIAAKOSAgAA9G4CAAAuygIAAf1fugAACDiw=
Date: Fri, 4 Mar 2022 11:43:38 +0000
Message-ID: 
 <AM5PR0801MB17162C36E0890FE1D0ABA750FD059@AM5PR0801MB1716.eurprd08.prod.outlook.com>
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
 <Yh5JYWMmAd6SnmOS@kudzu.us>
 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
 <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
 <20220303233749.GP1766@denix.org>
 <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
 <CANx9H-B4N8_a6Vz3zn=zPw5Yc=QWvG0rhfLGL7iwa6fQYgS0Gw@mail.gmail.com>
 <AM5PR0801MB1716D50B772242967A3A3DD5FD059@AM5PR0801MB1716.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM5PR0801MB1716D50B772242967A3A3DD5FD059@AM5PR0801MB1716.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 4e7f79b3-2126-cb45-aff0-65a7bd607c4d
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 16f595bd-8ded-46d4-c335-08d9fdd43f28
x-ms-traffictypediagnostic: 
	VI1PR0801MB1885:EE_|AM5EUR03FT050:EE_|DB8PR08MB4154:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB4154A2AA974ABE0649EA1FA6FD059@DB8PR08MB4154.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cT0/bbxJtkUSOlOW1raX3GV6m6jOMDozKcNfOylqch6yx2z+wOgA6jGYfjiUc1VULzp+oeMz1WzAtlu9yYQUGIBQWhumt7C7jfSYWUnioZTqjWYkZC/GUThOtb56YoeZpgC7WASBiV+FOYINl2qJaXmTWn+PskzUwdRXRTqwghiPhCZIViCmD1OvQIfdhtBrxgAGsYfYkmZqS4aRsbHKhtR4B5peeRU6SZOVyslNe0vmHWFI5MmWYNxgxGAXFwGo3kaXGxf2O8ZGf931qumzowYSoNaI2+t6lo77PRtuqEdxryc7tWR7xM5cAVftLY1zNZtjmWb7igKH0/ViwU0RBRWdPyMEmXv7CF3RQnicfhQQ/D9Mnw8Nh/GqhgB+ZzbgjeTJ70Y3mm0ugJuB4TcXWIbqE76OM/eUcDtNnbHrL7fowoFMYiEJ8UrRizrkvKLLb6n6pgyscvJkDU0LGVAkpTycg2s8h5gqbFp2AIOJRSgaS6TzJqsyCNVhBvWzBhNSQ2pESISWX1TP1g1ARcEryg5BSPn13Iqic3qmCGTw+UPENdXOmSO6rMB7XlMfLuu7mmYK8mxIpm7bsmgzS8VaOObPtMA8F5QA/zpshPZaLst+KZXndPukt7ST85Im9XISeJ5J2gDYCVvEnfFmH1uQeze5CMFHWY26TkMDOI5mCRcv9C1bkKLhIj6dbt4dMVgC+KmcTQrINg2E+mLvBJCakWm8uRsep4NKIbA431CwvsnOf3t+OCcwyZDXfD+KDDSa4y3Bt2wDw2v6iohM/Nm25K4I/jUhYxDELpn2EA8dH/kGYMk/bdunu3h34frfwxT/BCekz3Dk8O6R15zZdEjlGg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB1716.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(5660300002)(52536014)(110136005)(6506007)(508600001)(8936002)(38100700002)(53546011)(8676002)(122000001)(91956017)(86362001)(66556008)(66476007)(66946007)(64756008)(66446008)(76116006)(4326008)(966005)(83380400001)(2940100002)(19627405001)(316002)(71200400001)(2906002)(33656002)(55016003)(7696005)(9686003)(54906003)(166002)(38070700005);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0801MB17162C36E0890FE1D0ABA750FD059AM5PR0801MB1716_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1885
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ce87ca02-7ea4-4f45-0169-08d9fdd4393b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S+fP3npjOWeVz3o+uMPGOt61PmtmzJKdPnz7+u7qtyzLhY5zfBTLgRt0xYyjnYT3DzHOWGRJ+MUVEHXWO22cUzTQgjzT6cgym7Efncz3FeR82fTlJ1fTkFqgpAZoIKWobD7QssJgIXnuneiRXt82wOIQM1rwzQ5xRuHvFo6eCmVu1/BNmczPssTdhcJnOHnDIR2kiuf/PxbVQfRvsTA1CunLcA6tyPBLZf9xSYIDH9cf8QFrrG6kuppGR1RjrzGwsPG4OnX++Mw/koSr3M9wo6aqh6YkXhLKxUfvSGXOWQ1ZF+Z2OYjkmjq/HQn3/2nrYJUrVTozHoKEQyRdwr96Nhqg64Lq6ejPa+ZYXGzW9BhsfamMAy/VAFpsv+9+RHKZbmu/jQYmlD3R6HVYsxIkGrkug8+d+RfNUI8ZhmdLdmUk+z7qVdf3/m1tJdEPFpsza5im1OBps5biF4Z+6V69EXsgDuivwwfYom2bMrO8Zixaz1dYNwWB2cVq+uXlz6OrT6UDR+VXU8vDZtpXAVzQy3oe5O7pw6O8RYF+iQtnNZWYAlkdbGlzkwfNzhqLWUB0ylG5a32d6iykzG+PpSBKsd96X2mEc3S3Ras8jOxcML7x/rWPJFldTK4LTgZgNjOWV+Ju/U6GKZY7QNPJiPWtcuAusJpAaitOo3WrDMUDRHk4coGWtPmY/d3tEPHocUSCxSKdRFjIaQ3yY8IEWcEgQK5vKGX2lOEh9DVEcqVlqDeaA6/OtbFGbv9x8L5f3qodfWU1kRfsuY4yPKQ+5yrKAp8A6LWjJP6dfl0eSW60FvI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(166002)(81166007)(356005)(316002)(54906003)(19627405001)(52536014)(8676002)(70586007)(70206006)(966005)(110136005)(4326008)(86362001)(508600001)(82310400004)(33656002)(40460700003)(186003)(53546011)(47076005)(2906002)(83380400001)(5660300002)(26005)(55016003)(2940100002)(336012)(7696005)(30864003)(9686003)(8936002)(36860700001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 11:43:48.3067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 16f595bd-8ded-46d4-c335-08d9fdd43f28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4154
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 11:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3113

--_000_AM5PR0801MB17162C36E0890FE1D0ABA750FD059AM5PR0801MB1716_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I meant adding meta-python dependency to meta-arm layer like this:

In meta-arm/conf/layer.conf:

LAYERDEPENDS_meta-arm:append:qemuarm64-secureboot =3D " meta-python openemb=
edded-layer"

It works as explained in the previous email.
________________________________
From: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>
Sent: 04 March 2022 11:35
To: Tim Orling <ticotimo@gmail.com>; Alejandro Hernandez Samaniego <alhe@li=
nux.microsoft.com>
Cc: Denys Dmytriyenko <denis@denix.org>; Drew Reed <Drew.Reed@arm.com>; Jon=
 Mason <jdmason@kudzu.us>; Maxim Uvarov <maxim.uvarov@linaro.org>; Peter Gr=
iffin <peter.griffin@linaro.org>; Sumit Garg <sumit.garg@linaro.org>; Vishn=
u Banavath <Vishnu.Banavath@arm.com>; meta-arm@lists.yoctoproject.org <meta=
-arm@lists.yoctoproject.org>; Ross Burton <Ross.Burton@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16

Hi guys,

Thanks for the feedback.

Since the machine is in meta-arm (meta-arm/conf/machine/qemuarm64-secureboo=
t.conf), it makes sense to add the meta-python layer dependency as detailed=
 below.

It works, meta-python  and python3-cryptography are detected. Please have a=
 look at the logs below.

So, technically it works. But let's see what Jon and Ross think.

Suggested changes:

In ci/qemuarm64-secureboot.yml add:

    - ci/meta-openembedded.yml

In meta-arm/conf/layer.conf add:

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D " meta-python ope=
nembedded-layer"

Before the changes:

bitbake-layers show-layers

NOTE: Starting bitbake server...
layer                 path                                      priority
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
meta-arm              /home/abdelk01/Work/qemu/meta-arm/meta-arm  5
meta-arm-bsp          /home/abdelk01/Work/qemu/meta-arm/meta-arm-bsp  5
meta-arm-toolchain    /home/abdelk01/Work/qemu/meta-arm/meta-arm-toolchain =
 5
meta                  /home/abdelk01/Work/qemu/poky/meta        5
meta-poky             /home/abdelk01/Work/qemu/poky/meta-poky   5


After the changes:

bitbake-layers show-layers

NOTE: Starting bitbake server...
layer                 path                                      priority
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
meta-arm              /home/abdelk01/Work/qemu/meta-arm/meta-arm  5
meta-arm-bsp          /home/abdelk01/Work/qemu/meta-arm/meta-arm-bsp  5
meta-arm-toolchain    /home/abdelk01/Work/qemu/meta-arm/meta-arm-toolchain =
 5
meta-filesystems      /home/abdelk01/Work/qemu/meta-openembedded/meta-files=
ystems  5
meta-networking       /home/abdelk01/Work/qemu/meta-openembedded/meta-netwo=
rking  5
meta-oe               /home/abdelk01/Work/qemu/meta-openembedded/meta-oe  5
meta-python           /home/abdelk01/Work/qemu/meta-openembedded/meta-pytho=
n  5
meta                  /home/abdelk01/Work/qemu/poky/meta        5
meta-poky             /home/abdelk01/Work/qemu/poky/meta-poky   5

bitbake-layers show-recipes | grep -A 1 python3-cryptography

python3-cryptography:
  meta-python          36.0.1
python3-cryptography-vectors:
  meta-python          36.0.1

Kind regards
________________________________
From: Tim Orling <ticotimo@gmail.com>
Sent: 04 March 2022 03:58
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Cc: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>; Denys Dmytriyenko <=
denis@denix.org>; Drew Reed <Drew.Reed@arm.com>; Jon Mason <jdmason@kudzu.u=
s>; Maxim Uvarov <maxim.uvarov@linaro.org>; Peter Griffin <peter.griffin@li=
naro.org>; Sumit Garg <sumit.garg@linaro.org>; Vishnu Banavath <Vishnu.Bana=
vath@arm.com>; meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject=
.org>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16



On Thu, Mar 3, 2022 at 7:16 PM Alejandro Hernandez Samaniego <alhe@linux.mi=
crosoft.com<mailto:alhe@linux.microsoft.com>> wrote:


On 3/3/22 23:37, Denys Dmytriyenko wrote:

On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego wro=
te:


On 3/3/22 10:55, Abdellatif El Khlifi wrote:


Hello,

I suggest the following:

In meta-arm-bsp/conf/layer.conf add :

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D "
meta-python openembedded-layer"



This statement is a little confusing (to me), please correct me if
I'm wrong, but you're saying

we should set a dependency from meta-arm-bsp layer, only for
qemuarm64-secureboot,

however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,

AFAIC meta-arm-bsp has now knowledge of its existence, in fact
there's no other mention of

qemuarm64-secureboot in meta-arm-bsp.


Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending on
meta-arm, not meta-arm-bsp.

Depending on python3-cryptography which is only available in meta-python (p=
art
of meta-openembedded) should be avoided. Back in the day we pushed for movi=
ng
other python3 dependencies like pycryptodome and pyelftools into OE-Core:

https://git.openembedded.org/meta-openembedded/commit/?id=3Da8f3c00d8d113b4=
6a49584682e10435157d516ca
https://git.yoctoproject.org/meta-arm/commit/?id=3Df2069723f27d9229e8ec7426=
3a41160c8df32571

We could try doing the same with this new python3-cryptography dependecy an=
d
propose moving it to OE-Core. Alternatively, consider adding it to meta-arm=
?
Not ideal, but meta-arm-bsp briefly carried alternative/older version recen=
tly:

https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab011e2ba91a6c4=
ca6e1251de0d8058

I agree with Denys's point here, I think its likely there's other cases jus=
t like
meta-ti, and we would be forcing a meta-oe and meta-python dependency on th=
em, IMO
it would make sense to add a copy of python3-cryptography to meta-arm (espe=
cially since
there's been similar situations in the past) and in parallel try to make a =
case for
python3-cryptography to be moved from meta-python to OE-core.

Once (and if) we're successful we can delete the python3-cyrptography copy =
from meta-arm.


I have suggested moving python3-cryptography (also python3-cryptography-vec=
tors) to oe-core previously. It is heavily used for cryptography and needs =
to be kept up to date which is much more likely in oe-core.

This also means python3-pyo3, pyo3.bbclass, python3-setuptools-rust-native =
and the setuptools_rust.bbclass would also move to oe-core.

And then some tests. And documentation.



Alejandro


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#3107): https://lists.yoctoproject.org/g/meta-arm/messag=
e/3107
Mute This Topic: https://lists.yoctoproject.org/mt/89404067/924729
Group Owner: meta-arm+owner@lists.yoctoproject.org<mailto:meta-arm%2Bowner@=
lists.yoctoproject.org>
Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ticotimo@gmai=
l.com<mailto:ticotimo@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_AM5PR0801MB17162C36E0890FE1D0ABA750FD059AM5PR0801MB1716_
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
: 12pt; color: rgb(0, 0, 0);">
I meant adding meta-python dependency to meta-arm layer like this:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>In meta-arm/conf/layer.conf:</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
<span>LAYERDEPENDS_meta-arm:append:qemuarm64-secureboot =3D &quot; meta-pyt=
hon openembedded-layer&quot;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
It works as explained in the previous email.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Abdellatif El Khlifi =
&lt;Abdellatif.ElKhlifi@arm.com&gt;<br>
<b>Sent:</b> 04 March 2022 11:35<br>
<b>To:</b> Tim Orling &lt;ticotimo@gmail.com&gt;; Alejandro Hernandez Saman=
iego &lt;alhe@linux.microsoft.com&gt;<br>
<b>Cc:</b> Denys Dmytriyenko &lt;denis@denix.org&gt;; Drew Reed &lt;Drew.Re=
ed@arm.com&gt;; Jon Mason &lt;jdmason@kudzu.us&gt;; Maxim Uvarov &lt;maxim.=
uvarov@linaro.org&gt;; Peter Griffin &lt;peter.griffin@linaro.org&gt;; Sumi=
t Garg &lt;sumit.garg@linaro.org&gt;; Vishnu Banavath &lt;Vishnu.Banavath@a=
rm.com&gt;;
 meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.org&gt;; R=
oss Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16=
</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi guys,
<div><br>
</div>
<div>Thanks for the feedback.</div>
<div><br>
</div>
<div>Since the machine is in meta-arm (meta-arm/conf/machine/qemuarm64-secu=
reboot.conf), it makes sense to add the meta-python layer dependency as det=
ailed below.</div>
<div><br>
</div>
<div>It works, meta-python &nbsp;and python3-cryptography are detected. Ple=
ase have a look at the logs below.</div>
<div><br>
</div>
<div>So, technically it works. But let's see what Jon and Ross think.</div>
<div><br>
</div>
<div>Suggested changes:</div>
<div><br>
</div>
<div>In ci/qemuarm64-secureboot.yml add:</div>
<div><br>
</div>
<div>&nbsp; &nbsp; - ci/meta-openembedded.yml</div>
<div><br>
</div>
<div>In meta-arm/conf/layer.conf add:</div>
<div><br>
</div>
<div>LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D &quot; meta-=
python openembedded-layer&quot;</div>
<div><br>
</div>
<div>Before the changes:</div>
<div><br>
</div>
<div>bitbake-layers show-layers</div>
<div><br>
</div>
<div>NOTE: Starting bitbake server...</div>
<div>layer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; path &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;priority</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div>meta-arm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/home/abdelk0=
1/Work/qemu/meta-arm/meta-arm &nbsp;5</div>
<div>meta-arm-bsp &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/home/abdelk01/Work/qem=
u/meta-arm/meta-arm-bsp &nbsp;5</div>
<div>meta-arm-toolchain &nbsp; &nbsp;/home/abdelk01/Work/qemu/meta-arm/meta=
-arm-toolchain &nbsp;5</div>
<div>meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/ho=
me/abdelk01/Work/qemu/poky/meta &nbsp; &nbsp; &nbsp; &nbsp;5</div>
<div>meta-poky &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /home/abdelk01/Wor=
k/qemu/poky/meta-poky &nbsp; 5</div>
<div><br>
</div>
<div><br>
</div>
<div>After the changes:</div>
<div><br>
</div>
<div>bitbake-layers show-layers</div>
<div><br>
</div>
<div>NOTE: Starting bitbake server...</div>
<div>layer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; path &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;priority</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div>meta-arm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/home/abdelk0=
1/Work/qemu/meta-arm/meta-arm &nbsp;5</div>
<div>meta-arm-bsp &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/home/abdelk01/Work/qem=
u/meta-arm/meta-arm-bsp &nbsp;5</div>
<div>meta-arm-toolchain &nbsp; &nbsp;/home/abdelk01/Work/qemu/meta-arm/meta=
-arm-toolchain &nbsp;5</div>
<div>meta-filesystems &nbsp; &nbsp; &nbsp;/home/abdelk01/Work/qemu/meta-ope=
nembedded/meta-filesystems &nbsp;5</div>
<div>meta-networking &nbsp; &nbsp; &nbsp; /home/abdelk01/Work/qemu/meta-ope=
nembedded/meta-networking &nbsp;5</div>
<div>meta-oe &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /home/abdelk0=
1/Work/qemu/meta-openembedded/meta-oe &nbsp;5</div>
<div>meta-python &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /home/abdelk01/Work/qem=
u/meta-openembedded/meta-python &nbsp;5</div>
<div>meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/ho=
me/abdelk01/Work/qemu/poky/meta &nbsp; &nbsp; &nbsp; &nbsp;5</div>
<div>meta-poky &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /home/abdelk01/Wor=
k/qemu/poky/meta-poky &nbsp; 5</div>
<div><br>
</div>
<div>bitbake-layers show-recipes | grep -A 1 python3-cryptography</div>
<div><br>
</div>
<div>python3-cryptography:</div>
<div>&nbsp; meta-python &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;36.0.1</div>
<div>python3-cryptography-vectors:</div>
<div>&nbsp; meta-python &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;36.0.1</div>
<span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Kind regards<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Tim Orling &lt;tico=
timo@gmail.com&gt;<br>
<b>Sent:</b> 04 March 2022 03:58<br>
<b>To:</b> Alejandro Hernandez Samaniego &lt;alhe@linux.microsoft.com&gt;<b=
r>
<b>Cc:</b> Abdellatif El Khlifi &lt;Abdellatif.ElKhlifi@arm.com&gt;; Denys =
Dmytriyenko &lt;denis@denix.org&gt;; Drew Reed &lt;Drew.Reed@arm.com&gt;; J=
on Mason &lt;jdmason@kudzu.us&gt;; Maxim Uvarov &lt;maxim.uvarov@linaro.org=
&gt;; Peter Griffin &lt;peter.griffin@linaro.org&gt;; Sumit Garg &lt;sumit.=
garg@linaro.org&gt;;
 Vishnu Banavath &lt;Vishnu.Banavath@arm.com&gt;; meta-arm@lists.yoctoproje=
ct.org &lt;meta-arm@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16=
</font>
<div>&nbsp;</div>
</div>
<div>
<div><br>
</div>
<div><br>
<div class=3D"x_x_gmail_quote">
<div dir=3D"ltr" class=3D"x_x_gmail_attr">On Thu, Mar 3, 2022 at 7:16 PM Al=
ejandro Hernandez Samaniego &lt;<a href=3D"mailto:alhe@linux.microsoft.com"=
>alhe@linux.microsoft.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bo=
rder-left-width:1px; border-left-style:solid; padding-left:1ex; border-left=
-color:rgb(204,204,204)">
<div></div>
<div>
<p><br>
</p>
<div>On 3/3/22 23:37, Denys Dmytriyenko wrote:<br>
</div>
<blockquote type=3D"cite">
<pre style=3D"font-family:monospace">On Thu, Mar 03, 2022 at 09:11:28PM +00=
00, Alejandro Hernandez Samaniego wrote:
</pre>
<blockquote type=3D"cite">
<pre style=3D"font-family:monospace">On 3/3/22 10:55, Abdellatif El Khlifi =
wrote:
</pre>
<blockquote type=3D"cite">
<pre style=3D"font-family:monospace">Hello,

I suggest the following:

In meta-arm-bsp/conf/layer.conf add :

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D &quot;
meta-python openembedded-layer&quot;
</pre>
</blockquote>
<pre style=3D"font-family:monospace">
This statement is a little confusing (to me), please correct me if
I'm wrong, but you're saying

we should set a dependency from meta-arm-bsp layer, only for
qemuarm64-secureboot,

however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,

AFAIC meta-arm-bsp has now knowledge of its existence, in fact
there's no other mention of

qemuarm64-secureboot in meta-arm-bsp.
</pre>
</blockquote>
<pre style=3D"font-family:monospace">Moreover, optee is used by other BSP l=
ayers (e.g. meta-ti) by depending on=20
meta-arm, not meta-arm-bsp.

Depending on python3-cryptography which is only available in meta-python (p=
art=20
of meta-openembedded) should be avoided. Back in the day we pushed for movi=
ng=20
other python3 dependencies like pycryptodome and pyelftools into OE-Core:

<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3Da8f3=
c00d8d113b46a49584682e10435157d516ca" target=3D"_blank" style=3D"font-famil=
y:monospace">https://git.openembedded.org/meta-openembedded/commit/?id=3Da8=
f3c00d8d113b46a49584682e10435157d516ca</a>
<a href=3D"https://git.yoctoproject.org/meta-arm/commit/?id=3Df2069723f27d9=
229e8ec74263a41160c8df32571" target=3D"_blank" style=3D"font-family:monospa=
ce">https://git.yoctoproject.org/meta-arm/commit/?id=3Df2069723f27d9229e8ec=
74263a41160c8df32571</a>

We could try doing the same with this new python3-cryptography dependecy an=
d=20
propose moving it to OE-Core. Alternatively, consider adding it to meta-arm=
?=20
Not ideal, but meta-arm-bsp briefly carried alternative/older version recen=
tly:

<a href=3D"https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab01=
1e2ba91a6c4ca6e1251de0d8058" target=3D"_blank" style=3D"font-family:monospa=
ce">https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab011e2ba91=
a6c4ca6e1251de0d8058</a></pre>
</blockquote>
</div>
<div>
<pre style=3D"font-family:monospace">I agree with Denys's point here, I thi=
nk its likely there's other cases just like
meta-ti, and we would be forcing a meta-oe and meta-python dependency on th=
em, IMO
it would make sense to add a copy of python3-cryptography to meta-arm (espe=
cially since
there's been similar situations in the past) and in parallel try to make a =
case for
python3-cryptography to be moved from meta-python to OE-core.

Once (and if) we're successful we can delete the python3-cyrptography copy =
from meta-arm.
</pre>
</div>
</blockquote>
<div dir=3D"auto">I have suggested moving python3-cryptography (also python=
3-cryptography-vectors) to oe-core previously. It is heavily used for crypt=
ography and needs to be kept up to date which is much more likely in oe-cor=
e.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">This also means python3-pyo3, pyo3.bbclass, python3-setup=
tools-rust-native and the setuptools_rust.bbclass would also move to oe-cor=
e.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">And then some tests. And documentation.</div>
<div dir=3D"auto"><br>
</div>
<blockquote class=3D"x_x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bo=
rder-left-width:1px; border-left-style:solid; padding-left:1ex; border-left=
-color:rgb(204,204,204)">
<div>
<pre dir=3D"auto" style=3D"font-family:monospace">
Alejandro
</pre>
<p></p>
<blockquote type=3D"cite">
<pre style=3D"font-family:monospace"></pre>
</blockquote>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#3107): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/3107" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-arm/message/3107</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/89404067/9247=
29" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/mt/89404067/924729</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">
meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-arm/unsub</a> [<a href=3D"mailto:tico=
timo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AM5PR0801MB17162C36E0890FE1D0ABA750FD059AM5PR0801MB1716_--

