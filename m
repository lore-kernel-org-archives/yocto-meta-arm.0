Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.71])
 by mx.groups.io with SMTP id smtpd.web12.13610.1589900291364872898
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 07:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lsI+w41Y;
 spf=pass (domain: arm.com, ip: 40.107.6.71, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sJAZkB++i6pYR4sHBG/2n2gAFQjU/9mx/VW3Eqi6xA=;
 b=lsI+w41YOyCjN/KVaJ7tzI4qtaE2ePQww6PKyUKDmigUW3rr7S+W0jll/7zHe3xVH86bfqIh44FWMJfOAJJpH4t2+SqhYkL9HCOAMG2ox3hKEHGmXa1/oeQ6uY5JhF8tfjtIB0efCSOICzlOcGrlw3JG5pntDqC5PoEZW7e+esU=
Received: from DB7PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:10:36::35)
 by VE1PR08MB5149.eurprd08.prod.outlook.com (2603:10a6:803:107::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Tue, 19 May
 2020 14:58:08 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::9b) by DB7PR05CA0022.outlook.office365.com
 (2603:10a6:10:36::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26 via Frontend
 Transport; Tue, 19 May 2020 14:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Tue, 19 May 2020 14:58:08 +0000
Received: ("Tessian outbound 14e212f6ce41:v57"); Tue, 19 May 2020 14:58:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6db4634f7fded757
X-CR-MTA-TID: 64aa7808
Received: from 3d85aedc3687.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 543E4D94-8A87-4015-BB67-129448F348B4.1;
	Tue, 19 May 2020 14:58:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d85aedc3687.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 May 2020 14:58:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnwqOChtjCB9PHzaaoAsf3p2tf0l0IAwYfdbUQNq2qVXlcbwwUOf4HU31beq/zBClHrP6pud02NGg5uvbAdox4IeuALyK8hNxLKerzlGQjJxe5hMSpVPguu+IjMJjJ0S0JtiV1u8Nlt+aQLOHC5R/Tl4likQaJOQaaWlfETv+wh3xMvjYcuoWuLEQ7j3b5hv52e0MtHtWOw9z7nBTdZzkmNPhtJHetEFJ6pHhnTr/APdT0hAnwel58Jni4G2bgQtNOofDV0NG/cnVAybon/Q3d3TggfXlshXIQen58jzkWMOjEvNQGwRuBalQwfX0LycQ1LIYqH5SScd6Q8n01rdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sJAZkB++i6pYR4sHBG/2n2gAFQjU/9mx/VW3Eqi6xA=;
 b=dQvcEidD0FW4TxWCdHRV7Bg/tkk4zJ5Y3LmoXhMQj0VmpWLpuc7TdDBYctt9J2vDtWy7jJD7qibhWaH2WRrCzhpkFfvxS4GiqCuXq3EMpQGtK8pWJReGlEOJlitqZ+FxLqQJDIH5kRRXjdGptedrelv6P0ENkQb6orb0Al8btqHNkd6lq0TFRs5Bb11xmExQmvRiLHRIc9OzXA0Op4Gx649ZocVdFlv+73gFCJeZJGLm3jCPEzL4M64RRQ9c9WzNCz0Xua4qDwnMTu3gn8EToD7OKMedYhcu1D60fPZIIsN9ebNmE5RjzIaPioFGJsYlF8koqDG32i7B2knU1m+zJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sJAZkB++i6pYR4sHBG/2n2gAFQjU/9mx/VW3Eqi6xA=;
 b=lsI+w41YOyCjN/KVaJ7tzI4qtaE2ePQww6PKyUKDmigUW3rr7S+W0jll/7zHe3xVH86bfqIh44FWMJfOAJJpH4t2+SqhYkL9HCOAMG2ox3hKEHGmXa1/oeQ6uY5JhF8tfjtIB0efCSOICzlOcGrlw3JG5pntDqC5PoEZW7e+esU=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB3539.eurprd08.prod.outlook.com (2603:10a6:208:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 14:58:00 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 14:58:00 +0000
CC: nd@arm.com
To: yocto-announce@yoctoproject.org, meta-arm@lists.yoctoproject.org
From: "Jon Mason" <jon.mason@arm.com>
Subject: meta-arm dunfell branch is now available
Message-ID: <a3e90a0a-2d07-cce1-6e23-0b9ba4d131b1@arm.com>
Date: Tue, 19 May 2020 10:57:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
X-ClientProxiedBy: MN2PR15CA0052.namprd15.prod.outlook.com
 (2603:10b6:208:237::21) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2605:a601:a664:2e00:1ca0:41e:d9bc:f60c] (2605:a601:a664:2e00:1ca0:41e:d9bc:f60c) by MN2PR15CA0052.namprd15.prod.outlook.com (2603:10b6:208:237::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Tue, 19 May 2020 14:58:00 +0000
X-Originating-IP: [2605:a601:a664:2e00:1ca0:41e:d9bc:f60c]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 215d6671-4ad3-40d3-44e7-08d7fc050aef
X-MS-TrafficTypeDiagnostic: AM0PR08MB3539:|VE1PR08MB5149:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB51499CFCE47AB63C5E9DA9BDF0B90@VE1PR08MB5149.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uLHIbu6uV9jHspLZXgXkRZBwM9P+4t/lS6uMweLqrQT81RrEm2x/yEd0lkBWJ4iI4RjofRfP04uqEYZ/sfgxeql67+ru1f3Myn/33HiHNNocQtgMK0qr/ucM0bxmzlqnSTfxhC1YGrc8OcNMvpPF7nD1pnPXcg+pWpjEblFlVw1h7j4FBU6v5snl0jmRAG/w0MGDB44Mzf6ztRRk1B5gtJsY0j/hoLyKZ3UGgac2/kIG2tLfnLXzA26tMZSbbay3VYyUcPE1hpCCLdcuPcZDU4c0qBAJTzMi6lbUBpySOyyv+VSYMrvCtB1Wwpi05X1SONW52dDdIxaZwh1UZklzwfxR43NIBx2vsa6gzVQ8ZjA2cDcc4cR7EBEpHJS4FYEN2q4oPK8Ee84Fnr/zP2XvC028r2KlszEzq4HLxxPe0iqsj5fBwgG7bvdxZpSMzH3ZSt2a10FJx+hrUJ2uH/x/7jdO/OdzE8fc9vBwvlP/N3F+vecLmfJCUgtC9dqJQL59uX9QGdetSZMkdG3+dcgQH1V8zHTlwgrU8sr4pSgxAe4obH+TO32A9HkMBxMeqgUnhCy0v3/Rd8qS+Prlu+3e52FHE4ie3jnR8II/ADv3nOwBkkxjpMvEoO+z9eiaoAR8
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(36756003)(966005)(8936002)(5660300002)(316002)(2906002)(186003)(478600001)(8676002)(4326008)(52116002)(31696002)(86362001)(66556008)(66946007)(6486002)(16526019)(66476007)(31686004)(2616005)(6666004)(44832011)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: sMAez1LRq/jk41ntXpmDRsL2cSEJiSrlXfG/9Se3Y0X8UqMVKtpiTbkQF9Q80vXX+BTlyzRBQPxyknfYUxW2nYNEXN83lJq0Smm0fOWxW29g4Pyrql1bFoAl1g05K/ebdGscts3Xoc3DrL21VZTRwVRsohK+sOltjcVHR+Rc6sGS8tNuJfky/0qsTHIvKkpI+vzWe0tt4qpwwopIhejyX8gaKR6TFcy3VxzpDMtL4zf4MnChxUA3oencAl5HaI0WZt5Op8fPaee0XKb7WLrV6aK+gBZXdZslmnwUCaUc4ESpTQJncWilGb8cDhv+Db+81vteDPs2QdhXIHe+NOhcrkftd2+dBstQeRbpXk+brXY/Kiael0T8dOk1OqZX5cvud3DXk9abV6m8ymLw/7lFYl+tnwNii+OBucT8Z9sW1es6gdFDMChtoz0Vt+N5o/3o1whak759lLYR+wTRQdJu37PclqD3dsSrn6uIla9/qPCsJs08OGmGQuSKuMG8NyyYMwDFlprpUYVw5NsWwWxvtrg4M9wvIXNEIZEzzaruZRHirG5X621eejpfdR6RiJTR
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3539
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966005)(26005)(8936002)(5660300002)(16526019)(36756003)(6486002)(70586007)(478600001)(86362001)(966005)(70206006)(316002)(186003)(31696002)(31686004)(4326008)(82740400003)(2616005)(44832011)(8676002)(6666004)(2906002)(356005)(336012)(47076004)(82310400002)(81166007)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	02a35539-b01e-4318-f3bf-08d7fc050630
X-Forefront-PRVS: 040866B734
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tM6NfGzlu3hYHnbu6C2JcVFJjpvhSVCGDGhKL82wxwAij/rAGVixtOKigKBoouuX9FLFTANImIxoreHyNkanp/RNPeMbUj5BpzbR5OcJV8+H7ZOafHhJqpVBuevSn1LKdQpZdvRMGxbABr/yDFUkC1NJfcy0wZgypJ/q8XO1uwKyIylqSgZ4VPR30XP2n2g6+T7uHCTuBHxcAoH2K4XZ4bknadTKjAX3uG7PM0/QbHvgv52aejjl5O2MIJT3xhKfv+c2RFXLXb7m0AIq8ol2VseEwPem8FrnH9iQksbJnnKsJPs0V2FhTefxFdpZnWHkPnShxcyw4jS7+Q5U7qfpZHjJqyzeogVfmoF4ROdKiv2v3XS8tCV3G2a68pl2Kc06PkgMO/JtJEbWFYJHi2gA7Hkhuvop+xhuG4kq+VPNlLZsmBpOH6iBvEuUt9547nk2F2IKK7u4T0ESPIsZ7nuGhkJ5kNySztGxds8fqCAlHGMhCtcDvPQb4hYzyPBLdcr+p2XTLwgCj7tXOZ6RbfjwAKJeKI11BgRVmYVUjUlLYtibAKrl021AD1oba4lT1UERYHGLJy6IeiAD1iXR5CG7nvpSU1jdKzvELQYwh0JjzutYiM17/3hSsLx29dmXwhUOjz0BJlYg8Y0QXU5p89tuYzdUdO+d/Idow2bYO8nr2Sg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 14:58:08.4643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 215d6671-4ad3-40d3-44e7-08d7fc050aef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5149
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

We are pleased to announce the creation of the dunfell branch for=20
meta-arm.=C2=A0 It can be found at
https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/log/?h=3Ddunfell

It contains support for:
* Trusted Firmware A - versions 2.1, 2.2, and 2.3
* OP-TEE
* OpenSCD
* BSPs
 =C2=A0=C2=A0=C2=A0 * a5ds
 =C2=A0=C2=A0=C2=A0 * foundation-armv8
 =C2=A0=C2=A0=C2=A0 * fvp-base
 =C2=A0=C2=A0=C2=A0 * gem5-arm64
 =C2=A0=C2=A0=C2=A0 * juno
 =C2=A0=C2=A0=C2=A0 * n1sdp
* Toolchains
 =C2=A0=C2=A0=C2=A0 * Arm GCC - versions 8.2, 8.3, and 9.2
 =C2=A0=C2=A0=C2=A0 * Arm GCC Binary Toolchains
* Arm Autonomy Virtualization/Hypervisor for autonomous systems


NOTE: We have been delaying this release for Gem5 v20 to avoid python2=20
dependencies in meta-arm.=C2=A0 However, the release appears to be delayed.=
=C2=A0=20
So, we are releasing with an RC of v20 (which has no python2=20
dependencies) and will update this branch once v20 is available.


This is the first release of meta-arm, and I would like to thank all of=20
the contributors and reviewers.=C2=A0 Here is a developer snapshot.


The dunfell release of meta-arm had 121 commits from 17 active=20
developers from 4 companies

Most active developers (by commits) for the dunfell release of meta-arm are=
:
1=C2=A0=C2=A0=C2=A0 Bertrand Marquis=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 3=
4=C2=A0=C2=A0=C2=A0 (28.10%)
2=C2=A0=C2=A0=C2=A0 Diego Sueiro=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 30=C2=
=A0=C2=A0=C2=A0 (24.79%)
3=C2=A0=C2=A0=C2=A0 Denys Dmytriyenko=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
20=C2=A0=C2=A0=C2=A0 (16.53%)
4=C2=A0=C2=A0=C2=A0 Jon Mason=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 10=C2=A0=
=C2=A0=C2=A0 (8.26%)
5=C2=A0=C2=A0=C2=A0 Vineeth Raveendran=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 6=C2=A0=C2=A0=C2=A0 (4.96%)
6=C2=A0=C2=A0=C2=A0 Peter Griffin=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 4=C2=
=A0=C2=A0=C2=A0 (3.31%)
7=C2=A0=C2=A0=C2=A0 Rui Silva=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 3=C2=A0=
=C2=A0=C2=A0 (2.48%)
8=C2=A0=C2=A0=C2=A0 Joshua Watt=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 2=C2=
=A0=C2=A0=C2=A0 (1.65%)
9=C2=A0=C2=A0=C2=A0 Sumit Garg=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 2=C2=A0=
=C2=A0=C2=A0 (1.65%)
10=C2=A0=C2=A0=C2=A0 Khasim Syed Mohammed=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 2=C2=A0=C2=A0=C2=A0 (1.65%)

Most active companies (by LoC) for the dunfell release of meta-arm are:
1=C2=A0=C2=A0=C2=A0 Arm=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 12362=C2=A0=C2=
=A0=C2=A0 (50.77%)
2=C2=A0=C2=A0=C2=A0 Linaro=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 11683=C2=A0=
=C2=A0=C2=A0 (47.98%)
3=C2=A0=C2=A0=C2=A0 Ti=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 260=C2=A0=C2=A0=
=C2=A0 (1.07%)
4=C2=A0=C2=A0=C2=A0 Gmail=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 44=C2=A0=C2=
=A0=C2=A0 (0.18%)

Most active companies (by commits) for the dunfell release of meta-arm are:
1=C2=A0=C2=A0=C2=A0 Arm=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 90=C2=A0=C2=A0=
=C2=A0 (74.38%)
2=C2=A0=C2=A0=C2=A0 Ti=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 20=C2=A0=C2=A0=
=C2=A0 (16.53%)
3=C2=A0=C2=A0=C2=A0 Linaro=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 8=C2=A0=C2=
=A0=C2=A0 (6.61%)
4=C2=A0=C2=A0=C2=A0 Gmail=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 3=C2=A0=C2=
=A0=C2=A0 (2.48%)

Most active companies (by LoC) for the dunfell release of meta-arm are:
1=C2=A0=C2=A0=C2=A0 Arm=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 12362=C2=A0=C2=
=A0=C2=A0 (50.77%)
2=C2=A0=C2=A0=C2=A0 Linaro=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 11683=C2=A0=
=C2=A0=C2=A0 (47.98%)
3=C2=A0=C2=A0=C2=A0 Ti=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 260=C2=A0=C2=A0=
=C2=A0 (1.07%)
4=C2=A0=C2=A0=C2=A0 Gmail=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 44=C2=A0=C2=
=A0=C2=A0 (0.18%)


We having more cool things coming to meta-arm.=C2=A0 Please join us!


