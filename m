Return-Path: <ben.horgan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E430BC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 09:12:28 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.47])
 by mx.groups.io with SMTP id smtpd.web08.7157.1643965947431835759
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 01:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=zSgq8Fzr;
 spf=pass (domain: arm.com, ip: 40.107.5.47, mailfrom: ben.horgan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA6aBJ1R3iKzeH01e2ZvKFmAkBmyAmudIrEY1++ZA3U=;
 b=zSgq8Fzr1GN2fq/zDrz5LiA12uJcGiq+NVuxPF1bA+ZUYt3FabWQ9NC30DtXl1hxtjVL2D+0su7pVeMOa/7U7a0wLg8Q9nmao7sUThMyby1zmm+VL2Zw5BIFKglbw3iAKpzGwzJdLS1M1WBX1viGCCwd3eGtOaog6WWnLf9qOrU=
Received: from AM5PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:203:51::15) by AM0PR08MB3699.eurprd08.prod.outlook.com
 (2603:10a6:208:10c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 09:12:24 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::74) by AM5PR0701CA0005.outlook.office365.com
 (2603:10a6:203:51::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.6 via Frontend
 Transport; Fri, 4 Feb 2022 09:12:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12 via Frontend Transport; Fri, 4 Feb 2022 09:12:23 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Fri, 04 Feb 2022 09:12:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 586cafb044ade7fc
X-CR-MTA-TID: 64aa7808
Received: from cc22023b3f86.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA5CA471-8D4E-49B5-BD06-B40F9F9AF33E.1;
	Fri, 04 Feb 2022 09:12:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 cc22023b3f86.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 04 Feb 2022 09:12:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi1r+EVCDyZW9wc8nRSc59r7qEcBWFZSDF2AxRTQyZ1AvwqLaku1pL1wZw2jVn43pkWl3RdSWvdltmh27FJw9M29cs2tnI0CfNe1aSf1OSCimmDzg7R1602Wkef0l5GHv/hvaoGVvGjrP/NfEsXyl9/M/BufCUYaJvfIa6dePAmDrBLuXlLgitQ8GkbY16pTe4y1O9v9gRkA+GOQLfkM0YhqPbh5Igug2+BMJFwBBNEvqOP+2Qru/Vgdy/SSfVgBQ9jM52Zd2QsYqKcETFZnQaTR+zM/0zk1gB56bovzmWD4Vpy9Rlrmtki20rkWfcVVJLqYqegKM84Q7PFVxaxFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HA6aBJ1R3iKzeH01e2ZvKFmAkBmyAmudIrEY1++ZA3U=;
 b=k82ATNTprhNabhJF12iEi9BOPSS6sN6KEzzbF5l0s+uHYMwlPl/wOoGgzUvsSBFqKxvVRrZSj8l8ATJjJedsgCeNZ8kSrGjyTYSDJl0mrZB6bDmpVRv5c9P2aSs/ww07DNWLeeyqf7TSkF5MCQyTpw6ChoNsjVFjKqCMkGP37tw/ehiT6MJFpjMuHGpxV6m4i0h9sxdU5HVTvDOuV//SN5wI6RTqP1JjjHIM8wKaljKVl9VAm/VEjRbTqDTfqOsPZ4bqWGhwVCM/bmB7LeFgIWZ33+dMmfoS7V6v8MrJYjyztAhjcRbmk4au7g8+xCtqcAr/yq2F7JiWdxKpo/pBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA6aBJ1R3iKzeH01e2ZvKFmAkBmyAmudIrEY1++ZA3U=;
 b=zSgq8Fzr1GN2fq/zDrz5LiA12uJcGiq+NVuxPF1bA+ZUYt3FabWQ9NC30DtXl1hxtjVL2D+0su7pVeMOa/7U7a0wLg8Q9nmao7sUThMyby1zmm+VL2Zw5BIFKglbw3iAKpzGwzJdLS1M1WBX1viGCCwd3eGtOaog6WWnLf9qOrU=
Received: from VE1PR08MB4768.eurprd08.prod.outlook.com (2603:10a6:802:ab::22)
 by PA4PR08MB6288.eurprd08.prod.outlook.com (2603:10a6:102:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 09:12:14 +0000
Received: from VE1PR08MB4768.eurprd08.prod.outlook.com
 ([fe80::c5d6:51e5:3626:b794]) by VE1PR08MB4768.eurprd08.prod.outlook.com
 ([fe80::c5d6:51e5:3626:b794%4]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 09:12:13 +0000
From: Ben Horgan <Ben.Horgan@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm][PATCH] arm-bsp/optee-test: tc: Limit xtest to a single
 thread
Thread-Topic: [meta-arm][PATCH] arm-bsp/optee-test: tc: Limit xtest to a
 single thread
Thread-Index: AQHYGR5Y3d/wobJsd0iaND3akLgAHKyC2DiAgABDwW0=
Date: Fri, 4 Feb 2022 09:12:13 +0000
Message-ID: 
 <VE1PR08MB4768DB2776FC0240E3313F3891299@VE1PR08MB4768.eurprd08.prod.outlook.com>
References: <20220203165135.26872-1-ben.horgan@arm.com>
 <CAFA6WYPT7+dKditfukA-R4kkAMeUCGd1Z=zbhs__q6=f89bXZA@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYPT7+dKditfukA-R4kkAMeUCGd1Z=zbhs__q6=f89bXZA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: d56cedad-2233-d78c-aad6-76a85bd3a1d2
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5668901f-8283-448b-093f-08d9e7be74a1
x-ms-traffictypediagnostic: 
	PA4PR08MB6288:EE_|VE1EUR03FT053:EE_|AM0PR08MB3699:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB36992D4ADE48790E00C53CDB91299@AM0PR08MB3699.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BMwVJPn+uOxfzs1joVY8aFeUn5blNToqxzcnaY11WWJwSw6JU+JbqhjAx/FTYez6SYrohgGc0PJljsyGnL3LBzXXoV+y9dZgNR2WLopwGWuLzN0icF4iUt3bZhqolwjCn+HI0g8yRqyHHa1sw1cARnHO7ysgVFVcbFc0IAOCCjSj6uiG2A6QK4GpcgdTGkvYn0zXwYAY97/fP2NSR3k7JmNvFMBMI2lpYtQ2PwJyYpt6Nodpu6taN5EZn6naMJ3X20ifo9gLxUh+CVG5wPY6hTfohJrpY4e8YUt0uSmahtAwA5dt+AQysbLJ7bqws/1akKS2Vcwc2Nz4krBQjidM4uliDzHzyRlWRfF5TBOGi6yeSpXwPMitHg1xJ37xVdnwFjbB1VYryamm74HY28BXpbT0W++p3ZryLU/XItP+LChGTEnUdfLmz6qUM9iLWVpohyAyWnY+aAtfDOe8oKMtAnfFclUhBKOpWMyEqTBO7BDF+F67mOPYGilaqazQcgMHNYL5l0oPFohgfYaY2i9ovPxdOnxtE1KAzVOu7a1qnLNt3s+xl4urFp7rY7RwL0sYl0qQPQN7ZzK2KRoGeQI/Dx87XJvo1CMSaFtnwDzEl5UaVzDmO4w7ZQZGWA3yTWclXcDSj2/2MfVOBz7g1e2P2rmJkoHZrKS1Wr1bYOYrie8uC3o8qka85jgkqbydZr1uAQJQMr2agkTdn/BKaeIw95U2ZtHLycmJ2PxhoxckJ2+uJ+SFAnNaPiKw9Ekx5Y6RhuYaYmLC43iTEjGbS6Ge2KGp2WQMWaSgz5JVtkLaWdpfMoMx+HW9BbVeELimlQb0
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4768.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(9686003)(6506007)(7696005)(53546011)(66476007)(66556008)(86362001)(91956017)(508600001)(8676002)(8936002)(64756008)(76116006)(4326008)(71200400001)(66446008)(166002)(66946007)(5660300002)(55016003)(55236004)(83380400001)(38070700005)(122000001)(52536014)(186003)(2906002)(33656002)(26005)(19627405001)(6916009)(316002)(966005);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_VE1PR08MB4768DB2776FC0240E3313F3891299VE1PR08MB4768eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6288
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	73862655-bbdf-416b-359c-08d9e7be6ed5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k1jyUZSUr6NsH0nG3bHbzUkrD9iq11QKW/px4tUROQJioPI1D/UT6TTuoaD6mMma+Rgnt6ol4QiR47ko7ffMjwR4qfIStFszNMDMhqTwbd/RHG+XbPP4t1z91GplIiJkUTtcEFu65wmF80A08tC1icQpNl2iNVN3hQa5NzaINwZ1M35VK5rFrLyGe+/IUamUtLmyf5xF13iYogUygHm0j1tZKdIT604k2TZeVnFtNL4Im7PvsYouRKFcU/Uvr18dgQwtsB3C9oARnJ8iYWsak0LGHc8LC3WOifi11nybkxZCZz4ebDKNkuEV3ba/12J6ePhFlsea4zEQ0pFfPk8GzbV9Wd0jG9ZOrSkivYOC3OhkYL741rBQs4lP41YDfhkWJ7dV6fEa8DvgxCiqbCELStxpGXJPZnxP6etj91k16cu5HsnBTHGLBHpLTX0klBieCKyuo57RNrvt58GyGHUy+VUTdOu4phxzeYdp7h9MFBdW6MXApW2dDJs4YQeJdz74jtSnlBEMZNNLlTec/uXw8bNFVclJN4MkbdrDe/Hbj7el6KI4K7OlB6nB38DMliNa7Lu/03vqjbH18jJlSC1oIovk8u/Yld7RX5di4qC3pdexCPw/8Bcyw9GDL++gHoXl7jwKy+shFSGKC2IDfi7aqEQzVt5nuZGRL05yqn0c7y3ov1to8vKtX5teLptn4SudnKTxE51vREL1SF61ZBo/IhMrPrUkeKujX85E/AYRjZ3OgrHf0OMkvi/OuZUC5zlrt+KPruqluPaMRMuuII/UWkUz43NLJ09LZYnfLUvKf/M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(9686003)(7696005)(966005)(6506007)(19627405001)(53546011)(52536014)(33656002)(508600001)(55016003)(5660300002)(47076005)(166002)(83380400001)(316002)(36860700001)(82310400004)(70586007)(4326008)(6862004)(8676002)(8936002)(2906002)(70206006)(336012)(186003)(26005)(356005)(40460700003)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:12:23.4701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5668901f-8283-448b-093f-08d9e7be74a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3699
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Feb 2022 09:12:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2950

--_000_VE1PR08MB4768DB2776FC0240E3313F3891299VE1PR08MB4768eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, currently it doesn't look like an issue with the OP-TEE.

Ben
________________________________
From: Sumit Garg <sumit.garg@linaro.org>
Sent: 04 February 2022 05:08
To: Ben Horgan <Ben.Horgan@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm][PATCH] arm-bsp/optee-test: tc: Limit xtest to a sin=
gle thread

On Thu, 3 Feb 2022 at 22:21, Ben Horgan <ben.horgan@arm.com> wrote:
>
> When multiple threads are allowed xtest will fail and
> leave the system in a bad state after repeated runs.

Interesting failure. Is it reproducible for total compute platform
only? BTW, if you observe this as a generic problem then the best
place to seek support is to raise an OP-TEE issue here [1].

[1] https://github.com/OP-TEE/optee_os/issues

-Sumit

>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Change-Id: I16f07df1a362540560975deaa5a291a68c332bfb
> ---
>  ...xtest-Limit-tests-to-a-single-thread.patch | 55 +++++++++++++++++++
>  .../recipes-security/optee/optee-test-tc.inc  |  7 ++-
>  2 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-test/=
tc/0001-xtest-Limit-tests-to-a-single-thread.patch
>
> diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001=
-xtest-Limit-tests-to-a-single-thread.patch b/meta-arm-bsp/recipes-security=
/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch
> new file mode 100644
> index 0000000..370a81c
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-=
Limit-tests-to-a-single-thread.patch
> @@ -0,0 +1,55 @@
> +From 73bef38c5697cd6bd3ddbe9046681087f4f6454e Mon Sep 17 00:00:00 2001
> +From: Ben Horgan <ben.horgan@arm.com>
> +Date: Thu, 27 Jan 2022 10:33:04 +0000
> +Subject: [PATCH] xtest: Limit tests to a single thread
> +
> +Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> +Upstream-Status: Inappropriate [Workaround for intermittent failures]
> +---
> + host/xtest/regression_1000.c | 2 +-
> + host/xtest/regression_2000.c | 2 +-
> + host/xtest/regression_6000.c | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
> +index 9ee9d02..82d1def 100644
> +--- a/host/xtest/regression_1000.c
> ++++ b/host/xtest/regression_1000.c
> +@@ -1080,7 +1080,7 @@ static void *test_1013_thread(void *arg)
> +       return NULL;
> + }
> +
> +-#define NUM_THREADS 3
> ++#define NUM_THREADS 1
> +
> + static void xtest_tee_test_1013_single(ADBG_Case_t *c, double *mean_con=
currency,
> +                                      const TEEC_UUID *uuid)
> +diff --git a/host/xtest/regression_2000.c b/host/xtest/regression_2000.c
> +index 0591a42..a9f4b95 100644
> +--- a/host/xtest/regression_2000.c
> ++++ b/host/xtest/regression_2000.c
> +@@ -499,7 +499,7 @@ out:
> +       return NULL;
> + }
> +
> +-#define NUM_THREADS   3
> ++#define NUM_THREADS   1
> +
> + static void xtest_tee_test_2002(ADBG_Case_t *c)
> + {
> +diff --git a/host/xtest/regression_6000.c b/host/xtest/regression_6000.c
> +index ca1c254..d67ea7f 100644
> +--- a/host/xtest/regression_6000.c
> ++++ b/host/xtest/regression_6000.c
> +@@ -1568,7 +1568,7 @@ exit:
> + }
> +
> +
> +-#define NUM_THREADS 4
> ++#define NUM_THREADS 1
> + static void xtest_tee_test_6016_loop(ADBG_Case_t *c, uint32_t storage_i=
d)
> + {
> +       struct test_6016_thread_arg arg[NUM_THREADS] =3D { };
> +--
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc b/meta=
-arm-bsp/recipes-security/optee/optee-test-tc.inc
> index 62fa0a0..af73675 100644
> --- a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
> +++ b/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
> @@ -1,3 +1,8 @@
> -# TC0 specific configuration
> +# TC specific configuration
> +
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-test/tc:"
> +SRC_URI:append:tc =3D " \
> +    file://0001-xtest-Limit-tests-to-a-single-thread.patch \
> +    "
>
>  COMPATIBLE_MACHINE =3D "(tc?)"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2946): https://lists.yoctoproject.org/g/meta-arm/mess=
age/2946
> Mute This Topic: https://lists.yoctoproject.org/mt/88887066/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@=
linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_VE1PR08MB4768DB2776FC0240E3313F3891299VE1PR08MB4768eurp_
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
Thanks, currently it doesn't look like an issue with the OP-TEE.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Ben<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sumit Garg &lt;sumit.=
garg@linaro.org&gt;<br>
<b>Sent:</b> 04 February 2022 05:08<br>
<b>To:</b> Ben Horgan &lt;Ben.Horgan@arm.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Subject:</b> Re: [meta-arm][PATCH] arm-bsp/optee-test: tc: Limit xtest t=
o a single thread</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, 3 Feb 2022 at 22:21, Ben Horgan &lt;ben.ho=
rgan@arm.com&gt; wrote:<br>
&gt;<br>
&gt; When multiple threads are allowed xtest will fail and<br>
&gt; leave the system in a bad state after repeated runs.<br>
<br>
Interesting failure. Is it reproducible for total compute platform<br>
only? BTW, if you observe this as a generic problem then the best<br>
place to seek support is to raise an OP-TEE issue here [1].<br>
<br>
[1] <a href=3D"https://github.com/OP-TEE/optee_os/issues">https://github.co=
m/OP-TEE/optee_os/issues</a><br>
<br>
-Sumit<br>
<br>
&gt;<br>
&gt; Signed-off-by: Ben Horgan &lt;ben.horgan@arm.com&gt;<br>
&gt; Change-Id: I16f07df1a362540560975deaa5a291a68c332bfb<br>
&gt; ---<br>
&gt;&nbsp; ...xtest-Limit-tests-to-a-single-thread.patch | 55 +++++++++++++=
++++++<br>
&gt;&nbsp; .../recipes-security/optee/optee-test-tc.inc&nbsp; |&nbsp; 7 ++-=
<br>
&gt;&nbsp; 2 files changed, 61 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta-arm-bsp/recipes-security/optee/files/opt=
ee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch<br>
&gt;<br>
&gt; diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0=
001-xtest-Limit-tests-to-a-single-thread.patch b/meta-arm-bsp/recipes-secur=
ity/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.pat=
ch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..370a81c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xte=
st-Limit-tests-to-a-single-thread.patch<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +From 73bef38c5697cd6bd3ddbe9046681087f4f6454e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Ben Horgan &lt;ben.horgan@arm.com&gt;<br>
&gt; +Date: Thu, 27 Jan 2022 10:33:04 +0000<br>
&gt; +Subject: [PATCH] xtest: Limit tests to a single thread<br>
&gt; +<br>
&gt; +Signed-off-by: Ben Horgan &lt;ben.horgan@arm.com&gt;<br>
&gt; +Upstream-Status: Inappropriate [Workaround for intermittent failures]=
<br>
&gt; +---<br>
&gt; + host/xtest/regression_1000.c | 2 +-<br>
&gt; + host/xtest/regression_2000.c | 2 +-<br>
&gt; + host/xtest/regression_6000.c | 2 +-<br>
&gt; + 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_100=
0.c<br>
&gt; +index 9ee9d02..82d1def 100644<br>
&gt; +--- a/host/xtest/regression_1000.c<br>
&gt; ++++ b/host/xtest/regression_1000.c<br>
&gt; +@@ -1080,7 +1080,7 @@ static void *test_1013_thread(void *arg)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-#define NUM_THREADS 3<br>
&gt; ++#define NUM_THREADS 1<br>
&gt; +<br>
&gt; + static void xtest_tee_test_1013_single(ADBG_Case_t *c, double *mean_=
concurrency,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; const TEEC_UUID *uuid)<br>
&gt; +diff --git a/host/xtest/regression_2000.c b/host/xtest/regression_200=
0.c<br>
&gt; +index 0591a42..a9f4b95 100644<br>
&gt; +--- a/host/xtest/regression_2000.c<br>
&gt; ++++ b/host/xtest/regression_2000.c<br>
&gt; +@@ -499,7 +499,7 @@ out:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-#define NUM_THREADS&nbsp;&nbsp; 3<br>
&gt; ++#define NUM_THREADS&nbsp;&nbsp; 1<br>
&gt; +<br>
&gt; + static void xtest_tee_test_2002(ADBG_Case_t *c)<br>
&gt; + {<br>
&gt; +diff --git a/host/xtest/regression_6000.c b/host/xtest/regression_600=
0.c<br>
&gt; +index ca1c254..d67ea7f 100644<br>
&gt; +--- a/host/xtest/regression_6000.c<br>
&gt; ++++ b/host/xtest/regression_6000.c<br>
&gt; +@@ -1568,7 +1568,7 @@ exit:<br>
&gt; + }<br>
&gt; +<br>
&gt; +<br>
&gt; +-#define NUM_THREADS 4<br>
&gt; ++#define NUM_THREADS 1<br>
&gt; + static void xtest_tee_test_6016_loop(ADBG_Case_t *c, uint32_t storag=
e_id)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct test_6016_thread_arg arg[=
NUM_THREADS] =3D { };<br>
&gt; +--<br>
&gt; +2.17.1<br>
&gt; +<br>
&gt; diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc b/m=
eta-arm-bsp/recipes-security/optee/optee-test-tc.inc<br>
&gt; index 62fa0a0..af73675 100644<br>
&gt; --- a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc<br>
&gt; @@ -1,3 +1,8 @@<br>
&gt; -# TC0 specific configuration<br>
&gt; +# TC specific configuration<br>
&gt; +<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files/optee-test/tc:&qu=
ot;<br>
&gt; +SRC_URI:append:tc =3D &quot; \<br>
&gt; +&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-xtest-Limit-tests-to-a-sing=
le-thread.patch">file://0001-xtest-Limit-tests-to-a-single-thread.patch</a>=
 \<br>
&gt; +&nbsp;&nbsp;&nbsp; &quot;<br>
&gt;<br>
&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;(tc?)&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#2946): <a href=3D"https://lists.yoctoproject.org/g=
/meta-arm/message/2946">
https://lists.yoctoproject.org/g/meta-arm/message/2946</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/88887066=
/1777089">https://lists.yoctoproject.org/mt/88887066/1777089</a><br>
&gt; Group Owner: meta-arm+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsu=
b">https://lists.yoctoproject.org/g/meta-arm/unsub</a> [sumit.garg@linaro.o=
rg]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_VE1PR08MB4768DB2776FC0240E3313F3891299VE1PR08MB4768eurp_--

