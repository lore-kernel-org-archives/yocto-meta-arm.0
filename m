Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.60])
 by mx.groups.io with SMTP id smtpd.web10.370.1589386811638374859
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 09:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bRZkApCu;
 spf=pass (domain: arm.com, ip: 40.107.21.60, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81Z/ls+kVsig1v18G7tVlf6KKcAl9F6q0V1QGZn0rbc=;
 b=bRZkApCu+7mQy+JaGzDOgafSPKDIzxodPYKfp3wj7YLLTNV5QEnuaCdVvBHpKz1tK/bap6m9dd9ceKuHKsVVIthHEWWxKQUY0X6sAoA9mIqQLUCKZOCaMhZ9D4GHFFcYG0i8qPqRdBLIfSxXuVjOidrrVhvEo3CiEkZ9IT8CQgc=
Received: from AM6P193CA0080.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::21)
 by AM0PR08MB5347.eurprd08.prod.outlook.com (2603:10a6:208:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Wed, 13 May
 2020 16:20:06 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::54) by AM6P193CA0080.outlook.office365.com
 (2603:10a6:209:88::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Wed, 13 May 2020 16:20:06 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 16:20:05 +0000
Received: ("Tessian outbound b3a67fbfbb1f:v54"); Wed, 13 May 2020 16:20:05 +0000
X-CR-MTA-TID: 64aa7808
Received: from 90462534e7b4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 80CDFEC8-5F20-4C63-84D9-8C99EBEA8BD7.1;
	Wed, 13 May 2020 16:20:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90462534e7b4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 May 2020 16:20:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyUFGQvpqJAwTDo6dT4dkgUSEjP38qGTrLp8/OWZCt7vJE9lBtOS/y7M66EPVafzVrnMUydKucabieTYMs3UCggSdTCaub4z4qqiv0MVlApyHP6hPKvxDb6hUG2mvJN25+Ton8k783I1noFMK9DbSi0GdbfwqTxrVbdnIsztprg9FYxCncnwiIUTxSF46VQxtyD7JvW3oftSdgIVdFWDo/+6ngBLmLS/+RB22okfFUTh/kAJDK28Vu57+NR+7FH819WwO1aUwOUIbiC/N3ir/hWxeBbeeQVOqTRvdi2xQj9VBE4ncisSWBaxAWCohbOEscnawCp+Z6BmfqGE+1ZtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81Z/ls+kVsig1v18G7tVlf6KKcAl9F6q0V1QGZn0rbc=;
 b=Vx7tjuYp/75iIPlXMh2n3MG9dYINHxlI1Mq3+BwTLaSTvOOkRydsEKbU8EsMLTrofO+ZGX1KvEXqcqG+tOgWKV7/YCmCGTEcRUmfXqiuMhxLB/GiZcK4oJwvH4MW3CduAIU72NCq5c9mclWjS43gOe0okXowc5NKRTFy19hF4ZWSAux9/dIte7lcWyl8a6VpL32rEX0H9As7MaSidqwlUMrebWBtGzJAv+XsPWa3jEbqA5yeUW/fd5bH33Dqol5ZD/R+tQIIqYzjV06b97F6qlFbVUPTD2/kOkSxwfr5FxLz9a6wluxq9zODKeKB4rdVciwW6zzpttUCIU2kSQaIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81Z/ls+kVsig1v18G7tVlf6KKcAl9F6q0V1QGZn0rbc=;
 b=bRZkApCu+7mQy+JaGzDOgafSPKDIzxodPYKfp3wj7YLLTNV5QEnuaCdVvBHpKz1tK/bap6m9dd9ceKuHKsVVIthHEWWxKQUY0X6sAoA9mIqQLUCKZOCaMhZ9D4GHFFcYG0i8qPqRdBLIfSxXuVjOidrrVhvEo3CiEkZ9IT8CQgc=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4945.eurprd08.prod.outlook.com (2603:10a6:208:157::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Wed, 13 May
 2020 16:19:58 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.022; Wed, 13 May 2020
 16:19:58 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm][PATCH v3 2/2] trusted-firmware-a: Install .elf file from subdirectory
Thread-Topic: [meta-arm][PATCH v3 2/2] trusted-firmware-a: Install .elf file
 from subdirectory
Thread-Index: AQHWKT3gTUB38NlIbk2LJxOIqUsp3aimMhmA
Date: Wed, 13 May 2020 16:19:58 +0000
Message-ID: 
 <AM0PR08MB39872D9B52EAC58B6B46945B92BF0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200513154707.33747-1-JPEWhacker@gmail.com>
 <20200513154707.33747-3-JPEWhacker@gmail.com>
In-Reply-To: <20200513154707.33747-3-JPEWhacker@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 699a17e5-c79e-4e2b-8d90-e2a0d6d6a6a9.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6cccd2f5-686e-4a0f-bb5c-08d7f7597f54
x-ms-traffictypediagnostic: AM0PR08MB4945:|AM0PR08MB5347:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB53479DC103A026BAEDE8F8E792BF0@AM0PR08MB5347.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:9508;
x-forefront-prvs: 0402872DA1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 w939Uuht3jhtw6DfsE2RITHue4ezH5p+mJFr4OoyzEx8Nh9oYgyAaKJdzxgxQfWObAIg2W796SBtn1BxLT5TUu7GjeZvKMxzJPlJ7zvoRt+8YEs0Flg6AAw3nJpoAhCOcRtel9wqiarW8hZ0CAQPH+4vbkFKzdfPpqfn1GHNxKbgPhPcPyFly/+1uzaMLAh/7NxF2DnhK4lBBI+kHuDIHixqPmdOEFNGmiZHg4Ka5NBSsDa8jQxEfSLin6XSS5Fey0cdENATJZGhZsQoFOzsiz6ds6+q6BY1TmbaLA5N7n5fGF/DQA06Gg7WM2PJYOdu4NkeBcixfc0NxUF3BVXkfEWCrg9ogTxlWrhxDnKadRZeCF7ofLbEloktGySC45R8P4rERlrxnj51XZZMDJb6v9Pnts1pSN0BWn2wSfociz0emJZvU2AJ4fh8MAq9JPY9FmAEwCroYzqDJW9ekuopnwvxAbBWDdsTvS8GYdnU/VuDsgOi/rgc3A4B6CVD6dB5AFOd2A1MCFzMSgNVz5IqpRnE7EyqQuC5kiCUgCZUR5tXjU3V0swtnU8NXArEmE33
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(33430700001)(33656002)(66556008)(7696005)(55016002)(26005)(186003)(316002)(110136005)(8676002)(2906002)(8936002)(478600001)(71200400001)(86362001)(66476007)(66946007)(9686003)(33440700001)(52536014)(76116006)(5660300002)(53546011)(6506007)(66446008)(64756008)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 6xsOtEHvSIFOsLowgUFp4H1p+5NDSbrxxs+ihF6si80c0SlMkFv1RYqGdea77vlr9xuGHsJnWcaImuT3OXGM3EV69UrOaZmILxHgDGtVs4TtA5UkIDwjDuPRL9s4+L+P5fdy7/m8WcO1uGKrcdGhnDrn4tZ8WXpIBJJdCF31Qwh0AUfEgVH+WYERQIwkAhcKLnMN77w5+TaP+Xpu9sjE3t77KqIGNKbx/P/NoIIFkcTnA+PNI61wFPxpjWWfiEJk5L8Pq0nYv5a5KUj1y37Hs3usQptlG0Z+hXUyFqsPIxrTeAJ5xnFznyVFjpscgAOT0Ok0JnCT+JF5uhaFBarjuaYk0jfQCI/5bToRe7M0LaL9F1gwZ2kJyAYI4soFAOk2VVXqxJyOEutkag5SNOfCUkDId1P0zh8ouvif/HimId98OSmT+vv8/HSRP5l0ozypUbEeOduODjRkPIoc1jfr0LpNoIU8RIfGhAEyvvuJakE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4945
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(33430700001)(70586007)(47076004)(86362001)(110136005)(316002)(7696005)(70206006)(55016002)(33440700001)(82740400003)(81166007)(26005)(8676002)(52536014)(6506007)(9686003)(336012)(8936002)(2906002)(478600001)(356005)(36906005)(33656002)(53546011)(5660300002)(186003)(82310400002)(142923001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c2c7b166-181f-43d6-6979-08d7f7597b4b
X-Forefront-PRVS: 0402872DA1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kWto3i3p4CFoJn1VmVhwS7aFO5f3a0m4FJcfW2Y6r/cJ9gkMCHTb9aLVfBHiY1vAchmVOSa4abK6xw5fWdFm6mIL2WheLVy2zXOJrJaGtCE07yOzzLbr5VEJOzyZROfEsAMJPCtXP0e8+V79229eNUx9gzNLj/zOSRdk41ATGxlrknp5FEqLqDcLojlOkTWMwuKu9mPS4a3sGE4E7nM7N/HXiIw2TtPs9oUjHDrRVZHRMfSYvJwUrQOcx13INID6CJk8W43tgtuRT6WalfjwLdF44WHtI5zwzmTtMiLkZkqDRAycuphGHF11uFUF5AEJx74oiEqx/GmfsMWUyKo2L4tZYKOrcL5vWGwjxep4gouIAC3j4knX0kpKungkeWfo34XQQdHn7xG1sXOctTf35UTauv7BW+RW7Ui/naW4HXk7kY58bZWrjQ3NB0nkV/lhNNdI5naVV9T50wMPzOAUviRgm+b2XjtZYYwmH53qMmEtMLH/jbEJzCm0CotXx6mzVJfYLiECXEJevABiUkVLatZqxrTW/ziLVQzRUQ+nzuxTcqtmvIpIyYaxYTLrMR4MdWjSucSry+ZwEjknNejr3gWDTxTV4EqC86qh2XJF6Fc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 16:20:05.5600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cccd2f5-686e-4a0f-bb5c-08d7f7597f54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5347
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Joshua Watt via lists.yoctoproject.org
> Sent: 13 May 2020 16:47
> To: meta-arm@lists.yoctoproject.org
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Subject: [meta-arm][PATCH v3 2/2] trusted-firmware-a: Install .elf file f=
rom
> subdirectory
>
> The ELF files produced are in a subdirectory named by the build target (e=
.g.
> "bl31/bl31.elf") instead of the BUILD_PLAT directory.
>
> Specifically allows this recipe to correctly install ATF for Rockchip
> RK3399
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index febd8ce..4b5da7a 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -110,9 +110,9 @@ do_install() {
>              echo "Install $atfbin.bin"
>              install -m 0644 $BUILD_PLAT/$atfbin.bin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> -        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
> +        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
>              echo "Install $atfbin.elf"
> -            install -m 0644 $BUILD_PLAT/$atfbin.elf \
> +            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
>          elif [ -f $BUILD_PLAT/$atfbin ]; then
>              echo "Install $atfbin"
> --
> 2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
