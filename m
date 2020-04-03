Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.85])
 by mx.groups.io with SMTP id smtpd.web10.949.1585934535574430488
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Apr 2020 10:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tQUUFSw6;
 spf=pass (domain: arm.com, ip: 40.107.8.85, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALudjS5cpjtx9GQnVFC5/YP9m2CrMsDlVlUYb89J4Fw=;
 b=tQUUFSw6mUHd2Dw47WjCbZl/YNdywsnE4ZZvIsfAFrFlinRf57bWp25tzyja77GG6sArtzKzPWxXdMcQaLR3RmzvZ1uuqMshTuMSZfFGdHiuW5nFEDkXLx339gTKVS4mO5vwR7KXGkQMXCwpw2lWwHBLfGaNF3lx/6W5qGBJU1o=
Received: from AM6PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:20b:2e::35)
 by VI1PR08MB4495.eurprd08.prod.outlook.com (2603:10a6:803:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Fri, 3 Apr
 2020 17:22:12 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::9f) by AM6PR05CA0022.outlook.office365.com
 (2603:10a6:20b:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 3 Apr 2020 17:22:12 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 3 Apr 2020 17:22:12 +0000
Received: ("Tessian outbound e2c88df8bbbe:v50"); Fri, 03 Apr 2020 17:22:12 +0000
X-CR-MTA-TID: 64aa7808
Received: from 692427b4f551.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 753C5F8C-48B9-4692-96EB-546F70DCA351.1;
	Fri, 03 Apr 2020 17:22:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 692427b4f551.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 03 Apr 2020 17:22:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLiKtzRne/2lk2vepkR9eS+2A+fY2TizAwTlW7P1TJzxucpongg9cZcA3vPQ0eq9eR1+STFrpZgG8Aiusg8Ikjsza8MgcAXCs2E3jHvqnnIj3kPZFLj1O2MgnPT0RvTeecH2YbpuwCSEmMNMZJe6AP0hIcXIA1PEKCLy6bTwZjn7w1cdqFIg3p6vo0MmH2Boyl3p+LArHYk/ONNoL4BXcnsgN6MPZ+DooIU7ysWcZQ1ctDBo82QXW2Gph5TSoNt6YwzuB6LZPOGy2xECKUsypgYTYDu0gmUK83koHIN2rboj54UkZYHGzdaC0imj401ZA9ccwGJ+cCtE6TkQ9RN1SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALudjS5cpjtx9GQnVFC5/YP9m2CrMsDlVlUYb89J4Fw=;
 b=Pl6Q0Vk2xoUTOTFVOpkw0iAlI84oX//6q2bxkR1/eyQK0wEglYrl00qAVVY9avyQ7xmRqa0QDy+5EhDGYVtGFDzgala0uHxlGIb+6pv7tnTmDw+ygmVGpglEIIKdqERaRHaOU+PVaTOxVRi27eRPVxfplOWoh0YLVcAEbFq2Su6DDG4wpXsUlqeGpIZmRd220NOsJd0fN6kKADH7HhZyZ0OC9OFf8kOQKraEgb/zyLA7q/3lmFSt5qDOeiRd0YLODkp6AfxWLICTcCp/ADaGbXWAk+Pm6TQ3pdIMnmFUdEtR388mhU0k7tXSVZTm6XgGIB27zRpRPFd5RHGgkZhmMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALudjS5cpjtx9GQnVFC5/YP9m2CrMsDlVlUYb89J4Fw=;
 b=tQUUFSw6mUHd2Dw47WjCbZl/YNdywsnE4ZZvIsfAFrFlinRf57bWp25tzyja77GG6sArtzKzPWxXdMcQaLR3RmzvZ1uuqMshTuMSZfFGdHiuW5nFEDkXLx339gTKVS4mO5vwR7KXGkQMXCwpw2lWwHBLfGaNF3lx/6W5qGBJU1o=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB4131.eurprd08.prod.outlook.com (20.178.118.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Fri, 3 Apr 2020 17:22:05 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2878.016; Fri, 3 Apr 2020
 17:22:05 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH v2] optee-client: upgrade 3.7.0 -> 3.8.0, cleanup
Thread-Topic: [meta-arm] [PATCH v2] optee-client: upgrade 3.7.0 -> 3.8.0,
 cleanup
Thread-Index: AQHWCdF/inPvcLIYnkeYIZWEN6fW66hnpRBg
Date: Fri, 3 Apr 2020 17:22:05 +0000
Message-ID: 
 <AM0PR08MB39877F4597C500B5E1B8419792C70@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1601D50E2F786E6D.29801@lists.yoctoproject.org>
 <1585929820-14071-1-git-send-email-denis@denix.org>
In-Reply-To: <1585929820-14071-1-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: af9d7aa2-4376-40a7-9205-01e4cb6b9a99.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a492011a-0d7a-4b2b-5fe7-08d7d7f38c26
x-ms-traffictypediagnostic: AM0PR08MB4131:|VI1PR08MB4495:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB44950958EDBEFEB129CC92FB92C70@VI1PR08MB4495.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:75;OLM:2887;
x-forefront-prvs: 0362BF9FDB
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(86362001)(33656002)(5660300002)(2906002)(53546011)(8936002)(6916009)(6506007)(81156014)(478600001)(8676002)(7696005)(81166006)(9686003)(66946007)(66446008)(64756008)(71200400001)(186003)(52536014)(66556008)(66476007)(4326008)(55016002)(26005)(316002)(76116006);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ho3k5rF6wTMvOyOMjp+E0bRzD7wq83mKLepWwBshk939f0LPus+8m6Ah7ZedZwVyiFyIVaB/NWstEApcCLtyOxN2xrn53SvmkyY1f/MKcGAF99qTSnNVxc23nLQbUxKVxbo0lKwgJmzQ3CoGTaqJYAvHTqkrGt8+rKCAiGdHrGhBSCkN5wKrwDcyIsVe8EOgiWkm7KUd6h/Vhl0Hs/Pii07vZQ4x+rQ9OCKu4z+v35kYa5b45tRKSv4eoss2Mf68ou2HirpwEoIj1tX7sFXnLmY9sPBcdtaRfLFhUH4TXQFhzFKwKlbM0PGPuwiUTxhDCXPpyw8K/r4PioHvWqSJBZFE/e9f2sSOtntTnfoSo/q9GXA5o74K4DePGCAbrv/LqUTLlzHOE62XGBHl95++2ob7TV3CFoLg4guTmisyt+QpuCjrVN2sgRUOEJB5YJTgeW5Mokn7B6lrL84vcjHd5tI5f/1h2f6dyRh1yAuUzPCZSSWib63iB3IOdubyui2J+AOO9G8+gCLvAZF3JAnWOg==
x-ms-exchange-antispam-messagedata: 
 kHeva36ydK0nW4Qg/KgEBOa7xSV25wbMf6dR44xsGvIW62qjOnNtxErmhlEz8gkEUjbkNFugUaayvejYZI9gOYZjJ5TK3/Z9a2r9/rL934YzRB44mGoaasLyAIaNUUViG4Q3sEKW+ooPEFqAXxqOLw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4131
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966005)(9686003)(70206006)(52536014)(26005)(55016002)(5660300002)(186003)(70586007)(336012)(26826003)(478600001)(6916009)(8676002)(7696005)(81166006)(81156014)(8936002)(82740400003)(356004)(86362001)(53546011)(36906005)(316002)(2906002)(33656002)(6506007)(4326008)(47076004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c35c2991-4bd3-4399-05ad-08d7d7f38827
X-Forefront-PRVS: 0362BF9FDB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WPjs1OWFWuBT73PJQceRm2CPmyZlFrtcVNB98MZC8wVLPVVJSaKQKRfDtzHd6Bj5w1KO8WA/AVa59kyvwLYnPL09Y3gfewhMYcHuFDDeYFKSi4A3i/pUeLoCAqbGXm6q1jjqONlIn3yDQ9+ReLvtv8GGQcoHny3Cs+fMpkkqHSvtEyhry2MULNRypkanc1N1CNmCol60Eq0UIqmSxv7GBX+126BOmekk/x2AV2n/Dm7k7i13xabGlfihSLqv43k3+ia7fvPoiKdDQIarv0n1XmlIbrraTx7feJzRrNzMRZY4q2fUtuBu/9KpZ9IJ/rtbt8MZ8q5M/dTs6HPh1xnBCivjBchwvEIrRWFH1ZuM94Glc0BXDtrfVcdqLbcYPeXuvWd6w4IbMWExJYyRpZQae0KfPq5Zjj4RgFJQSfe54k8+7FO8QjFH5P6GgBYUikLOlFJqCwsDdG36fj0WLaDIGjRZyHx8gzrP7J3gQj5iQ9firz+tzS6XZxihXDMeDX8/Ph+X6WxUl8XyGoLh0+GYnlagTaB9qBJ/bi5wI4GfRXp9ciYwWRS5vPIqIJXiTc/KozpMML2guyNupIo45B0C4g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2020 17:22:12.3933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a492011a-0d7a-4b2b-5fe7-08d7d7f38c26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4495
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 03 April 2020 17:04
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH v2] optee-client: upgrade 3.7.0 -> 3.8.0, clea=
nup
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
> v2 - correct typo in the commit log - use dots in version instead of comm=
as
>
>  .../optee/{optee-client.bb =3D> optee-client_git.bb}   | 20 ++++++++++++=
--------
>  1 file changed, 12 insertions(+), 8 deletions(-)  rename meta-arm/recipe=
s-
> security/optee/{optee-client.bb =3D> optee-client_git.bb} (63%)
>
> diff --git a/meta-arm/recipes-security/optee/optee-client.bb b/meta-
> arm/recipes-security/optee/optee-client_git.bb
> similarity index 63%
> rename from meta-arm/recipes-security/optee/optee-client.bb
> rename to meta-arm/recipes-security/optee/optee-client_git.bb
> index 519683a..a25d343 100644
> --- a/meta-arm/recipes-security/optee/optee-client.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> @@ -1,18 +1,21 @@
> -SUMMARY =3D "OPTEE Client"
> -HOMEPAGE =3D "https://github.com/OP-TEE/optee_client"
> +SUMMARY =3D "OP-TEE Client API"
> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Normal
> World Client side of the TEE"
> +HOMEPAGE =3D "https://www.op-tee.org/"
>
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60a743e5b"
>
> -PV =3D "3.7.0+git${SRCPV}"
> +PV =3D "3.8.0+git${SRCPV}"
>
>  inherit python3native systemd
>
> -SRC_URI =3D "git://github.com/OP-TEE/optee_client.git \
> -           file://tee-supplicant.service"
> -S =3D "${WORKDIR}/git"
> +SRCREV =3D "be4fa2e36f717f03ca46e574aa66f697a897d090"
> +SRC_URI =3D " \
> +    git://github.com/OP-TEE/optee_client.git \
> +    file://tee-supplicant.service \
> +"
>
> -SRCREV =3D "bc0ec8ce1e4dc5ae23f4737ef659338b7cd408fe"
> +S =3D "${WORKDIR}/git"
>
>  SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
>
> @@ -25,7 +28,8 @@ do_install() {
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
>
> -    cp -a ${S}/out/export/usr/include ${D}/usr/
> +    install -d ${D}${includedir}
> +    install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${includedir}
>
>      sed -i -e s:/etc:${sysconfdir}:g \
>             -e s:/usr/bin:${bindir}:g \
> --
> 2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
