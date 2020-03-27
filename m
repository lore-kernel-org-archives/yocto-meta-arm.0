Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.79])
 by mx.groups.io with SMTP id smtpd.web12.14193.1585322616370890131
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nhIuYfKD;
 spf=pass (domain: arm.com, ip: 40.107.7.79, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVWMa8GLR9eRShpHmwzJKXMwi7s+GJ38Prg9CAGICms=;
 b=nhIuYfKDcfPGfN6SGF+RQJH0PEFfqeY0m9d2X4KXwcssujJ3yjpkbhdJA3ftVCyY4sFrHKrWgmbvABLj2D1z0iXVuIUG32E8L8OysdUWbDb5pnXdwB9j/+CXZyZo0mFghgITokwrIdJwzjA00ujtBI+CdIHQYkZAXD1xt6at2sA=
Received: from AM6PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:20b:f0::36)
 by AM4PR0802MB2258.eurprd08.prod.outlook.com (2603:10a6:200:62::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 15:23:30 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::b1) by AM6PR04CA0059.outlook.office365.com
 (2603:10a6:20b:f0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:23:30 +0000
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
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:23:30 +0000
Received: ("Tessian outbound 6835489d965f:v48"); Fri, 27 Mar 2020 15:23:30 +0000
X-CR-MTA-TID: 64aa7808
Received: from 5c9fe806081d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7EE8ED5B-665D-4977-8238-5D6F24CB4407.1;
	Fri, 27 Mar 2020 15:23:25 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5c9fe806081d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:23:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTCMneHkBMF7sdJgxV1P6Vk/AHg9F119yWwkIFKdYnmG6eC4pkuEjwSWXKPwRpaBlRp70010qJ1VD6A2TacQkhAxr5gjBI5AQkaUKUYAKpgBXm8XRGXDnv5Y5ChPExJTfC57eCmjHNkEYHmgElyOOt+r8NfHWPUAN/kfJOnYJ0MU8VssLv0e1rFO0TrPs0jBxvYfVQxUs0l5OJWsjLboCwXjGXr1wxwWBzJnObA5VLxqxeL4xyagoWg47+tCHafDf7h0soiyBML0B0yMjxWnCpE9d/9QKzL3ILkygq3TLnoDCtqRhhsEO9GlHMdVCJE1ftR4Di0s0YFrdumYZx3a7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVWMa8GLR9eRShpHmwzJKXMwi7s+GJ38Prg9CAGICms=;
 b=hxl5T+wFSJevWsvpQp/m3T0Xo2O4U76Qcrxg8iMUIhCAT5zUtW6EVzMEhxizGXw+MVC4opQvbmUwhTrJOJCOaIFrGpUjM9H0o+vbmV3vaJ0NLKU+/HPSS+pe2nJaLW+gQ/xfDJzqXFcGtWkcVkhrKsdP004NtpozDBxRqKMfMUypRExrDI/fumDG0RIosVulJQJcl+lHCMNZShJgldLP5IFA+f9s/JNmgmSk2vzrjpef6jKf9QyjjN7ZyBeMO/wToYIKaDq313sSR1fWFLVtFqSuT7zpsU+++teheq0Rt/UcyVSqyTQWbpda+wPIkT6nGbmXEggdmkxyupRENQoS9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVWMa8GLR9eRShpHmwzJKXMwi7s+GJ38Prg9CAGICms=;
 b=nhIuYfKDcfPGfN6SGF+RQJH0PEFfqeY0m9d2X4KXwcssujJ3yjpkbhdJA3ftVCyY4sFrHKrWgmbvABLj2D1z0iXVuIUG32E8L8OysdUWbDb5pnXdwB9j/+CXZyZo0mFghgITokwrIdJwzjA00ujtBI+CdIHQYkZAXD1xt6at2sA=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3650.eurprd08.prod.outlook.com (20.177.108.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 27 Mar 2020 15:23:23 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:23:23 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 6/7] arm-autonomy: Create quick start documentation
Thread-Topic: [meta-arm] [PATCH 6/7] arm-autonomy: Create quick start
 documentation
Thread-Index: AQHWBCWfr6DKhIMtE0i0Uf4CwYYiH6hcjuvw
Date: Fri, 27 Mar 2020 15:23:23 +0000
Message-ID: 
 <AM0PR08MB39873DC0DA83D7E9025A013C92CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
 <20200327105010.400-7-bertrand.marquis@arm.com>
In-Reply-To: <20200327105010.400-7-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 704542a4-2dcd-4896-8b1c-188ec8d978e2.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 83762345-1baf-421a-64f0-08d7d262ce31
x-ms-traffictypediagnostic: AM0PR08MB3650:|AM4PR0802MB2258:
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB22589B5DD51CF4FCD9C47A2892CC0@AM4PR0802MB2258.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(9686003)(6916009)(478600001)(55236004)(6506007)(53546011)(81166006)(186003)(55016002)(86362001)(8936002)(5660300002)(7696005)(26005)(81156014)(76116006)(33656002)(66476007)(66556008)(52536014)(66946007)(64756008)(8676002)(71200400001)(4326008)(316002)(2906002)(66446008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FMwhOgAqxgJav1nmHYX5VQAUeq391tgWVOqL7QPMzVTYuANE6lJmwwq4kbLD5Nnq660a8NBcv4mqnYmzyRnuLs/BHVEjdAST8BXfrkPUWOIVWN2ltgDJ97zUhS5aXbvDkFuyTEj+Bhd6hyLGH/ix+ntlkdmBRcEtQaTAaPnKpUZhyVt1d390B4UEdk8uyZnVNrg0MswoeXF75+FgttjjThxV29gOP0aqXrRFb+77kLDJ8kGYtgGUUEBvuyXC0w9j5JBF8VGI/QNfliM2+iHtqbwxl5SN5DiwQ70QPLA1XTEoVJMn5XBYkkmwxZ6NNQZaW8SjU5v147ARJY2FtESf9fENbwx+OUWxVIKqLOD8EHz0OrJosBxkjMbUT01ZcpanVnJGHzjaURbA6DpQVVQaZkrwJbrQbA9Vv6q2MK+0g0wezpHsMrN705tIwVTN3E+L/drnm1Uco+8Ou4Smjp/5J/F7EeLAGz8JF5bbJE9wP/Ub297cbTKBELkkSL5pRevD594RV3QRYbld6AT5oq7gx/aNcU9PRT8Plj0FA8wSpbp/2Yu4ze6PCMtGvRfhSdzN0HQ7HIstPy6/EpaaxZEql8Eo3XYxNBrxtXduU9DRPIYHBaSsYiGOzIHjdt0Lr/CUO6yxQOT8wIUem1CDNRqL39yzTurOCB0YCNaylUESLOIgeZ8+//QCxrn91EsiAwAho/DjjEOYPZF5YLt2yAnOPQ==
x-ms-exchange-antispam-messagedata: 
 6+5oifzprhAYgtAwg3S8AxJBnV0qszbbVIgJ9s2XhPQjNwUoqkDUGbcj2NHSJaRwDOR5VVx6OaHfCchh7PNmpvHdjRlEK0n9xHaovE23hsvUaxat85RPd3ffyStXO+xcIV1Ghih3PXSHLf49Yjh8Yw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966005)(336012)(186003)(36906005)(33656002)(26005)(6506007)(2906002)(316002)(53546011)(7696005)(70586007)(70206006)(8676002)(26826003)(8936002)(47076004)(81156014)(81166006)(82740400003)(55016002)(6916009)(478600001)(5660300002)(52536014)(9686003)(4326008)(86362001)(356004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e2bfa963-ac22-4f89-c68f-08d7d262ca3f
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SPNzk8yjbODxPSG/iTTi6G90xi8AH5BjXW/+XjbQA0Xxhh84SY8nCLeXjqd8XKuCZX0PpJcVSWNU8hUEiITYQlJPHaffOJ+wRkQFeg0SwjxdZgKK5h64/LBXM2xWc5AmcEF+TYHVBY16jPSUYDfKyCjNFFIUFvCh+hW85ZL5qoWb1RX1XzCNhvu4zmftaXGCphZUaHH9oAzYAugN5nilfBdbQ+dy44R38graD8mtNz+1q8w9e0XcPSxrP5GARIWudGVcrN0m8twrO6v7mFBo9CgVbaqBxITiXHPhpgH1jvGrMlPO7UtrOl53HR/nOIKRnrLpqP/lZNjQB7bIzM2RD30oVR9/Oi57H4DTE4IZ3F7/LeYDpafIC/rifgHRrqC5rzBqE9/xfJmqReTE80G4XoqZoDwykOO31BLJ3bROuxyqiQmKTxC6Wo5fJDKbppas2ZhrjS4XpVlLkk3AumyTbvKUwNWEumNG5ResXSoMQ1NBOarxZ3TwZG0cQ1ctbRx6P8gF0q1I8xR2PM7kiJ2+Ecuz11phXvPgFXqtSqrI5/yC5HCqq+4kPorzxQhzqF2mlalwAvJMAWHt0XLwchNBwpA+C20rRCJS2pE9wQpMSJXadlxVaGPltaXrZdo2a2jVkK2/hyR4sBU4nA8klMiudbZibpIwkpaN19+3YRQLJ1kUC0gEEv7vjTDka9N3h39KbPHa1LwkQv8Qeik8jC8clNlwfxnYcL7C307s4I8j/oo5gurG0yafE1XiNUyqBCKkNL9j0wdvn3pVkrQqJke4wYPpVixBY7g5sCSAmrL1TcU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:23:30.3215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83762345-1baf-421a-64f0-08d7d262ce31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2258
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:50
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 6/7] arm-autonomy: Create quick start
> documentation
>=20
> Add a quick start documentation to help user to start using the layer.
>=20
> Change-Id: I3aea950d2dfdcae41bbdb8f3df4f29196048338b
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-autonomy/README.md                   |   3 +
>  .../documentation/arm-autonomy-quickstart.md  | 116 ++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644 meta-arm-autonomy/documentation/arm-autonomy-
> quickstart.md
>=20
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-
> autonomy/README.md index ed9d6c9..9b12993 100644
> --- a/meta-arm-autonomy/README.md
> +++ b/meta-arm-autonomy/README.md
> @@ -7,6 +7,9 @@ This layer provides an hypervisor based solution (current=
ly
> based on Xen) for  autonomous system. It contains recipes and classes to =
build
> host and guests  systems.
>=20
> +To start using this layer, please check the [Quick Start
> +Guide](documentation/arm-autonomy-quickstart.md).
> +
>  Dependencies
>  ------------
>  This layer depends on several other Yocto layers:
> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> new file mode 100644
> index 0000000..2b92996
> --- /dev/null
> +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> @@ -0,0 +1,116 @@
> +arm-autonomy Quick Start
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This documentation is explaining how to quickly start with arm-autonomy
> +layer and the main features provided.
> +You will find in the documentation directory some more detailed
> +documentation for each of the functionalites provided by this layer.
> +
> +What to use this layer for?
> +---------------------------
> +Using this layer, you can easily and rapidly create a system based on
> +Xen with one or more guests created using Yocto.
> +
> +For this you will need to create at least 2 Yocto projects:
> +- a host project: This one will compile Xen and create a Linux system
> +to be
> +  used as Xen Dom0. The Linux system will contain all functionalities
> +required
> +  to start and manage guests.
> +- one or several guest projects: Those will create Linux systems with
> +the
> +  required Linux kernel configuration to run as Xen DomU.
> +
> +Prepare your system
> +-------------------
> +
> +First you must download the Yocto layers needed:
> + - [meta-openembedded](https://git.openembedded.org/meta-
> openembedded)
> + - [poky](https://git.yoctoproject.org/poky)
> + -
> +[meta-virtualization](https://git.yoctoproject.org/meta-virtualization)
> + - [meta-arm](https://git.yoctoproject.org/meta-arm)
> + - all other layers you might want to use
> +
> +For each of the downloaded layer make sure you checkout the release of
> +Yocto you want to use (for example zeus using `git checkout zeus`).
> +
> +Please follow [Yocto
> +documentation](https://www.yoctoproject.org/docs/latest/brief-yoctoproj
> +ectqs/brief-yoctoprojectqs.html) in order to have the required
> +dependencies.
> +
> +
> +Create a project
> +----------------
> +
> +Here are the main steps to create an arm-autonomy project:
> +
> +1. create a new Yocto project using `oe-init-build-env` in a new directo=
ry:
> +  ```
> +  oe-init-build-env my-project
> +  ```
> +
> +2. edit the file `conf/bblayers.conf` and add
> +`meta-arm/meta-arm-autonomy`
> +  layer to the list of layers of your project. Also add any other
> +layers you
> +  might need (for example `meta-arm/meta-arm-bsp` and
> +`meta-arm/meta-arm` to
> +  use Arm boards like Juno or FVP emulator).
> +  For example:
> +  ```
> +  BBLAYERS ?=3D " \
> +    /home/user/arm-autonomy/poky/meta \
> +    /home/user/arm-autonomy/poky/meta-poky \
> +    /home/user/arm-autonomy/poky/meta-yocto-bsp \
> +    /home/user/arm-autonomy/meta-openembedded/meta-oe \
> +    /home/user/arm-autonomy/meta-openembedded/meta-python \
> +    /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
> +    /home/user/arm-autonomy/meta-openembedded/meta-networking \
> +    /home/user/arm-autonomy/meta-arm/meta-arm \
> +    /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
> +    /home/user/arm-autonomy/meta-virtualization \
> +    /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
> +    "
> +  ```
> +
> +Those steps will have to be done for each project you will have to creat=
e.
> +
> +Host project
> +------------
> +The host project will build Xen and the Dom0 Linux. It will be the only
> +project that will be specific to the board (MACHINE) you will be running=
 on.
> +
> +To create a host project:
> +1. Follow the steps of "Create a project"
> +
> +2. Add the layers in `bblayers.conf` required to build a Yocto project f=
or the
> +   board you want to use.
> +   For example to use Arm FVP Base emulator, add `meta-arm/meta-arm` and
> +   `meta-arm/meta-arm-bsp`.
> +
> +3. edit conf/local.conf to add `arm-autonomy-host` to the DISTRO_FEATURE=
S
> and
> +   set MACHINE to the board you want to use.
> +   For example, add the following lines:
> +  ```
> +  MACHINE =3D "fvp-base"
> +  DISTRO_FEATURES +=3D "arm-autonomy-host"
> +  ```
> +
> +4. build the image using `bitbake arm-autonomy-host-image-minimal`
> +
> +Guest project
> +-------------
> +The guest projects are not target specific and will use a Yocto MACHINE
> +defined in meta-arm-autonomy to include only the Linux configuration
> +required to run a xen guest.
> +
> +To create a guest project:
> +
> +1. Follow the steps of "Create a project"
> +
> +2. Optionaly add layers required to build the image and features you nee=
d.
> +
> +3. edit conf/local.conf to add `arm-autonomy-guest` to the
> DISTRO_FEATURES and
> +   set MACHINE to `arm64-autonomy-guest`:
> +  ```
> +  MACHINE =3D "arm64-autonomy-guest"
> +  DISTRO_FEATURES +=3D "arm-autonomy-guest"
> +  ```
> +
> +4. build the image you want.
> +   For example `bitbake core-image-minimal`
> +
> +
> --
> 2.17.1

