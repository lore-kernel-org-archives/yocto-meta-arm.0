Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.67])
 by mx.groups.io with SMTP id smtpd.web08.5540.1617191655776863373
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 04:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3L3ZQe//;
 spf=pass (domain: arm.com, ip: 40.107.3.67, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzA2yLclMfLEIFgz2lY0rbXbOw6OTbuukNcERYCQmaw=;
 b=3L3ZQe//14yl2cD78j+CBC+cCSspH+duZa/zR7Du7Kj+KdEEpU0aV24R3skP9Inw67q3y5mTqBlUVx0z5uAhujufSZ3Hzq2k4KiBUIJm6aE9rOn8Lt6RaZP+KZsuW7WuyPdpj9vr/dCTPYOddjsKvJ8gX2OdOZ/H53/i1bma7+M=
Received: from DB3PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:8::47) by
 DBBPR08MB4743.eurprd08.prod.outlook.com (2603:10a6:10:d9::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.30; Wed, 31 Mar 2021 11:54:11 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::ac) by DB3PR08CA0034.outlook.office365.com
 (2603:10a6:8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 31 Mar 2021 11:54:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29 via Frontend Transport; Wed, 31 Mar 2021 11:54:11 +0000
Received: ("Tessian outbound 587f55a14cc5:v89"); Wed, 31 Mar 2021 11:54:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9eb6b4c22e0956e1
X-CR-MTA-TID: 64aa7808
Received: from ac79f9115be5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 42D85111-8422-4CF5-BFD8-1AE6F63A115E.1;
	Wed, 31 Mar 2021 11:54:01 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac79f9115be5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 31 Mar 2021 11:54:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maZVNJ6pgTRu8VBn2fVYihnNQmQu7jh4d23t0GRIixYgcB6KGayD2ItP4uu3j7957pYi25gnMedMjfn074UwQK4q8E4ALMJDHlGMnTl1I75VsdSGuQktHiLPXnWBn/W6h3m8EgIi3aJiHuHpesZDwOF3Mhk6D2Z6bZc7lxO4Jakjv+lyCH50fLiJ7JUM29NhXvauggxsi7S4FHVrIUotiCXvBAjWtist4gehPAXKLV5kIyfi6DxPBYzzHxbMJLbTJPvpPxzL3i8mwkCI8iFTHI8kRcYY+o3aQ8iq6bWSbVC0cby43efFcx2rm9hTXfsFfw48K+T1JiRLeELQmq/aIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzA2yLclMfLEIFgz2lY0rbXbOw6OTbuukNcERYCQmaw=;
 b=QMS6173ArmQJ2jyE/p3icJrmrhIXtnQyn2K7Urobd8hy7YUrJCRNut9DhtoygGs6g9GrfGUuciVY1RH3MqE8/d3uos3VZbCXUvGcpWZX4RwaYfLY3mn/VQmh/k5/hgQy87VMrlJgO4qX1nVQraFL/2nIYkj3le9uqcPYbhbV51wYTluGxDmN8jbQ+pAMb3EdDv4O2QiYmJt8/TYGIdcqifo6sQ4JHrbvhWkA208fQOhGnUxaWLQVhz8s1T09HIJoyWa/IItxB3BYFCAUxPsmDZE+nApPo6FaT/h7JLm78/0xCCGnxXqryHwIOuUVVaK4ZL+TltOvlo9DBu8wgC2N/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzA2yLclMfLEIFgz2lY0rbXbOw6OTbuukNcERYCQmaw=;
 b=3L3ZQe//14yl2cD78j+CBC+cCSspH+duZa/zR7Du7Kj+KdEEpU0aV24R3skP9Inw67q3y5mTqBlUVx0z5uAhujufSZ3Hzq2k4KiBUIJm6aE9rOn8Lt6RaZP+KZsuW7WuyPdpj9vr/dCTPYOddjsKvJ8gX2OdOZ/H53/i1bma7+M=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6536.eurprd08.prod.outlook.com (2603:10a6:20b:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Wed, 31 Mar
 2021 11:53:58 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 11:53:58 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/6] arm-bsp/machine: Introduce fvp-baser-aemv8r64 machine and its BSP
Date: Wed, 31 Mar 2021 12:53:46 +0100
Message-Id: <af2920170ac197083e351aa5e325f4a59fc59a58.1617191477.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
References: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend Transport; Wed, 31 Mar 2021 11:53:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4e9c1f8-6f3d-4ece-09d1-08d8f43bb315
X-MS-TrafficTypeDiagnostic: AS8PR08MB6536:|DBBPR08MB4743:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB474356BAC7172EE7F29A8221927C9@DBBPR08MB4743.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CcZrrTrbVlN7qa0JS5ssLXQxkexbZYzndl4kgE8dbkY6p0R+nryYEiJpT3k9pkLtlagcdiXOysx5AU5/oVER0iAzofHfHMJ6ljdykMNQpYMX2S5eHrawXTTPsErT2Qjv86SyeT6YjNrxJ7X+BUR/ZgTHanl/dJP7I9a5P2M5c5n1cjFidIIK0XpueCP/Cscd6201I29peOYQ8PilZdPx60Rx7cucOTAxPXJ0nj8Z1a/3/qo8zpiQVipwoMZwNQx0WRdrX4rOP3Gt/+jfPw+Ksgo90S44195Mv5VuLxJYhX5HMnFGKv5opQrNeWYfp6OZG4O9eFOmEFewt75oYPBI2cH5tKXMNX3ArthXjKQJmN34ZRfzYasuRqDKBgGeRzqsn5CBq5T43H4qMY6fiOvDYg5W2GdyTvVU+4jxhci3C6i9zWwM6P+4bU1jhYzsaBFjujC5x0bptQ/2dCjy1w73/zlb3kbCxnNlQr/ytKH3NL/xyoQQ9OYJfWYaWO2nM7uDlSfDBLmBgHcTiVZNyF1/i93R9CXxIGqWMigTf1DO2kLFcbtLFGUhDuRRFoNf1crOVAiUG0SnTw/BsyxLZxsGU003sYOmWwCsasfpnwT/dSgHGi8h1iHCHjjmyUbNvEVsz7T061cCxkez1jymzszjt30yLbVYmmL0Nw+NUbxCbPHKCjEHjKtwNa0WtCXTH6cXNlKVVIg4z5zuCTkMAek4CO6JoI6bWRhEbjg5sTn7J0o=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(6486002)(316002)(66946007)(36756003)(186003)(6666004)(86362001)(30864003)(2906002)(7696005)(5660300002)(66476007)(66556008)(26005)(52116002)(19627235002)(44832011)(16526019)(956004)(2616005)(4326008)(6916009)(478600001)(83380400001)(8936002)(8676002)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?rRAgyIp43CYewHoM63cEsMZpEmZtcUvznpxBCwvOyKyg3tZEtcSYC6js2Fcz?=
 =?us-ascii?Q?R1Ym+AOe6OnRUUg8fZNVFYE6gm8IP1Y/oXGRf9lpI+YHAMFkyo41syZoJLaU?=
 =?us-ascii?Q?JPp5Lh4vo9p1WHXGXMHkie6iXefiq8O67p4urwjuJlaKbE4OVSwEvUTMl7ZG?=
 =?us-ascii?Q?5LpaJrtX8MyK9RYYTKbavmx4evNVJSKUWb7oR99O1Rr/rVd0OwUijPY729jv?=
 =?us-ascii?Q?QfhZCgg5NuTo0tjjLnCvVJqzlbjeihi8pYykRx/YsGvLhmWlgi5So1SLVY3w?=
 =?us-ascii?Q?BSylQLUH+gDjmGVvXWzZKVGQ7G+oFQgYH/9+J4kAUiF6rGLceqXbdCsu7zcY?=
 =?us-ascii?Q?6BUt+lLI2cUB6cSFYlvcSP28SG+G04b/ocZ6ULuORp9GTdwNDV4sRkLo8aet?=
 =?us-ascii?Q?32YgXe4D/MTa+/hxGLalYy4ruJcweAFQVc2xY1d5LeQN9vM2Bt0PqT4dRJnX?=
 =?us-ascii?Q?ACzdLU+7CMX35rl7iEZBsdZxkCkY6w3TxNbZJFN9rjfBDCrXRdJcw9ukImOv?=
 =?us-ascii?Q?TfsvxHbuTpNIokxHGXj+pm7nfT7JHoRfF+qK0ZuYNW3cJl4FLbfOjqKuwSgY?=
 =?us-ascii?Q?8lhBOB+Y8gpWz44WOy3GROjFYZbQC/C3ZRD+B2AGwYiFb8+Mp62x2SpViJbR?=
 =?us-ascii?Q?Qj2LFfGnPo+XbHZT7ODzsYmvae0GpbZrWpxA1krOvEEIRA9NiVwoH4M8TCAs?=
 =?us-ascii?Q?tuzeaeH0bR+p2bMyyuS9OSVKVQHTD21M4KEPVe9Sv5Gkc2wMnk0+PhksJx2k?=
 =?us-ascii?Q?LohTsIyTtiiWGEdJvJkAmalZOBxppgcRP51KjHgWHEzw07RVkvfesAAqXLvv?=
 =?us-ascii?Q?eOKI1paxY1HkWNj+TzS7UKGU8HR5L9WHoxEbjNfOn8d9uMrOSKkSz6kOYulo?=
 =?us-ascii?Q?4afM1OmCvyJLSQkFlj7QjsemRzFPh4raQLWr0NCxPDa4FCujh531erq2AEvc?=
 =?us-ascii?Q?cROjGSU+rM40lYaTHnjoMcVHt1LpvMslUb2RYYACdGoD5RF4j1HjbViMkUbB?=
 =?us-ascii?Q?Z4bJAZ7EaYwEaYNlYEv0DGCxQuxQBiZR+VM3EPvtbkDflzq2iPnXPPpRNeD2?=
 =?us-ascii?Q?lQ57irpU8KcT1WJlsAXGLuhY7R2PS14dZDmDXAfiamT9PWPzhDvq931VSOSc?=
 =?us-ascii?Q?4RtEyyT9aYYrTA33MwrgOtDOnhKsREGBh0yuC6g8bNhnWcHLzLSh/1IHsxg5?=
 =?us-ascii?Q?5n8w+IYL0uEwJDqPxTfVAlQd1F9dLSjaMWenRwEae5kxpFegukU/U3Wat3Od?=
 =?us-ascii?Q?xd3wXliKuDJ7JJESW6CyjwnVHl+njx9zeotbTdRm0BCAsU+ppglmAno9JWx8?=
 =?us-ascii?Q?AF0HjWpa2MiY/6+twagVox1h?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6536
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	25c4c7d0-ff39-4664-79c5-08d8f43baad5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oqdDTzQvtVVhUppmyUd0vW2GawyZW3I/0OyRxVbpfc6wsMJGCuhlEjUOlyjSlbmxPGCS8ZJ7Rbs0ScRPqSzrCdHiEqI0ehYkO3glSBOg8gjDzkBInU6DX4t3Rqe3h1aM+pTh9Ahpl1qS6n0TBe5/xTfD75AJ2N+3TzTxba8ZO/Cbn0kbXhhs8BRMRLbMbOy9EkiAq7BN2OwW4I5leOzZ9UYo9LkACRIZul6fAl3xilaxpheni0oitWDsftOeC+EkLyntCqQxIq7pNI4mMeYYqLZ5Rn6VwS1bgB89da5pvTWg8vAAwka7QulohUgEQ2H29VzfEFNpU6wI8A0JxJZk3JzkzHEGjn4IJnIkkEFF7CifSNLhu4mMx5alWsKR/hk9c9kwzGja9oyR+B3IJMIhBVjCcPGDAJUGAM3vbH/zX+/dX5S9oiwEg75Gr7wGHFG5pHdxHrVbhX2SQK3a7yrCZ1nrWrDcfcOvzGFZVrnHItxQ+l+cHV9l3mbYc+0AHIpvfP0B0dWtLBr+/tT88LxjjIdVDvQFKoGyzJA+7YoNKQTozqjLgXsxQZXMTrv/RZNTgoaz7XcB2Cl1CdpH5s8HyuCAOP10V7VQwutCLEWWsrdvRIiW5+yP+9qkD2okj9q0pCL3PmO54N5My2C85sm1j8xEifCvGwlCh7SYoaOEn40Oo4gyE9KiJQyorI4VuTT/tA29i6B1SKXi42gqrB1fMJedqXvS9xU2HKQOJV1maKA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39830400003)(46966006)(36840700001)(16526019)(26005)(6486002)(4326008)(19627235002)(956004)(2616005)(30864003)(5660300002)(356005)(2906002)(36860700001)(81166007)(44832011)(70206006)(8676002)(316002)(82310400003)(6666004)(83380400001)(186003)(47076005)(36756003)(86362001)(8936002)(6916009)(478600001)(336012)(70586007)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 11:54:11.7583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e9c1f8-6f3d-4ece-09d1-08d8f43bb315
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4743
Content-Type: text/plain

This patch adds the fvp-baser-aemv8r64.conf machine definition for the
FVP BaseR AEMv8r64 Platform alongside the following BSP components:

* boot-wrapper-aarch64
* Kernel: linux-yocto-5.10
* Devicetree for bootstrapping
* wic image

Issue-Id: SCM-2121
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Ia9e400db8c78e5e57a6fa2241b81fdd42a00dd53
---
 .../conf/machine/fvp-baser-aemv8r64.conf      |  26 ++
 .../documentation/fvp-baser-aemv8r64.md       | 114 +++++++
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |  12 +
 .../boot-wrapper-aarch64_%.bbappend           |   4 +
 ...M_SYS-config-by-auto-detect-dtb-node.patch |  67 ++++
 ...4-Introduce-EL2-boot-code-for-v8-r64.patch | 314 ++++++++++++++++++
 .../fvp-baser-aemv8r64-standard.scc           |   7 +
 .../bsp/arm-platforms/fvp-baser-aemv8r64.scc  |   3 +
 .../fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts | 192 +++++++++++
 .../linux/linux-arm-platforms.inc             |   7 +
 meta-arm-bsp/wic/fvp-baser-aemv8r64.wks       |   3 +
 11 files changed, 749 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
 create mode 100644 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64-standard.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts
 create mode 100644 meta-arm-bsp/wic/fvp-baser-aemv8r64.wks

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
new file mode 100644
index 0000000..79b95a8
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -0,0 +1,26 @@
+# Configuration for Fixed Virtual Platform BaseR AEMv8r64 Machine
+
+#@TYPE: Machine
+#@NAME: FVP BaseR AEMv8r64 Machine
+#@DESCRIPTION: Machine configuration for FVP BaseR AEMv8r64
+
+require conf/machine/include/arm/armv8r/arch-armv8r64.inc
+
+EXTRA_IMAGEDEPENDS += "boot-wrapper-aarch64"
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "5.10%"
+
+KERNEL_IMAGETYPE = "Image"
+KERNEL_DEVICETREE = "arm/fvp-baser-aemv8r64.dtb"
+
+SERIAL_CONSOLES = "115200;ttyAMA0"
+
+IMAGE_FSTYPES += "wic"
+WKS_FILE ?= "${MACHINE}.wks"
+
+# As this is a virtual target that will not be used in the real world there is
+# no need for real SSH keys.  Disable rng-tools (which takes too long to
+# initialise) and install the pre-generated keys.
+PACKAGECONFIG_remove_pn-openssh = "rng-tools"
+MACHINE_EXTRA_RRECOMMENDS += "ssh-pregen-hostkeys"
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
new file mode 100644
index 0000000..9701739
--- /dev/null
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -0,0 +1,114 @@
+# AEM Armv8-R64 BaseR Platform FVP Support in meta-arm-bsp
+
+## Overview
+Fixed Virtual Platforms (FVP) are complete simulations of an Arm system,
+including processor, memory and peripherals. These are set out in a
+"programmer's view", which gives you a comprehensive model on which to build
+and test your software.
+
+The AEMv8-R BaseR Platform FVP is the Fixed Virtual Platform of the latest
+Armv8-R architecture features.
+
+This BSP implements a reference stack for the AArch64 support in the R-class
+first announced with the Cortex-R82 processor:
+https://developer.arm.com/ip-products/processors/cortex-r/cortex-r82
+
+Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
+https://developer.arm.com/docs/100966/latest
+
+## BSP Support
+Supported components:
+
+ - boot-wrapper-aarch64
+ - Kernel: linux-yocto-5.10
+
+## Howto Build and Run
+
+### Configuration:
+In the local.conf file, MACHINE should be set as follow:
+`MACHINE ?= "fvp-baser-aemv8r64"`
+
+If a quicker boot is required add the following line in the local.conf:
+`INIT_MANAGER = "mdev-busybox"`
+
+### Build:
+```
+bitbake core-image-minimal
+```
+
+### Run:
+To Run the Fixed Virtual Platform simulation tool you must download "Armv8-R
+BaseR AEM FVP" from Arm developer (This might require the user to
+register) from this address:
+https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms/arm-ecosystem-models
+and install it on your host PC.
+**DISCLAIMER:** The AEMv8-R BaseR Platform FVP package will be available for
+download soon.
+
+Once the build is done, do the following run an image:
+```
+export YOCTO_DEPLOY_IMGS_DIR="<yocto-build-dir/tmp/deploy/images/fvp-baser-aemv8r64>"
+cd <path-to-FVP_BaseR_AEMv8R_pkg-dir/models/Linux64_GCC-X.X/>
+./FVP_BaseR_AEMv8R \
+-C bp.dram_metadata.init_value=0 \
+-C bp.dram_metadata.is_enabled=true \
+-C bp.dram_size=8 \
+-C bp.exclusive_monitor.monitor_access_level=1 \
+-C bp.pl011_uart0.unbuffered_output=1 \
+-C bp.pl011_uart0.untimed_fifos=true \
+-C bp.refcounter.non_arch_start_at_default=1 \
+-C bp.smsc_91c111.enabled=0 \
+-C bp.ve_sysregs.mmbSiteDefault=0 \
+-C cache_state_modelled=true \
+-C cluster0.gicv3.cpuintf-mmap-access-level=2 \
+-C cluster0.gicv3.SRE-enable-action-on-mmap=2 \
+-C cluster0.gicv3.SRE-EL2-enable-RAO=1 \
+-C cluster0.gicv3.extended-interrupt-range-support=1 \
+-C cluster0.has_aarch64=1 \
+-C cluster0.NUM_CORES=4 \
+-C cluster0.stage12_tlb_size=512 \
+-C gic_distributor.GICD_CTLR-DS-1-means-secure-only=1 \
+-C gic_distributor.GITS_BASER0-type=1 \
+-C gic_distributor.ITS-count=1 \
+-C gic_distributor.ITS-hardware-collection-count=1 \
+-C gic_distributor.direct-lpi-support=1 \
+-C gic_distributor.has-two-security-states=0 \
+-C pctl.startup=0.0.0.* \
+-C bp.virtio_net.enabled=1 \
+-C cache_state_modelled=0 \
+-C bp.vis.rate_limit-enable=0 \
+-C bp.virtio_net.hostbridge.interfaceName=tap0 \
+-a cluster0*=${YOCTO_DEPLOY_IMGS_DIR}/linux-system.axf \
+-C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fvp-baser-aemv8r64.wic
+```
+
+## Devices supported in the kernel
+- serial
+- virtio disk
+- virtio network
+- watchdog
+- rtc
+
+## Devices not supported or not functional
+- Only one CPU since SMP is not functional in boot-wrapper-aarch64 yet
+
+## Networking
+
+To enable networking on the FVP via a host network interface, set up tap0 using
+the following commands (Ubuntu 18.04 Host):
+```
+sudo apt-get install libvirt-bin
+sudo virsh net-start default
+sudo ip tuntap add dev tap0 mode tap user $(whoami)
+sudo ifconfig tap0 0.0.0.0 promisc up
+sudo brctl addif virbr0 tap0
+```
+
+To clean up the tap0 interface on the host use the following commands:
+```
+sudo brctl delif virbr0 tap0
+sudo ip link set virbr0 down
+sudo brctl delbr virbr0
+sudo virsh net-destroy default
+sudo ip link delete tap0
+```
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
new file mode 100644
index 0000000..b57bf11
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
@@ -0,0 +1,12 @@
+COMPATIBLE_MACHINE = "fvp-baser-aemv8r64"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files/${MACHINE}:"
+SRC_URI_append = " \
+    file://0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch \
+    file://0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch \
+    "
+
+BOOT_WRAPPER_AARCH64_CMDLINE = "\
+earlycon console=ttyAMA0 loglevel=8 rootfstype=ext4 root=/dev/vda1 rw"
+
+EXTRA_OECONF_remove = "--enable-psci"
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
new file mode 100644
index 0000000..91098ad
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
@@ -0,0 +1,4 @@
+MACHINE_BOOT_WRAPPER_AARCH64_REQUIRE ?= ""
+MACHINE_BOOT_WRAPPER_AARCH64_REQUIRE_fvp-baser-aemv8r64 ?= "boot-wrapper-aarch64-fvp-baser-aemv8r64.inc"
+
+require ${MACHINE_BOOT_WRAPPER_AARCH64_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch
new file mode 100644
index 0000000..f3e03c4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch
@@ -0,0 +1,67 @@
+From 7b8c821c22929cd2d3532f937672fcf05dc7d5d0 Mon Sep 17 00:00:00 2001
+Message-Id: <7b8c821c22929cd2d3532f937672fcf05dc7d5d0.1616744115.git.diego.sueiro@arm.com>
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Thu, 25 Mar 2021 12:35:13 +0800
+Subject: [PATCH 1/2] Decouple V2M_SYS config by auto-detect dtb node
+
+An auto-detect switch is added to make it an option to enable/disable
+'arm,vexpress-sysreg', because not all platforms support this feature.
+
+Issue-ID: SCM-2221
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: Ib8738aa62ca3902f7bdae2ad9a5a63aa2d225abf
+
+Upstream-Status: Pending
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ Makefile.am | 2 +-
+ platform.c  | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index af694b7..e131207 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -19,7 +19,7 @@ NR_CPUS         := $(shell echo $(CPU_IDS) | tr ',' ' ' | wc -w)
+ DEFINES		= -DCNTFRQ=$(CNTFRQ)
+ DEFINES		+= -DCPU_IDS=$(CPU_IDS)
+ DEFINES		+= -DNR_CPUS=$(NR_CPUS)
+-DEFINES		+= -DSYSREGS_BASE=$(SYSREGS_BASE)
++DEFINES		+= $(if $(SYSREGS_BASE), -DSYSREGS_BASE=$(SYSREGS_BASE), )
+ DEFINES		+= -DUART_BASE=$(UART_BASE)
+ DEFINES		+= -DSTACK_SIZE=256
+ 
+diff --git a/platform.c b/platform.c
+index a528a55..d11f568 100644
+--- a/platform.c
++++ b/platform.c
+@@ -23,10 +23,12 @@
+ 
+ #define PL011(reg)	((void *)UART_BASE + PL011_##reg)
+ 
++#ifdef SYSREGS_BASE
+ #define V2M_SYS_CFGDATA		0xa0
+ #define V2M_SYS_CFGCTRL		0xa4
+ 
+ #define V2M_SYS(reg)	((void *)SYSREGS_BASE + V2M_SYS_##reg)
++#endif
+ 
+ static void print_string(const char *str)
+ {
+@@ -59,6 +61,7 @@ void init_platform(void)
+ 
+ 	print_string("Boot-wrapper v0.2\r\n\r\n");
+ 
++#ifdef SYSREGS_BASE
+ 	/*
+ 	 * CLCD output site MB
+ 	 */
+@@ -66,4 +69,5 @@ void init_platform(void)
+ 	/* START | WRITE | MUXFPGA | SITE_MB */
+ 	raw_writel((1 << 31) | (1 << 30) | (7 << 20) | (0 << 16),
+ 				V2M_SYS(CFGCTRL));
++#endif
+ }
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch
new file mode 100644
index 0000000..5d039b2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch
@@ -0,0 +1,314 @@
+From 81fcc5cc80c9c3c812d92000b9116f6a02ff7e6c Mon Sep 17 00:00:00 2001
+Message-Id: <81fcc5cc80c9c3c812d92000b9116f6a02ff7e6c.1616744115.git.diego.sueiro@arm.com>
+In-Reply-To: <7b8c821c22929cd2d3532f937672fcf05dc7d5d0.1616744115.git.diego.sueiro@arm.com>
+References: <7b8c821c22929cd2d3532f937672fcf05dc7d5d0.1616744115.git.diego.sueiro@arm.com>
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Thu, 25 Mar 2021 12:47:02 +0800
+Subject: [PATCH 2/2] arch64: Introduce EL2 boot code for v8-r64
+
+The v8-r64 boots from EL2 mode. In order to boot linux, EL2 boot mode
+is needed. Because there is no MMU supported for v8-r64 under EL2 mode,
+bootwrapper needs to switch to EL1 mode when jumpping to the kernel.
+
+Some register in gic-v3.h need to be auto-detected.
+
+Issue-ID: SCM-2221
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: I52ca3f045f1ab50f32945420144752f396d95193
+
+Upstream-Status: Pending
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ arch/aarch64/boot.S               | 76 +++++++++++++++++++++++++++----
+ arch/aarch64/include/asm/cpu.h    |  3 ++
+ arch/aarch64/include/asm/gic-v3.h | 23 ++++++++--
+ arch/aarch64/psci.S               | 13 +++---
+ arch/aarch64/spin.S               |  8 ++--
+ arch/aarch64/utils.S              |  8 ++++
+ 6 files changed, 110 insertions(+), 21 deletions(-)
+
+diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
+index e47cf59..5c3eb73 100644
+--- a/arch/aarch64/boot.S
++++ b/arch/aarch64/boot.S
+@@ -22,20 +22,30 @@ _start:
+ 	bl	setup_stack
+ 
+ 	/*
+-	 * EL3 initialisation
++	 * Boot sequence
++	 * If EL3, goto EL3 initialisation
++	 * If EL2 && id_aa64mmfr0_el1.MSA == 0xf, do Armv8r initialisation
++	 * Else no initialisation sequence
+ 	 */
+ 	mrs	x0, CurrentEL
+ 	cmp	x0, #CURRENTEL_EL3
+-	b.eq	1f
++	beq	el3_init
++	cmp	x0, #CURRENTEL_EL2
++	beq	el2_init
+ 
++no_el_max:
+ 	mov	w0, #1
+ 	ldr	x1, =flag_no_el3
+ 	str	w0, [x1]
+ 
+ 	bl	setup_stack
+-	b	start_no_el3
++	b	start_no_el_max
+ 
+-1:	mov	x0, #0x30			// RES1
++	/*
++	 * EL3 initialisation
++	 */
++el3_init:
++	mov	x0, #0x30			// RES1
+ 	orr	x0, x0, #(1 << 0)		// Non-secure EL1
+ 	orr	x0, x0, #(1 << 8)		// HVC enable
+ 
+@@ -93,14 +103,54 @@ _start:
+ 	mov	x0, #ZCR_EL3_LEN_MASK		// SVE: Enable full vector len
+ 	msr	ZCR_EL3, x0			// for EL2.
+ 
+-1:
++	mov	w0, #SPSR_KERNEL
++	ldr	x1, =spsr_to_elx
++	str	w0, [x1]
++	b	el_max_init
++
++	/*
++	 * EL2 Armv8r initialisation
++	 */
++el2_init:
++	/* Detect Armv8r */
++	mrs	x1, id_aa64mmfr0_el1
++	ubfx	x1, x1, #48, #4			// MSA
++	cmp	x1, 0xf				// 0xf means Armv8r
++	bne	no_el_max
++
++	mrs	x0, midr_el1
++	msr	vpidr_el2, x0
++
++	mrs	x0, mpidr_el1
++	msr	vmpidr_el2, x0
++
++	mov	x0, #(1 << 31)			// VTCR_MSA: VMSAv8-64 support
++	msr	vtcr_el2, x0
++
++	/* Enable pointer authentication if present */
++	mrs	x1, id_aa64isar1_el1
++	ldr	x2, =(((0xff) << 24) | (0xff << 4))
++	and	x1, x1, x2
++	cbz	x1, 1f
++
++	mrs	x0, hcr_el2
++	orr	x0, x0, #(1 << 40)		// AP key enable
++	orr	x0, x0, #(1 << 41)		// AP insn enable
++	msr	hcr_el2, x0
++
++1:	isb
++	mov	w0, #SPSR_KERNEL_EL1
++	ldr	x1, =spsr_to_elx
++	str	w0, [x1]
++	b	el_max_init
++
++el_max_init:
+ 	ldr	x0, =CNTFRQ
+ 	msr	cntfrq_el0, x0
+ 
+ 	bl	gic_secure_init
+ 
+-	b	start_el3
+-
++	b	start_el_max
+ err_invalid_id:
+ 	b	.
+ 
+@@ -137,7 +187,7 @@ jump_kernel:
+ 	b.eq	1f
+ 	br	x19			// No EL3
+ 
+-1:	mov	x4, #SPSR_KERNEL
++1:	ldr	w4, spsr_to_elx
+ 
+ 	/*
+ 	 * If bit 0 of the kernel address is set, we're entering in AArch32
+@@ -145,13 +195,23 @@ jump_kernel:
+ 	 */
+ 	bfi	x4, x19, #5, #1
+ 
++	mrs	x18, CurrentEL
++	cmp	x18, #CURRENTEL_EL2
++	b.eq	1f
++
+ 	msr	elr_el3, x19
+ 	msr	spsr_el3, x4
+ 	eret
+ 
++1:	msr	elr_el2, x19
++	msr	spsr_el2, x4
++	eret
++
+ 	.ltorg
+ 
+ 	.data
+ 	.align 3
+ flag_no_el3:
+ 	.long 0
++spsr_to_elx:
++	.long 0
+diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
+index ccb5397..2b3a0a4 100644
+--- a/arch/aarch64/include/asm/cpu.h
++++ b/arch/aarch64/include/asm/cpu.h
+@@ -11,6 +11,7 @@
+ 
+ #define MPIDR_ID_BITS		0xff00ffffff
+ 
++#define CURRENTEL_EL2		(2 << 2)
+ #define CURRENTEL_EL3		(3 << 2)
+ 
+ /*
+@@ -24,6 +25,7 @@
+ #define SPSR_I			(1 << 7)	/* IRQ masked */
+ #define SPSR_F			(1 << 6)	/* FIQ masked */
+ #define SPSR_T			(1 << 5)	/* Thumb */
++#define SPSR_EL1H		(5 << 0)	/* EL1 Handler mode */
+ #define SPSR_EL2H		(9 << 0)	/* EL2 Handler mode */
+ #define SPSR_HYP		(0x1a << 0)	/* M[3:0] = hyp, M[4] = AArch32 */
+ 
+@@ -42,6 +44,7 @@
+ #else
+ #define SCTLR_EL1_RESET		SCTLR_EL1_RES1
+ #define SPSR_KERNEL		(SPSR_A | SPSR_D | SPSR_I | SPSR_F | SPSR_EL2H)
++#define SPSR_KERNEL_EL1		(SPSR_A | SPSR_D | SPSR_I | SPSR_F | SPSR_EL1H)
+ #endif
+ 
+ #ifndef __ASSEMBLY__
+diff --git a/arch/aarch64/include/asm/gic-v3.h b/arch/aarch64/include/asm/gic-v3.h
+index e743c02..f8ddb27 100644
+--- a/arch/aarch64/include/asm/gic-v3.h
++++ b/arch/aarch64/include/asm/gic-v3.h
+@@ -15,21 +15,38 @@
+ #define ICC_CTLR_EL3	"S3_6_C12_C12_4"
+ #define ICC_PMR_EL1	"S3_0_C4_C6_0"
+ 
++static inline uint32_t current_el(void)
++{
++	uint32_t val;
++
++	asm volatile ("mrs %0, CurrentEL" : "=r" (val));
++	return val;
++}
++
+ static inline uint32_t gic_read_icc_sre(void)
+ {
+ 	uint32_t val;
+-	asm volatile ("mrs %0, " ICC_SRE_EL3 : "=r" (val));
++
++	if(current_el() == CURRENTEL_EL3)
++		asm volatile ("mrs %0, " ICC_SRE_EL3 : "=r" (val));
++	else
++		asm volatile ("mrs %0, " ICC_SRE_EL2 : "=r" (val));
++
+ 	return val;
+ }
+ 
+ static inline void gic_write_icc_sre(uint32_t val)
+ {
+-	asm volatile ("msr " ICC_SRE_EL3 ", %0" : : "r" (val));
++	if(current_el() == CURRENTEL_EL3)
++		asm volatile ("msr " ICC_SRE_EL3 ", %0" : : "r" (val));
++	else
++		asm volatile ("msr " ICC_SRE_EL2 ", %0" : : "r" (val));
+ }
+ 
+ static inline void gic_write_icc_ctlr(uint32_t val)
+ {
+-	asm volatile ("msr " ICC_CTLR_EL3 ", %0" : : "r" (val));
++	if(current_el() == CURRENTEL_EL3)
++		asm volatile ("msr " ICC_CTLR_EL3 ", %0" : : "r" (val));
+ }
+ 
+ #endif
+diff --git a/arch/aarch64/psci.S b/arch/aarch64/psci.S
+index 01ebe7d..0681d5e 100644
+--- a/arch/aarch64/psci.S
++++ b/arch/aarch64/psci.S
+@@ -45,8 +45,8 @@ vector:
+ 
+ 	.text
+ 
+-	.globl start_no_el3
+-	.globl start_el3
++	.globl start_no_el_max
++	.globl start_el_max
+ 
+ err_exception:
+ 	b err_exception
+@@ -101,7 +101,7 @@ smc_exit:
+ 	eret
+ 
+ 
+-start_el3:
++start_el_max:
+ 	ldr	x0, =vector
+ 	bl	setup_vector
+ 
+@@ -111,10 +111,11 @@ start_el3:
+ 	b	psci_first_spin
+ 
+ /*
+- * This PSCI implementation requires EL3. Without EL3 we'll only boot the
+- * primary cpu, all others will be trapped in an infinite loop.
++ * This PSCI implementation requires EL3 or AArch64-R EL2. Without EL max
++ * we'll only boot the primary cpu, all others will be trapped in an infinite
++ * loop.
+  */
+-start_no_el3:
++start_no_el_max:
+ 	cpuid	x0, x1
+ 	bl	find_logical_id
+ 	cbz	x0, psci_first_spin
+diff --git a/arch/aarch64/spin.S b/arch/aarch64/spin.S
+index 72603cf..fa1d657 100644
+--- a/arch/aarch64/spin.S
++++ b/arch/aarch64/spin.S
+@@ -11,11 +11,11 @@
+ 
+ 	.text
+ 
+-	.globl start_no_el3
+-	.globl start_el3
++	.globl start_no_el_max
++	.globl start_el_max
+ 
+-start_el3:
+-start_no_el3:
++start_el_max:
++start_no_el_max:
+ 	cpuid	x0, x1
+ 	bl	find_logical_id
+ 
+diff --git a/arch/aarch64/utils.S b/arch/aarch64/utils.S
+index ae22ea7..2a63fa7 100644
+--- a/arch/aarch64/utils.S
++++ b/arch/aarch64/utils.S
+@@ -41,6 +41,14 @@ find_logical_id:
+  * x0: vector address
+  */
+ setup_vector:
++	mrs	x1, CurrentEL
++	cmp	x1, #CURRENTEL_EL2
++	b.eq	1f
++
+ 	msr	VBAR_EL3, x0
+ 	isb
+ 	ret
++
++1:	msr	VBAR_EL2, x0
++	isb
++	ret
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64-standard.scc
new file mode 100644
index 0000000..fd1fb28
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64-standard.scc
@@ -0,0 +1,7 @@
+define KMACHINE fvp-baser-aemv8r64
+define KTYPE standard
+define KARCH arm64
+
+include ktypes/standard/standard.scc
+
+include fvp-baser-aemv8r64.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64.scc
new file mode 100644
index 0000000..accf146
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64.scc
@@ -0,0 +1,3 @@
+kconf hardware arm64.cfg
+kconf hardware fvp-common-peripherals.cfg
+include cfg/virtio.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts
new file mode 100644
index 0000000..f70b484
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts
@@ -0,0 +1,192 @@
+/dts-v1/;
+
+/ {
+
+        #address-cells = <0x2>;
+        #size-cells = <0x2>;
+        interrupt-parent = <0x1>;
+        model = "Generated";
+        compatible = "arm,base";
+
+        memory@0 {
+                #address-cells = <0x2>;
+                #size-cells = <0x2>;
+                device_type = "memory";
+                reg = <0x0        0x0        0x0 0x80000000>,
+                      <0x00000008 0x80000000 0x1 0x80000000>;
+        };
+
+        cpus {
+                #address-cells = <0x2>;
+                #size-cells = <0x0>;
+
+                cpu-map {
+                        cluster0 {
+                                core0 { thread0 { cpu = <&CPU_0>; }; };
+                                core1 { thread0 { cpu = <&CPU_1>; }; };
+                                core2 { thread0 { cpu = <&CPU_2>; }; };
+                                core3 { thread0 { cpu = <&CPU_3>; }; };
+                        };
+                };
+
+                CPU_0: cpu@0 {
+                        device_type = "cpu";
+                        compatible = "arm,armv8";
+                        reg = <0x0 0x0>;
+                        enable-method = "spin-table";
+                        cpu-release-addr = <0x0 0x7f800>;
+                };
+
+                CPU_1: cpu@1 {
+                        device_type = "cpu";
+                        compatible = "arm,armv8";
+                        reg = <0x0 0x1>;
+                        enable-method = "spin-table";
+                        cpu-release-addr = <0x0 0x7f808>;
+                };
+
+                CPU_2: cpu@2 {
+                        device_type = "cpu";
+                        compatible = "arm,armv8";
+                        reg = <0x0 0x2>;
+                        enable-method = "spin-table";
+                        cpu-release-addr = <0x0 0x7f810>;
+                };
+
+                CPU_3: cpu@3 {
+                        device_type = "cpu";
+                        compatible = "arm,armv8";
+                        reg = <0x0 0x3>;
+                        enable-method = "spin-table";
+                        cpu-release-addr = <0x0 0x7f818>;
+                };
+        };
+
+        interrupt-controller@af000000 {
+                compatible = "arm,gic-v3";
+                #interrupt-cells = <0x3>;
+                #address-cells = <0x2>;
+                #size-cells = <0x2>;
+                ranges;
+                interrupt-controller;
+                #redistributor-regions = <0x1>;
+                reg = <0x0 0xaf000000 0x0 0x10000>,     // GICD
+                      <0x0 0xaf100000 0x0 0x100000>,    // GICR
+                      <0x0 0xac000000 0x0 0x2000>,      // GICC
+                      <0x0 0xac010000 0x0 0x2000>,      // GICH
+                      <0x0 0xac02f000 0x0 0x2000>;      // GICV
+                interrupts = <0x1 9 0x4>;
+                linux,phandle = <0x1>;
+                phandle = <0x1>;
+
+                its: msi-controller@2f020000 {
+                        #msi-cells = <1>;
+                        compatible = "arm,gic-v3-its";
+                        reg = <0x0 0xaf020000 0x0 0x20000>; // GITS
+                        msi-controller;
+                };
+
+        };
+
+        refclk100mhz: refclk100mhz {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <100000000>;
+                clock-output-names = "apb_pclk";
+        };
+
+        refclk24mhz: refclk24mhz {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <24000000>;
+                clock-output-names = "refclk24mhz";
+        };
+
+        refclk1hz: refclk1hz {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <1>;
+                clock-output-names = "refclk1hz";
+        };
+
+        uart@9c090000 {
+                compatible = "arm,pl011", "arm,primecell";
+                reg = <0x0 0x9c090000 0x0 0x10000>;
+                interrupts = <0x0 5 0x4>;
+                clocks = <&refclk24mhz>, <&refclk100mhz>;
+                clock-names = "uartclk", "apb_pclk";
+        };
+
+        uart@9c0a0000 {
+                compatible = "arm,pl011", "arm,primecell";
+                reg = <0x0 0x9c0a0000 0x0 0x10000>;
+                interrupts = <0x0 6 0x4>;
+                clocks = <&refclk24mhz>, <&refclk100mhz>;
+                clock-names = "uartclk", "apb_pclk";
+        };
+
+        uart@9c0b0000 {
+                compatible = "arm,pl011", "arm,primecell";
+                reg = <0x0 0x9c0b0000 0x0 0x10000>;
+                interrupts = <0x0 7 0x4>;
+                clocks = <&refclk24mhz>, <&refclk100mhz>;
+                clock-names = "uartclk", "apb_pclk";
+        };
+
+        uart@9c0c0000 {
+                compatible = "arm,pl011", "arm,primecell";
+                reg = <0x0 0x9c0c0000 0x0 0x10000>;
+                interrupts = <0x0 8 0x4>;
+                clocks = <&refclk24mhz>, <&refclk100mhz>;
+                clock-names = "uartclk", "apb_pclk";
+        };
+
+        wdt@9c0f0000 {
+                compatible = "arm,sp805", "arm,primecell";
+                reg = <0x0 0x9c0f0000 0x0 0x10000>;
+                interrupts = <0x0 0 0x4>;
+                clocks = <&refclk24mhz>, <&refclk100mhz>;
+                clock-names = "wdog_clk", "apb_pclk";
+        };
+
+        rtc@9c170000 {
+                compatible = "arm,pl031", "arm,primecell";
+                reg = <0x0 0x9c170000 0x0 0x1000>;
+                interrupts = <0x0 4 0x4>;
+                clocks = <&refclk1hz>;
+                clock-names = "apb_pclk";
+        };
+
+        virtio-block@9c130000 {
+                compatible = "virtio,mmio";
+                reg = <0 0x9c130000 0 0x200>;
+                interrupts = <0x0 42 0x4>;
+        };
+
+        virtio-net@9c150000 {
+                compatible = "virtio,mmio";
+                reg = <0 0x9c150000 0 0x200>;
+                interrupts = <0x0 44 0x4>;
+        };
+
+        timer {
+                compatible = "arm,armv8-timer";
+                interrupts = <0x1 13 0xff08>,
+                             <0x1 14 0xff08>,
+                             <0x1 11 0xff08>,
+                             <0x1 10 0xff08>;
+                clock-frequency = <100000000>;
+        };
+
+        aliases {
+                serial0 = "/uart@9c090000";
+                serial1 = "/uart@9c0a0000";
+                serial2 = "/uart@9c0b0000";
+                serial3 = "/uart@9c0c0000";
+        };
+
+        chosen {
+                bootargs = "earlycon console=ttyAMA0 loglevel=8 rootfstype=ext4 root=/dev/vda1 rw";
+                stdout-path = "serial0";
+        };
+};
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 711c67a..1737a05 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -13,6 +13,7 @@ SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base-arm32 = " ${SRC_URI_KMETA}"
 SRC_URI_append_juno = " ${SRC_URI_KMETA}"
 SRC_URI_append_n1sdp = " ${SRC_URI_KMETA}"
+SRC_URI_append_fvp-baser-aemv8r64 = " ${SRC_URI_KMETA}"
 SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 
 #
@@ -113,3 +114,9 @@ KCONF_AUDIT_LEVEL_n1sdp_pn-linux-yocto-rt = "0"
 #
 COMPATIBLE_MACHINE_musca-b1 = "(^$)"
 COMPATIBLE_MACHINE_musca-s1 = "(^$)"
+
+#
+# FVP BaseR AEMv8r64 Machine
+#
+COMPATIBLE_MACHINE_fvp-baser-aemv8r64 = "fvp-baser-aemv8r64"
+SRC_URI_append_fvp-baser-aemv8r64 = " file://fvp-baser-aemv8r64.dts;subdir=git/arch/arm64/boot/dts/arm"
diff --git a/meta-arm-bsp/wic/fvp-baser-aemv8r64.wks b/meta-arm-bsp/wic/fvp-baser-aemv8r64.wks
new file mode 100644
index 0000000..4701406
--- /dev/null
+++ b/meta-arm-bsp/wic/fvp-baser-aemv8r64.wks
@@ -0,0 +1,3 @@
+# For fvp-baser-aemv8r64 machine we just need to populate the rootfs partition
+
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024 --extra-space 100
-- 
2.17.1

