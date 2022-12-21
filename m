Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A10BC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 15:59:44 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.74])
 by mx.groups.io with SMTP id smtpd.web10.22321.1671638381534049801
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 07:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Gaq6Ipam;
 spf=pass (domain: arm.com, ip: 40.107.105.74, mailfrom: emekcan.aras@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOUShwJ7thBc9tcPRECnOwUjE0qXR9pgpRstbzfn3V0=;
 b=Gaq6IpamUbFO6Cq7lwEK2D+xKUQSo7itL6JJk116zOlhYid7h9QiMT6Ui6q2OS1FRyGkR4pd7x92ijJId8p2ZvFkp2BmqxO6GVbrkJbQA6IAOW/x4Un7DK8TLoQbQlv3hjalXmzdGWZi9h9OdQtQmN02w7CEXl1s16qHL6SWeq4=
Received: from AS9PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:20b:489::18)
 by DB5PR08MB10163.eurprd08.prod.outlook.com (2603:10a6:10:4a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Wed, 21 Dec
 2022 15:59:37 +0000
Received: from AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::5e) by AS9PR05CA0031.outlook.office365.com
 (2603:10a6:20b:489::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.21 via Frontend
 Transport; Wed, 21 Dec 2022 15:59:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT049.mail.protection.outlook.com (100.127.140.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.6 via Frontend Transport; Wed, 21 Dec 2022 15:59:37 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132"); Wed, 21 Dec 2022 15:59:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec616b14bfb88d9c
X-CR-MTA-TID: 64aa7808
Received: from 718635492441.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 62E707B4-5051-4D2C-93AD-52494FD2637E.1;
	Wed, 21 Dec 2022 15:59:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 718635492441.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Dec 2022 15:59:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLqcK7N+nd4Rzirnxy8ns1KsZ8Sox+2zxL6fDcLN8RuFUUBA/mRQfBhScVTZz6lHN9iSt2E0b4DnGKkI63zqyLV78g3LukI97kbKAhEgvUjcyXigh3NU/atuK6NCkVtY1IIUikGqxyjnr2rO6pBoEIhznkLibFB+iE4Hlh8zIIBLLAbFKEKMH81JX4qN4xgUJmeLdmfTJuxJYfvX6IVhvjUA/pyUb0EPJK1K3U0eNLhByvdq4gOsAw6E3wbagcv7W4dgdawC6KpGka/3Qm0ZOhJTLIRDAsXvHzPONyyRgdVLLpawm6QERZkZoqv6t1RYFsw+JDiAjNyzR//aTG3Tlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOUShwJ7thBc9tcPRECnOwUjE0qXR9pgpRstbzfn3V0=;
 b=US5rliNQb6HNVyw1m2aoq8ldKKeZMmoJk5USu/zXaBhFYEMRMpletzjq6CfjSyOYga+0Ihq8LM43xYaLGpy0P4js52fPD2K9T1nWrg7raHUbpo1klTViQzX4O6CcPDN+pLCLSnvGrcrCxLlyttip7u6MKKHLlgTvsUE6YK6HXaiPnO1wypr8E1MkF4cAW33PZhVHLxZc7QG8jgsAA9ZsIEcvwe842/4DVMvLNvcm+kQgXs6YsRqO5P00DlyNwLLkxzdfHkNAwLUP9GrLKr9o/aGWdNyiqDDlv77O2BaQ1zoInDEDifov6WAdptE7X2qQUD0/cZcQkvZuCA+uKxLWqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOUShwJ7thBc9tcPRECnOwUjE0qXR9pgpRstbzfn3V0=;
 b=Gaq6IpamUbFO6Cq7lwEK2D+xKUQSo7itL6JJk116zOlhYid7h9QiMT6Ui6q2OS1FRyGkR4pd7x92ijJId8p2ZvFkp2BmqxO6GVbrkJbQA6IAOW/x4Un7DK8TLoQbQlv3hjalXmzdGWZi9h9OdQtQmN02w7CEXl1s16qHL6SWeq4=
Received: from DBBPR08MB4838.eurprd08.prod.outlook.com (2603:10a6:10:f6::10)
 by AS8PR08MB8109.eurprd08.prod.outlook.com (2603:10a6:20b:54b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Wed, 21 Dec
 2022 15:59:29 +0000
Received: from DBBPR08MB4838.eurprd08.prod.outlook.com
 ([fe80::3cd:ddee:ec77:e09d]) by DBBPR08MB4838.eurprd08.prod.outlook.com
 ([fe80::3cd:ddee:ec77:e09d%4]) with mapi id 15.20.5944.006; Wed, 21 Dec 2022
 15:59:28 +0000
From: Emekcan Aras <Emekcan.Aras@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>, Jon Mason <Jon.Mason@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os
 version
Thread-Topic: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os
 version
Thread-Index: AQHZFUocsxIPG8I4uE2vXHYkQ4b9KK54edSAgAAEQ5Q=
Date: Wed, 21 Dec 2022 15:59:28 +0000
Message-ID: 
 <DBBPR08MB4838DA8917E1EFA549701D7A8EEB9@DBBPR08MB4838.eurprd08.prod.outlook.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-6-emekcan.aras@arm.com>
 <CAFA6WYMN0VaPyPqeYGrQx3+56KA+Pd78H-kEd6xQzF7o3vdOnQ@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYMN0VaPyPqeYGrQx3+56KA+Pd78H-kEd6xQzF7o3vdOnQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DBBPR08MB4838:EE_|AS8PR08MB8109:EE_|AM7EUR03FT049:EE_|DB5PR08MB10163:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a49459-ae8a-4da7-d73f-08dae36c5c90
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 U4fwvCo0Rbq0FIEHJUdnrpsEELVZ9q1b40NJZoN2Js/n77SnVHfLoOVWYGbGnjyksq+uDpTmcyrDSDd2v2eABiMZJYkW1ic6RENvQ8c85IF5ZeFqE8q5qbhI1wJx6KeBp9Vghjo0om+4tvsMIoDnjhPBe2Dpz/LC4D/mryyCcRhWMPbxTU47mj8nLgNv2qoHMPVKhBp4ASYpkGMV7qerI9jChGsKj4ZlCBPToebChvWv67hzALvu9Evmte6Lps2fuouF5rztK7jBSesGf3p7t/Qm4tLjovqaN//ISTfxIc0l2RJpKODSshbOm7WaJGPzjhgS7EpbM/O1QsnuNz45qZstvMbk2eVE+oqAua74IpweKb5u1zpdgU4Ape1MJIyHjjiohZCs0WzcMKAJW0r0yAeFRifCZn2jY1v/PEW2LilqBXshT2c3+HBUGgRFOZh2V7mei/OnIeoYvEcww9O/juESjeczooV4UnHaxqLdOLd7z4tCNqjvOpzddWiQkuzs+i2zkAFrUaZbSREDd8kqUrJPV8nDWdeyX19O28U63TNEI2m6EPJdl9zZgb8qyCo73/HihjxekHyN7uUG8Iujrvk5wGwQFGdYKzqINBsOouxnGQdeR87jlLSsw4ImBeFJJ46YJ5oZ7yhKS6IrFy+EGPTCwj7dDGxE8zWRz436M0c26SJYmHCphEdqziDTYkLcqmN13UHST40qg2TelkH5ZBw3YD8+e99pwGoIbysUPaVznpjCfY5od/bxFpO4v7kaGyq6mF8WkVUWH8mW9F6f7+1jfzU1xFZTV4BRDrzV84XZ23QREFCVxYI/nds7JUbB
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4838.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199015)(5660300002)(4326008)(86362001)(8676002)(122000001)(26005)(9686003)(186003)(6916009)(33656002)(38070700005)(76116006)(91956017)(316002)(66556008)(64756008)(66476007)(66946007)(66446008)(66899015)(7696005)(6506007)(166002)(8936002)(38100700002)(52536014)(478600001)(53546011)(71200400001)(966005)(83380400001)(55016003)(19627405001)(54906003)(4001150100001)(41300700001)(2906002)(473944003)(414714003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_DBBPR08MB4838DA8917E1EFA549701D7A8EEB9DBBPR08MB4838eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8109
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e526e594-5f41-4e87-a62a-08dae36c576a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3sxu5Gj3RtfF35Or+ugfOKOhlLI3ZJmo7cWGTJcx5W3w+bImr8LyXB1jEM7OR3kDu0QJ7EZ3A5YXLdTWbiJuzfZ5Tdrbf0txd4y7bfbdQr2d6shNIZ6xyhQbX/wv5ixd51n8WtDd2NBnAOaWfoWq//Np3pDU0562BpN2CMJzOA6AU8CmxMmwAPB8zLbRu54vqmTYk4SSndn0TgxfJnkSxpHRgUyKvAIVSFe4SgBlVXy0eCF7B+1LWUVN84ZAVFPLB1ofRBlZZNioc3hbIXiGlvn+hTLIZABLeDU/n0GzmyNRqtGhOND4EUVHjF3qA61QGORpKPbVBbPmORsfFWUrvL1TDG64Bh0kNlhb1887/tYOy5R0XMgwgDpG8wgHP4qT9u0IKe79Rsn4GcRrQ6cuV1DsPYnA9cWEKIazFqIovdNIWFuLMrUjyEEgFfDZINTLGIhHCvKJWNU6dniB1TQZ1lQhLE6o2NRt3dFeumShh+QueYJRRNKLrfzRoYWRv4pklyfrfltPM1dWAYD2HBPDBwcoZEkuFHQlMi1CS6rhawKLL0Ckoxjuk20MU50XiT1iOIuzbwiXgEVqofmys+endSYsoOyCzJTG6tF1cyimGWkWhDmJGCEjUnM0DsfFmIXDua46njlrq1F4qNhiStT6OzLLeD7rbw2H61LFVZ9KpH/KDU3zrqNL/GXkCalOa8b+JF4vd5lgbAOG9aluO+Xwhei0oAWZQa9LRMmbiaeNnVoGPor/ziuburg78DrpjJSr1UhbB3G1MsAVKq1abxh8uXdcvJj5fd/w9zA54mERcDxHdQ+pEWhTcd7XFUXXaNHgI85WFtKNGZYFchnGk1K8vg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(40480700001)(55016003)(33656002)(40460700003)(336012)(47076005)(41300700001)(4326008)(8676002)(70206006)(70586007)(83380400001)(5660300002)(52536014)(8936002)(6862004)(53546011)(7696005)(966005)(6506007)(478600001)(54906003)(316002)(9686003)(186003)(26005)(82740400003)(356005)(81166007)(166002)(86362001)(82310400005)(36860700001)(4001150100001)(2906002)(19627405001)(66899015)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 15:59:37.4534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a49459-ae8a-4da7-d73f-08dae36c5c90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10163
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 15:59:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4222

--_000_DBBPR08MB4838DA8917E1EFA549701D7A8EEB9DBBPR08MB4838eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Sumit Garg <sumit.garg@linaro.org>
Sent: Wednesday, December 21, 2022 3:37 PM
To: Emekcan Aras <Emekcan.Aras@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ross=
 Burton <Ross.Burton@arm.com>; Jon Mason <Jon.Mason@arm.com>; nd <nd@arm.co=
m>
Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os ve=
rsion

On Wed, 21 Dec 2022 at 20:10, <emekcan.aras@arm.com> wrote:
>
> From: Emekcan Aras <emekcan.aras@arm.com>
>
> There is a new optee version 3.19. Currently, qemuarm-secureboot cannot b=
oot
> optee 3.19 out-of-the-box.

This sounds strange since Qemu is regularly tested in OP-TEE build CI
as well as 3.19 release [1]. Is it really an OP-TEE related issue? Can
you share details of the boot error you are observing?

[1] https://github.com/OP-TEE/optee_os/commit/afacf356f9593a7f83cae9f960268=
24ec242ff52

-Sumit

2022-12-21 11:33:27 - INFO - E/TC:0 0 Panic 'Failed mapping FIP SPs' at cor=
e/arch/arm/kernel/secure_partition.c:1223 <sp_init_all>
2022-12-21 11:33:27 - INFO - E/TC:0 0 TEE load address @ 0xcf412000
2022-12-21 11:33:27 - INFO - E/TC:0 0 Call stack:
2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41eb3c
2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42bafc
2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41bd4c
2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42d548
2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41e268
2022-12-21 11:33:27 - INFO - runqemu - INFO - SIGTERM received
2022-12-21 11:33:27 - INFO - runqemu - INFO - Cleaning up
2022-12-21 11:33:27 - INFO - runqemu - INFO - Host uptime: 1436.86
2022-12-21 11:33:27 - INFO -
2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specified
2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specified

This is the error message. We also have the same issue for n1sdp since the =
new optee is looking for an SP manifest in FIP.. Need to create a bbappend =
or an inc file for qemuarm-secureboot as well where the necessary flags are=
 set. Just left it for now since there are other platforms that use optee 3=
.18 version. I think this can be fixed relatively easily when all the platf=
orms upgrades to 3.19.

-Emek

> This pins optee-os version to 3.18 for
> qemuarm-secureboot.
>
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> ---
>  meta-arm/conf/machine/qemuarm-secureboot.conf   | 3 +++
>  meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/con=
f/machine/qemuarm-secureboot.conf
> index f08b84fe..db02dc68 100644
> --- a/meta-arm/conf/machine/qemuarm-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
> @@ -21,3 +21,6 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
>  IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
>
>  MACHINE_FEATURES +=3D "optee-ftpm"
> +
> +PREFERRED_VERSION_optee-os ?=3D "3.18.%"
> +
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
> index 55c4cab4..7277817d 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -23,3 +23,6 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
>  IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
>
>  MACHINE_FEATURES +=3D "optee-ftpm"
> +
> +PREFERRED_VERSION_optee-os ?=3D "3.18.%"
> +
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4220): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4220
> Mute This Topic: https://lists.yoctoproject.org/mt/95807186/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@=
linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_DBBPR08MB4838DA8917E1EFA549701D7A8EEB9DBBPR08MB4838eurp_
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
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><br>
</span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Sumit Garg &lt;sumi=
t.garg@linaro.org&gt;<br>
<b>Sent:</b> Wednesday, December 21, 2022 3:37 PM<br>
<b>To:</b> Emekcan Aras &lt;Emekcan.Aras@arm.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Ross Burton &lt;Ross.Burton@arm.com&gt;; Jon Mason &lt;Jon.Mason@a=
rm.com&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin opte=
e-os version</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">On Wed, 21 Dec 2022 at 20:10, &lt;e=
mekcan.aras@arm.com&gt; wrote:<br>
&gt;<br>
&gt; From: Emekcan Aras &lt;emekcan.aras@arm.com&gt;<br>
&gt;<br>
&gt; There is a new optee version 3.19. Currently, qemuarm-secureboot canno=
t boot<br>
&gt; optee 3.19 out-of-the-box.<br>
<br>
This sounds strange since Qemu is regularly tested in OP-TEE build CI<br>
as well as 3.19 release [1]. Is it really an OP-TEE related issue? Can<br>
you share details of the boot error you are observing?<br>
<br>
[1] <a href=3D"https://github.com/OP-TEE/optee_os/commit/afacf356f9593a7f83=
cae9f96026824ec242ff52" data-auth=3D"NotApplicable">
https://github.com/OP-TEE/optee_os/commit/afacf356f9593a7f83cae9f96026824ec=
242ff52</a><br>
<br>
-Sumit</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof"><code data-qa-selector=3D"job_log_c=
ontent" class=3D"job-log d-block"><span class=3D"js-line log-line"><span cl=
ass=3D"gl-white-space-pre-wrap ContentPasted0">2022-12-21 11:33:27 - INFO -=
 E/TC:0 0 Panic 'Failed mapping FIP SPs' at
 core/arch/arm/kernel/secure_partition.c:1223 &lt;sp_init_all&gt;</span></s=
pan></code></div>
<div class=3D"PlainText elementToProof"><code data-qa-selector=3D"job_log_c=
ontent" class=3D"job-log d-block">
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - E/TC:0 0 TEE load address @ 0xcf41=
2000</span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - E/TC:0 0 Call stack:</span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41eb3c</span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42bafc</span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41bd4c</span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42d548</span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41e268</span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - runqemu - INFO - SIGTERM received<=
/span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - runqemu - INFO - Cleaning up</span=
></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO - runqemu - INFO - Host uptime: 1436=
.86</span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
>
<div class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Cont=
entPasted0">2022-12-21 11:33:27 - INFO -
</span></div>
<div class=3D"js-line log-line"></div>
</code><code data-qa-selector=3D"job_log_content" class=3D"job-log d-block"=
><span class=3D"js-line log-line"><span class=3D"gl-white-space-pre-wrap Co=
ntentPasted0">2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no =
-T specified</span></span>
<div class=3D"js-line log-line"></div>
</code></div>
<div class=3D"PlainText elementToProof"><code data-qa-selector=3D"job_log_c=
ontent" class=3D"job-log d-block"><span class=3D"gl-white-space-pre-wrap Co=
ntentPasted0">2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no =
-T specified</span></code></div>
<div class=3D"PlainText elementToProof"><code data-qa-selector=3D"job_log_c=
ontent" class=3D"job-log d-block"><span class=3D"gl-white-space-pre-wrap Co=
ntentPasted0"><br>
</span></code></div>
<div class=3D"PlainText elementToProof">This is the error message. We also =
have the same issue for n1sdp since the new optee is looking for an SP mani=
fest in FIP.. Need to create a bbappend or an inc file for qemuarm-securebo=
ot as well where the necessary flags
 are set. Just left it for now since there are other platforms that use opt=
ee 3.18 version. I think this can be fixed relatively easily when all the p=
latforms upgrades to 3.19.<br>
</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">-Emek</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">&gt; This pins optee-os version to =
3.18 for<br>
&gt; qemuarm-secureboot.<br>
&gt;<br>
&gt; Signed-off-by: Emekcan Aras &lt;emekcan.aras@arm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta-arm/conf/machine/qemuarm-secureboot.conf&nbsp;&nbsp; | 3 ++=
+<br>
&gt;&nbsp; meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++<br>
&gt;&nbsp; 2 files changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/=
conf/machine/qemuarm-secureboot.conf<br>
&gt; index f08b84fe..db02dc68 100644<br>
&gt; --- a/meta-arm/conf/machine/qemuarm-secureboot.conf<br>
&gt; +++ b/meta-arm/conf/machine/qemuarm-secureboot.conf<br>
&gt; @@ -21,3 +21,6 @@ WKS_FILE_DEPENDS =3D &quot;trusted-firmware-a&quot;<=
br>
&gt;&nbsp; IMAGE_BOOT_FILES =3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
&gt;<br>
&gt;&nbsp; MACHINE_FEATURES +=3D &quot;optee-ftpm&quot;<br>
&gt; +<br>
&gt; +PREFERRED_VERSION_optee-os ?=3D &quot;3.18.%&quot;<br>
&gt; +<br>
&gt; diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-ar=
m/conf/machine/qemuarm64-secureboot.conf<br>
&gt; index 55c4cab4..7277817d 100644<br>
&gt; --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; @@ -23,3 +23,6 @@ WKS_FILE_DEPENDS =3D &quot;trusted-firmware-a&quot;<=
br>
&gt;&nbsp; IMAGE_BOOT_FILES =3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
&gt;<br>
&gt;&nbsp; MACHINE_FEATURES +=3D &quot;optee-ftpm&quot;<br>
&gt; +<br>
&gt; +PREFERRED_VERSION_optee-os ?=3D &quot;3.18.%&quot;<br>
&gt; +<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#4220): <a href=3D"https://lists.yoctoproject.org/g=
/meta-arm/message/4220" data-auth=3D"NotApplicable">
https://lists.yoctoproject.org/g/meta-arm/message/4220</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/95807186=
/1777089" data-auth=3D"NotApplicable">
https://lists.yoctoproject.org/mt/95807186/1777089</a><br>
&gt; Group Owner: meta-arm+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsu=
b" data-auth=3D"NotApplicable">
https://lists.yoctoproject.org/g/meta-arm/unsub</a> [sumit.garg@linaro.org]=
<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_DBBPR08MB4838DA8917E1EFA549701D7A8EEB9DBBPR08MB4838eurp_--

