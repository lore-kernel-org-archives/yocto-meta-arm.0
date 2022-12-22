Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12F1C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 08:42:49 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.81])
 by mx.groups.io with SMTP id smtpd.web11.41612.1671698563083429639
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 00:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bBvodYfk;
 spf=pass (domain: arm.com, ip: 40.107.15.81, mailfrom: emekcan.aras@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvF7MrE69qhDWowzHEG63o7qc8ZeZ4gsTcReYJG3PpY=;
 b=bBvodYfklLGrtKh3pUJtF9zEDyWcknXeD54CWMb6SgDgKbMOpS2VOMeJazfacliQB5TS+SUerBoL/kLTxiO4ED1hHfKxXu+gTXKrRL2DKm4v984Q/6TNqL7SHwt9JZPdafwfDhQT/Z35qqZLgGVZiy6zCy6SLCEE/0kNz+fTteU=
Received: from DBBPR09CA0020.eurprd09.prod.outlook.com (2603:10a6:10:c0::32)
 by DU0PR08MB9703.eurprd08.prod.outlook.com (2603:10a6:10:445::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 08:42:38 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::3b) by DBBPR09CA0020.outlook.office365.com
 (2603:10a6:10:c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.21 via Frontend
 Transport; Thu, 22 Dec 2022 08:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.12 via Frontend Transport; Thu, 22 Dec 2022 08:42:38 +0000
Received: ("Tessian outbound 333ca28169fa:v132"); Thu, 22 Dec 2022 08:42:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16468f38a12947a7
X-CR-MTA-TID: 64aa7808
Received: from 2dd5690d9e59.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D6B2870B-74F8-4329-9F46-90B1D4DC5D98.1;
	Thu, 22 Dec 2022 08:42:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2dd5690d9e59.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Dec 2022 08:42:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhvCKlR30Jqot2WdT6rnpAR4jVWh6BIYrHi5QiMvaUaV+MTpeJsmJZ3TBlyo7wIE4eC1Qpf9h4KZ1AWZiTcTYMFNCHwjMiGh5nEHgzHEo6F9cAiydBnfvlCqzzxphvLrE5hc/UB/rRDu6zjSQbAnn98awtv+pq/SXkC2N40hEpgN2Z1fK6QnsonKvvPrqNVxTzilodGBDapk6gkwtKwRqcOdRmG8RgNB/9TUCdaUWx5D6oXad8FlNTpR7Q1JGOwJNbbtG6Wye096cOylneigS9MtmmYuSCECZOcIrfMugFCI9/WSwv0eGYJc9ELSDDEu6kh3Jq9hbEAm52jekdHopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvF7MrE69qhDWowzHEG63o7qc8ZeZ4gsTcReYJG3PpY=;
 b=iy+5/2OwP7nf+K0GFPFyGDtlYEB8Z0yg7QkPXWFUiHGAN5XZjWH+aZVB1C9KLsGlPX9IsAs5sy+dIesHCFJsuUyqACjmcrxkIRqRJJ4tKGcCsjowAKC7pysaWuzqBm+/k0G2q5DRQWDVjsbTCUkvGGrvPgvSt1p2G1tpr53CDomENCOMkOJI0qbLQ7iMJzECHbzUzvbPPxfYAz2vTJ0ECkI9tmkOZ3tHR1ZWhIu0maGsQMPQ+jy8WiKoYFF8fJ6IT9YW6PHHYJUB/4Tue5gWy4OsS2KDgrmhllAv3sd4LjWffV1d9mE5X/Ay6NaCy4QWFAg7scWTk/XaJ9Fze+Xigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvF7MrE69qhDWowzHEG63o7qc8ZeZ4gsTcReYJG3PpY=;
 b=bBvodYfklLGrtKh3pUJtF9zEDyWcknXeD54CWMb6SgDgKbMOpS2VOMeJazfacliQB5TS+SUerBoL/kLTxiO4ED1hHfKxXu+gTXKrRL2DKm4v984Q/6TNqL7SHwt9JZPdafwfDhQT/Z35qqZLgGVZiy6zCy6SLCEE/0kNz+fTteU=
Received: from DBBPR08MB4838.eurprd08.prod.outlook.com (2603:10a6:10:f6::10)
 by AM0PR08MB5428.eurprd08.prod.outlook.com (2603:10a6:208:182::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 08:42:29 +0000
Received: from DBBPR08MB4838.eurprd08.prod.outlook.com
 ([fe80::3cd:ddee:ec77:e09d]) by DBBPR08MB4838.eurprd08.prod.outlook.com
 ([fe80::3cd:ddee:ec77:e09d%7]) with mapi id 15.20.5944.012; Thu, 22 Dec 2022
 08:42:29 +0000
From: Emekcan Aras <Emekcan.Aras@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>, Jon Mason <Jon.Mason@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os
 version
Thread-Topic: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os
 version
Thread-Index: AQHZFUocsxIPG8I4uE2vXHYkQ4b9KK54edSAgAAEQ5SAAPo0gIAAG6GB
Date: Thu, 22 Dec 2022 08:42:29 +0000
Message-ID: 
 <DBBPR08MB48384A6FC8780E6DFCE384698EE89@DBBPR08MB4838.eurprd08.prod.outlook.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-6-emekcan.aras@arm.com>
 <CAFA6WYMN0VaPyPqeYGrQx3+56KA+Pd78H-kEd6xQzF7o3vdOnQ@mail.gmail.com>
 <DBBPR08MB4838DA8917E1EFA549701D7A8EEB9@DBBPR08MB4838.eurprd08.prod.outlook.com>
 <CAFA6WYNyRUxHCM==QRYYFbHv2g=OACcrfDhP52ydNtxTpjCV_w@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYNyRUxHCM==QRYYFbHv2g=OACcrfDhP52ydNtxTpjCV_w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DBBPR08MB4838:EE_|AM0PR08MB5428:EE_|DBAEUR03FT039:EE_|DU0PR08MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: 7137504e-e7b5-4d1d-2561-08dae3f87b51
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qgIst7RtC6EfVO5IldmoXmf2wtaCdVbMU1s0QGED71xDRx+i7hePzWivCSHrM1lC5+kwrrMvX1COv0CWZa1c+J6LT4XJo1DKg+Y5e1cv3sRBnWe3XjeMoCKwI9kIJK7wvCgogQQo/lrwnd1TNa66d9kWdGkw/PVK0785APb/K4u/dajIxpX30EEh6+5zqpGax28xbuHco4jkTW6E8GqAbCxhf+xdTqYIXCm48teIgMJ6qdKEInj9PE5hXgZ2rfyMxMRQWUN9KtQT9HR4Qm7GJ7z3X2/MKaGPfWp824rSV564Dzxc9JhTAFJQwPXU3IVl1XMyZh23NNXQFOBYjDj+sGm9UOTsuqHsxEoFGKUeo2UefvmF3ZaiDF+0Jqc+rvOYa4S+DCEtJLi4CqXcDZy6GW3dM0w/OZ5w6K8JT1s0NCwh7yPVVk0T53NMIPZD01z0cpugiuAlOLB0BxKwx5p5dTbzYacAk5DbtN6bVtFI7x+TFHbqL5FzKJVMBLZczrIGR33ZzGGIA6eHLLoS2SAWdr6UMug+QSS58luvGOyCRcRrxs0E4vIIcmkROTl8U/OzBkA6mhM1lmcUm7N2e0Uona76Ejqjhh3BQJI8U5Bi1Omuy2RqBvOon6OZ/oMMHBj+k5Kkg+yRfVjYdksBDnWZqwS3eUEY7hPH9r3j4ct+h9Fl6Sclnqz4W87p+5fxLDb+B8uui6hostYZfXC3TljJyp3sYxFyvR1XHUjT7JroFMUCWfRn1EKlcLbIjYXGrm8sSA+oVZhtWQq6MHNIOxAUPxy/gJVR5EjiYvf1QpQgnsHjpl864dniWf5eAamtD41m
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4838.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199015)(19627405001)(41300700001)(8676002)(4326008)(186003)(64756008)(91956017)(66556008)(66446008)(66476007)(66899015)(66946007)(26005)(71200400001)(76116006)(316002)(6916009)(2906002)(122000001)(5660300002)(4001150100001)(8936002)(54906003)(52536014)(33656002)(38070700005)(86362001)(55016003)(7696005)(966005)(9686003)(478600001)(6506007)(53546011)(38100700002)(83380400001)(166002)(473944003)(414714003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_DBBPR08MB48384A6FC8780E6DFCE384698EE89DBBPR08MB4838eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5428
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c4c788df-95e0-4bcc-14ef-08dae3f875cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z5I+KSc7+0ca9veQQmFuThqQTtTs5BdVxSRAKHGEkKyv0OGdYltvEGYzjluayS0BWbpwu5Qe5HP2UbV7vSdY2S4WrBaVzcFmxHONs30OCVDg0KLqbXjaBxNfCJ1oFBevuSv9kENXLm2J4kLHCTBqPwHfcucjL/8U66fbyls3o8ZyNjj6pY+o2dP+YdFKNgIjqYUpUUQHEMJ9F6f/vKdwLgM9bSJbZmjLunlzBKhli1wTSdgHNrgahvHAQh0C75wLynJp9nZA+KJReUnMukY0AoKnogodmqOHEQrqXMm0h+bx80bCyjWNY5DeBsiu2WtrxD1tKAQaRTyH4pIgQw7aIzZfI99YU2tAZ0lvaSOpXqiGNUUD9JWgFkYdUEUYHpvlNBEizL7FlUJFNSv/8sDJZuwL7SOf0wxZ5CgoMgEF7Brrqz+Ye+g7dkjIddz8AEMG/j1qzNl0XeAu9PAbYpwmPQ+wv6kc7YPXvSf6ptBzCcvCyeElFjAZeTd0b0r7IG+ooOqydTcQgtAfgTCl4y9wTw5RGJ3vsQUztfzHWoto2ptXTB7Q0C+HJFkQcRLm1XU5VhkczADzwe70C7K7zOvjsDHRIVwPfMBuYnH8k+domDk8QWQRoOGlI1RcjoyoRqNqvO7DTxhDBFt/2GY4uJ2ySadfQFWfICNZwirXSlK/JIqIwEGDOrOqbCB6auFgHmxMcHt6ssT92Z/jupCJ2ZWpVksGbqKW5HrDvJkFOhmxhHV04Ce6zJ1DXMfKz10W0xff3fflRxENrAjFXNU1bL/NhbQeP+KBmToLQOi737QMzT+95ypgKBLaM5IQoxxDH+s6k9kxz1BVmVwF/J7DRPgHvQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(66899015)(6862004)(8936002)(36860700001)(52536014)(4001150100001)(30864003)(19627405001)(5660300002)(2906002)(41300700001)(83380400001)(55016003)(82740400003)(4326008)(82310400005)(8676002)(70586007)(70206006)(356005)(166002)(81166007)(40480700001)(47076005)(316002)(6506007)(186003)(7696005)(86362001)(40460700003)(26005)(54906003)(966005)(33656002)(336012)(478600001)(53546011)(9686003)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 08:42:38.6500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7137504e-e7b5-4d1d-2561-08dae3f87b51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9703
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Dec 2022 08:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4224

--_000_DBBPR08MB48384A6FC8780E6DFCE384698EE89DBBPR08MB4838eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Sumit Garg <sumit.garg@linaro.org>
Sent: Thursday, December 22, 2022 6:48 AM
To: Emekcan Aras <Emekcan.Aras@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ross=
 Burton <Ross.Burton@arm.com>; Jon Mason <Jon.Mason@arm.com>; nd <nd@arm.co=
m>
Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os ve=
rsion

On Wed, 21 Dec 2022 at 21:29, Emekcan Aras <Emekcan.Aras@arm.com> wrote:
>
>
>
> ________________________________
> From: Sumit Garg <sumit.garg@linaro.org>
> Sent: Wednesday, December 21, 2022 3:37 PM
> To: Emekcan Aras <Emekcan.Aras@arm.com>
> Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ro=
ss Burton <Ross.Burton@arm.com>; Jon Mason <Jon.Mason@arm.com>; nd <nd@arm.=
com>
> Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os =
version
>
> On Wed, 21 Dec 2022 at 20:10, <emekcan.aras@arm.com> wrote:
> >
> > From: Emekcan Aras <emekcan.aras@arm.com>
> >
> > There is a new optee version 3.19. Currently, qemuarm-secureboot cannot=
 boot
> > optee 3.19 out-of-the-box.
>
> This sounds strange since Qemu is regularly tested in OP-TEE build CI
> as well as 3.19 release [1]. Is it really an OP-TEE related issue? Can
> you share details of the boot error you are observing?
>
> [1] https://github.com/OP-TEE/optee_os/commit/afacf356f9593a7f83cae9f9602=
6824ec242ff52
>
> -Sumit
>
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 Panic 'Failed mapping FIP SPs' at c=
ore/arch/arm/kernel/secure_partition.c:1223 <sp_init_all>

This file won't even compile if CFG_SECURE_PARTITION=3Dn which is the
default configuration. So how does it get enabled for Qemu using
OP-TEE 3.19?

I don't know. I saw that you've developed the qemu recipes. So hoping that =
you might answered this :)
Maybe optee 3.19 set this explicitly. This patchset was already reviewed by=
 maintainers actually and ran on different platforms.
It could be related to the recipe as well, but as you can see I'm not doing=
 anything complicated there.

> 2022-12-21 11:33:27 - INFO - E/TC:0 0 TEE load address @ 0xcf412000
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 Call stack:
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41eb3c
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42bafc
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41bd4c
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42d548
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41e268
> 2022-12-21 11:33:27 - INFO - runqemu - INFO - SIGTERM received
> 2022-12-21 11:33:27 - INFO - runqemu - INFO - Cleaning up
> 2022-12-21 11:33:27 - INFO - runqemu - INFO - Host uptime: 1436.86
> 2022-12-21 11:33:27 - INFO -
> 2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specified
> 2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specified
>
> This is the error message. We also have the same issue for n1sdp since th=
e new optee is looking for an SP manifest in FIP..

AFAIK, secure partitions are not enabled by default in OP-TEE. So how
does that get enabled for Qemu? Also, I can see from your patch-set
that you enable secure partitions explicitly for n1sdp.

> Need to create a bbappend or an inc file for qemuarm-secureboot as well w=
here the necessary flags are set. Just left it for now since there are othe=
r platforms that use optee 3.18 version. I think this can be fixed relative=
ly easily when all the platforms upgrades to 3.19.

I would suggest that we update Qemu as part of OP-TEE uprev as that is
something which others could test as well as something that can be
tested in CI as well.

I kindly disagree with this :) Normally, there is always an uprev work for =
components every now and then. Someone pushes a new recipe for the new vers=
ion and if any platform fails, Maintainers ask platform-maintainers to fix =
it. At least that's our experience on corstone1000 and it makes sense, to b=
e honest. I think optee uprev work and upgrading other platforms should go =
separately if it doesn't work out-of-the-box. I.E. Next month, I'll update =
corstone1000 to optee 3.19, because it doesn't work quite right with the ne=
w version. However, this is not related to the new recipe, it's rather rela=
ted to configurations.

-Sumit

>
> -Emek
>
> > This pins optee-os version to 3.18 for
> > qemuarm-secureboot.
> >
> > Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> > ---
> >  meta-arm/conf/machine/qemuarm-secureboot.conf   | 3 +++
> >  meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm-secureboot.conf
> > index f08b84fe..db02dc68 100644
> > --- a/meta-arm/conf/machine/qemuarm-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
> > @@ -21,3 +21,6 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
> >  IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
> >
> >  MACHINE_FEATURES +=3D "optee-ftpm"
> > +
> > +PREFERRED_VERSION_optee-os ?=3D "3.18.%"
> > +
> > diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm=
/conf/machine/qemuarm64-secureboot.conf
> > index 55c4cab4..7277817d 100644
> > --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > @@ -23,3 +23,6 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
> >  IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
> >
> >  MACHINE_FEATURES +=3D "optee-ftpm"
> > +
> > +PREFERRED_VERSION_optee-os ?=3D "3.18.%"
> > +
> > --
> > 2.17.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#4220): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/4220
> > Mute This Topic: https://lists.yoctoproject.org/mt/95807186/1777089
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.gar=
g@linaro.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

--_000_DBBPR08MB48384A6FC8780E6DFCE384698EE89DBBPR08MB4838eurp_
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
<font style=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#00000=
0"><b>From:</b> Sumit Garg &lt;sumit.garg@linaro.org&gt;</font>
<div id=3D"divRplyFwdMsg" dir=3D"ltr" class=3D"elementToProof"><font style=
=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>Sent:=
</b> Thursday, December 22, 2022 6:48 AM<br>
</font></div>
<div dir=3D"ltr"><font style=3D"font-size:11pt" face=3D"Calibri, sans-serif=
" color=3D"#000000"><b>To:</b> Emekcan Aras &lt;Emekcan.Aras@arm.com&gt;<br=
>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Ross Burton &lt;Ross.Burton@arm.com&gt;; Jon Mason &lt;Jon.Mason@a=
rm.com&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin opte=
e-os version</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">On Wed, 21 Dec 2022 at 21:29, Emekc=
an Aras &lt;Emekcan.Aras@arm.com&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Sumit Garg &lt;sumit.garg@linaro.org&gt;<br>
&gt; Sent: Wednesday, December 21, 2022 3:37 PM<br>
&gt; To: Emekcan Aras &lt;Emekcan.Aras@arm.com&gt;<br>
&gt; Cc: meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.or=
g&gt;; Ross Burton &lt;Ross.Burton@arm.com&gt;; Jon Mason &lt;Jon.Mason@arm=
.com&gt;; nd &lt;nd@arm.com&gt;<br>
&gt; Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-=
os version<br>
&gt;<br>
&gt; On Wed, 21 Dec 2022 at 20:10, &lt;emekcan.aras@arm.com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Emekcan Aras &lt;emekcan.aras@arm.com&gt;<br>
&gt; &gt;<br>
&gt; &gt; There is a new optee version 3.19. Currently, qemuarm-secureboot =
cannot boot<br>
&gt; &gt; optee 3.19 out-of-the-box.<br>
&gt;<br>
&gt; This sounds strange since Qemu is regularly tested in OP-TEE build CI<=
br>
&gt; as well as 3.19 release [1]. Is it really an OP-TEE related issue? Can=
<br>
&gt; you share details of the boot error you are observing?<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/OP-TEE/optee_os/commit/afacf356f9593=
a7f83cae9f96026824ec242ff52" data-auth=3D"NotApplicable">
https://github.com/OP-TEE/optee_os/commit/afacf356f9593a7f83cae9f96026824ec=
242ff52</a><br>
&gt;<br>
&gt; -Sumit<br>
&gt;<br>
&gt; 2022-12-21 11:33:27 - INFO - E/TC:0 0 Panic 'Failed mapping FIP SPs' a=
t core/arch/arm/kernel/secure_partition.c:1223 &lt;sp_init_all&gt;<br>
<br>
This file won't even compile if CFG_SECURE_PARTITION=3Dn which is the<br>
default configuration. So how does it get enabled for Qemu using<br>
OP-TEE 3.19?<br>
</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">I don't know. I saw that you've dev=
eloped the qemu recipes. So hoping that you might answered this :<span clas=
s=3D"FluidPluginCopy ContentPasted0">)</span>
<br>
Maybe optee 3.19 set this explicitly. This patchset was already reviewed by=
 maintainers actually and ran on different platforms.</div>
<div class=3D"PlainText elementToProof">It could be related to the recipe a=
s well, but as you can see I'm not doing anything complicated there.
<br>
</div>
<div class=3D"PlainText elementToProof"><br>
&gt; 2022-12-21 11:33:27 - INFO - E/TC:0 0 TEE load address @ 0xcf412000<br=
>
&gt; 2022-12-21 11:33:27 - INFO - E/TC:0 0 Call stack:<br>
&gt; 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41eb3c<br>
&gt; 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42bafc<br>
&gt; 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41bd4c<br>
&gt; 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42d548<br>
&gt; 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41e268<br>
&gt; 2022-12-21 11:33:27 - INFO - runqemu - INFO - SIGTERM received<br>
&gt; 2022-12-21 11:33:27 - INFO - runqemu - INFO - Cleaning up<br>
&gt; 2022-12-21 11:33:27 - INFO - runqemu - INFO - Host uptime: 1436.86<br>
&gt; 2022-12-21 11:33:27 - INFO -<br>
&gt; 2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specif=
ied<br>
&gt; 2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specif=
ied<br>
&gt;<br>
&gt; This is the error message. We also have the same issue for n1sdp since=
 the new optee is looking for an SP manifest in FIP..<br>
<br>
AFAIK, secure partitions are not enabled by default in OP-TEE. So how<br>
does that get enabled for Qemu? Also, I can see from your patch-set<br>
that you enable secure partitions explicitly for n1sdp.<br>
<br>
&gt; Need to create a bbappend or an inc file for qemuarm-secureboot as wel=
l where the necessary flags are set. Just left it for now since there are o=
ther platforms that use optee 3.18 version. I think this can be fixed relat=
ively easily when all the platforms
 upgrades to 3.19.<br>
<br>
I would suggest that we update Qemu as part of OP-TEE uprev as that is<br>
something which others could test as well as something that can be<br>
tested in CI as well.<br>
</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">I kindly disagree with this :<span =
class=3D"FluidPluginCopy ContentPasted1">) Normally, there is always an upr=
ev work for components every now and then. Someone pushes a new recipe for =
the new version and if any platform
 fails, Maintainers ask platform-maintainers to fix it. At least that's our=
 experience on corstone1000 and it makes sense, to be honest. I think optee=
 uprev work and upgrading other platforms should go separately if it doesn'=
t work out-of-the-box. I.E. Next
 month, I'll update corstone1000 to optee 3.19, because it doesn't work qui=
te right with the new version. However, this is not related to the new reci=
pe, it's rather related to configurations.
</span><br>
</div>
<div class=3D"PlainText elementToProof"><br>
-Sumit<br>
<br>
&gt;<br>
&gt; -Emek<br>
&gt;<br>
&gt; &gt; This pins optee-os version to 3.18 for<br>
&gt; &gt; qemuarm-secureboot.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Emekcan Aras &lt;emekcan.aras@arm.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta-arm/conf/machine/qemuarm-secureboot.conf&nbsp;&nbsp; |=
 3 +++<br>
&gt; &gt;&nbsp; meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++<br>
&gt; &gt;&nbsp; 2 files changed, 6 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta=
-arm/conf/machine/qemuarm-secureboot.conf<br>
&gt; &gt; index f08b84fe..db02dc68 100644<br>
&gt; &gt; --- a/meta-arm/conf/machine/qemuarm-secureboot.conf<br>
&gt; &gt; +++ b/meta-arm/conf/machine/qemuarm-secureboot.conf<br>
&gt; &gt; @@ -21,3 +21,6 @@ WKS_FILE_DEPENDS =3D &quot;trusted-firmware-a&q=
uot;<br>
&gt; &gt;&nbsp; IMAGE_BOOT_FILES =3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; MACHINE_FEATURES +=3D &quot;optee-ftpm&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PREFERRED_VERSION_optee-os ?=3D &quot;3.18.%&quot;<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/me=
ta-arm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; &gt; index 55c4cab4..7277817d 100644<br>
&gt; &gt; --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; &gt; +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; &gt; @@ -23,3 +23,6 @@ WKS_FILE_DEPENDS =3D &quot;trusted-firmware-a&q=
uot;<br>
&gt; &gt;&nbsp; IMAGE_BOOT_FILES =3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; MACHINE_FEATURES +=3D &quot;optee-ftpm&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PREFERRED_VERSION_optee-os ?=3D &quot;3.18.%&quot;<br>
&gt; &gt; +<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#4220): <a href=3D"https://lists.yoctoproject.=
org/g/meta-arm/message/4220" data-auth=3D"NotApplicable">
https://lists.yoctoproject.org/g/meta-arm/message/4220</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/958=
07186/1777089" data-auth=3D"NotApplicable">
https://lists.yoctoproject.org/mt/95807186/1777089</a><br>
&gt; &gt; Group Owner: meta-arm+owner@lists.yoctoproject.org<br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm=
/unsub" data-auth=3D"NotApplicable">
https://lists.yoctoproject.org/g/meta-arm/unsub</a> [sumit.garg@linaro.org]=
<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_DBBPR08MB48384A6FC8780E6DFCE384698EE89DBBPR08MB4838eurp_--

