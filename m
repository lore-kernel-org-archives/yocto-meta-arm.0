Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A321C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 11:32:54 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44])
 by mx.groups.io with SMTP id smtpd.web12.42099.1655811163173054767
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 04:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=HOt5Vci3;
 spf=pass (domain: arm.com, ip: 40.107.20.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AM1Y4On5mxSrmhwhkvyfS3OAT4DiXtTnN5C1nFFbuIWWfLbAm+Q6ErzANG46Es3Wa24HMIZUg13+23kowxWwC73h6825M2EDyVdh7fTTI/PB0hVUPfRHbTI5gr04P54R/Y0QVNdQbHg4iG3QMwod6UcKg20MlwAAZe8BAkfuu3uXbodFVAUnwuk64dt/t0GAhFvWhrykBf1K7gYUk23n5gwRR0FN7aFcuR0BDwRDnhsD4IEllRZvzIf/VQ/8XLCkqp6buYB1lM4yUO3su7ul9V/UhZWX3Qz+tbaK/3fvvFeTD83XpebSS8Lvo/TpiTYmZRJZMOZkhqaFPbtHGnIqXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE0MGvz9kzebOKiMi0I8f00p+t5mUuzqr7LiehfUQLs=;
 b=koYfwv9q5b4To1ybVZsi0C5RkorubBXMO7+xO51vwo3P+vZi7B7Jadt79LhyYYtFSv5VV/S2p4YV6D5bWzgLCS4iR8K2/BaKCWX+SmJJEBXdI3BkOCrfiTVx0pDqH6v1iUnuz6QJL/IcaVLSr9KFjuSKjSjhgP9s90b50+hnRIDeNA6zJyvccbCcNUGYzG+RGtctTCEqOA2lRQz+ZT7Fhq3F5v56UbpyZi0pCc5kK49q1xsEFOJx3ElIaHr2z8s5BKzrigxgvyiT8SrwHOe/h7Wubqd6IkgN8npIITJUHVvEeMKXBwwXkSGvjFZx4rIQO3DB2SPwFOZtYnXwjFvtOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE0MGvz9kzebOKiMi0I8f00p+t5mUuzqr7LiehfUQLs=;
 b=HOt5Vci3QntR8fEp9NsDI+sZoEOsajxZr3K34MJ54gYcHHLPPJEdz3Gd4GOkiwkT9u4QVhxbAFY4iYYvmowb4vWC3VbzkUEUWIrpiJXHDXrTg2dx0KL6v3ffOHlXarrEWXeWM03q+RroQGl/ytSjCO6RCri4o2H2BveGryKR598=
Received: from DB8PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:10:110::40)
 by AS8PR08MB6181.eurprd08.prod.outlook.com (2603:10a6:20b:29a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Tue, 21 Jun
 2022 11:32:39 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::ac) by DB8PR04CA0030.outlook.office365.com
 (2603:10a6:10:110::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22 via Frontend
 Transport; Tue, 21 Jun 2022 11:32:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Tue, 21 Jun 2022 11:32:39 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Tue, 21 Jun 2022 11:32:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c6567aa43d2bd1ab
X-CR-MTA-TID: 64aa7808
Received: from 26eb35de7599.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3D61A0E-AC4F-4270-9C16-AF61A9420920.1;
	Tue, 21 Jun 2022 11:32:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 26eb35de7599.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Jun 2022 11:32:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUdcqPZPfODEH4FcTeTFletD0Tq8MyafiZtqaI9jJKxaYlE7Z0CZ0r2ywj8IafjBjJ34N0xp9RsI5GJqE3EPBGfU3WosXRmGzJX7blyhQOpRLY2Yip1hnDhdOnwTV4TyES0XtsFpZfOhegWwfIUFHdBUE9m5P7oD+31VUuKDCSKkKv89nS93IwxOmT5+BzyOFAuOEUdRXzg4T7FBt93xhM593jnpfzsmkUrO4Z+Kk7AoRJq3dcJtk5HKaNYHli8ryGZ8qgSnbYGTEXjYHxLwrA6eAw/qlATI5B7ExbpiXIp8w8fskXR1zfeZDDstmQZEhA2Akkgftqr0oIHMahhM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE0MGvz9kzebOKiMi0I8f00p+t5mUuzqr7LiehfUQLs=;
 b=SACeGTHdTCSUM6QIbLEKiBczeo+vR4FW7TM98q0g88avAk9ULq7X1Mh/tP+yk50xA6hF1ASD8oPHlPCG4BywVt0axcly9LvIjuVpPPTTmiD+q0nbkMoIEIX3AlQnxA1LXtZXpnZs6/8zkLcVyr0t89C/HzoES2Qv/keMeMfs68xaKJU0k7dZY0U4LfpqxpLNNg5lmtWVW3DMoli+l0KIcvfZn/6slYV4vkGR+JrcP9k3Sd/E4XGz0sHl0rDwQ7A5glPlBBaYUYauFn+JUPn2dmGvyFJdFHaVMYksNzKT4tQP8mIfyvDPFvwiRB6pEUNocC25XCnNYCUn+5bC85oNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE0MGvz9kzebOKiMi0I8f00p+t5mUuzqr7LiehfUQLs=;
 b=HOt5Vci3QntR8fEp9NsDI+sZoEOsajxZr3K34MJ54gYcHHLPPJEdz3Gd4GOkiwkT9u4QVhxbAFY4iYYvmowb4vWC3VbzkUEUWIrpiJXHDXrTg2dx0KL6v3ffOHlXarrEWXeWM03q+RroQGl/ytSjCO6RCri4o2H2BveGryKR598=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by HE1PR0801MB2106.eurprd08.prod.outlook.com (2603:10a6:3:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 11:32:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5353.018; Tue, 21 Jun 2022
 11:32:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "stephen.yu@microchip.com" <stephen.yu@microchip.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: ARM cross compiler question
Thread-Topic: ARM cross compiler question
Thread-Index: AdiE5MLDmNP9r+fLQkOfETIUyN9KoQAfMVfd
Date: Tue, 21 Jun 2022 11:32:29 +0000
Message-ID: 
 <PA4PR08MB7411A86ECF5D9BC1BC3214EAE8B39@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: 
 <BYAPR11MB31898D00E13886070423652C8EB09@BYAPR11MB3189.namprd11.prod.outlook.com>
In-Reply-To: 
 <BYAPR11MB31898D00E13886070423652C8EB09@BYAPR11MB3189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 53a789ca-a3db-41ee-325d-08da5379bf5f
x-ms-traffictypediagnostic: 
	HE1PR0801MB2106:EE_|DBAEUR03FT020:EE_|AS8PR08MB6181:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB61811DF320052C600C5A1DFCE8B39@AS8PR08MB6181.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dk8r2f2ul1gLOPA8Zbu50CfoRh0pFTPsR7Wem7Vy2JF1/awxd8REAFNfQMXG1hzxMqqt+3nI+PEm2gmyYw9nqzZbPTJa88nsiW8xbqpuS9fZ8zsAsBw9Gq2zGFJRX5+7cWhL2SPXER+5Z6szGw0krtON7/WfskYRN2wiDUZRFwOmngy4+ep0umNxudlxlimZ/mpkhE/AuhmFHfXQAXJj6XFBYnNi/YMY4kzoAQla/QxvX8QM2j2iXuIn7psyeL99wdX//Wjt6OYzkY/3bt7oBD9l3nXeXbQi3J60pw0cBKUiMMExxMSxqUF62t4LOjv6aI2HgaATgvCmSS6zpckG3TTKb598IUL7MQYQpm1VpEnGyl518ZgDjAQzOxfo1BeXsPz1YgTWXUiW51VBY8wqJBfcmcLBU/MdYdbt9rHSCwuX6zD3BB8+uBfstM0eQipASTAzk+8rG1uRJqA9RUj6WuwCarNQykMwCvS6oL34oScAiwRasmAYwpH1qMoGCaAC6CWlcQoP28sCgadAWOCyN5mK9V+HnuSNP3QNcKeOIabwSDr/tpf0ekJHmwB+JOBwe2i+pgedn+6+DTjQ873kMoDNXzXEh/RCxz/6VjaHr1EdqcHGzFEHVEV0oG6i/Ubmlp25b/VLo+hOfPq8UPr2cxfME53qIZ22jp7utiRhj69SF/EFtu/cllMoS78JWa5rnFMkfzRh3JhUekIpcRuzkQZiR6Fy6a1XNUN+8ZUzhiA5Htnh6b49r607qYV4zq93iBXi++z+M2egGUhNiSLctBO6z/BVTSNoZE7Jv3Iuii4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(33656002)(8936002)(5660300002)(478600001)(52536014)(64756008)(83380400001)(26005)(966005)(7696005)(38070700005)(6506007)(186003)(55016003)(71200400001)(9686003)(41300700001)(166002)(91956017)(66946007)(316002)(2906002)(86362001)(3480700007)(8676002)(38100700002)(122000001)(66476007)(66556008)(110136005)(66446008)(76116006);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411A86ECF5D9BC1BC3214EAE8B39PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2106
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3fb8f567-9c31-4b89-4ee1-08da5379b96b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	60BPKCmW00HIROOq2k5hlDEDb0cvpshRrnrgFovHJ1/RXge70zKQf87MyWwNVO13EcR1bRyF0n7rsSJC0mxWRZ9jNpjyi1/oTCzklXlqrknZBjff4sK7RvSDaInilxoDS7P+pi8Wfv5ldpKHcjruHjMuyKCOivgZxZ+UebJBDD35uTMqlsSk0weqLqODoM56HIsTrm1Ev1KH2bdvdctq0XfU/Gw+ud3jIP3UeWxyYgATw4hl8UY6vXjnqEY6ED2XPX96avR20DLQRgcWJGcIqNH3XflQpaauIIkHZ6SwA4bVq/qOIbR3rbQFBZj8ds1zf0XAzi2VVKCEFI1SPfsS1SlY6+N4ASTineIHWoac/GyMLTX81Q1ZF5r5QnkLqxXPDHeu6mzaYtIV/eILZ1lMk6k7bzfrF68PphPXwy6IbXSX4cHq7gc74K0m2twirpiS1yG8TtkKutB8x/baDyGYk1sRPrCWi6zY0CqQpsDBhpk1O6cjVvVE4PqhqWvfEGEr08Hhv5rBfBukkXdJPmdBXoyrQFwgdHn8JtoPvbRNUv5jwgNhU+6fsZoKmueYR1UvKXocBQS3tTL7Blw1EJ7B59/CNOFQ3dqsONXMqGRp51Gjp+748+LFBZ1Yf3fEMu2Y2dIBImR4i0k6IHgqlp7qvXZKWIXPhwjMWr9hxuZy+0AgNV/JIFuyfHzw2Lfs5L2IB0uQWIJzg4LNs8+zV1TcQNeLrXdezBqrDvYoFb+ofr31+YcjgyVY7YmPxIVEnmUTEjdrNCI+C6uITkks7gIov4yAwD0lX1GeE41aWLyEKa4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(40470700004)(36840700001)(70206006)(70586007)(166002)(110136005)(316002)(33656002)(86362001)(36860700001)(82310400005)(336012)(2906002)(186003)(966005)(47076005)(40480700001)(55016003)(9686003)(8936002)(8676002)(82740400003)(83380400001)(356005)(41300700001)(6506007)(26005)(40460700003)(7696005)(52536014)(81166007)(3480700007)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 11:32:39.3025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53a789ca-a3db-41ee-325d-08da5379bf5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6181
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Jun 2022 11:32:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3520

--_000_PA4PR08MB7411A86ECF5D9BC1BC3214EAE8B39PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This is not Arm-specific, as demonstrated here:

https://godbolt.org/z/7bdeYrKxK

The problem is that you=92re breaking strict aliasing with your pointer cas=
ts:

<source>:12:32: warning: dereferencing type-punned pointer will break stric=
t-aliasing rules [-Wstrict-aliasing]
   12 |     v1 =3D ((uint16_t *)(&value))[0];

You=92ve wandered into undefined behaviour here, so this means that value i=
s effectively uninitialized here:

<source>:12:8: warning: 'value' is used uninitialized [-Wuninitialized]
   12 |     v1 =3D ((uint16_t *)(&value))[0];
      |     ~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

So, it=92s zero.  Turn on -Wall and you=92ll get the warnings from GCC that=
 this is happening.

Ross

From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Stephen Yu (Microchip) via lists.yoctoproject.org <stephen.yu=3Dm=
icrochip.com@lists.yoctoproject.org>
Date: Monday, 20 June 2022 at 21:43
To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Subject: [meta-arm] ARM cross compiler question
I have the following C source file arm_cast.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

int main(int argc, char **argv)
{
    uint32_t value =3D 0x1254FEBA;
    uint16_t v1, v2;
    uint16_t a[2];
    int loop;

    v1 =3D ((uint16_t *)(&value))[0];
    v2 =3D ((uint16_t *)(&value))[1];

    printf("value: hex -> 0x%x, dec -> %u\n", value, value);
    printf("v1: hex -> 0x%x, dec -> %u\n", v1, v1);
    printf("v2: hex -> 0x%x, dec -> %u\n", v2, v2);

    for (loop =3D 0; loop < 2; loop++)
        a[loop] =3D ((uint16_t *)(&value))[loop];

    printf("a[0]: hex -> 0x%x, addr -> %p\n", a[0], &a[0]);
    printf("a[1]: hex -> 0x%x, addr -> %p\n", a[1], &a[1]);

    return 0;
}

Cross compile from x86-64 to ARM
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
syu@ubuntu-virtual-machine:~$ echo $CC
arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a=
9 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security=
 -Werror=3Dformat-security --sysroot=3D/opt/poky/3.1.7/sysroots/cortexa9hf-=
neon-poky-linux-gnueabi
syu@ubuntu-virtual-machine:~$
syu@ubuntu-virtual-machine:~$ $CC -o arm_cast_o1 -O1 arm_cast.c
syu@ubuntu-virtual-machine:~$
syu@ubuntu-virtual-machine:~$ $CC -o arm_cast_o2 -O2 arm_cast.c
syu@ubuntu-virtual-machine:~$
syu@ubuntu-virtual-machine:~$ ls -lt arm_cast_o1 arm_cast_o2
-rwxrwxr-x 1 syu syu 11636 Jun 20 13:24 arm_cast_o2
-rwxrwxr-x 1 syu syu 11636 Jun 20 13:24 arm_cast_o1

Run the binary on target
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
root@Bev8040D:~# uname -a
Linux Bev8040D 5.4.124-altera #1 SMP Wed Nov 10 15:47:46 UTC 2021 armv7l ar=
mv7l armv7l GNU/Linux
root@Bev8040D:~#
root@Bev8040D:~# ls -lt arm_cast_o1 arm_cast_o2
-rwxr-xr-x 1 root root 11636 Dec  7 20:35 arm_cast_o2
-rwxr-xr-x 1 root root 11636 Dec  7 20:35 arm_cast_o1
root@Bev8040D:~#
root@Bev8040D:~# ./arm_cast_o1
value: hex -> 0x1254feba, dec -> 307560122
v1: hex -> 0xfeba, dec -> 65210
v2: hex -> 0x1254, dec -> 4692
a[0]: hex -> 0xfeba, addr -> 0x7ebf3b88
a[1]: hex -> 0x1254, addr -> 0x7ebf3b8a
root@Bev8040D:~#
root@Bev8040D:~# ./arm_cast_o2
value: hex -> 0x1254feba, dec -> 307560122
v1: hex -> 0xfeba, dec -> 65210
v2: hex -> 0x1254, dec -> 4692
a[0]: hex -> 0x0, addr -> 0x7ede7b88
a[1]: hex -> 0x0, addr -> 0x7ede7b8a

The issue was that with -O2, a[0] and a[1] were 0, which seemed incorrect i=
n my opinion. I did the same experiment with $CXX. The result was correct. =
For both -O1 and -O2, a[0] and a[1]  had the same non-zero value. Note that=
 the target runs Dunfell distro. Again, I tested the Honister and it seemed=
 having the same issue.

Any idea and suggestion?

Thanks,
Stephen


--_000_PA4PR08MB7411A86ECF5D9BC1BC3214EAE8B39PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">This is not Arm-specific, as demonstrated here:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><a href=3D"https://godbolt.org/z/7bdeYrKxK">https://godbolt.org/z/7=
bdeYrKxK</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">The problem is that you=92re breaking strict aliasing with your poi=
nter casts:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&lt;source&gt;:12:32: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules [-Wstrict-aliasing]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp; 12 |&nbsp;&nbsp;&nbsp;&nbsp; v1 =3D ((uint16_t *)(&amp=
;value))[0];<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">You=92ve wandered into undefined behaviour here, so this means that=
 value is effectively uninitialized here:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&lt;source&gt;:12:8: warning: 'value' is used uninitialized [-Wunin=
itialized]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp; 12 |&nbsp;&nbsp;&nbsp;&nbsp; v1 =3D ((uint16_t *)(&amp=
;value))[0];<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; ~~~^~~~~~~=
~~~~~~~~~~~~~~~~~~~~<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">So, it=92s zero.&nbsp; Turn on -Wall and you=92ll get the warnings =
from GCC that this is happening.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><br>
Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;color:black">From:
</span></b><span lang=3D"EN-US" style=3D"font-size:12.0pt;color:black">meta=
-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.org&gt; on beha=
lf of Stephen Yu (Microchip) via lists.yoctoproject.org &lt;stephen.yu=3Dmi=
crochip.com@lists.yoctoproject.org&gt;<br>
<b>Date: </b>Monday, 20 June 2022 at 21:43<br>
<b>To: </b>meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Subject: </b>[meta-arm] ARM cross compiler question<o:p></o:p></span></p=
>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">I have the following C source file arm_cast.c</span><span la=
ng=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">#include &lt;stdlib.h&gt;</span><span lang=3D"EN-US" style=
=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">#include &lt;stdio.h&gt;</span><span lang=3D"EN-US" style=3D=
"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">#include &lt;stdint.h&gt;</span><span lang=3D"EN-US" style=
=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">int main(int argc, char **argv)</span><span lang=3D"EN-US" s=
tyle=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">{</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; uint32_t value =3D 0x1254FEBA;</span><spa=
n lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; uint16_t v1, v2;</span><span lang=3D"EN-U=
S" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; uint16_t a[2];</span><span lang=3D"EN-US"=
 style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; int loop;</span><span lang=3D"EN-US" styl=
e=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; v1 =3D ((uint16_t *)(&amp;value))[0];</sp=
an><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; v2 =3D ((uint16_t *)(&amp;value))[1];</sp=
an><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;value: hex -&gt; 0x%x, dec -=
&gt; %u\n&quot;, value, value);</span><span lang=3D"EN-US" style=3D"font-si=
ze:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;v1: hex -&gt; 0x%x, dec -&gt=
; %u\n&quot;, v1, v1);</span><span lang=3D"EN-US" style=3D"font-size:11.0pt=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;v2: hex -&gt; 0x%x, dec -&gt=
; %u\n&quot;, v2, v2);</span><span lang=3D"EN-US" style=3D"font-size:11.0pt=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; for (loop =3D 0; loop &lt; 2; loop++)</sp=
an><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a[loop] =3D ((uin=
t16_t *)(&amp;value))[loop];</span><span lang=3D"EN-US" style=3D"font-size:=
11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;a[0]: hex -&gt; 0x%x, addr -=
&gt; %p\n&quot;, a[0], &amp;a[0]);</span><span lang=3D"EN-US" style=3D"font=
-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; printf(&quot;a[1]: hex -&gt; 0x%x, addr -=
&gt; %p\n&quot;, a[1], &amp;a[1]);</span><span lang=3D"EN-US" style=3D"font=
-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;&nbsp;&nbsp; return 0;</span><span lang=3D"EN-US" styl=
e=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">}</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">Cross compile from x86-64 to ARM</span><span lang=3D"EN-US" =
style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">syu@ubuntu-virtual-machine:~$ echo $CC</span><span lang=3D"E=
N-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a9 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -W=
format-security -Werror=3Dformat-security --sysroot=3D/opt/poky/3.1.7/sysro=
ots/cortexa9hf-neon-poky-linux-gnueabi</span><span lang=3D"EN-US" style=3D"=
font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">syu@ubuntu-virtual-machine:~$
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">syu@ubuntu-virtual-machine:~$ $CC -o arm_cast_o1 -O1 arm_cas=
t.c
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">syu@ubuntu-virtual-machine:~$
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">syu@ubuntu-virtual-machine:~$ $CC -o arm_cast_o2 -O2 arm_cas=
t.c
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">syu@ubuntu-virtual-machine:~$
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">syu@ubuntu-virtual-machine:~$ ls -lt arm_cast_o1 arm_cast_o2=
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">-rwxrwxr-x 1 syu syu 11636 Jun 20 13:24 arm_cast_o2</span><s=
pan lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">-rwxrwxr-x 1 syu syu 11636 Jun 20 13:24 arm_cast_o1</span><s=
pan lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">Run the binary on target</span><span lang=3D"EN-US" style=3D=
"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">root@Bev8040D:~# uname -a
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">Linux Bev8040D 5.4.124-altera #1 SMP Wed Nov 10 15:47:46 UTC=
 2021 armv7l armv7l armv7l GNU/Linux</span><span lang=3D"EN-US" style=3D"fo=
nt-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">root@Bev8040D:~#
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">root@Bev8040D:~# ls -lt arm_cast_o1 arm_cast_o2</span><span =
lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">-rwxr-xr-x 1 root root 11636 Dec&nbsp; 7 20:35 arm_cast_o2</=
span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">-rwxr-xr-x 1 root root 11636 Dec&nbsp; 7 20:35 arm_cast_o1</=
span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">root@Bev8040D:~#
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">root@Bev8040D:~# ./arm_cast_o1</span><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">value: hex -&gt; 0x1254feba, dec -&gt; 307560122</span><span=
 lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">v1: hex -&gt; 0xfeba, dec -&gt; 65210</span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">v2: hex -&gt; 0x1254, dec -&gt; 4692</span><span lang=3D"EN-=
US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">a[0]: hex -&gt; 0xfeba, addr -&gt; 0x7ebf3b88</span><span la=
ng=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">a[1]: hex -&gt; 0x1254, addr -&gt; 0x7ebf3b8a</span><span la=
ng=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">root@Bev8040D:~#
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">root@Bev8040D:~# ./arm_cast_o2</span><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">value: hex -&gt; 0x1254feba, dec -&gt; 307560122</span><span=
 lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">v1: hex -&gt; 0xfeba, dec -&gt; 65210</span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">v2: hex -&gt; 0x1254, dec -&gt; 4692</span><span lang=3D"EN-=
US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">a[0]: hex -&gt; 0x0, addr -&gt; 0x7ede7b88</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">a[1]: hex -&gt; 0x0, addr -&gt; 0x7ede7b8a</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">The issue was that with -O2, a[0] and a[1] were 0, which see=
med incorrect in my opinion. I did the same experiment with $CXX. The resul=
t was correct. For both -O1 and -O2, a[0] and a[1]
 &nbsp;had the same non-zero value. Note that the target runs Dunfell distr=
o. Again, I tested the Honister and it seemed having the same issue.</span>=
<span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">Any idea and suggestion?</span><span lang=3D"EN-US" style=3D=
"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">Thanks,</span><span lang=3D"EN-US" style=3D"font-size:11.0pt=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">Stephen</span><span lang=3D"EN-US" style=3D"font-size:11.0pt=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cour=
ier New&quot;">&nbsp;</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_PA4PR08MB7411A86ECF5D9BC1BC3214EAE8B39PA4PR08MB7411eurp_--

