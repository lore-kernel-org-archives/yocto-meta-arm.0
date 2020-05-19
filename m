Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.72])
 by mx.groups.io with SMTP id smtpd.web11.9123.1589884809864486820
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 03:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PdNOphZs;
 spf=pass (domain: arm.com, ip: 40.107.1.72, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KnHBOmhvfK0M/+DoAcHFgj0tOaJJQiZipsVHa8NaXA=;
 b=PdNOphZsNY2YWitihhlF9DpvEnKwl9RMJs6uYLJUqNdrPWOSC9gU2CVXjRDGvHUdU1a+76ohCbvEiCnBUIEXE5qajwwTHdWCbHGaob85+/mlKDIUkCb2hGavzcNQLBaaXcE57D5mFHe7zNwRyHPs11TyYnyWQMLfygjcABOmP+I=
Received: from AM6P192CA0047.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::24)
 by DB7PR08MB3146.eurprd08.prod.outlook.com (2603:10a6:5:25::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Tue, 19 May
 2020 10:40:07 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::b8) by AM6P192CA0047.outlook.office365.com
 (2603:10a6:209:82::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Tue, 19 May 2020 10:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Tue, 19 May 2020 10:40:05 +0000
Received: ("Tessian outbound facc38080784:v57"); Tue, 19 May 2020 10:40:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 097d726cfd65d685
X-CR-MTA-TID: 64aa7808
Received: from f84dfc9830bc.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C2AFB76E-431D-4E6E-99B8-692AE4605027.1;
	Tue, 19 May 2020 10:39:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f84dfc9830bc.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 May 2020 10:39:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2TKM2hZXwnkRKG9KQ+7etVMYUgYEh+bMmSMRbcKkrCHSqZ/LIsSE/7lhd9KnherlJJY7wQT2t3n4ONKsKeFOkqvH9rKQZR8j/TbtfTd+veI5TJ5e0W9htddpQ//t6qOCSFnVO3TIsZeW8dYMj4rcPlzMQYYeUB/b6l3oGKUyMtWDPSKewaQebPEQ/32LIy/Y4k1O3lv/5TNsYInZJVbZfUjDSSIDlq5wG6svvIR7a6zHxFxpD1naOu9dx3jlkWtC4Ql0SdXSkd29Yzf+Aw52xaSsHnWt2xR21Q7deMTU6pLjws3Eb0bGgUib+muipWWJtZ1oeRPWYtTJp3V3OYpQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KnHBOmhvfK0M/+DoAcHFgj0tOaJJQiZipsVHa8NaXA=;
 b=a8FDSAO7U6DLt6lGuyj22xOrAa656w571rq1bfOclLU3rHqysAZOvkIUmSuHwFm9m965r74xXV5QJ3+fVqL82+oRChrmYwpWxcQ+K7uJI8vjZ0eeViasttEhsEL8uv/qPSQ4ECrh/OPZMbUA6ViJZRUHtW16oamL5Q4fwGFAnxBaZKbd15vO5JQdUaQnqlgU1TLs+44T9PaOG/WoRF647zoN1sZuhiNfHVQpTReYzjYxTx3CUWj3gNev6rEBdJaNJLqlNEILvZpO9WWFik1Ec7x28zv4t5R1jlnWpo038ZI/ch1l8Wv6HKPfTJT6ibhrl2MGV2J2iWuIy6Yt1qNaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KnHBOmhvfK0M/+DoAcHFgj0tOaJJQiZipsVHa8NaXA=;
 b=PdNOphZsNY2YWitihhlF9DpvEnKwl9RMJs6uYLJUqNdrPWOSC9gU2CVXjRDGvHUdU1a+76ohCbvEiCnBUIEXE5qajwwTHdWCbHGaob85+/mlKDIUkCb2hGavzcNQLBaaXcE57D5mFHe7zNwRyHPs11TyYnyWQMLfygjcABOmP+I=
Authentication-Results-Original: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB4137.eurprd08.prod.outlook.com (2603:10a6:10:a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 10:39:57 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4%6]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 10:39:57 +0000
Message-ID: <9cbc4eebd7db6b878ee65dff48aa5c9246c02dc9.camel@arm.com>
Subject: Re: [meta-arm] [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: denis@denix.org
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, 
	Diego Sueiro <Diego.Sueiro@arm.com>
Date: Tue, 19 May 2020 16:09:52 +0530
In-Reply-To: <20200518205732.GN11927@denix.org>
References: <1589506580-40706-1-git-send-email-denis@denix.org>
	 <23216.1589528602075061452@lists.yoctoproject.org>
	 <160FD0B211B491C0.9570@lists.yoctoproject.org>
	 <DB8PR08MB496999D8C3226CA0370A8124FABB0@DB8PR08MB4969.eurprd08.prod.outlook.com>
	 <20200518205732.GN11927@denix.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-ClientProxiedBy: LO2P265CA0354.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::30) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.37.8.180] (217.140.96.140) by LO2P265CA0354.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Tue, 19 May 2020 10:39:56 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a18cb045-3f75-4289-e618-08d7fbe0fe57
X-MS-TrafficTypeDiagnostic: DB8PR08MB4137:|DB7PR08MB3146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3146BBD1FF5D4683D6CD7197FAB90@DB7PR08MB3146.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:9508;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TTbAk3NQU7nJEBgytdHzDcUx/S7xiBE7HvC+BXrIT0jdmZex0waGHXUJMTjZOHo8h+gpluw140A+dZC79cqxXvXUv8vpWKwCKyEBxz0vugaxxpW9lq0ysKOQcoMkjB8MZWZ1XrgORArl9beZs8BamcTZfB9xHg+I5x5aAA0dgQBebyvIjqMf0KXW++QL4cOkJ/HzMII1NNI5VRYpr55ANvQL0w/RxjBcxz4aquOTLyVIw4jn40gGdOFgIw1juSTT2oF7U1GVTKXXmF4EUzajAs/hlPIz7yXyA7jkQDOl97x3+cjKLJjDRcr26DEKIO++v7rlKmqGuTwDyCPzHAh+7cx9osJXIiSKZDOYZ6YzdIgLTlJgoaSvCVvJUbX+T11Vaut9VHn7Tg8CemBdQZEMm/lsmF/jC3C8RxcMX34/p/VsT47NczqgDoDqr7Y68a1yRYvnAzZjatsN9WsD7VAhK8WTmahVFOraOibB6l29v4S6Ntg87VtmnLVZf1fgenw1Fof9RxHZhK+vrS8yxIvDcaeZ2RC6Wb3VHqmeeIySgF+c28i/wC8MsCIaP8KFICNWiBbbJsl1v1/RMlECKB0Q6bJ8f+duunzOBbcFFaj5pqjXqGbx2/g7jjCjwiPYaDnR
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(6486002)(16576012)(316002)(54906003)(2906002)(956004)(6916009)(2616005)(478600001)(6666004)(86362001)(26005)(966005)(186003)(16526019)(5660300002)(52116002)(8936002)(4326008)(8676002)(66556008)(44832011)(36756003)(66476007)(66946007)(99106002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 QsMw6BNuBJx3dwtxwFu84Y+KCdxP4fQVPOV7K+gefvoUVNsaH55+g//OWVmLARG8+/+Xir9kuVcfGp9UP1xwY0Cj1hgESGtkxc1gqmcJUvFlr6fpy/CxFpQqv0s6yaXUiUO4xeSV2KVaByab5aa66CXzszmCDfKPvX/9AYAZTknpkZ1ngc5G5svv7zUhRxqIZweWAxH8UGaaNdrpzwmQqTCpJBkHLF7Q6wpMCXssNlw7kjjw2s0aIjWXeAF1Jzu3oCgaAxalrM/Mpxhu37mchYosNLcA6aOIkGeJCSJZWGfxwmPTwZCDm79NKxLlacEp+A1fwfu1Xlaef6UyGg+U4QYvdVhaioUkFnQkYyEAp5yB1yntp6z0+YZYzA8P8ywfpRFvefFjoXyBGx+6zut4jU66LRVy0kC/Z54TUrwzCd6BzeFgzUcoiC1sW2hdC1mmATIRRFBVQpGcS72MnBavdWX2kRW1MBJhWOA6PQI0pvjp1i6au4FeNJ6xpRRrgK5S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4137
Original-Authentication-Results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(26005)(5660300002)(34206002)(2906002)(47076004)(186003)(4326008)(16526019)(81166007)(356005)(82740400003)(82310400002)(16576012)(966005)(8676002)(956004)(8936002)(2616005)(44832011)(36756003)(478600001)(86362001)(6666004)(336012)(70586007)(70206006)(36906005)(54906003)(316002)(6486002)(99106002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cbda12dc-5352-42ae-ec13-08d7fbe0f961
X-Forefront-PRVS: 040866B734
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yMIWLLMM5+6hPDMlJywIhwkPBtkqLoNmBDA1jj3kha9bMpksaMV9maJVLWkaxkBZMVo0Lceha12DIRcGKYvSLR5r2HQO29edhNol3r7pq5GbUpao8U+0W7jzBnu4uaVsHkvAyBWxR+7ZbfCWVgn+DYFTo8aAbRt33sUQthWyfDQT9I9C/uuumPRAhwdcsjHEUjhdDke3neKCLJGGf7WcemSOsBxqPimRBLXQxBPoo4Y2uis4wUH50V7+EGPVSVkxSKGH9H5YK49BOa5tBnLBqIryjjkfAHuFmBJGvVE1NU1qGy7U6C36oPS4+gdT55nF7G+1UWkHhmZAs0tqQFUIrmHJT4dWcfU3vQq33VzN093ZM9HwIOi1helfupMI+A25KqdQXv+ShEf2ld2jUxmgL+5QUdVC6pFhA+AJ2YpLHLP14uVql2J+SkQ7imnUiAu8+VrbHHA1dDl0QK23EHINgIecvxWU3oKfbVWtmaMUf83zMfZJnepf3rQqpyliXS2DlYiaGh31m6AI/ODqhYkK13eoH8G2WAmRWlne3IqW0ZgwjLl7brrcUIbS8LlWHoSkBp9jFkpRhWocxr9tnKKBvh0nogAiEyf7aK6xaB1003QoJXD5jagQU5eeVgiiiZRXTFw3zhk9OUUFqNxzQBMlEKCrzJ7F8CatednHvmztvEM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 10:40:05.3904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a18cb045-3f75-4289-e618-08d7fbe0fe57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3146
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-18 at 16:57 -0400, Denys Dmytriyenko via
lists.yoctoproject.org wrote:
> Khasim,
>
> I don't think you are using it correctly, see below.
>

Looks like, I had added
EXTRA_IMAGEDEPENDS +=3D "virtual/arm-none-eabi-gcc"

In my machine conf file and that was resulting in below errors.

I moved the dependency to my target recipe (scp-firmware), I don't see
these errors now.

have verified the patch, Good to go from my side.

Thanks.

Regards,
Khasim

> On Sun, May 17, 2020 at 02:43:44PM +0000, Khasim Mohammed wrote:
> > > From: Jon Mason <jdmason@kudzu.us>
> > >
> > > Adds a recipe to pull down the prebuilt GCC for compiling on
> > > Cortex-R
> > > and Cortex-M processors from ARM. This toolchain is required to
> > > build
> > > Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must
> > > compile
> > > some firmware for the M0 coprocessor.
> > >
> > > This was originally taken from meta-rockchip, but has been
> > > modified from
> > > mailing list feedback.
> > > I observe one issue when building for n1sdp,
> > > gcc-arm-none-eabi PROVIDES virtual/arm-none-eabi-gcc but was
> > > skipped: incompatible with host aarch64-poky-linux (not in
> > > COMPATIBLE_HOST)
> >
> > Actually I found two issue
> > 1) gcc-arm-none-eabi PROVIDES virtual/arm-none-eabi-gcc but was
> > skipped: incompatible with host aarch64-poky-linux (not in
> > COMPATIBLE_HOST)
> > > +COMPATIBLE_HOST =3D "x86_64.*-linux"
> >
> > changed to : "x86_64.*|aarch64.*" to build.
>
> Are you trying to use it on aarch64 host?
> Or are you trying to build ot for the target?
>
> This is a prebuilt binary that only runs on x86_64.
> And, obviously, it is not meant for the target - the error is
> correct,
> arm-none-eabi !=3D aarch64-poky-linux
>
>
> > 2) ERROR: gcc-arm-none-eabi-9-2019-q4-major-r0 do_package_qa: QA
> > run found fatal errors. Please consider fixing them.
> > added below line to fix :
> >
> > inherit native
>
> If you check the list of v3 changes below, you'll see that inherit
> native was
> removed. It is not needed, due to BBCLASSEXTEND =3D "native nativesdk"
> So, basically, this is not a proper cross toolchain recipe - it is a
> very
> simplistic native and nativesdk one. You shouldn't use it for any
> Linux
> builds, it's meant just for very limited bare-metal builds...
>
>
> > > v3 changes:
> > > * rename recipe to not contain -native in the name
> > > * fix typo in "subsidiaries" word
> > > * use SUMMARY instead of DESCRIPTION
> > > * remove inherit native
> > > * add FILES_${PN} for nativesdk package
> > > * add extra INSANE_SKIP_${PN} due to prebuilt binary package
>
> In other words, this is correct:
> $ bitbake gcc-arm-none-eabi-native
> $ bitbake nativesdk-gcc-arm-none-eabi
>
> This is incorrect, and is blocked on purpose:
> $ bitbake gcc-arm-none-eabi
>
>
> > > +COMPATIBLE_HOST =3D "x86_64.*-linux"
> >
> > Can this be changed to : "x86_64.*|aarch64.*"
>
> No, it should not - that would be incorrect!
>
>=20

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
