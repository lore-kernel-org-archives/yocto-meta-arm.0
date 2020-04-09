Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web12.4781.1586418452908293508
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Apr 2020 00:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=91OUigXN;
 spf=pass (domain: arm.com, ip: 40.107.21.64, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2B/vjMFKwAiqSxalNrtRZZf1M+KDAccYtoWYMeOHlo=;
 b=91OUigXNRAR3Jp64N5SaO2fp1J/6D1zPXq5Th5xUXBECl/wIXfgbLvkXXncpRS3S5SvSkqaLZnaLVpotTyY79/6FP9vRB4u9OfZD+AuFxB4yJMy2qhkk2Y0O/RTKHnUNXyG8bVkmoi1u8Dl21H36+nl0O0cpVNrxW3OlcaC3qyc=
Received: from DB6PR0301CA0057.eurprd03.prod.outlook.com (2603:10a6:4:54::25)
 by AM6PR08MB3206.eurprd08.prod.outlook.com (2603:10a6:209:46::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Thu, 9 Apr
 2020 07:47:30 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::f) by DB6PR0301CA0057.outlook.office365.com
 (2603:10a6:4:54::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Thu, 9 Apr 2020 07:47:30 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Thu, 9 Apr 2020 07:47:30 +0000
Received: ("Tessian outbound eadf07c3b4bb:v50"); Thu, 09 Apr 2020 07:47:30 +0000
X-CR-MTA-TID: 64aa7808
Received: from d03b9487e6b4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 83926C03-2193-4555-8E05-741DA18B8325.1;
	Thu, 09 Apr 2020 07:47:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d03b9487e6b4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Apr 2020 07:47:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXjKZAsEb94Nl29d9ERWiAE8H+r/tAjfriRo1cCAmZSCkT9NPNj0jyQFMZuE0dEi9WrHau6BMupL1rZTHcmwN9nuTmnF36qIMguElpsmnD7MBR6Gw28Tg3P2YcqshZBEDKnFVEEJwetxgjxj4vst7qQT2pmXunTQNFP3NjU/v71u/O+9KE0RnE3U+r+CO4fmnay60d+WA6K3C1FPBIj5P3UsfReZzwpm1nKCRNoqr2eSLfWvtirPNKJuVGUI3HisDSW29/fhAZmq/vA5lGnem5wE+RolXLWzzVkhLHSMEVLzf9hgc1UHdZz7YzgS25XJVngJUpIJ4cGMP5D1oN/XqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2B/vjMFKwAiqSxalNrtRZZf1M+KDAccYtoWYMeOHlo=;
 b=XV+42Ow8RP+4GQ6A0SxIZrMsh5LIcYYdGtyL4XdwUWt6gMru5E/DAh6+66mQCJdyDioPg6j7YfJ3UR6TFyrl/PaOqtsBWhMUF6suEE2Kld2PJe2zj2/iLkGz8bnoiSbs0UrNfv5n2epPWvkkyPh9tQsm58rH26O4bW0DQHmYPy3++KCPh2gnTv/LnNYAddBafcl0Su0h2FYRnkeE9TN0XJ8gNHRz9AIEMpWK1duY3Vpyfv3I30wmOxlHdTQeBNdVQmhmwc/b6LwRfWBTXV0UzhDaTe160PhweJviLIEy4hYjTEs+54DyX1l9LJhO+KMhqk7a9ARUdgm65D59HQlnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2B/vjMFKwAiqSxalNrtRZZf1M+KDAccYtoWYMeOHlo=;
 b=91OUigXNRAR3Jp64N5SaO2fp1J/6D1zPXq5Th5xUXBECl/wIXfgbLvkXXncpRS3S5SvSkqaLZnaLVpotTyY79/6FP9vRB4u9OfZD+AuFxB4yJMy2qhkk2Y0O/RTKHnUNXyG8bVkmoi1u8Dl21H36+nl0O0cpVNrxW3OlcaC3qyc=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4963.eurprd08.prod.outlook.com (2603:10a6:208:159::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 9 Apr
 2020 07:47:23 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2900.015; Thu, 9 Apr 2020
 07:47:23 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Jon Mason <Jon.Mason@arm.com>, "nicolas.dechesne@linaro.org"
	<nicolas.dechesne@linaro.org>, "riku.voipio@linaro.org"
	<riku.voipio@linaro.org>, "denis@denix.org" <denis@denix.org>,
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, Sumit Garg
	<sumit.garg@linaro.org>
Subject: Re: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ball insted of svn
Thread-Topic: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar
 ball insted of svn
Thread-Index: AQHWDjhGcV6Deo57UEmNCJnzx13GhahwaZpg
Date: Thu, 9 Apr 2020 07:47:23 +0000
Message-ID: 
 <AM0PR08MB3987022196172E69DE04AA3692C10@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 8c16e5fc-0c0c-4cb5-8706-577fe300bac9.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34545803-0083-4baa-c10d-08d7dc5a41af
x-ms-traffictypediagnostic: AM0PR08MB4963:|AM0PR08MB4963:|AM6PR08MB3206:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3206BA457D8A1F030F6355A192C10@AM6PR08MB3206.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:632;OLM:9508;
x-forefront-prvs: 0368E78B5B
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(52536014)(71200400001)(9686003)(33656002)(6916009)(26005)(81166007)(6506007)(2906002)(66556008)(55016002)(5660300002)(53546011)(66476007)(316002)(7696005)(81156014)(478600001)(4326008)(8676002)(64756008)(54906003)(8936002)(186003)(66946007)(76116006)(86362001)(66446008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YXHJ/pDMwBSY8htiWhg/tqlbeYrWoIgXXZFWzdC3tuBRlcP5J6opqKFDhMHfeQu+dj2FtbXNNoG1br1ELD6gp7ThFutcV1pzCrQxXP8QcISVpMma/sfUagEdfWOBd8ZjpyW4TJ1xfI1EO16cgH4Co4mtxKt+Opl8G5M6LR44xVc20xkBKxenWbCsm3JzErZ7Ev2RDFrLXODlBbl+lYLUK4KYNm2GqnkF3te3bYK/4e82u4lfFFucbIT5zvhmqOADko8zMkAnbVYDOFelBULMzocLaM64g2785OeQXBXkVFbEPUq7sBI78eK+NvrnNGVqLOotvia37ophqJUDSbnrcMUM7NXwioxQoMX9RypNtahHOtjRYIaQh7PNNCCqjujGt367WvDYLr3+VYpNPeFN+6QMLDz1JVCJZkasB8I4tCSOZPZp1u8h9pk/naMn0oJ45AlKDY6IRy8HRb1qcXPjpwYHlRkr7q4EIqKsBdNzEEe6vJ+qsdsxcA+K7w2anB0HuDFAd4xtVT2xg5NTA0F1dQ==
x-ms-exchange-antispam-messagedata: 
 0D5n4x7qr0c5j7569VllleiERpLRmR3qyGJZMywSPpjZyNXJ0/NJyQcddKgCDZ8zJG2B78ziyQ3tqTVE72HrdymZW+PwTA8tKwuoYNOmZfuabmWVAu0jqTpbT2eC1y7z39nByvbRErnWIx3tTC7O1A==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4963
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(2906002)(26005)(4326008)(8676002)(26826003)(356004)(81166007)(7696005)(478600001)(186003)(316002)(54906003)(33656002)(9686003)(6506007)(53546011)(55016002)(86362001)(52536014)(81156014)(336012)(70586007)(47076004)(8936002)(107886003)(6916009)(70206006)(82740400003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e25cd6d1-b473-4861-9eaf-08d7dc5a3dcb
X-Forefront-PRVS: 0368E78B5B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8VgAR+c4NbGMCXzCohJa8ymMu0e6xa9kV5gfi/VS6cQntpQcWzz4G8arWCGilUWsk+UFJoiotGGDqO7RMhWSrVP9du5YoW3fdemC9Iagy/Yk54dhHB+7Qdt/gzjj/ObSDe4Ht7FhlFxJ5l3Ky0pAudIQeogQtJoJSl2NyZnhccAXx4IKbK0gWbBYJP6mU/lB9+JIjUHDkBvairEVSmAEStY4cJ5QvWzHUz7cHZ9rV46CPvbWPC+mPzzgSSvYwa9XRSuKH8WuX3jZBpJJqH1HMXHiXwBuVho1UP1Fen2bc2naRStX6biJaIqvHZ4djWb7Fg2UU2zZ3hDboHAoG6Z6aIDHGGDqhwH+hytrFGtEVOkoLj25U6qqb3cTBEzR0Vm3bRiAvveDHZdj6k0hKW7hwbP7nREI/wognATvSR9h6VHlZe5kP3YRI5Bt6okPvY4kmD17407OA8htMrqVwCnfkvWd1K3R/Si2rlzf5ZKHseRTCdEHa0umkP2D+nU0i6PNXEZD6ZwU27ajzvZj5IKcYSi4I85i4myc9bzR91xaHM7JLNFuliPWhHUVZQM8YJpXA0heivGAWDhs31740gTbZw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 07:47:30.3339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34545803-0083-4baa-c10d-08d7dc5a41af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3206
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Sumit Garg via lists.yoctoproject.org
> Sent: 09 April 2020 07:30
> To: meta-arm@lists.yoctoproject.org
> Cc: Jon Mason <Jon.Mason@arm.com>; nicolas.dechesne@linaro.org;
> riku.voipio@linaro.org; denis@denix.org; daniel.thompson@linaro.org;
> Sumit Garg <sumit.garg@linaro.org>
> Subject: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ba=
ll
> insted of svn
>
> GCC 9.2 source fetch from svn is quite slow as compared to source tar bal=
l.
> So switch to fetch GCC 9.2 source tar ball instead.
>
> Reported-by: Riku Voipio <riku.voipio@linaro.org>
> Suggested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/me=
ta-
> arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> index 366a070..08e8f7f 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> @@ -27,10 +27,7 @@ LIC_FILES_CHKSUM =3D "\
>      file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \  "
>
> -#BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> -#RELEASE ?=3D "5a5ca2d"
> -#BASEURI ?=3D "https://repo.or.cz/official-
> gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=3Dgcc-
> ${RELEASE}.tar.gz"
> -BASEURI ?=3D
> "svn://gcc.gnu.org/svn/gcc/branches/ARM;rev=3D277439;module=3Darm-9-
> branch"
> +BASEURI ?=3D "https://developer.arm.com/-/media/Files/downloads/gnu-
> a/9.2-2019.12/srcrel/gcc-arm-src-snapshot-9.2-2019.12.tar.xz"
>  SRC_URI =3D "\
>             ${BASEURI} \
>             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \ @@ -71,7
> +68,9 @@ SRC_URI =3D "\
>             file://0036-Re-introduce-spe-commandline-options.patch \
>             file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch=
 \  "
> -S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-9-branch"
> +SRC_URI[md5sum] =3D "9c570fc4286825b4e6f67b3d34aade23"
> +
> +S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-9.2-
> 2019.12"
>
>  # For dev release snapshotting
>  #S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
> --
> 2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
