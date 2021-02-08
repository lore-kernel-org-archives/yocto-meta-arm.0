Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.51])
 by mx.groups.io with SMTP id smtpd.web10.34385.1612787327293022573
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Feb 2021 04:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=S009lw/I;
 spf=pass (domain: arm.com, ip: 40.107.22.51, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kzj11ODlUZlZ8FSUXM3KPTQ83h4RcWdnU+eLVERQ3HM=;
 b=S009lw/IzaPiL7xfHEJnBgq34BZbxbp1a3jHTGpQpXEuC1Td3FToPChUQ6Vv5u5wakjN/Im7kTpp7v4LvfEP0cqbuxSaVY/nZxH7dGj00AOvUtJB5OCact+uMq5r9E1+ApQl4/Uj/OchQLx5+4JEOCfIRxWRHMnzsGbmyJ0VKdQ=
Received: from MR2P264CA0028.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::16) by
 VI1PR08MB2943.eurprd08.prod.outlook.com (2603:10a6:802:23::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17; Mon, 8 Feb 2021 12:27:42 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::51) by MR2P264CA0028.outlook.office365.com
 (2603:10a6:500::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.26 via Frontend
 Transport; Mon, 8 Feb 2021 12:27:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 8 Feb 2021 12:27:41 +0000
Received: ("Tessian outbound f362b81824dc:v71"); Mon, 08 Feb 2021 12:27:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 746746aedbd26591
X-CR-MTA-TID: 64aa7808
Received: from f78228212958.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 16BD2D0C-C8B5-4374-9D89-651E5D82B36D.1;
	Mon, 08 Feb 2021 12:27:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f78228212958.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Feb 2021 12:27:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9CK0Bh8SKkGc8CeHr2PgQl30723EnMeDA5ffr8YH1YdqGtgriJKdmWh7swhEIUmxW8hiPtghwcNHIqHwY8kRjLW1S87CfIKXdPHY8Nofcxp3/Pj9BSKtmnoqRMTB9Hp8Tx0UApmVsGIDRYMmTUhIKuPqD3ngy+d946oyXI6BBpt0uT2c2ZOODjXgxPDUPlZZSnh+bR+oDQ+k8t/+94jYSSTQOWiFQo1cefTYM64i1RGOvBQ9JXLOgNOVg6oih/1uJ1idbtv+tQeASZRFLjZMt9mr31COtwiJ9COyqzigw0NB6wrs5omXm/ZNNPWW1uCW07iFKTU9NeA9JP1dotBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kzj11ODlUZlZ8FSUXM3KPTQ83h4RcWdnU+eLVERQ3HM=;
 b=O/Zr3O5Ly3dWx8h9ILCAgEaVaPFrnRxSqwPWNOfl/LxFvcgzSkHy7U0kwSfQCGyc0iVgeDi64DZl71u8meMp9XdO9EBrKY7SVENEU/R1VXTnaUUOQ5BZJbgsnDUqMuqq2Rpd6qYSLcXUZogVrYh9FG3q2wzmo2mUDlgmdJ1E5LMXhUpgivaA5uVFQjm3jCduYNEn6kgqH8BbyrQhm6cUaMJSj7XPe5TAU8mWokl5pvbvWkxuEjJ3GklayDPiRko/xbEmx/5iKGZeEE2qSSovKotMXhimwAh2n1rME/IJNbrsNqqDFfxYtjPPGP4ngjjrrG9TbN0W67r8LxslVJUkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kzj11ODlUZlZ8FSUXM3KPTQ83h4RcWdnU+eLVERQ3HM=;
 b=S009lw/IzaPiL7xfHEJnBgq34BZbxbp1a3jHTGpQpXEuC1Td3FToPChUQ6Vv5u5wakjN/Im7kTpp7v4LvfEP0cqbuxSaVY/nZxH7dGj00AOvUtJB5OCact+uMq5r9E1+ApQl4/Uj/OchQLx5+4JEOCfIRxWRHMnzsGbmyJ0VKdQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VE1PR08MB5855.eurprd08.prod.outlook.com (2603:10a6:800:1a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Mon, 8 Feb
 2021 12:27:33 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::cac:e7b3:c805:602]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::cac:e7b3:c805:602%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 12:27:33 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 2/2] arm-bsp/tc0: add Theodul DSU support
Date: Mon,  8 Feb 2021 12:26:52 +0000
Message-ID: <20210208122652.2122054-2-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208122652.2122054-1-arunachalam.ganapathy@arm.com>
References: <20210208122652.2122054-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::33) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.50) by LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Mon, 8 Feb 2021 12:27:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d9acc4d-e17c-448a-57b4-08d8cc2cedf5
X-MS-TrafficTypeDiagnostic: VE1PR08MB5855:|VI1PR08MB2943:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB2943EA8A7079DD8DF1EBF860FB8F9@VI1PR08MB2943.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Qov0N7XjbPAsJjEy84uEJfreZoiDPbARZ/D6WZJmClUackw3h4VY/9IiFPGuEp4m2ROm8GTf/19IWDanHUtIGrdRwUbNcSlWJbzlS5m3Ixm8eQNFlNgljIbZc7OC4almrBe2+WnWeus95TcMEOMCHMjx3DgqirkZWhCbXw1oey/1xSABRFLNBHGzYhW0lRT+3CDSNpZFzbKRsoL1AObSxWcqm9b0zM4fPlyOqqRGuUYk8h2FAYKdCXZSbyUeHy1b0sC4TzBCaYz30Dgr36sGfaZBfw4fqhhEXp4EI1FxK0aIt9tFduqWXpSfaIHISaeBtKtwWy5TQkQuf3fCLjyTtZoXGCmTpK0yVTQXFyWSLAl/DBResw5Hn68bItE6I51bdDNK/3XuhqQbmPES/8z/ULMl2o1jLsfo1WWOs5fTAfFdLb+g2XTUY3Ta+pAH9o2UvkfHjC5/fVbn0wvExTQIlpSQfTGxmAB7KJcaPDYR4Ak1HYKPYqjgBA45k2fm5HsaNtI5kAnSd3+CBdFkRO84MF4zWC7RALQMVWGEXsMSgJCqta2nL1FOWDG5osFmbcNHkmfgM9CWFO6kXNhFDwBQfxnbKXfbo6+vqb5y3F3if5M=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(4326008)(956004)(2616005)(478600001)(26005)(7696005)(966005)(86362001)(6916009)(66946007)(66556008)(66476007)(8676002)(6666004)(2906002)(44832011)(30864003)(316002)(36756003)(16526019)(6486002)(186003)(5660300002)(83380400001)(8936002)(1076003)(19627235002)(52116002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?juA07dnYHLHdVw5jTzwsJ7/pmU8QdA8dDwEI/xv749gxbuWFmyphZ4GbR2rA?=
 =?us-ascii?Q?1XwPXsOzzD1seQkwKbVR68oPbqaacwwxWn1wpMd8uwuBs5kVYDNmSJKx2Yhp?=
 =?us-ascii?Q?g15m61jMT6eMEGgd+daqV134aF8Nc+pGK1N5rMNMS0/GvhXNTZ2JltPvHamQ?=
 =?us-ascii?Q?DsvTKlTK/aDeeTly1oVyMOkWEzZi7HF+RB6bk0RYBxW79+eKTwo8PquAcFld?=
 =?us-ascii?Q?Ot2FLDqR8yM4N6QKetDd3o59fSFaErUV+gHQ/QK+ta4etNPV+PK5tfXPJ2/G?=
 =?us-ascii?Q?mrR9/fp2QMUpeF+ErX+usjbSwqDP7rRkxeK5R0oCMjYVDZdx0CcdvGcxPdJU?=
 =?us-ascii?Q?HBqcsaNQ0PNXhvw70HOvECir6ClaFJ9un5MFu8vp/xKu59GX+oLTWArDyfyI?=
 =?us-ascii?Q?TDLbekxJWe+1O5I4P4/KdRJX0F6Fk9qTC5IRARKLdBoiGCPdR5Dtknidge8t?=
 =?us-ascii?Q?MNMvhyj/k9J770FQzfxhktIAheu3cGVADuueeulnNR7kdPw7bZHGPSIYr0dz?=
 =?us-ascii?Q?vmyR2NHFrCsyQpa9UhVqaMXWFIRfsJnFFY7KV1t/IJZFbZfUaLPWqMWhOMZ1?=
 =?us-ascii?Q?ZKIBOgOUuXT1Of58GySqi1WpdgNunZot1mxSpBz9YDum6/PEYX+HG5rQ39My?=
 =?us-ascii?Q?xJbTz/5m3C//MSdzZ+gATK5vEL8L+s74xOQUnM8f0gNvix99RkIHDoKcOjnD?=
 =?us-ascii?Q?9byLaHlzV7AuT9Ny48A9XF24zNMY+nYl+1RjrFZCsL6AdQ4ajsVf9MEgoqI7?=
 =?us-ascii?Q?ua+sdq/+0aRtqD0C6DnLcNCg0pNo6sKSS/m3psXVs+51YQnNsXX3IcmF7hNA?=
 =?us-ascii?Q?jzJa3NhJPTXa6uzA7bbKOmesuSujKug7HcwkcG3vGapefdP0QCzVeIc7xukI?=
 =?us-ascii?Q?9dyG8JLv9UZfp9ZPOSfusC5lBzprL3XVG8QD0gGW8BHrT+JynQ4cItRTZriF?=
 =?us-ascii?Q?qDbY70lxp5fYvSWS/0xsrxYklr9ykRd4TD4imRdXYH3wQ5IWuTglnUsbCiQ5?=
 =?us-ascii?Q?cHGqMsLo1WPFKR35UTzUxpjS+nRoeJJ/Nwk5l2fQbgW5dFieznsvVGFd6+ob?=
 =?us-ascii?Q?K9Bg+J1+RYzlfeocwN65rG+n3izGQs4mBrK40+bmDv8UyDV3NBGXuAaPai+q?=
 =?us-ascii?Q?CLbmsxnRLY6VaWi9+zw3fuA7JDSyB99tT5JxJ8WM/M468cwKz/V0DXYkO3aw?=
 =?us-ascii?Q?WCgLXUMDiEXeQx8LE9TSz7EX/tNjiVMPzruVdAagfK02UMX4FO7znm36vT+Q?=
 =?us-ascii?Q?8d50lZ3d2Jlo2VFRcezwurMJOzAfWjd/8eeUFoxfqB06rWyeER3kJ/UcK+7F?=
 =?us-ascii?Q?xcGB6Mfa4t9dHYWy9NAEKbDD?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5855
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b3bc49f7-d79f-44eb-7b9d-08d8cc2ce903
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NGXGCY9lpe+XlmjQuDWAsD7+EqcDL5XW0q5vlru+lKI0TTAaZsKs88DLVYenBbsIqE710kdllGz61fnPURSiy3nOt+5O3QMCAADejcg41Vn1iC7vz9nXgSLrXkBfJ++phC0/ziHv8a83d9ydMUuXUCYDQeyDbxAvsL/xqqK6VKq4xRfel2z4p+1nzH9zFWpEDGHDXknn6PhQJK7sXH38yFcEtU1GzUns3CqLhZ5UboAxazG3um28eBjwDTzCYUG23xD9W/Z+SzRFWAHrW6Q2cTqlLXzrAGdsX1i1s+DQ/9okkDs+RSoE1450dYbHr8k1heutXpuHHxUGJg9UXojfM4hSJOgqeCEw5s7/PPY1YACFyx73Q4y+YtpiuPNp6tGHjFjK+UnQVN3+fFL5WnVOtRMXUKGtOv3DkrKeIFg3X3Qo1FQMyE+KMX+DqfXoDuENLBv7pPC8sm9rrCojVB3X5CinxXWa7wH9ntqQagLEB2/WYrYOlbJKVcF04kMjW1luA+j+yvQTNimkzSWfvQrWQd1VWQWv1Vy1v1CJeC4H2Vj0qx5MyGBslEzBSfj/7E+qWJBeD3ukBzrnR+QTjJxYjwYEOg2u+407aYHdNaQKc6+NxOwwbWpr/dGC68CGRSJlS1ggQj+ZnCAOhFrCglSDAxFwpNm4Up+Pt+mseG2mbvKGfCw7ipm337SuZhWZcHBN2GiHhV0C4FawaliWoGQB/gbVxm448TSGLgisi5iVrYM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966006)(36840700001)(956004)(83380400001)(8676002)(70206006)(4326008)(6486002)(70586007)(2616005)(336012)(6916009)(186003)(47076005)(81166007)(36860700001)(2906002)(356005)(478600001)(44832011)(7696005)(36756003)(30864003)(316002)(966005)(19627235002)(6666004)(86362001)(8936002)(26005)(1076003)(82310400003)(16526019)(82740400003)(5660300002)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 12:27:41.4172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9acc4d-e17c-448a-57b4-08d8cc2cedf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2943
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

- Adds patches required to support Theodul DSU in optee-os, hafnium
- Updates SHA of TF-A, SCP with revision that has Theodul DSU support

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I62f0990b7de919839be9ab0e3234914624c8afde
---
 ...condary-core-entry-point-at-SPMC-ini.patch | 330 ++++++++----------
 ...A-Cold-boot-and-wake-up-from-suspend.patch |  80 +++--
 ...-A-Respond-to-PSCI_CPU_OFF-from-SPMD.patch |  88 +++--
 .../0004-tc0-Add-Theodul-DSU-support.patch    |  30 ++
 .../recipes-bsp/hafnium/hafnium-tc0.inc       |   5 +-
 .../scp-firmware/scp-firmware-tc0.inc         |   4 +
 .../trusted-firmware-a-tc0.inc                |   6 +-
 ...totalcompute-add-Theodul-DSU-support.patch |  93 +++++
 ...P-declare-device-regions-in-manifest.patch |  47 +++
 ...TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch | 173 +++++++++
 .../recipes-security/optee/optee-os-tc0.inc   |   3 +
 11 files changed, 611 insertions(+), 248 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0004-tc0-Add=
-Theodul-DSU-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0009-plat-totalcompute-add-Theodul-DSU-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0010-WIP-OP-TEE-SP-declare-device-regions-in-manifest.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0001-FF-A-Register-=
secondary-core-entry-point-at-SPMC-ini.patch b/meta-arm-bsp/recipes-bsp/haf=
nium/files/tc0/0001-FF-A-Register-secondary-core-entry-point-at-SPMC-ini.pa=
tch
index 5828750..f2219d0 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0001-FF-A-Register-seconda=
ry-core-entry-point-at-SPMC-ini.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0001-FF-A-Register-seconda=
ry-core-entry-point-at-SPMC-ini.patch
@@ -1,32 +1,37 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Pending [https://review.trustedfirmware.org/c/hafnium/haf=
nium/+/6009/27]
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
=20
-From cb329ce33874abd8b69988c3dc63fd323a3413be Mon Sep 17 00:00:00 2001
+From 06e7602ddb383e0f88c19feaa216c24cf032a136 Mon Sep 17 00:00:00 2001
 From: Max Shvetsov <maksims.svecovs@arm.com>
 Date: Thu, 27 Aug 2020 12:37:57 +0100
-Subject: [PATCH 1/4] FF-A: Register secondary core entry point at SPMC ini=
t.
+Subject: [PATCH 2/5] FF-A: Register secondary core entry point at SPMC ini=
t.
=20
-When the primary physical core boots the SPMC registers its secondary phys=
ical
-core entry points to the SPMD. All Secure Partition are then initialized o=
n
-their primary Execution Contexts. A Secure Partition calls PSCI_CPU_ON fro=
m its
-first EC (trapped to the SPMC) passing entry point addresses of secondary =
ECs.
-ECs are turned "on" in their SPMC internal states, although they do not ru=
n yet
-(the service call does not reach the EL3 PSCI layer). Later, when the NWd
-(Hypervisor or OS Kernel) boots, it calls PSCI_CPU_ON for waking up physic=
al
-cores down to EL3. The PSCI layer calls into SPMD PM hooks, then the SPMD =
calls
-into the SPMC by an exception return to the registered secondary entry poi=
nt.
-The target secondary core then reaches Hafnium vcpu_main.
+When the primary physical core boots the SPMC registers its secondary
+physical core entry points to the SPMD. All Secure Partition are then
+initialized on their primary Execution Contexts. A Secure Partition
+calls PSCI_CPU_ON from its first EC (trapped to the SPMC) passing
+entry point addresses of secondary ECs. ECs are turned "on" in their
+SPMC internal states, although they do not run yet (the service call
+does not reach the EL3 PSCI layer). Later, when the NWd (Hypervisor
+or OS Kernel) boots, it calls PSCI_CPU_ON for waking up physical cores
+down to EL3. The PSCI layer calls into SPMD PM hooks, then the SPMD
+calls into the SPMC by an exception return to the registered secondary
+entry point. The target secondary core then reaches Hafnium vcpu_main.
=20
 Change-Id: I2bd42ea54e1a7feebff20e878345ec196ff352e9
 Signed-off-by: Max Shvetsov <maksims.svecovs@arm.com>
 Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
 ---
- inc/hf/arch/init.h                          |   7 ++
- src/arch/aarch64/hypervisor/psci_handler.c  | 131 +++++++++++++++++---
- src/arch/aarch64/inc/hf/arch/spmd_helpers.h |  15 +++
- src/cpu.c                                   |   7 ++
- src/init.c                                  |   2 +
- 5 files changed, 143 insertions(+), 19 deletions(-)
+ inc/hf/arch/init.h                          |  7 ++++
+ inc/hf/arch/other_world.h                   |  2 ++
+ src/arch/aarch64/hypervisor/other_world.c   | 29 +++++++++++++++
+ src/arch/aarch64/hypervisor/psci_handler.c  | 40 +++++++++++++++++++++
+ src/arch/aarch64/inc/hf/arch/spmd_helpers.h | 15 ++++++++
+ src/cpu.c                                   |  2 +-
+ src/init.c                                  |  2 ++
+ src/load.c                                  |  3 ++
+ src/main.c                                  | 12 ++++---
+ 9 files changed, 106 insertions(+), 6 deletions(-)
  create mode 100644 src/arch/aarch64/inc/hf/arch/spmd_helpers.h
=20
 diff --git a/inc/hf/arch/init.h b/inc/hf/arch/init.h
@@ -51,64 +56,87 @@ index 5205e4e..ef0e48f 100644
 + * Sets up secondary cores.
 + */
 +void arch_psci_secondary_core_init(const struct boot_params *params);
-diff --git a/src/arch/aarch64/hypervisor/psci_handler.c b/src/arch/aarch64=
/hypervisor/psci_handler.c
-index f89a00b..bdcc1d3 100644
---- a/src/arch/aarch64/hypervisor/psci_handler.c
-+++ b/src/arch/aarch64/hypervisor/psci_handler.c
-@@ -11,9 +11,11 @@
- #include <stdint.h>
-=20
- #include "hf/arch/plat/psci.h"
-+#include "hf/arch/spmd_helpers.h"
- #include "hf/arch/types.h"
-=20
- #include "hf/api.h"
-+#include "hf/boot_params.h"
- #include "hf/cpu.h"
- #include "hf/dlog.h"
- #include "hf/ffa.h"
-@@ -24,9 +26,32 @@
- #include "smc.h"
+diff --git a/inc/hf/arch/other_world.h b/inc/hf/arch/other_world.h
+index 68c0b45..860a142 100644
+--- a/inc/hf/arch/other_world.h
++++ b/inc/hf/arch/other_world.h
+@@ -20,3 +20,5 @@ bool arch_other_world_is_direct_request_valid(struct vcp=
u *current,
+ bool arch_other_world_is_direct_response_valid(struct vcpu *current,
+ 					       ffa_vm_id_t sender_vm_id,
+ 					       ffa_vm_id_t receiver_vm_id);
++void arch_other_world_init_ffa_id(void);
++ffa_vm_id_t arch_other_world_get_ffa_id(void);
+diff --git a/src/arch/aarch64/hypervisor/other_world.c b/src/arch/aarch64/=
hypervisor/other_world.c
+index 74a2bb1..6b5bb16 100644
+--- a/src/arch/aarch64/hypervisor/other_world.c
++++ b/src/arch/aarch64/hypervisor/other_world.c
+@@ -23,6 +23,10 @@
+ alignas(PAGE_SIZE) static uint8_t other_world_send_buffer[HF_MAILBOX_SIZE=
];
+ alignas(PAGE_SIZE) static uint8_t other_world_recv_buffer[HF_MAILBOX_SIZE=
];
 =20
- static uint32_t el3_psci_version;
++#else
++
 +static ffa_vm_id_t physical_ffa_id;
++
+ #endif
 =20
- void cpu_entry(struct cpu *c);
-=20
+ void arch_other_world_init(void)
+@@ -181,3 +185,28 @@ struct ffa_value arch_other_world_call(struct ffa_val=
ue args)
+ {
+ 	return smc_ffa_call(args);
+ }
++
 +#if SECURE_WORLD =3D=3D 1
 +
-+static void set_ffa_id(void)
++ffa_vm_id_t arch_other_world_get_ffa_id(void)
++{
++	return physical_ffa_id;
++}
++
++void arch_other_world_init_ffa_id(void)
 +{
 +	struct ffa_value res =3D
 +		smc_ffa_call((struct ffa_value){.func =3D FFA_ID_GET_32});
 +
 +	if (res.func !=3D FFA_SUCCESS_32) {
-+		dlog_error("%s Failed to get it's own FF-A ID.\n", __func__);
++		dlog_error("%s Failed to get SPMC's FFA-ID from SPMD.\n",
++			   __func__);
 +		physical_ffa_id =3D HF_INVALID_VM_ID;
 +		return;
 +	}
 +	physical_ffa_id =3D res.arg2 & 0xFFFF;
-+}
 +
-+#endif
-+
-+ffa_vm_id_t get_ffa_id(void)
-+{
-+	return physical_ffa_id;
++	CHECK(physical_ffa_id =3D=3D HF_TEE_VM_ID);
 +}
 +
- /* Performs arch specific boot time initialisation. */
- void arch_one_time_init(void)
- {
-@@ -53,9 +78,79 @@ void arch_one_time_init(void)
++#endif
+diff --git a/src/arch/aarch64/hypervisor/psci_handler.c b/src/arch/aarch64=
/hypervisor/psci_handler.c
+index f89a00b..b323faa 100644
+--- a/src/arch/aarch64/hypervisor/psci_handler.c
++++ b/src/arch/aarch64/hypervisor/psci_handler.c
+@@ -10,10 +10,13 @@
+=20
+ #include <stdint.h>
+=20
++#include "hf/arch/other_world.h"
+ #include "hf/arch/plat/psci.h"
++#include "hf/arch/spmd_helpers.h"
+ #include "hf/arch/types.h"
+=20
+ #include "hf/api.h"
++#include "hf/boot_params.h"
+ #include "hf/cpu.h"
+ #include "hf/dlog.h"
+ #include "hf/ffa.h"
+@@ -53,6 +56,41 @@ void arch_one_time_init(void)
  	}
  #else
  	el3_psci_version =3D PSCI_VERSION_1_1;
 +
-+	set_ffa_id();
- #endif
- }
-=20
++	arch_other_world_init_ffa_id();
++#endif
++}
++
 +/**
 + * Register secondary physical core entry points to the SPMD.
 + */
@@ -120,11 +148,11 @@ index f89a00b..bdcc1d3 100644
 +	for (uint32_t count =3D 0; count < params->cpu_count; count++) {
 +		uint32_t id =3D params->cpu_ids[count];
 +		struct cpu *cpu =3D cpu_find(id);
-+		const ffa_vm_id_t ffa_id =3D get_ffa_id();
++		const ffa_vm_id_t ffa_id =3D arch_other_world_get_ffa_id();
 +
 +		res =3D smc_ffa_call((struct ffa_value){
 +			.func =3D FFA_MSG_SEND_DIRECT_REQ_32,
-+			.arg1 =3D (ffa_id << 16) | SPMD_ID,
++			.arg1 =3D ((uint64_t)ffa_id << 16) | SPMD_ID,
 +			.arg3 =3D SPMD_DIRECT_MSG_SET_ENTRY_POINT,
 +			.arg4 =3D params->cpu_ids[count],
 +			.arg5 =3D (uintreg_t)&cpu_entry,
@@ -139,127 +167,23 @@ index f89a00b..bdcc1d3 100644
 +
 +		dlog_verbose("SPMD EP register returned %#x\n", res.func);
 +	}
-+#endif
-+}
-+
-+/**
-+ * Convert a PSCI CPU / affinity ID for a secondary VM to the correspondi=
ng vCPU
-+ * index.
-+ */
-+ffa_vcpu_index_t vcpu_id_to_index(cpu_id_t vcpu_id)
-+{
-+	/* For now we use indices as IDs for the purposes of PSCI. */
-+	return vcpu_id;
-+}
-+
-+#if SECURE_WORLD =3D=3D 1
-+/**
-+ * Use vcpu_on only as a way to initialize entry point without
-+ * an intent to power up vcpu.
-+ */
-+static uintreg_t ffa_register_entrypoint(cpu_id_t id, struct vm *vm,
-+					 uintreg_t entrypoint, uintreg_t param)
-+{
-+	ffa_vcpu_index_t target_vcpu_index =3D vcpu_id_to_index(id);
-+
-+	if (target_vcpu_index >=3D vm->vcpu_count) {
-+		return PSCI_ERROR_INVALID_PARAMETERS;
-+	}
-+
-+	struct vcpu *target_vcpu =3D vm_get_vcpu(vm, target_vcpu_index);
-+	struct vcpu_locked locked_target_vcpu =3D vcpu_lock(target_vcpu);
-+
-+	vcpu_on(locked_target_vcpu, ipa_init(entrypoint), param);
-+
-+	vcpu_unlock(&locked_target_vcpu);
-+
-+	return PSCI_RETURN_SUCCESS;
-+}
-+#endif
-+
- /**
-  * Handles PSCI requests received via HVC or SMC instructions from the pr=
imary
-  * VM.
-@@ -180,7 +275,8 @@ bool psci_primary_vm_handler(struct vcpu *vcpu, uint32=
_t func, uintreg_t arg0,
- 		panic("CPU off failed");
- 		break;
-=20
--	case PSCI_CPU_ON:
-+	case PSCI_CPU_ON: {
-+#if SECURE_WORLD =3D=3D 0
- 		c =3D cpu_find(arg0);
- 		if (!c) {
- 			*ret =3D PSCI_ERROR_INVALID_PARAMETERS;
-@@ -208,7 +304,12 @@ bool psci_primary_vm_handler(struct vcpu *vcpu, uint3=
2_t func, uintreg_t arg0,
- 		if (*ret !=3D PSCI_RETURN_SUCCESS) {
- 			cpu_off(c);
- 		}
-+#else
-+		*ret =3D ffa_register_entrypoint((cpu_id_t)arg0, vcpu->vm, arg1,
-+					       arg2);
-+#endif
- 		break;
-+	}
-=20
- 	case PSCI_MIGRATE:
- 	case PSCI_MIGRATE_INFO_TYPE:
-@@ -234,16 +335,6 @@ bool psci_primary_vm_handler(struct vcpu *vcpu, uint3=
2_t func, uintreg_t arg0,
- 	return true;
+ #endif
  }
 =20
--/**
-- * Convert a PSCI CPU / affinity ID for a secondary VM to the correspondi=
ng vCPU
-- * index.
-- */
--ffa_vcpu_index_t vcpu_id_to_index(cpu_id_t vcpu_id)
--{
--	/* For now we use indices as IDs for the purposes of PSCI. */
--	return vcpu_id;
--}
--
- /**
-  * Handles PSCI requests received via HVC or SMC instructions from a seco=
ndary
-  * VM.
-@@ -337,22 +428,23 @@ bool psci_secondary_vm_handler(struct vcpu *vcpu, ui=
nt32_t func, uintreg_t arg0,
- 	case PSCI_CPU_ON: {
- 		/* Parameter names as per PSCI specification. */
- 		cpu_id_t target_cpu =3D arg0;
--		ipaddr_t entry_point_address =3D ipa_init(arg1);
- 		uint64_t context_id =3D arg2;
--		ffa_vcpu_index_t target_vcpu_index =3D
--			vcpu_id_to_index(target_cpu);
- 		struct vm *vm =3D vcpu->vm;
--		struct vcpu *target_vcpu;
+@@ -353,11 +391,13 @@ bool psci_secondary_vm_handler(struct vcpu *vcpu, ui=
nt32_t func, uintreg_t arg0,
 =20
-+#if SECURE_WORLD =3D=3D 1
-+		*ret =3D ffa_register_entrypoint((cpu_id_t)target_cpu, vm, arg1,
-+					       context_id);
-+#else
-+		ffa_vcpu_index_t target_vcpu_index =3D
-+			vcpu_id_to_index(target_cpu);
- 		if (target_vcpu_index >=3D vm->vcpu_count) {
- 			*ret =3D PSCI_ERROR_INVALID_PARAMETERS;
- 			break;
- 		}
-+		struct vcpu *target_vcpu =3D vm_get_vcpu(vm, target_vcpu_index);
-=20
--		target_vcpu =3D vm_get_vcpu(vm, target_vcpu_index);
--
--		if (vcpu_secondary_reset_and_start(
--			    target_vcpu, entry_point_address, context_id)) {
-+		if (vcpu_secondary_reset_and_start(target_vcpu, ipa_init(arg1),
-+						   context_id)) {
+ 		if (vcpu_secondary_reset_and_start(
+ 			    target_vcpu, entry_point_address, context_id)) {
++#if SECURE_WORLD =3D=3D 0
  			/*
  			 * Tell the scheduler that it can start running the new
  			 * vCPU now.
-@@ -362,6 +454,7 @@ bool psci_secondary_vm_handler(struct vcpu *vcpu, uint=
32_t func, uintreg_t arg0,
+ 			 */
+ 			*next =3D api_wake_up(vcpu, target_vcpu);
++#endif
+ 			*ret =3D PSCI_RETURN_SUCCESS;
  		} else {
  			*ret =3D PSCI_ERROR_ALREADY_ON;
- 		}
-+#endif
-=20
- 		break;
- 	}
 diff --git a/src/arch/aarch64/inc/hf/arch/spmd_helpers.h b/src/arch/aarch6=
4/inc/hf/arch/spmd_helpers.h
 new file mode 100644
 index 0000000..6e11c36
@@ -282,30 +206,18 @@ index 0000000..6e11c36
 + */
 +ffa_vm_id_t get_ffa_id(void);
 diff --git a/src/cpu.c b/src/cpu.c
-index 0a3fc6f..42a17fa 100644
+index 0a3fc6f..0e0ee9a 100644
 --- a/src/cpu.c
 +++ b/src/cpu.c
-@@ -138,6 +138,8 @@ bool cpu_on(struct cpu *c, ipaddr_t entry, uintreg_t a=
rg)
+@@ -138,7 +138,7 @@ bool cpu_on(struct cpu *c, ipaddr_t entry, uintreg_t a=
rg)
  	c->is_on =3D true;
  	sl_unlock(&c->lock);
 =20
-+#if SECURE_WORLD =3D=3D 0
-+
- 	if (!prev) {
+-	if (!prev) {
++	if (!prev && vm_id_is_current_world(HF_PRIMARY_VM_ID)) {
  		struct vm *vm =3D vm_find(HF_PRIMARY_VM_ID);
  		struct vcpu *vcpu =3D vm_get_vcpu(vm, cpu_index(c));
-@@ -148,6 +150,11 @@ bool cpu_on(struct cpu *c, ipaddr_t entry, uintreg_t =
arg)
- 		vcpu_unlock(&vcpu_locked);
- 	}
-=20
-+#else
-+	(void)entry;
-+	(void)arg;
-+#endif
-+
- 	return prev;
- }
-=20
+ 		struct vcpu_locked vcpu_locked;
 diff --git a/src/init.c b/src/init.c
 index a5b48ab..0121213 100644
 --- a/src/init.c
@@ -319,6 +231,46 @@ index a5b48ab..0121213 100644
  	/* Load all VMs. */
  	update.reserved_ranges_count =3D 0;
  	if (!load_vms(mm_stage1_locked, &manifest, &cpio, &params, &update,
+diff --git a/src/load.c b/src/load.c
+index 660d77c..7accc65 100644
+--- a/src/load.c
++++ b/src/load.c
+@@ -286,6 +286,9 @@ static bool load_primary(struct mm_stage1_locked stage=
1_locked,
+ 	dlog_info("Loaded primary VM with %u vCPUs, entry at %#x.\n",
+ 		  vm->vcpu_count, pa_addr(primary_begin));
+=20
++	/* Mark the primary to be the first booted VM */
++	vm_update_boot(vm);
++
+ 	vcpu_locked =3D vcpu_lock(vm_get_vcpu(vm, 0));
+ 	vcpu_on(vcpu_locked, primary_entry, params->kernel_arg);
+ 	vcpu_unlock(&vcpu_locked);
+diff --git a/src/main.c b/src/main.c
+index 5f30aac..3cc932e 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -15,14 +15,16 @@
+  */
+ struct vcpu *cpu_main(struct cpu *c)
+ {
++	struct vm *first_boot;
+ 	struct vcpu *vcpu;
+-#if SECURE_WORLD =3D=3D 1
+-	struct vm *first_boot =3D vm_get_first_boot();
++
++	/*
++	 * This returns the PVM in the normal worls and the first
++	 * booted Secure Partition in the secure world.
++	 */
++	first_boot =3D vm_get_first_boot();
+=20
+ 	vcpu =3D vm_get_vcpu(first_boot, cpu_index(c));
+-#else
+-	vcpu =3D vm_get_vcpu(vm_find(HF_PRIMARY_VM_ID), cpu_index(c));
+-#endif
+=20
+ 	vcpu->cpu =3D c;
+=20
 --=20
-2.26.2
+2.29.2
=20
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0002-FF-A-Cold-boot=
-and-wake-up-from-suspend.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc=
0/0002-FF-A-Cold-boot-and-wake-up-from-suspend.patch
index 0b58637..6cce9ad 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0002-FF-A-Cold-boot-and-wa=
ke-up-from-suspend.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0002-FF-A-Cold-boot-and-wa=
ke-up-from-suspend.patch
@@ -1,10 +1,10 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Pending [https://review.trustedfirmware.org/c/hafnium/haf=
nium/+/6010/29]
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
=20
-From 8422e2a5d6b2094f9f451a2d818a593cba29af84 Mon Sep 17 00:00:00 2001
+From ebd568637627fa895e6e7f479675c650414cc240 Mon Sep 17 00:00:00 2001
 From: Max Shvetsov <maksims.svecovs@arm.com>
 Date: Thu, 27 Aug 2020 12:39:50 +0100
-Subject: [PATCH 2/4] FF-A: Cold boot and wake up from suspend.
+Subject: [PATCH 3/5] FF-A: Cold boot and wake up from suspend.
=20
 WIP: Currently there is zero entry-point passed with no arguments, This
 will be reworked once a proper way to pass this information will be
@@ -12,12 +12,41 @@ defined.
=20
 Change-Id: Ic6050af16d4081ca31729744995fbb999b170e11
 Signed-off-by: Max Shvetsov <maksims.svecovs@arm.com>
+Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
 ---
- src/main.c | 23 +++++++++++++++++++++++
- 1 file changed, 23 insertions(+)
+ inc/hf/vcpu.h                              |  2 ++
+ src/arch/aarch64/hypervisor/psci_handler.c |  2 ++
+ src/main.c                                 | 20 ++++++++++++++++++++
+ 3 files changed, 24 insertions(+)
=20
+diff --git a/inc/hf/vcpu.h b/inc/hf/vcpu.h
+index 5439719..98f3a50 100644
+--- a/inc/hf/vcpu.h
++++ b/inc/hf/vcpu.h
+@@ -86,6 +86,8 @@ struct vcpu {
+ 	 * a result of a prior FFA_MSG_SEND_DIRECT_REQ invocation.
+ 	 */
+ 	ffa_vm_id_t direct_request_origin_vm_id;
++
++	ipaddr_t psci_handler[1];
+ };
+=20
+ /** Encapsulates a vCPU whose lock is held. */
+diff --git a/src/arch/aarch64/hypervisor/psci_handler.c b/src/arch/aarch64=
/hypervisor/psci_handler.c
+index b323faa..c892385 100644
+--- a/src/arch/aarch64/hypervisor/psci_handler.c
++++ b/src/arch/aarch64/hypervisor/psci_handler.c
+@@ -389,6 +389,8 @@ bool psci_secondary_vm_handler(struct vcpu *vcpu, uint=
32_t func, uintreg_t arg0,
+=20
+ 		target_vcpu =3D vm_get_vcpu(vm, target_vcpu_index);
+=20
++		target_vcpu->psci_handler[0] =3D entry_point_address;
++
+ 		if (vcpu_secondary_reset_and_start(
+ 			    target_vcpu, entry_point_address, context_id)) {
+ #if SECURE_WORLD =3D=3D 0
 diff --git a/src/main.c b/src/main.c
-index 5f30aac..7b7264f 100644
+index 3cc932e..2c3d1a5 100644
 --- a/src/main.c
 +++ b/src/main.c
 @@ -7,6 +7,7 @@
@@ -28,14 +57,11 @@ index 5f30aac..7b7264f 100644
  #include "hf/vm.h"
 =20
  /**
-@@ -16,9 +17,31 @@
- struct vcpu *cpu_main(struct cpu *c)
- {
+@@ -18,6 +19,18 @@ struct vcpu *cpu_main(struct cpu *c)
+ 	struct vm *first_boot;
  	struct vcpu *vcpu;
-+
- #if SECURE_WORLD =3D=3D 1
- 	struct vm *first_boot =3D vm_get_first_boot();
 =20
++#if SECURE_WORLD =3D=3D 1
 +	if (c->is_on =3D=3D false) {
 +		/*
 +		 * This is the PSCI warm reset path (svc_cpu_on_finish
@@ -45,21 +71,25 @@ index 5f30aac..7b7264f 100644
 +		(void)cpu_on(c, ipa_init(0UL), 0UL);
 +		dlog_verbose("%s: cpu mpidr 0x%x on\n", __func__, c->id);
 +	}
++#endif
 +
-+	/*
-+	 * If `vm_get_first_boot` returns a valid vm, the first partition to
-+	 * execute is in accordance to the boot-order field of the partition's
-+	 * manifest.
-+	 * Else, no partition has been configured with the "boot-order" field
-+	 * in its manifest, and primary vm should be booted.
-+	 */
-+	if (!first_boot) {
-+		first_boot =3D vm_find(HF_PRIMARY_VM_ID);
+ 	/*
+ 	 * This returns the PVM in the normal worls and the first
+ 	 * booted Secure Partition in the secure world.
+@@ -26,6 +39,13 @@ struct vcpu *cpu_main(struct cpu *c)
+=20
+ 	vcpu =3D vm_get_vcpu(first_boot, cpu_index(c));
+=20
++	if (vcpu->psci_handler[0].ipa) {
++		struct vcpu_locked vcpu_locked =3D vcpu_lock(vcpu);
++
++		vcpu_on(vcpu_locked, vcpu->psci_handler[0], 0);
++		vcpu_unlock(&vcpu_locked);
 +	}
 +
- 	vcpu =3D vm_get_vcpu(first_boot, cpu_index(c));
- #else
- 	vcpu =3D vm_get_vcpu(vm_find(HF_PRIMARY_VM_ID), cpu_index(c));
+ 	vcpu->cpu =3D c;
+=20
+ 	arch_cpu_init();
 --=20
-2.26.2
+2.29.2
=20
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0003-FF-A-Respond-t=
o-PSCI_CPU_OFF-from-SPMD.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0=
/0003-FF-A-Respond-to-PSCI_CPU_OFF-from-SPMD.patch
index 83aeca3..87f2a43 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0003-FF-A-Respond-to-PSCI_=
CPU_OFF-from-SPMD.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0003-FF-A-Respond-to-PSCI_=
CPU_OFF-from-SPMD.patch
@@ -1,10 +1,10 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Pending [https://review.trustedfirmware.org/c/hafnium/haf=
nium/+/6011/29]
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
=20
-From 66d7628fea54dd7a25d25a13eb4f732c0a3428d0 Mon Sep 17 00:00:00 2001
+From 6a836b380265876a12b2edfb7f013523af89e754 Mon Sep 17 00:00:00 2001
 From: Max Shvetsov <maksims.svecovs@arm.com>
 Date: Fri, 18 Sep 2020 13:52:20 +0100
-Subject: [PATCH 3/4] FF-A: Respond to PSCI_CPU_OFF from SPMD.
+Subject: [PATCH 4/5] FF-A: Respond to PSCI_CPU_OFF from SPMD.
=20
 At run-time when a PSCI call is made from NWd, the corresponding SPMD PM
 hooks gets called and is eventually routed to the SPMC.  This change
@@ -13,12 +13,13 @@ conveyed from SPMD to SPMC such as core suspend, core o=
ff.
=20
 Change-Id: Id288e26d9fbb8328acc71f5cf68c39e095a0e3da
 Signed-off-by: Max Shvetsov <maksims.svecovs@arm.com>
+Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
 ---
- src/arch/aarch64/hypervisor/handler.c | 40 ++++++++++++++++++++++++++-
- 1 file changed, 39 insertions(+), 1 deletion(-)
+ src/arch/aarch64/hypervisor/handler.c | 49 +++++++++++++++++++++++++--
+ 1 file changed, 47 insertions(+), 2 deletions(-)
=20
 diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hype=
rvisor/handler.c
-index c10f77e..95d6a18 100644
+index b33298c..43a1404 100644
 --- a/src/arch/aarch64/hypervisor/handler.c
 +++ b/src/arch/aarch64/hypervisor/handler.c
 @@ -13,6 +13,7 @@
@@ -29,59 +30,86 @@ index c10f77e..95d6a18 100644
 =20
  #include "hf/api.h"
  #include "hf/check.h"
-@@ -478,6 +479,41 @@ static bool ffa_handler(struct ffa_value *args, struc=
t vcpu *current,
+@@ -261,6 +262,7 @@ static void set_virtual_interrupt_current(bool enable)
+ }
 =20
  #if SECURE_WORLD =3D=3D 1
-=20
-+/**
-+ * Returns true if the message is sent directly from SPMD to SPMC.
-+ */
-+static bool is_spmd_message(const uint64_t arg)
-+{
-+	return (((arg & 0xFFFF) =3D=3D get_ffa_id()) &&
-+		(((arg >> 16) & 0xFFFF) =3D=3D SPMD_ID));
-+}
++
+ static bool sp_boot_next(struct vcpu *current, struct vcpu **next,
+ 			 struct ffa_value *ffa_ret)
+ {
+@@ -303,6 +305,41 @@ out:
+ 	vm_unlock(&current_vm_locked);
+ 	return ret;
+ }
 +
 +/**
 + * Handle special direct messages from SPMD to SPMC. For now related to p=
ower
 + * management only.
 + */
-+static bool spmd_handler(struct ffa_value *ret)
++static bool spmd_handler(struct ffa_value *args, struct vcpu *current)
 +{
-+	if (!is_spmd_message(ret->arg1)) {
++	ffa_vm_id_t spmc_ffa_id =3D arch_other_world_get_ffa_id();
++	ffa_vm_id_t sender =3D ffa_msg_send_sender(*args);
++	ffa_vm_id_t receiver =3D ffa_msg_send_receiver(*args);
++	ffa_vm_id_t current_vm_id =3D current->vm->id;
++
++	if (!((sender =3D=3D SPMD_ID) && (receiver =3D=3D spmc_ffa_id) &&
++	      (current_vm_id =3D=3D HF_OTHER_WORLD_ID))) {
 +		return false;
 +	}
 +
-+	dlog_verbose("%s Handling direct PSCI calls from SPMD\n", __func__);
-+
-+	switch (ret->arg3) {
++	switch (args->arg3) {
 +	case PSCI_CPU_OFF:
-+		ret->func =3D FFA_MSG_SEND_DIRECT_RESP_32;
-+		ret->arg1 =3D (get_ffa_id() << 16) | SPMD_ID;
-+		ret->arg2 =3D 0U;
++		dlog_verbose("%s cpu off notification\n", __func__);
++		args->func =3D FFA_MSG_SEND_DIRECT_RESP_32;
++		args->arg1 =3D ((uint64_t)spmc_ffa_id << 16) | SPMD_ID;
++		args->arg2 =3D 0U;
++
++		cpu_off(current->cpu);
 +		break;
 +	default:
-+		dlog_verbose("Following message not handled %#x\n", ret->arg3);
++		dlog_verbose("%s message not handled %#x\n", __func__,
++			     args->arg3);
 +		return false;
 +	}
 +
 +	return true;
 +}
 +
+ #endif
+=20
  /**
-  * Called to switch to the other world and handle FF-A calls from it. Ret=
urns
-  * when it is ready to run a secure partition again.
-@@ -510,7 +546,9 @@ static void other_world_switch_loop(struct vcpu *other=
_world_vcpu,
+@@ -461,11 +498,17 @@ static bool ffa_handler(struct ffa_value *args, stru=
ct vcpu *current,
+ 					    (args->arg4 >> 16) & 0xffff,
+ 					    current);
+ 		return true;
+-	case FFA_MSG_SEND_DIRECT_REQ_32:
++	case FFA_MSG_SEND_DIRECT_REQ_32: {
++#if SECURE_WORLD =3D=3D 1
++		if (spmd_handler(args, current)) {
++			return true;
++		}
++#endif
+ 		*args =3D api_ffa_msg_send_direct_req(
+ 			ffa_msg_send_sender(*args),
+ 			ffa_msg_send_receiver(*args), *args, current, next);
+ 		return true;
++	}
+ 	case FFA_MSG_SEND_DIRECT_RESP_32:
+ 		*args =3D api_ffa_msg_send_direct_resp(
+ 			ffa_msg_send_sender(*args),
+@@ -510,7 +553,9 @@ static void other_world_switch_loop(struct vcpu *other=
_world_vcpu,
  		 * the result of the call back to EL3 unless the API handler
  		 * sets *next to something different.
  		 */
 -		if (!ffa_handler(&other_world_args, other_world_vcpu, next)) {
 +
-+		if (!spmd_handler(&other_world_args) &&
++		if (!spmd_handler(&other_world_args, other_world_vcpu) &&
 +		    !ffa_handler(&other_world_args, other_world_vcpu, next)) {
  			other_world_args.func =3D SMCCC_ERROR_UNKNOWN;
  		}
  	}
 --=20
-2.26.2
+2.29.2
=20
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0004-tc0-Add-Theodu=
l-DSU-support.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0004-tc0-A=
dd-Theodul-DSU-support.patch
new file mode 100644
index 0000000..4c0b5dd
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0004-tc0-Add-Theodul-DSU-s=
upport.patch
@@ -0,0 +1,30 @@
+From e8042fda56aa470cdda723757a957a81cd95dde8 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Tue, 2 Feb 2021 12:12:32 +0000
+Subject: [PATCH] tc0: Add Theodul DSU support
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Change-Id: I4a9b7e4350410fdacccd8c12ff03a61b7e64e98b
+---
+ project/reference/BUILD.gn | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/project/reference/BUILD.gn b/project/reference/BUILD.gn
+index 5596009..ffcaab7 100644
+--- a/project/reference/BUILD.gn
++++ b/project/reference/BUILD.gn
+@@ -159,8 +159,8 @@ aarch64_toolchains("secure_tc0") {
+   gic_version =3D 3
+   gicd_base_address =3D "0x30000000"
+   gicr_base_address =3D "0x30140000"
+-  heap_pages =3D 60
+-  max_cpus =3D 4
++  heap_pages =3D 80
++  max_cpus =3D 8
+   max_vms =3D 16
+   toolchain_args =3D {
+     secure_world =3D "1"
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc b/meta-arm-bs=
p/recipes-bsp/hafnium/hafnium-tc0.inc
index 51747ce..9f14f73 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc
@@ -1,7 +1,7 @@
 # TC0 specific configuration
=20
-# Intermediate SHA with 2.4 baseline version
-SRCREV =3D "ee68c5494dea5c5a59aa02af46b35ab3d949672e"
+# Intermediate SHA with 2.4 baseline version, required for OP-TEE SEL1 sup=
port
+SRCREV =3D "fe7f737ec20add15d49c587ebeb55f7ea0118226"
 PV =3D "2.4+git${SRCPV}"
=20
 FILESEXTRAPATHS_prepend_tc0 :=3D "${THISDIR}/files/tc0:"
@@ -10,6 +10,7 @@ SRC_URI_append =3D " \
     file://0001-FF-A-Register-secondary-core-entry-point-at-SPMC-ini.patch=
 \
     file://0002-FF-A-Cold-boot-and-wake-up-from-suspend.patch \
     file://0003-FF-A-Respond-to-PSCI_CPU_OFF-from-SPMD.patch \
+    file://0004-tc0-Add-Theodul-DSU-support.patch \
     "
=20
 COMPATIBLE_MACHINE =3D "tc0"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/m=
eta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index cacdca8..7d71a57 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -1,5 +1,9 @@
 # TC0 specific SCP configuration
=20
+# Intermediate SHA with 2.7 baseline version, required for Theodul DSU
+SRCREV =3D "bc35f4fd2d5e93c77effdeba43c98ddd5038de96"
+PV =3D "2.7+git${SRCPV}"
+
 COMPATIBLE_MACHINE =3D "tc0"
=20
 SCP_PLATFORM =3D "tc0"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-t=
c0.inc
index bb12ba4..20b52e9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.in=
c
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.in=
c
@@ -1,7 +1,9 @@
 # TC0 specific TFA configuration
=20
-# Intermediate SHA with 2.4 baseline version, required for OP-TEE SP
-SRCREV_tfa =3D "b153ce0391012e9228b807815a65fa0dc514cf77"
+# Intermediate SHA with 2.4 baseline version, required for Theodul DSU
+# --- This SRC_URI will be removed once below SRCREV_tfa gets merged to TF=
-A master
+SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;pro=
tocol=3Dhttps;branch=3Dintegration;name=3Dtfa"
+SRCREV_tfa =3D "9bc3007d3bb9363dbd5f6655d2b17d599e22bac4"
 PV =3D "2.4+git${SRCPV}"
=20
 DEPENDS +=3D "scp-firmware"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0009-pl=
at-totalcompute-add-Theodul-DSU-support.patch b/meta-arm-bsp/recipes-securi=
ty/optee/files/optee-os/tc0/0009-plat-totalcompute-add-Theodul-DSU-support.=
patch
new file mode 100644
index 0000000..e52a9d0
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0009-plat-tota=
lcompute-add-Theodul-DSU-support.patch
@@ -0,0 +1,93 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 3563e39d66404ff2415d29c4018757a85cd0ad97 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 13 Jan 2021 13:49:54 +0000
+Subject: [PATCH 1/3] plat-totalcompute: add Theodul DSU support
+
+- Change CPU count from 4 to 8
+- Set heap size to 128K
+- In debug print, change EMSG to DMSG
+
+Change-Id: Ic426f5e08ac4e7ce1be37333486c75a3228e3415
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ core/arch/arm/mm/mobj_ffa.c                        |  2 +-
+ core/arch/arm/plat-totalcompute/conf.mk            |  4 +++-
+ core/arch/arm/plat-totalcompute/optee_manifest.dts |  2 +-
+ core/arch/arm/plat-totalcompute/tc0_spmc_pm.c      | 10 +++++++++-
+ 4 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/core/arch/arm/mm/mobj_ffa.c b/core/arch/arm/mm/mobj_ffa.c
+index 8e334f04..500404c3 100644
+--- a/core/arch/arm/mm/mobj_ffa.c
++++ b/core/arch/arm/mm/mobj_ffa.c
+@@ -381,7 +381,7 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,
+ 		if (mf)
+ 			DMSG("cookie %#"PRIx64" resurrecting", cookie);
+ 		if (!mf) {
+-			EMSG("Populating mobj from rx buffer\n");
++			DMSG("Populating mobj from rx:  %#"PRIx64"", cookie);
+ 			mf =3D thread_spmc_populate_mobj_from_rx(cookie);
+ 		}
+ #endif
+diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-=
totalcompute/conf.mk
+index d330eb92..c35437aa 100644
+--- a/core/arch/arm/plat-totalcompute/conf.mk
++++ b/core/arch/arm/plat-totalcompute/conf.mk
+@@ -22,7 +22,9 @@ platform-aflags-debug-info =3D -gdwarf-2
+ endif
+=20
+ ifeq ($(PLATFORM_FLAVOR),tc0)
+-CFG_TEE_CORE_NB_CORE =3D 4
++CFG_TEE_CORE_NB_CORE =3D 8
++
++CFG_CORE_HEAP_SIZE ?=3D 131072
+=20
+ ifeq ($(CFG_CORE_SEL1_SPMC),y)
+ CFG_TZDRAM_START ?=3D 0xfd000000
+diff --git a/core/arch/arm/plat-totalcompute/optee_manifest.dts b/core/arc=
h/arm/plat-totalcompute/optee_manifest.dts
+index 4e60cbe1..60cb5957 100644
+--- a/core/arch/arm/plat-totalcompute/optee_manifest.dts
++++ b/core/arch/arm/plat-totalcompute/optee_manifest.dts
+@@ -18,7 +18,7 @@
+ 	ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
+ 	uuid =3D <0x486178e0 0xe7f811e3 0xbc5e0002 0xa5d5c51b>;
+ 	id =3D <1>;
+-	execution-ctx-count =3D <4>;
++	execution-ctx-count =3D <8>;
+ 	exception-level =3D <2>; /* S-EL1 */
+ 	execution-state =3D <0>; /* AARCH64 */
+ 	load-address =3D <0xfd280000>;
+diff --git a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c b/core/arch/arm=
/plat-totalcompute/tc0_spmc_pm.c
+index 8e59a8cc..3fb32823 100644
+--- a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
++++ b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
+@@ -17,7 +17,11 @@ static const uint64_t core_clus_aff_array[] =3D {
+ 	0x0000,		/* Cluster 0 Cpu 0 */
+ 	0x0001,		/* Cluster 0 Cpu 1 */
+ 	0x0002,		/* Cluster 0 Cpu 2 */
+-	0x0003		/* Cluster 0 Cpu 3 */
++	0x0003,		/* Cluster 0 Cpu 3 */
++	0x0004,		/* Cluster 0 Cpu 4 */
++	0x0005,		/* Cluster 0 Cpu 5 */
++	0x0006,		/* Cluster 0 Cpu 6 */
++	0x0007		/* Cluster 0 Cpu 7 */
+ };
+=20
+ void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, uint64_t cookie)
+@@ -38,6 +42,10 @@ void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, u=
int64_t cookie)
+ 		/* Create an mpidr from core_clus_aff_array */
+ 		a1 |=3D core_clus_aff_array[cnt] << aff_shift;
+=20
++		/* Ignore current cpu */
++		if (a1 =3D=3D mpidr)
++			continue;
++
+ 		/* Invoke the PSCI_CPU_ON_SMC64 function */
+ 		ret =3D thread_smc(PSCI_CPU_ON_SMC64, a1, secondary_ep, cookie);
+=20
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0010-WI=
P-OP-TEE-SP-declare-device-regions-in-manifest.patch b/meta-arm-bsp/recipes=
-security/optee/files/optee-os/tc0/0010-WIP-OP-TEE-SP-declare-device-region=
s-in-manifest.patch
new file mode 100644
index 0000000..fbc5161
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0010-WIP-OP-TE=
E-SP-declare-device-regions-in-manifest.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From fd325f731da694057a2738411faa2ccbeea71778 Mon Sep 17 00:00:00 2001
+From: Olivier Deprez <olivier.deprez@arm.com>
+Date: Thu, 3 Dec 2020 22:29:37 +0100
+Subject: [PATCH 2/3] WIP OP-TEE SP declare device regions in manifest
+
+Secure Partitions must declare peripherals they access such
+that the SPMC maps IO regions in SP's Stage-2 translation
+regime. OP-TEE currently directly accesses the GIC Distributor
+and the UART0 peripheral hence declare those device regions in
+OP-TEE's manifest.
+
+Change-Id: I1fda46e5cf17153dfaf499042dceff325729d041
+Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
+---
+ .../arch/arm/plat-totalcompute/optee_manifest.dts | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/core/arch/arm/plat-totalcompute/optee_manifest.dts b/core/arc=
h/arm/plat-totalcompute/optee_manifest.dts
+index 60cb5957..cdc28d98 100644
+--- a/core/arch/arm/plat-totalcompute/optee_manifest.dts
++++ b/core/arch/arm/plat-totalcompute/optee_manifest.dts
+@@ -30,4 +30,19 @@
+=20
+ 	/* Boot protocol */
+ 	gp-register-num =3D <0x0>;
++
++	device-regions {
++		compatible =3D "arm,ffa-manifest-device-regions";
++		uart0 {
++			base-address =3D <0x00000000 0x7ff70000>;
++			pages-count =3D <1>;
++			attributes =3D <0x3>; /* read-write */
++		};
++
++		gicd {
++			base-address =3D <0x00000000 0x30000000>;
++			pages-count =3D <16>;
++			attributes =3D <0x3>; /* read-write */
++		};
++	};
+ };
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0011-WI=
P-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch b/meta-arm-bsp/recipes-secu=
rity/optee/files/optee-os/tc0/0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNT=
VCT.patch
new file mode 100644
index 0000000..323ace7
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0011-WIP-OP-TE=
E-SP-use-CNTVCT-in-place-of-CNTVCT.patch
@@ -0,0 +1,173 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 85110aaf32b6d3b19fdca301f7a07a4683825802 Mon Sep 17 00:00:00 2001
+From: Olivier Deprez <olivier.deprez@arm.com>
+Date: Thu, 3 Dec 2020 17:33:09 +0100
+Subject: [PATCH 3/3] WIP OP-TEE SP use CNTVCT in place of CNTVCT
+
+The SPMC forbids access to the physical counter and Secure Partitions
+shall rather access the virtual counter (for which virtual offset is
+set to 0). More information at [1].
+
+[1] https://lists.trustedfirmware.org/pipermail/hafnium/2020-December/0000=
92.html
+
+Change-Id: Ifab083921fa12154cafc31bd80ce91fa8da0db82
+Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
+---
+ core/arch/arm/include/arm64.h              | 2 +-
+ core/arch/arm/include/kernel/delay.h       | 4 ++--
+ core/arch/arm/kernel/arm32_sysreg.txt      | 2 +-
+ core/arch/arm/kernel/tee_time_arm_cntpct.c | 4 ++--
+ core/kernel/tee_ta_manager.c               | 4 ++--
+ lib/libutee/arch/arm/arm32_user_sysreg.txt | 2 +-
+ lib/libutee/include/arm64_user_sysreg.h    | 2 +-
+ lib/libutils/ext/ftrace/ftrace.c           | 6 +++---
+ 8 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/core/arch/arm/include/arm64.h b/core/arch/arm/include/arm64.h
+index 40a6b113..46c5431f 100644
+--- a/core/arch/arm/include/arm64.h
++++ b/core/arch/arm/include/arm64.h
+@@ -322,7 +322,7 @@ DEFINE_U32_REG_READ_FUNC(sctlr_el1)
+=20
+ /* ARM Generic timer functions */
+ DEFINE_REG_READ_FUNC_(cntfrq, uint32_t, cntfrq_el0)
+-DEFINE_REG_READ_FUNC_(cntpct, uint64_t, cntpct_el0)
++DEFINE_REG_READ_FUNC_(cntvct, uint64_t, cntvct_el0)
+ DEFINE_REG_READ_FUNC_(cntkctl, uint32_t, cntkctl_el1)
+ DEFINE_REG_WRITE_FUNC_(cntkctl, uint32_t, cntkctl_el1)
+ DEFINE_REG_READ_FUNC_(cntps_ctl, uint32_t, cntps_ctl_el1)
+diff --git a/core/arch/arm/include/kernel/delay.h b/core/arch/arm/include/=
kernel/delay.h
+index 00510059..34629ba2 100644
+--- a/core/arch/arm/include/kernel/delay.h
++++ b/core/arch/arm/include/kernel/delay.h
+@@ -44,12 +44,12 @@ static inline uint64_t arm_cnt_us2cnt(uint32_t us)
+=20
+ static inline uint64_t timeout_init_us(uint32_t us)
+ {
+-	return read_cntpct() + arm_cnt_us2cnt(us);
++	return read_cntvct() + arm_cnt_us2cnt(us);
+ }
+=20
+ static inline bool timeout_elapsed(uint64_t expire)
+ {
+-	return read_cntpct() > expire;
++	return read_cntvct() > expire;
+ }
+=20
+ #endif
+diff --git a/core/arch/arm/kernel/arm32_sysreg.txt b/core/arch/arm/kernel/=
arm32_sysreg.txt
+index b69ebcb4..155773f8 100644
+--- a/core/arch/arm/kernel/arm32_sysreg.txt
++++ b/core/arch/arm/kernel/arm32_sysreg.txt
+@@ -117,7 +117,7 @@ VBAR  c12 0 c0 0 RW Vector Base Address Register
+=20
+ @ B8.2 Generic Timer registers summary
+ CNTFRQ    c14 0 c0  0 RW Counter Frequency register
+-CNTPCT    -   0 c14 - RO Physical Count register
++CNTVCT    -   1 c14 - RO Physical Count register
+ CNTKCTL   c14 0 c1  0 RW Timer PL1 Control register
+ CNTP_TVAL c14 0 c2  0 RW PL1 Physical TimerValue register
+ CNTP_CTL  c14 0 c2  1 RW PL1 Physical Timer Control register
+diff --git a/core/arch/arm/kernel/tee_time_arm_cntpct.c b/core/arch/arm/ke=
rnel/tee_time_arm_cntpct.c
+index 3c41e4c2..04e673d9 100644
+--- a/core/arch/arm/kernel/tee_time_arm_cntpct.c
++++ b/core/arch/arm/kernel/tee_time_arm_cntpct.c
+@@ -16,7 +16,7 @@
+=20
+ static TEE_Result arm_cntpct_get_sys_time(TEE_Time *time)
+ {
+-	uint64_t cntpct =3D read_cntpct();
++	uint64_t cntpct =3D read_cntvct();
+ 	uint32_t cntfrq =3D read_cntfrq();
+=20
+ 	time->seconds =3D cntpct / cntfrq;
+@@ -49,7 +49,7 @@ REGISTER_TIME_SOURCE(arm_cntpct_time_source)
+=20
+ void plat_prng_add_jitter_entropy(enum crypto_rng_src sid, unsigned int *=
pnum)
+ {
+-	uint64_t tsc =3D read_cntpct();
++	uint64_t tsc =3D read_cntvct();
+ 	int bytes =3D 0, n;
+ 	static uint8_t first, bits;
+ 	static uint16_t acc;
+diff --git a/core/kernel/tee_ta_manager.c b/core/kernel/tee_ta_manager.c
+index 46632ce7..4153fbd8 100644
+--- a/core/kernel/tee_ta_manager.c
++++ b/core/kernel/tee_ta_manager.c
+@@ -923,7 +923,7 @@ static void gprof_update_session_utime(bool suspend, s=
truct ts_session *s,
+ static void tee_ta_update_session_utime(bool suspend)
+ {
+ 	struct ts_session *s =3D ts_get_current_session();
+-	uint64_t now =3D read_cntpct();
++	uint64_t now =3D read_cntvct();
+=20
+ 	gprof_update_session_utime(suspend, s, now);
+ }
+@@ -947,7 +947,7 @@ static void ftrace_update_times(bool suspend)
+ 	uint64_t now =3D 0;
+ 	uint32_t i =3D 0;
+=20
+-	now =3D read_cntpct();
++	now =3D read_cntvct();
+=20
+ 	fbuf =3D s->fbuf;
+ 	if (!fbuf)
+diff --git a/lib/libutee/arch/arm/arm32_user_sysreg.txt b/lib/libutee/arch=
/arm/arm32_user_sysreg.txt
+index 8baefd10..13e28f20 100644
+--- a/lib/libutee/arch/arm/arm32_user_sysreg.txt
++++ b/lib/libutee/arch/arm/arm32_user_sysreg.txt
+@@ -10,4 +10,4 @@
+=20
+ @ B8.2 Generic Timer registers summary
+ CNTFRQ    c14 0 c0  0 RW Counter Frequency register
+-CNTPCT    -   0 c14 - RO Physical Count register
++CNTVCT    -   1 c14 - RO Physical Count register
+diff --git a/lib/libutee/include/arm64_user_sysreg.h b/lib/libutee/include=
/arm64_user_sysreg.h
+index db4ee188..722a08c9 100644
+--- a/lib/libutee/include/arm64_user_sysreg.h
++++ b/lib/libutee/include/arm64_user_sysreg.h
+@@ -31,7 +31,7 @@ static inline __noprof void write_##reg(type val)		\
+=20
+ /* ARM Generic timer functions */
+ DEFINE_REG_READ_FUNC_(cntfrq, uint32_t, cntfrq_el0)
+-DEFINE_REG_READ_FUNC_(cntpct, uint64_t, cntpct_el0)
++DEFINE_REG_READ_FUNC_(cntvct, uint64_t, cntvct_el0)
+ DEFINE_REG_READ_FUNC_(tpidr_el0, uint64_t, tpidr_el0)
+ DEFINE_REG_WRITE_FUNC_(tpidr_el0, uint64_t, tpidr_el0)
+=20
+diff --git a/lib/libutils/ext/ftrace/ftrace.c b/lib/libutils/ext/ftrace/ft=
race.c
+index 101aa594..637cbd19 100644
+--- a/lib/libutils/ext/ftrace/ftrace.c
++++ b/lib/libutils/ext/ftrace/ftrace.c
+@@ -165,7 +165,7 @@ void __noprof ftrace_enter(unsigned long pc, unsigned =
long *lr)
+=20
+ 	if (fbuf->ret_idx < FTRACE_RETFUNC_DEPTH) {
+ 		fbuf->ret_stack[fbuf->ret_idx] =3D *lr;
+-		fbuf->begin_time[fbuf->ret_idx] =3D read_cntpct();
++		fbuf->begin_time[fbuf->ret_idx] =3D read_cntvct();
+ 		fbuf->ret_idx++;
+ 	} else {
+ 		/*
+@@ -269,7 +269,7 @@ unsigned long __noprof ftrace_return(void)
+ 		dur_loc =3D curr_buf - (fbuf->ret_idx +
+ 				      (2 * sizeof(unsigned long)) + 11);
+ 		ftrace_duration(dur_loc, fbuf->begin_time[fbuf->ret_idx],
+-				read_cntpct());
++				read_cntvct());
+ 	} else {
+ 		bool full =3D false;
+=20
+@@ -297,7 +297,7 @@ unsigned long __noprof ftrace_return(void)
+ 			dur_loc =3D curr_buf - fbuf->ret_idx - 6;
+ 			ftrace_duration(dur_loc,
+ 					fbuf->begin_time[fbuf->ret_idx],
+-					read_cntpct());
++					read_cntvct());
+ 		}
+ 	}
+=20
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/meta-ar=
m-bsp/recipes-security/optee/optee-os-tc0.inc
index fff6381..1b03a35 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
@@ -22,6 +22,9 @@ SRC_URI_append =3D " \
     file://0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch \
     file://0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch=
 \
     file://0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch=
 \
+    file://0009-plat-totalcompute-add-Theodul-DSU-support.patch \
+    file://0010-WIP-OP-TEE-SP-declare-device-regions-in-manifest.patch \
+    file://0011-WIP-OP-TEE-SP-use-CNTVCT-in-place-of-CNTVCT.patch \
     "
=20
 COMPATIBLE_MACHINE =3D "tc0"
--=20
2.29.2

